package com.fengmaster.handler;

import com.fengmaster.domain.DeviceModel;
import com.fengmaster.event.ReceiveDeviceMsgEvent;
import com.fengmaster.event.SendDeviceMsgEvent;
import com.fengmaster.service.TcpService;
import org.greenrobot.eventbus.EventBus;
import org.greenrobot.eventbus.Subscribe;
import org.greenrobot.eventbus.ThreadMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.*;
import java.net.Socket;
import java.util.Arrays;
import java.util.Scanner;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingDeque;

/**
 * Created by Feng-master on 19/02/15.
 */
public class DeviceSocketHandler extends Thread{

    private final Logger logger= LoggerFactory.getLogger(TcpService.class.getName());


    /**
     * 控制设备对象
     */
    private DeviceModel deviceModel;

    /**
     * 设备对应的socket
     */
    private Socket socket;


    private boolean stopFlag=false;

    private BlockingQueue<String> sendMsgQueue=new LinkedBlockingDeque<>();

    public DeviceSocketHandler(DeviceModel deviceModel) {
        this.deviceModel = deviceModel;
        socket=deviceModel.getSocket();
        EventBus.getDefault().register(this);
    }

    @Override
    public void run() {
        PrintWriter writer=null;
        Scanner scanner=null;
        StringBuffer stringBuffer=new StringBuffer();


        try {
            InputStream inputStream = socket.getInputStream();
            scanner=new Scanner(inputStream);

            OutputStream outputStream=socket.getOutputStream();
            writer=new PrintWriter(new OutputStreamWriter(outputStream));

        } catch (IOException e) {
            e.printStackTrace();
        }
        while (!stopFlag){
            //检查是否连接正常
            if (!socket.isConnected()||socket.isClosed()||socket.isOutputShutdown()){
                stopFlag=true;
                break;
            }


            if (!sendMsgQueue.isEmpty()){
                //有内容要发送到设备
                String msg = sendMsgQueue.poll();
                try{
                    writer.println(msg);
                    writer.flush();
                }catch (Exception e){
                    stopProgress();
                    break;
                }

            }



            if (!socket.isConnected()||socket.isClosed()||socket.isInputShutdown()){
                stopFlag=true;
                break;
            }


            String readMsg=null;
            //尝试读取数据

            try {
                readMsg=scanner.next();
            }catch (Exception e){
                stopProgress();
                break;
            }


            if (readMsg!=null&&!readMsg.isEmpty()){
                //读取到内容
                logger.info("接受到信息:"+readMsg);
                //发送接收到设备信息事件
                ReceiveDeviceMsgEvent receiveDeviceMsgEvent = new ReceiveDeviceMsgEvent(deviceModel, readMsg);
                EventBus.getDefault().post(receiveDeviceMsgEvent);
                stringBuffer.setLength(0);
            }

        }

        EventBus.getDefault().unregister(this);
    }


    @Subscribe(threadMode = ThreadMode.POSTING)
    public void sendToDevice(SendDeviceMsgEvent sendDeviceMsgEvent){
        logger.info("接收到 发送信息请求");
        if (sendDeviceMsgEvent.getDeviceModel().equals(deviceModel)){
            //如果要发送的设备是当前handler处理的设备
            sendMsgQueue.add(sendDeviceMsgEvent.getMsg());
        }

    }

    @Subscribe(threadMode = ThreadMode.POSTING)
    public void receiveMsg(ReceiveDeviceMsgEvent receiveDeviceMsgEvent){
        logger.info("接收到 接收信息事件");
        if (receiveDeviceMsgEvent.getDeviceModel().equals(deviceModel)){
            EventBus.getDefault().post(new SendDeviceMsgEvent(deviceModel,receiveDeviceMsgEvent.getMsg()+"1"));
        }

    }

    public void stopProgress(){
        stopFlag=true;
    }

}
