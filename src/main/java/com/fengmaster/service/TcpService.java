package com.fengmaster.service;

import com.fengmaster.domain.DeviceModel;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.io.IOException;
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
    private int timeout=3000;

    private List<DeviceModel> deviceModels=new ArrayList<>();

    public TcpService() {
        try {
            if (serverSocket==null){
                serverSocket=new ServerSocket(port,10, Inet4Address.getLocalHost());
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

                deviceModels.add(new DeviceModel(socket));

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
