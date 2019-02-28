<%--
  Created by IntelliJ IDEA.
  User: qianzise
  Date: 19/01/07
  Time: 12:41
  To change this template use File | Settings | File Templates.
  控制面板

  传入参数:
    SN:表示要控制的设备SN号
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <script src="../layui/layui.js"></script>
    <script src="../jquery.js"></script>

</head>
<body>

<form class="layui-form" action="">


<div class="layui-collapse">
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">设备控制</h2>
        <div class="layui-colla-content layui-show">

            <table class="layui-table">
                <colgroup>
                    <col width="30%">
                    <col width="70%">
                </colgroup>
                <tbody>
                <tr>
                    <td>
                        <label class="layui-form-label" style="width: 100px;">设备标识码SN:</label>
                    </td>
                    <td>
                        <div class="layui-input-block">
                            <input type="text" id="SN" name="SN" required lay-verify="required" placeholder="请输入"
                                   autocomplete="off" class="layui-input" value="<%= request.getParameter("SN")%>">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button class="layui-btn" lay-submit="" lay-filter="query" id="query" name="query">查询</button>
                            </div>
                        </div>
                    </td>
                    <td></td>

                </tr>

                </tbody>
            </table>


        </div>
    </div>
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">温度</h2>
        <div class="layui-colla-content layui-show" name="xx">

            <table class="layui-table">
                <colgroup>
                    <col width="20%">
                    <col width="40%">
                    <col width="40%">
                </colgroup>
                <tbody>
                <% for (int i = 1; i <= 3; i++) {%>
                <tr>
                    <td><label class="layui-form-label">温度T<%=i%>:<a>30</a>°C</label></td>
                    <td>
                        <label class="layui-form-label">a=</label>
                        <div class="layui-input-block">
                            <input type="text" id="T<%=i%>_a" name="T<%=i%>_a" required lay-verify="required" placeholder="请输入"
                                   autocomplete="off" class="layui-input">
                        </div>
                    </td>
                    <td>
                        <label class="layui-form-label">b=</label>
                        <div class="layui-input-block">
                            <input type="text" id="T<%=i%>_b"  name="T<%=i%>_b" required lay-verify="required" placeholder="请输入"
                                   autocomplete="off" class="layui-input">
                        </div>

                    </td>
                </tr>

                <%}%>
                </tbody>
            </table>


        </div>
    </div>

    <div class="layui-colla-item">
        <h2 class="layui-colla-title">湿度</h2>
        <div class="layui-colla-content layui-show">

            <table class="layui-table">
                <colgroup>
                    <col width='20%'>
                    <col width='40%'>
                    <col width='40%'>
                </colgroup>
                <tbody>
                <% for (int i = 1; i <= 3; i++) {%>
                <tr>
                    <td><label class="layui-form-label">湿度RH<%=i%>:<a>100</a>%</label></td>
                    <td>
                        <label class="layui-form-label">a=</label>
                        <div class="layui-input-block">
                            <input type="text" id="RH<%=i%>_a" name="RH<%=i%>_a" required lay-verify="required" placeholder="请输入"
                                   autocomplete="off" class="layui-input">
                        </div>
                    </td>
                    <td>
                        <label class="layui-form-label">b=</label>
                        <div class="layui-input-block">
                            <input type="text" id="RH<%=i%>_b" name="RH<%=i%>_b" required lay-verify="required" placeholder="请输入"
                                   autocomplete="off" class="layui-input">
                        </div>

                    </td>
                </tr>

                <%}%>
                </tbody>
            </table>


        </div>
    </div>
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">触发器</h2>
        <div class="layui-colla-content layui-show">

            <table class="layui-table">
                <colgroup >
                    <col width='10%'>
                    <col width='60%'>
                    <col width='30%'>
                </colgroup>
                <tbody>
                <% for (int i = 1; i <= 4; i++) {%>
                <tr >
                    <td><label class="layui-form-label">K<%=i%>:</label></td>
                    <td>
                                <div class="layui-inline" style="width: 100px;" ><input type="text" id="K<%=i%>_Min"  name="K<%=i%>_Min" required lay-verify="required" placeholder="请输入"
                                                                 autocomplete="off" class="layui-input"></div>
                                <div class="layui-inline" style="width: 100px;">

                                    <select name="K<%=i%>_Relation"  lay-verify="required">
                                        <option value="T1">T1</option>
                                        <option value="T2">T2</option>
                                        <option value="T3">T3</option>
                                        <option value="RH1">RH1</option>
                                        <option value="RH2">RH2</option>
                                        <option value="RH3">RH3</option>

                                    </select>
                                </div>
                                <div class="layui-inline" style="width: 100px;">
                                    <input type="text" id="K<%=i%>_Max" name="K<%=i%>_Max" required lay-verify="required" placeholder="请输入"
                                           autocomplete="off" class="layui-input">

                                </div>


                    </td>
                    <td>
                                <select id="K<%=i%>_Mode" name="K<%=i%>_Mode" lay-verify="required">
                                    <option value="AUTO">自动</option>
                                    <option value="M-D">常开</option>
                                    <option value="M-E">常闭</option>


                                </select>
                    </td>
                </tr>

                <%}%>
                </tbody>
            </table>


        </div>
    </div>

