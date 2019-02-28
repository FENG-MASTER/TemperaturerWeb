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
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>全部设备</title>
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
    <script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/??sm.min.js,sm-extend.min.js' charset='utf-8'></script>


</head>
<body>
<div class="page-group">
    <div id="page-view-list" class="page">
        <header class="bar bar-nav">
            <a class="button button-link button-nav pull-left back" href="/">
                <span class="icon icon-left"></span>
                返回
            </a>
            <h1 class="title">列表</h1>
        </header>
        <div class="content">
            <div class="content-block-title">全部设备</div>
            <div class="list-block">
                <ul id="ul_list">


                </ul>
                <div class="list-block-label" >到底了</div>
            </div>

        </div>
    </div>

</div>

<script>

    $(document).ready(function () {
        $.ajax({
            type : "POST", //提交方式
            url : "${pageContext.request.contextPath}/device/getList",//路径
            success : function(result) {//返回数据根据结果进行相应的处理
                if ( result.code=="0" ) {
                    //获取成功

                    for (var i=0;i<result.count;i++){


                        var liStr="<li class=\"item-content\" onclick=\"goTo('/device/controlpanel?SN="+result.data[i].sn+"');\">\n" +
                            "                        <div class=\"item-media\"><i class=\"icon icon-f7\"></i></div>\n" +
                            "                        <div class=\"item-inner\">\n" +
                            "                            <div class=\"item-title\">设备</div>\n" +
                            "                            <div class=\"item-after\">"+result.data[i].sn+"</div>\n" +
                            "                        </div>\n" +
                            "                    </li>";

                        $('#ul_list').append(liStr);

                    }


                } else {
                    alert("获取列表失败")
                }
            }
        });

    })


</script>

</body>
</html>
