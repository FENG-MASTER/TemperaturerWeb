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
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>控制器</title>
    <meta name="description" content="MSUI: Build mobile apps with simple HTML, CSS, and JS components.">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="/favicon.ico">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">

    <!-- Google Web Fonts -->
    <script src="../jquery.js"></script>
    <script src="../common.js"></script>


    <link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.6.2/css/sm.min.css">
    <script type='text/javascript' src='//g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm.min.js' charset='utf-8'></script>

    <link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.6.2/css/??sm.min.css,sm-extend.min.css">
    <script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/??sm.min.js,sm-extend.min.js'
            charset='utf-8'></script>

</head>
<body>
<body>
<div class="page-group">
    <div id="page-label-input" class="page">
        <header class="bar bar-nav">
            <a class="button button-link button-nav pull-left back" href="/demos/form">
                <span class="icon icon-left"></span>
                返回
            </a>
            <h1 class="title">控制器</h1>
        </header>
        <div class="content">
            <div class="content-block-title">设备控制</div>
            <div class="list-block">
                <ul>
                    <li>
                        <div class="item-content">
                            <div class="item-media"><i class="icon icon-form-name"></i></div>
                            <div class="item-inner">
                                <div class="item-title label">设备标识码SN</div>
                                <div class="item-input">
                                    <input id="sn" disabled type="text" value="<%= request.getParameter("SN")%>">
                                </div>
                            </div>
                        </div>
                    </li>

                    <li>
                        <div class="item-content">
                            <table border="0" style="width: 100%">
                                <tr style="width: 100%">
                                    <td width="50%">
                                        <div class="item-inner">
                                            <div class="item-title label" style="width: 50%">自动查询</div>
                                            <div class="item-input" style="width: 50%">
                                                <label class="label-switch" onchange="autoQuery()">
                                                    <input type="checkbox" id="swAutoQuery">
                                                    <div class="checkbox"></div>
                                                </label>
                                            </div>
                                        </div>
                                    </td>

                                    <td width="50%">
                                        <div class="item-inner" style="display:none;" id="selectAutoQueryInterval">
                                            <div class="item-title label" style="width: 50%">查询间隔</div>
                                            <div class="item-input" style="width: 50%">
                                                <select>
                                                    <option>2S</option>
                                                    <option>3S</option>
                                                    <option>5S</option>

                                                </select>
                                            </div>
                                        </div>
                                    </td>


                                <tr/>
                            </table>

                        </div>
                    </li>


                </ul>
            </div>


            <div class="content-block-title">温湿度控制</div>
            <div class="list-block">
                <ul>

                    <% for (int i = 1; i <= 3; i++) {%>
                    <li>
                        <div class="item-content">
                            <div class="item-inner">

                                <table border="0" style="width: 100%">
                                    <tr style="width: 100%">
                                        <td width="25%">
                                            <div style="width: 100%" class="item-title label">温度T<%=i%>
                                            </div>
                                        </td>

                                        <td width="25%">
                                            <div id="T<%=i%>_val" style="width: 100%" class="item-title label">60°</div>
                                        </td>

                                        <td width="5%">
                                            <div style="width: 100%" class="item-title label">A</div>
                                        </td>

                                        <td width="15%">
                                            <div style="width: 100%" class="item-input ">
                                                <input id="T<%=i%>_a" style="width: 100%" type="text" placeholder="0.0">
                                            </div>

                                        </td>

                                        <td width="5%">
                                            <div style="width: 100%" class="item-title label ">B</div>
                                        </td>

                                        <td style="width: 100%" width="15%">
                                            <div class="item-input ">
                                                <input id="T<%=i%>_b" type="text" placeholder="0.0">
                                            </div>

                                        </td>
                                    </tr>

                                </table>

                            </div>
                        </div>
                    </li>

                    <li>
                        <div class="item-content">
                            <div class="item-inner">

                                <table border="0" style="width: 100%">
                                    <tr style="width: 100%">
                                        <td width="25%">
                                            <div style="width: 100%" class="item-title label">湿度RH<%=i%>
                                            </div>
                                        </td>

                                        <td width="25%">
                                            <div id="RH<%=i%>_val" style="width: 100%" class="item-title label">60%
                                            </div>
                                        </td>

                                        <td width="5%">
                                            <div style="width: 100%" class="item-title label">A</div>
                                        </td>

                                        <td width="15%">
                                            <div style="width: 100%" class="item-input ">
                                                <input id="RH<%=i%>_a" style="width: 100%" type="text"
                                                       placeholder="0.0">
                                            </div>

                                        </td>

                                        <td width="5%">
                                            <div style="width: 100%" class="item-title label ">B</div>
                                        </td>

                                        <td style="width: 100%" width="15%">
                                            <div class="item-input ">
                                                <input id="RH<%=i%>_b" type="text" placeholder="0.0">
                                            </div>

                                        </td>
                                    </tr>

                                </table>

                            </div>
                        </div>
                    </li>


                    <%}%>

                </ul>
            </div>

            <div class="content-block-title">继电器控制</div>
            <div class="list-block">
                <ul>
                    <% for (int i = 1; i <= 4; i++) {%>
                    <li>
                        <div class="item-content">
                            <div class="item-inner">

                                <table border="0" style="width: 100%">
                                    <tr style="width: 100%">
                                        <td width="15%">
                                            <div style="width: 100%" class="item-title label">K<%=i%>
                                            </div>
                                        </td>


                                        <td width="15%">
                                            <div style="width: 100%" class="item-input ">
                                                <input id="K<%=i%>_Min" style="width: 100%" type="text"
                                                       placeholder="0.0">
                                            </div>

                                        </td>

                                        <td width="15%">
                                            <div class="item-input">
                                                <select id="K<%=i%>_Relation">
                                                    <option>T1</option>
                                                    <option>T2</option>
                                                    <option>T3</option>
                                                    <option>RH1</option>
                                                    <option>RH2</option>
                                                    <option>RH3</option>
                                                </select>
                                            </div>
                                        </td>


                                        <td width="15%">
                                            <div style="width: 100%" class="item-input ">
                                                <input id="K<%=i%>_Max" style="width: 100%" type="text"
                                                       placeholder="0.0">
                                            </div>

                                        </td>

                                        <td width="15%">
                                            <div class="item-input">
                                                <select id="K<%=i%>_Mode">
                                                    <option>AUTO</option>
                                                    <option>M-D</option>
                                                    <option>M-E</option>
                                                </select>
                                            </div>
                                        </td>


                                    </tr>

                                </table>

                            </div>
                        </div>
                    </li>


                    <%}%>

                </ul>
            </div>

            <div class="content-block">
                <div class="row">
                    <div class="col-50"><a id="queryButton" onclick="query()" class="button button-big button-fill button">查询</a></div>
                    <div class="col-50"><a id="sendButton" onclick="sendParm()"
                                           class="button button-big button-fill button-success">发送</a></div>
                </div>
            </div>
        </div>
    </div>

