<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>温控中心</title>
    <link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.6.2/css/sm.min.css">

    <script src="../jquery.js"></script>
    <script src="../common.js"></script>

    <script type='text/javascript' src='//g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm.min.js' charset='utf-8'></script>

    <link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.6.2/css/??sm.min.css,sm-extend.min.css">
    <script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/??sm.min.js,sm-extend.min.js' charset='utf-8'></script>

</head>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>温控中心</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="/favicon.ico">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.6.2/css/sm.min.css">
    <link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.6.2/css/sm-extend.min.css">

</head>
<body>
<div class="page-group">
    <div class="page" id="page-index">
        <header class="bar bar-nav">
            <a class="icon icon-me pull-left open-panel" data-panel=".panel-left"></a>
            <a class="button button-link button-nav pull-right open-popup" data-popup=".popup-about">
                关于
                <span class="icon icon-menu"></span>
            </a>
            <h1 class="title">温控中心</h1>
        </header>

        <div class="content" id='page-index'>
            <div class="content-inner">
                <div class="content-block-title">功能列表</div>
                <div class="list-block">
                    <ul>
                        <li>
                            <a  onclick="goTo('/device/list')" class="item-link item-content">
                                <div class="item-inner">
                                    <div class="item-title">搜索所有设备</div>
                                </div>
                            </a>
                        </li>

                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="popup popup-about">
        <header class="bar bar-nav">
            <a class="button button-link button-nav pull-right close-popup">
                关闭
            </a>
            <h1 class="title">关于</h1>
        </header>
        <div class="content">
            <div class="content-inner">
                <div class="content-block">
                    <p>远端操控温度湿度控制器APP</p>
                    <p></p>
                    <p><a class="button close-popup">确定</a></p>
                </div>
            </div>
        </div>
    </div>

    <div class="panel-overlay"></div>
    <!-- Left Panel with Reveal effect -->
    <div class="panel panel-left panel-reveal">
        <div class="content-block">
            <p>敬请期待</p>
            <p></p>
            <!-- Click on link with "close-panel" class will close panel -->
            <p><a href="#" class="close-panel">关闭</a></p>
        </div>
    </div>



</div>
<script src="/dist/js/sm.js"></script>
<script src="/dist/js/sm-extend.js"></script>
<script src="/dist/js/sm-city-picker.js"></script>
<script src="/assets/js/demos.js"></script>
</body>
</html>
</html>