package com.fengmaster.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fengmaster.domain.DeviceModel;
import com.fengmaster.handler.DeviceSocketHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.io.*;
import java.net.Inet4Address;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.List;

/**
 * 传透协议(TCP) 服务层
 * 这个类只负责接收socket
 * Created by Feng-master on 19/01/16.
 */
@Service
public class TcpService implements Runnable{

    private final Logger logger= LoggerFactory.getLogger(TcpService.class.getName());

    private ServerSocket serverSocket;

    /**
     * 端口
     */
    private int port=37458;

    /**
     * 超时时间
     */
    private int timeout=0;

    private List<DeviceModel> deviceModels=new ArrayList<>();

    public TcpService() {
        try {
            if (serverSocket==null){
                serverSocket=new ServerSocket(port);
                logger.info("服务器在端口"+port+"等待消息");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        new Thread(this).start();
    }

    @Override
    public void run(){


        while (true){
            Socket socket;

            try {
                socket=serverSocket.accept();
                logger.info("收到来自设备的连接,设备地址:"+socket.getInetAddress()+"设备端口:"+socket.getPort());
                socket.setSoTimeout(timeout);

                //设备连接上后,必须主动发送SN码,这里用于接收SN码
                int sn = readSN(socket);
                if (sn==-1){
                    //获取SN失败
                    logger.error("获取SN码失败!");
                }else {
                    logger.info("连接设备SN为"+sn);
                    DeviceModel model = new DeviceModel(socket);
                    model.setSN(sn+"");
                    deviceModels.add(model);
                }


                //TODO:测试用
//                OutputStream outputStream=socket.getOutputStream();
//                BufferedWriter writer=new BufferedWriter(new OutputStreamWriter(outputStream));
//                writer.write("{\"T\":\"C\"}");
//                writer.flush();
//                logger.info("写TC到socket中");

            } catch (IOException e) {
                e.printStackTrace();
            }


        }

    }


    private int readSN(Socket socket){
        InputStream inputStream = null;
        try {
            inputStream = socket.getInputStream();
        } catch (IOException e) {
            e.printStackTrace();
        }
        Reader reader=new InputStreamReader(inputStream);

        int len=0;
        char [] buffer=new char[1024];
        try {
            len=reader.read(buffer);
        } catch (IOException e) {
            e.printStackTrace();
        }

        if (len>0){
            String s = new String(buffer, 0, len);
            ObjectMapper mapper=new ObjectMapper();
            SNObj snObj=null;
            try {
                snObj=mapper.readValue(s,SNObj.class);
            } catch (IOException e) {
                e.printStackTrace();
            }

            if (snObj==null){
                return -1;
            }
            return snObj.SN;
        }else {
            return -1;
        }
    }

    private static class SNObj{
        public int SN;
    }


    public int getPort() {
        return port;
    }

    public void setPort(int port) {
        this.port = port;
    }

    public int getTimeout() {
        return timeout;
    }

    public void setTimeout(int timeout) {
        this.timeout = timeout;
    }

    public List<DeviceModel> getDeviceModels() {
        return deviceModels;
    }
}
