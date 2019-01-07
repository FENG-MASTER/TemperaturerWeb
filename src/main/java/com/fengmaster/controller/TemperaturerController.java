package com.fengmaster.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Feng-master on 19/01/07.
 */
@Controller
@RequestMapping(value = "device")
public class TemperaturerController {


    @RequestMapping(value = "list")
    public String listDeviceView(){
        return "listdevice";
    }



}
