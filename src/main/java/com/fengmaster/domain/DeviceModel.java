package com.fengmaster.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;

import java.net.Socket;

/**
 * 设备信息实体对象
 * Created by Feng-master on 19/01/07.
 */
public class DeviceModel {

    /**
     * 设备名称
     */
    private String name;

    /**
     * 设备SN序列号,主KEY
     */
    private String SN="-1";

    /**
     * 设备对应的sim卡电话号码
     */
    private String phoneNum;

    @JsonIgnore
    private Socket socket;

    public DeviceModel(Socket socket) {
        this.socket = socket;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSN() {
        return SN;
    }

    public void setSN(String SN) {
        this.SN = SN;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public Socket getSocket() {
        return socket;
    }

    public void setSocket(Socket socket) {
        this.socket = socket;
    }


    @Override
    public boolean equals(Object obj) {
        return SN.equals(((DeviceModel)obj).SN);
    }

    @Override
    public int hashCode() {
        return SN.hashCode();
    }
}
