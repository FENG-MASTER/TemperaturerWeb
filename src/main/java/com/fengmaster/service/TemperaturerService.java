package com.fengmaster.service;

import com.fengmaster.domain.DeviceModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Feng-master on 19/01/07.
 */
@Service
public class TemperaturerService {

    @Autowired
    TcpService tcpService;


    /**
     * 获取所有设备列表
     * @return
     */
    public List<DeviceModel> getAllDevice(){
        return tcpService.getDeviceModels();
    }







}
