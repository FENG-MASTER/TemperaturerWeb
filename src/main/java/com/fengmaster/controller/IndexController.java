package com.fengmaster.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Feng-master on 19/01/07.
 */
@Controller
@RequestMapping
public class IndexController {

    @RequestMapping(value = {"/","index"})
    public String index(){
        return "index";
    }

}
