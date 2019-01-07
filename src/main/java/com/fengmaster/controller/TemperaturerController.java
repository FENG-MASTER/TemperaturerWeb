package com.fengmaster.controller;

import com.fengmaster.domain.DeviceModel;
import com.fengmaster.domain.res.ResponseBean;
import com.fengmaster.service.TemperaturerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 温控相关控制器
 * Created by Feng-master on 19/01/07.
 */
@Controller
@RequestMapping(value = "device")
public class TemperaturerController {


    @Autowired
    TemperaturerService temperaturerService;

    @RequestMapping(value = "list")
    public String listDeviceView(){
        return "listdevice";
    }

    @RequestMapping(value = "controlpanel")
    public String controlPanel(){
        return "controlpanel";
    }

    /**
     * 获取所有设备列表
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "getList",produces = "application/json;charset=UTF-8")
    public ResponseBean getDeviceList(){

        List<DeviceModel> allDevice = temperaturerService.getAllDevice();
        ResponseBean responseBean=new ResponseBean(0,"",allDevice.size(),allDevice);
        return responseBean;
    }






}