</div>

</form>

<script>



    //初始化websocket相关
    var webSocket=null;

    //判断当前浏览器是否支持webSocket
    if ('WebSocket' in window){
        webSocket=new WebSocket("ws://<%=request.getLocalAddr()%>:<%=request.getLocalPort()%>/websocket/control")
    }else {
        alert("您使用的浏览器不支持websocket通讯协议,无法使用远程控制设备功能")
    }

    //发送消息
    function send(msg){
        webSocket.send(msg);
    }

    webSocket.onerror=function(){
      alert("发生错误,连接断开");
    };

    webSocket.onopen=function(){
        send("#connect "+$('#SN').val());
    };

    webSocket.onclose=function(){

    };

    webSocket.onmessage=function(event){
        if (event.data.startsWith("#")){
            //特殊指令返回值,#后面为返回json报文
            var msg = event.data.substr(1);
            var jmsg = JSON.parse(msg);
            if (jmsg["code"]=="0"){
                alert("连接成功");
            } else {
                alert("连接失败"+jmsg["msg"]);
            }

        } else {
            //非特殊指令返回值,数据源来自设备,需要解析并显示
            var obj=JSON.parse(msg);

            <% for (int i=1;i<=3;i++){%>
            $('#T<%=i%>_a').val(obj["T<%=i%>"]["A"]);
            $('#T<%=i%>_b').val(obj["T<%=i%>"]["B"]);
            <%}%>


            <% for (int i=1;i<=3;i++){%>
            $('#RH<%=i%>_a').val(obj["RH<%=i%>"]["A"]);
            $('#RH<%=i%>_b').val(obj["RH<%=i%>"]["B"]);
            <%}%>


            <% for (int i=1;i<=4;i++){%>
            $('#K<%=i%>_Relation').val(obj["K<%=i%>"]["R"]);
            $('#K<%=i%>_Mode').val(obj["K<%=i%>"]["M"]);
            $('#K<%=i%>_Min').val(obj["K<%=i%>"]["Min"]);
            $('#K<%=i%>_Max').val(obj["K<%=i%>"]["Max"]);

            <%}%>

        }

    };


    function formDateFormat(data){
        var formatData={};

        formatData["SN"]=data["SN"];

        <% for (int i=1;i<=3;i++){%>

            formatData["T<%=i%>"]={};
            formatData["T<%=i%>"]["A"]=data["T<%=i%>_a"];
            formatData["T<%=i%>"]["B"]=data["T<%=i%>_b"];

        <%}%>


        <% for (int i=1;i<=3;i++){%>

        formatData["RH<%=i%>"]={};
        formatData["RH<%=i%>"]["A"]=data["RH<%=i%>_a"];
        formatData["RH<%=i%>"]["B"]=data["RH<%=i%>_b"];

        <%}%>


        <% for (int i=1;i<=4;i++){%>

        formatData["K<%=i%>"]={};
        formatData["K<%=i%>"]["R"]=data["K<%=i%>_Relation"];
        formatData["K<%=i%>"]["Min"]=data["K<%=i%>_Min"];
        formatData["K<%=i%>"]["Max"]=data["K<%=i%>_Max"];
        formatData["K<%=i%>"]["M"]=data["K<%=i%>_Mode"];

        <%}%>

        return formatData;

    }


    layui.use(['element', 'form'], function () {
        var element = layui.element;
        var form = layui.form;
        //…


        form.on('submit(query)', function(data){
            //查询设备信息
            send(JSON.stringify(formDateFormat(data.field)));
            return false;
        });
    });
</script>

</body>
</html>
