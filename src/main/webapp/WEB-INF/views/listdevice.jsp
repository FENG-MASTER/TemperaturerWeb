<%--
  Created by IntelliJ IDEA.
  User: qianzise
  Date: 19/01/07
  Time: 12:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>设备列表</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <script src="../layui/layui.js"></script>
</head>

<script>

    layui.use('table', function(){
        var table = layui.table;

        //第一个实例
        table.render({
            elem: '#deviceList'
            ,height: 'auto'
            ,url: '/device/getList' //数据接口
            ,page: true //开启分页
            ,cols: [[ //表头
                {field: 'bluetoothAddress', title: '地址', width:'30%',fixed: 'left'}
                ,{field: 'name', title: '设备名称', width:'20%'}
                ,{field: 'sn', title: '设备序列号', width:'25%'}
                ,{field: 'phoneNum', title: '手机号', width:'25%'}
            ]]
        });

    });

</script>

<body>
<table id="deviceList" lay-filter="list"></table>

</body>
</html>
