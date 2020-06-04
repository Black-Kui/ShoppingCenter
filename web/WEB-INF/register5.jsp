<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>

<head lang="en">
    <meta charset="UTF-8">
    <title>注册</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="stylesheet" href="../AmazeUI-2.4.2/assets/css/amazeui.min.css" />
    <link href="../css2/dlstyle.css" rel="stylesheet" type="text/css">
    <script src="../AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <script src="../AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>

    <script type="text/javascript" src="../angularjs/angular.min.js"></script>
    <script type="text/javascript" src="../angularjs/base.js"></script>
    <script type="text/javascript" src="../angularjs/service/loginService.js"></script>
    <script type="text/javascript" src="../angularjs/controller/loginController.js"></script>


    <!-- 用户信息 -->
    <script type="text/javascript" src="../basic/js/jquery.cookie.js"></script>
    <script type="text/javascript" src="../custom/userInfo.js"></script>
</head>

<body ng-app="itcast-shop" ng-controller="loginController" ng-init="">

<div class="login-boxtitle">
    <a href="home/demo.html"><img alt="" src="../images/logobig.png" /></a>
</div>

<div class="res-banner">
    <div class="res-main">
        <div class="login-banner-bg"><span></span><img src="../images/big.jpg" /></div>
        <div class="login-box">

            <div class="am-tabs" id="doc-my-tabs">
                <ul class="am-tabs-nav am-nav am-nav-tabs am-nav-justify">
                    <li class="am-active"><a href="">邮箱注册</a></li>
                    <li><a href="">手机号注册</a></li>
                </ul>

                <div class="am-tabs-bd">
                    <div class="am-tab-panel am-active">
                        <form method="post">

                            <div class="user-email">
                                <%--@declare id="email"--%><label for="email"><i class="am-icon-envelope-o"></i></label>
                                <input type="email" name="" ng-model="user.username"  placeholder="请输入邮箱账号">
                            </div>
                            <div class="user-pass">
                                <label for="password"><i class="am-icon-lock"></i></label>
                                <input type="password" name="" ng-model="user.password"
                                       placeholder="设置密码">
                            </div>
                            <div class="user-pass">
                                <label for="passwordRepeat"><i class="am-icon-lock"></i></label>
                                <input type="password" name="" ng-model="confirmPassword"
                                       placeholder="确认密码">
                            </div>

                        </form>

                        <div class="login-links">
                            <label for="reader-me">
                                <input id="reder-mea" type="checkbox"> 点击表示您同意商城《服务协议》
                            </label>
                        </div>
                        <div class="am-cf">
                            <input type="submit" name="" ng-click="regist()"  value="注册" class="am-btn am-btn-primary am-btn-sm am-fl">
                        </div>

                    </div>

                    <div class="am-tab-panel">
                        <form method="post">
                            <div class="user-phone">
                                <label for="phone"><i class="am-icon-mobile-phone am-icon-md"></i></label>
                                <input type="tel" name="" ng-model="user.username" id="phone" placeholder="请输入手机号">
                            </div>
                            <!-- <div class="verification">
                                <label for="code"><i class="am-icon-code-fork"></i></label>
                                <input type="tel" name="" id="code" placeholder="请输入验证码">
                                <a class="btn" href="javascript:void(0);" onClick="sendMobileCode();"
                                    id="sendMobileCode">
                                    <span id="dyMobileButton">获取</span></a>
                            </div> -->
                            <div class="user-pass">
                                <label for="password"><i class="am-icon-lock"></i></label>
                                <input type="password" name="" ng-model="user.password" id="password"
                                       placeholder="设置密码">
                            </div>
                            <div class="user-pass">
                                <label for="passwordRepeat"><i class="am-icon-lock"></i></label>
                                <input type="password" name="" ng-model="confirmPassword" id="passwordRepeat"
                                       placeholder="确认密码">
                            </div>
                        </form>
                        <div class="login-links">
                            <label for="reader-me">
                                <input id="reader-me" type="checkbox"> 点击表示您同意商城《服务协议》
                            </label>
                        </div>
                        <div class="am-cf">
                            <input type="submit" name=""  ng-click="regist()" value="注册" class="am-btn am-btn-primary am-btn-sm am-fl">
                        </div>

                        <hr>
                    </div>

                    <script>
                        $(function () {
                            $('#doc-my-tabs').tabs();
                        })
                    </script>

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