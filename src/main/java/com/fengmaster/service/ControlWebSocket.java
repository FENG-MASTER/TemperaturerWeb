package com.fengmaster.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fengmaster.domain.DeviceModel;
import com.fengmaster.domain.res.ResponseBean;
import com.fengmaster.event.SendDeviceMsgEvent;
import com.fengmaster.handler.DeviceSocketHandler;
import org.greenrobot.eventbus.EventBus;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.function.Predicate;

/**
 *
 * 交互报文格式:
 * 1.所有以#开头的信息,全部用于和服务器交互
 *      输入: #connect XXXX 表示连接SN为XXXX的设备
 *      返回: #{json返回报文} {@link com.fengmaster.domain.res.ResponseBean}
 *
 * 2.其他信息直接发送到设备上
 *
 * Created by Feng-master on 19/02/27.
 */
@ServerEndpoint(value = "/websocket/control")
@Component
public class ControlWebSocket {

    private static TemperaturerService temperaturerService;

    /**
     * 防止注入失败 {@line https://blog.csdn.net/lotts/article/details/77944672}
     * @param t
     */
    @Autowired
    public void setTemperaturerService(TemperaturerService t){
        temperaturerService=t;
    }

    private final Logger logger= LoggerFactory.getLogger(TcpService.class.getName());


    private Session session;

    /**
     * 设备控制器
     */
    private DeviceSocketHandler deviceSocketHandler;


    /**
     * 有连接建立
     * @param session
     */
    @OnOpen
    public void onOpen(Session session){
        this.session=session;
        logger.info("有新的websocket连接");
    }

    @OnClose
    public void onClose(){
        if (deviceSocketHandler!=null){
            deviceSocketHandler.stopProgress();
            deviceSocketHandler=null;
        }
        logger.info("有websocket连接关闭");
    }

    /**
     * 收到信息
     */
    @OnMessage
    public void onMessage(String message,Session session){
        if (message.isEmpty()){
            return;
        }

        //#开头为特殊命令,用于和服务器交互,其他
        if (message.toLowerCase().startsWith("#")){
            if (message.toLowerCase().substring(1).startsWith("connect")){
                //connect为特殊指令,声明要连接的设备SN
                String SN=message.substring(9);
                DeviceModel device = findDevice(SN);
                ResponseBean responseBean=new ResponseBean();
                if (device==null){
                    responseBean.setCode(-1);
                    responseBean.setMsg("未找到相应设备");
                }else {
                    deviceSocketHandler=new DeviceSocketHandler(device);
                    responseBean.setCode(0);
                    responseBean.setMsg("连接成功");
                }
                ObjectMapper mapper=new ObjectMapper();
                String jsonStr="";
                try {
                    jsonStr=mapper.writeValueAsString(responseBean);
                } catch (JsonProcessingException e) {
                    e.printStackTrace();
                }

                sendMessage("#"+jsonStr);
            }


        }else {
            //收到其他内容,直接无差别发送到设备
            SendDeviceMsgEvent event = new SendDeviceMsgEvent(deviceSocketHandler.getDeviceModel(), message);
            EventBus.getDefault().post(event);
        }

    }

    /**
     * 发生错误
     * @param session
     * @param error
     */
    @OnError
    public void onError(Session session,Throwable error){
        logger.error("websocket发生错误");
        error.printStackTrace();
        deviceSocketHandler.stopProgress();
    }


    private DeviceModel findDevice(String SN){
        List<DeviceModel> allDevice = temperaturerService.getAllDevice();
        Optional<DeviceModel> first = allDevice.stream().filter(deviceModel -> deviceModel.getSN().equals(SN)).findFirst();
        return first.orElse(null);
    }


    /**
     * 发送信息到前端页面
     * @param msg
     */
    private void sendMessage(String msg){
        try {
            session.getBasicRemote().sendText(msg);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
