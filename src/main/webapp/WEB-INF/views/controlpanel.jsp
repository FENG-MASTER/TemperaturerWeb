<%--
  Created by IntelliJ IDEA.
  User: qianzise
  Date: 19/01/07
  Time: 12:41
  To change this template use File | Settings | File Templates.
  控制面板
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <script src="../layui/layui.js"></script>
</head>
<body>

<form class="layui-form" action="">
<div class="layui-collapse">
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">温度</h2>
        <div class="layui-colla-content layui-show">

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
                            <input type="text" name="title" required lay-verify="required" placeholder="请输入"
                                   autocomplete="off" class="layui-input">
                        </div>
                    </td>
                    <td>
                        <label class="layui-form-label">b=</label>
                        <div class="layui-input-block">
                            <input type="text" name="title" required lay-verify="required" placeholder="请输入"
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
                    <td><label class="layui-form-label">湿度HR<%=i%>:<a>100</a>%</label></td>
                    <td>
                        <label class="layui-form-label">a=</label>
                        <div class="layui-input-block">
                            <input type="text" name="title" required lay-verify="required" placeholder="请输入"
                                   autocomplete="off" class="layui-input">
                        </div>
                    </td>
                    <td>
                        <label class="layui-form-label">b=</label>
                        <div class="layui-input-block">
                            <input type="text" name="title" required lay-verify="required" placeholder="请输入"
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
                                <div class="layui-inline" style="width: 100px;" ><input type="text" name="title" required lay-verify="required" placeholder="请输入"
                                                                 autocomplete="off" class="layui-input"></div>
                                <div class="layui-inline" style="width: 100px;">

                                    <select name="k<%=i%>Trigger"  lay-verify="required">
                                        <option value="T1">T1</option>
                                        <option value="T2">T2</option>
                                        <option value="T3">T3</option>
                                        <option value="RH1">RH1</option>
                                        <option value="RH2">RH2</option>
                                        <option value="RH3">RH3</option>

                                    </select>
                                </div>
                                <div class="layui-inline" style="width: 100px;">
                                    <input type="text" name="title" required lay-verify="required" placeholder="请输入"
                                           autocomplete="off" class="layui-input">

                                </div>


                    </td>
                    <td>
                                <select name="k<%=i%>TriggerType" lay-verify="required">
                                    <option value="T1">自动</option>
                                    <option value="T2">常开</option>
                                    <option value="T3">常闭</option>


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

    layui.use(['element', 'form'], function () {
        var element = layui.element;
        var form = layui.form;
        //…
    });
</script>

</body>
</html>
