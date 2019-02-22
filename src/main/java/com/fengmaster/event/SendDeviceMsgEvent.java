package com.fengmaster.event;

import com.fengmaster.domain.DeviceModel;

/**
 * 发送信息给设备事件
 * Created by Feng-master on 19/02/15.
 */
public class SendDeviceMsgEvent {

    /**
     * 设备对象
     */
    private DeviceModel deviceModel;

    /**
     * 要发送的信息
     */
    private String msg;


    public SendDeviceMsgEvent(DeviceModel deviceModel, String msg) {
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
