package com.fengmaster.event;

import com.fengmaster.domain.DeviceModel;

/**
 * 从设备接收信息事件
 * Created by Feng-master on 19/02/15.
 */
public class ReceiveDeviceMsgEvent {

    /**
     * 设备对象
     */
    private DeviceModel deviceModel;

    /**
     * 接收的信息
     */
    private String msg;


    public ReceiveDeviceMsgEvent(DeviceModel deviceModel, String msg) {
        this.deviceModel = deviceModel;
        this.msg = msg;
    }

    public DeviceModel getDeviceModel() {
        return deviceModel;
    }

    public String getMsg() {
        return msg;
    }
}