</div>

<script>


    //初始化websocket相关
    var webSocket = null;

    /**
     *是否已经连接
     * @type {boolean}
     */
    var connectFlag = false;

    /**
     *自动查询标记
     * @type {boolean}
     */
    var autoQueryFlag = false;

    //判断当前浏览器是否支持webSocket
    if ('WebSocket' in window) {
        webSocket = new WebSocket("ws://<%=request.getLocalAddr()%>:<%=request.getLocalPort()%>/websocket/control")
    } else {
        alert("您使用的浏览器不支持websocket通讯协议,无法使用远程控制设备功能")
    }

    //发送消息
    function send(msg) {
        webSocket.send(msg);
    }

    webSocket.onerror = function () {
        alert("发生错误,连接断开");
        connectFlag = false;
    };

    webSocket.onopen = function () {
        send("#connect " + $('#sn').val());
    };

    webSocket.onclose = function () {

    };

    webSocket.onmessage = function (event) {

        if (event.data[0] == "#") {
            //特殊指令返回值,#后面为返回json报文
            var msg = event.data.substr(1);
            var jmsg = JSON.parse(msg);
            if (jmsg["code"] == "0") {
                alert("连接成功");
                connectFlag = true;
            } else if (jmsg["code"] == "-1") {
                alert("连接失败" + jmsg["msg"]);
                connectFlag = false;
                $('#queryButton').addClass("disabled");
                $('#sendButton').addClass("disabled");

            }else if (jmsg["code"] == "-2"){
                alert("设备错误" + jmsg["msg"]);

                setTimeout(function () {
                    goTo('/device/list');
                },2000)
            }

        } else {
            //非特殊指令返回值,数据源来自设备,需要解析并显示

            var obj = JSON.parse(event.data);

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


    function autoQuery() {
        if ($('#swAutoQuery').prop('checked')) {
            //开启自动查询
            $('#queryButton').addClass("disabled");
            $('#selectAutoQueryInterval').show();
            autoQueryFlag = true;
        } else {
            autoQueryFlag = false;
            $('#queryButton').removeClass("disabled");
            $('#selectAutoQueryInterval').hide();

        }

    }


    /**
     *查询设备信息
     */
    function query() {
        if (!connectFlag || autoQueryFlag) {
            return
        }
        send('{"SN":'+$('#sn').val()+',"T":"C"}')
    }

    /**
     *发送参数到设备
     */
    function sendParm() {
        if (!connectFlag || autoQueryFlag) {
            return
        }
        var formatData = {};

        formatData["SN"] = $('SN').val();

        <% for (int i=1;i<=3;i++){%>

        formatData["T<%=i%>"] = {};
        formatData["T<%=i%>"]["A"] = $('#T<%=i%>_a').val();
        formatData["T<%=i%>"]["B"] = $('#T<%=i%>_b').val();

        <%}%>


        <% for (int i=1;i<=3;i++){%>

        formatData["RH<%=i%>"] = {};
        formatData["RH<%=i%>"]["A"] = $('#RH<%=i%>_a').val();
        formatData["RH<%=i%>"]["B"] = $('#RH<%=i%>_b').val();

        <%}%>


        <% for (int i=1;i<=4;i++){%>

        formatData["K<%=i%>"] = {};
        formatData["K<%=i%>"]["R"] = $('#K<%=i%>_Relation').val();
        formatData["K<%=i%>"]["Min"] = $('#K<%=i%>_Min').val();
        formatData["K<%=i%>"]["Max"] = $('#K<%=i%>_Max').val();
        formatData["K<%=i%>"]["M"] = $('#K<%=i%>_Mode').val();

        <%}%>
        alert(JSON.stringify(formatData));
        send(JSON.stringify(formatData));
    }


</script>

</body>
</html>
