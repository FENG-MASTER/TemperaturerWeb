package com.fengmaster.domain;

/**
 * 设备信息实体对象
 * Created by Feng-master on 19/01/07.
 */
public class DeviceModel {

    /**
     * 蓝牙地址
     */
    private String bluetoothAddress;

    /**
     * 设备名称
     */
    private String name;

    /**
     * 设备SN序列号
     */
    private String SN;


    private String ip;


    public String getBluetoothAddress() {
        return bluetoothAddress;
    }

    public void setBluetoothAddress(String bluetoothAddress) {
        this.bluetoothAddress = bluetoothAddress;
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

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }
}
