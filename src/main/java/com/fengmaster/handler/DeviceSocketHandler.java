package com.fengmaster.handler;

import com.fengmaster.domain.DeviceModel;
import com.fengmaster.event.SendDeviceMsgEvent;
import org.greenrobot.eventbus.Subscribe;
import org.greenrobot.eventbus.ThreadMode;

import java.io.*;
import java.net.Socket;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingDeque;

/**
 * Created by Feng-master on 19/02/15.
 */
public class DeviceSocketHandler implements Runnable{


    /**
     * 控制设备对象
     */
    private DeviceModel deviceModel;

    /**
     * 设备对应的socket
     */
    private Socket socket;

    private Thread thread;

    private boolean stopFlag=false;

    private BlockingQueue<String> sendMsgQueue=new LinkedBlockingDeque<>();

    public DeviceSocketHandler(DeviceModel deviceModel) {
        this.deviceModel = deviceModel;
        socket=deviceModel.getSocket();
        thread=new Thread(this);
        thread.start();
    }

    @Override
    public void run() {

        BufferedWriter writer=null;
        BufferedReader reader=null;

        try {
            InputStream inputStream = socket.getInputStream();
            reader=new BufferedReader(new InputStreamReader(inputStream));

            OutputStream outputStream=socket.getOutputStream();
            writer=new BufferedWriter(new OutputStreamWriter(outputStream));

        } catch (IOException e) {
            e.printStackTrace();
        }
        while (!stopFlag){

            if (!sendMsgQueue.isEmpty()){
                //有内容要发送到设备
                String msg = sendMsgQueue.poll();
                try {
                    writer.write(msg);
                } catch (IOException e) {
                    e.printStackTrace();
                }

            }


        }
    }


    @Subscribe(threadMode = ThreadMode.POSTING)
    public void sendToDevice(SendDeviceMsgEvent sendDeviceMsgEvent){
        if (sendDeviceMsgEvent.getDeviceModel().equals(deviceModel)){
            //如果要发送的设备是当前handler处理的设备
            sendMsgQueue.add(sendDeviceMsgEvent.getMsg());
        }

    }


    public void stop(){
        stopFlag=true;
    }
}
