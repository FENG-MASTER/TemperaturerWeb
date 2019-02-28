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
public class DeviceSocketHandler{

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

    /**
     * 接受设备信息线程
     */
    private Thread readThread;

    private Runnable readRunable=new Runnable() {
        @Override
        public void run() {
            Reader reader=null;
            char [] buffer=new char[4096];
            Arrays.fill(buffer,'\0');
            try {
                InputStream inputStream = socket.getInputStream();
                reader=new InputStreamReader(inputStream);

            } catch (IOException e) {
                e.printStackTrace();
            }
            while (!stopFlag){

                if (!socket.isConnected()||socket.isClosed()||socket.isInputShutdown()){
                    stopFlag=true;
                    break;
                }

                int readLen=0;
                String readMsg=null;
                //尝试读取数据

                try {
                    readLen=reader.read(buffer);
                }catch (Exception e){
                    stopProgress();
                    break;
                }


                if (readLen>0){
                    //读取到内容
                    readMsg=new String(buffer,0,readLen);
                    logger.info("接受到信息:"+readMsg);
                    //发送接收到设备信息事件
                    ReceiveDeviceMsgEvent receiveDeviceMsgEvent = new ReceiveDeviceMsgEvent(deviceModel, readMsg);
                    EventBus.getDefault().post(receiveDeviceMsgEvent);
                    Arrays.fill(buffer,'\0');
                }

            }

        }
    };


    /**
     * 发送设备信息线程
     */
    private Thread writeThread;

    private Runnable writeRunable=new Runnable() {
        @Override
        public void run() {
            PrintWriter writer=null;

            try {
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
                        logger.info("发送数据到设备"+deviceModel.getSN()+",内容:"+msg);
                        writer.println(msg);
                        writer.flush();
                    }catch (Exception e){
                        stopProgress();
                        break;
                    }

                }

                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }


            }
        }
    };





    private BlockingQueue<String> sendMsgQueue=new LinkedBlockingDeque<>();

    public DeviceSocketHandler(DeviceModel deviceModel) {
        this.deviceModel = deviceModel;
        socket=deviceModel.getSocket();
        readThread=new Thread(readRunable);
        writeThread=new Thread(writeRunable);
        EventBus.getDefault().register(this);

        readThread.start();
        writeThread.start();
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
        EventBus.getDefault().unregister(this);
    }

    public DeviceModel getDeviceModel() {
        return deviceModel;
    }

    public void setDeviceModel(DeviceModel deviceModel) {
        this.deviceModel = deviceModel;
    }
}
