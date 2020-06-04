<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>

<head lang="en">
    <meta charset="UTF-8">
    <title>登录</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="stylesheet" href="../AmazeUI-2.4.2/assets/css/amazeui.css" />
    <link href="../css2/dlstyle.css" rel="stylesheet" type="text/css">

    <script type="text/javascript" src="../angularjs/angular.min.js"></script>
    <script type="text/javascript" src="../angularjs/base.js"></script>
    <script type="text/javascript" src="../angularjs/service/loginService.js"></script>
    <script type="text/javascript" src="../angularjs/controller/loginController.js"></script>
</head>

<body ng-app="itcast-shop" ng-controller="loginController" ng-init="">

<div class="login-boxtitle">
    <a href="home.html"><img alt="logo" src="../images/logobig.png" /></a>
</div>

<div class="login-banner">
    <div class="login-main">
        <div class="login-banner-bg"><span></span><img src="../images/big.jpg" /></div>
        <div class="login-box">

            <h3 class="title">登录商城</h3>

            <div class="clear"></div>

            <div class="login-form">
                <form>
                    <div class="user-name">
                        <label for="user"><i class="am-icon-user"></i></label>
                        <input type="text" name="" ng-model="user.username" id="user" placeholder="邮箱/手机/用户名">
                    </div>
                    <div class="user-pass">
                        <label for="password"><i class="am-icon-lock"></i></label>
                        <input type="password" name=""  ng-model="user.password" id="password" placeholder="请输入密码">
                    </div>
                </form>
            </div>

            <div class="login-links">
                <label for="remember-me"><input id="remember-me" type="checkbox">记住密码</label>
                <a href="#" class="am-fr">忘记密码</a>
                <a href="toregister" class="zcnext am-fr am-btn-default">注册</a>
                <br />
            </div>
            <div class="am-cf">
                <input type="submit" name=""  ng-click="login()" value="登 录" class="am-btn am-btn-primary am-btn-sm">
            </div>
            <div class="partner">
                <h3>合作账号</h3>
                <div class="am-btn-group">
                    <li><a href="javascript:void(0)"><i class="am-icon-qq am-icon-sm"></i><span>QQ登录</span></a></li>
                    <li><a href="javascript:void(0)"><i class="am-icon-weibo am-icon-sm"></i><span>微博登录</span> </a>
                    </li>
                    <li><a href="javascript:void(0)"><i class="am-icon-weixin am-icon-sm"></i><span>微信登录</span> </a>
                    </li>
                </div>
            </div>

        </div>
    </div>
</div>


<div class="footer ">
    <div class="footer-hd ">
        <p>
            <a href="index.html">商城首页</a>
            <b>|</b>
            <a href="https://www.alipay.com/">支付宝</a>
            <b>|</b>
            <a href="javascript:void(0)">物流</a>
        </p>
    </div>
    <div class="footer-bd ">
        <p>
            <a href="javascript:void(0)">合作伙伴</a>
            <a href="javascript:void(0)">联系我们</a>
            <a href="javascript:void(0)">网站地图</a>
            <em>© 2019-2019 www.www.com 版权所有</em>
        </p>
    </div>
</div>
</body>

</html>