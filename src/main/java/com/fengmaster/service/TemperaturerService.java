package com.fengmaster.service;

import com.fengmaster.domain.DeviceModel;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Feng-master on 19/01/07.
 */
@Service
public class TemperaturerService {


    /**
     * 获取所有设备列表
     * @return
     */
    public List<DeviceModel> getAllDevice(){
        List<DeviceModel> list=new ArrayList<>();

        for (int i=0;i<20;i++){
            DeviceModel model=new DeviceModel();
            model.setName("设备"+i);
            model.setBluetoothAddress(i*1000+"");
            model.setSN(i+"");
            list.add(model);
        }
        return list;
    }


}
