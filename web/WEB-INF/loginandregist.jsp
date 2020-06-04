<%--
  Created by IntelliJ IDEA.
  User: Black.kui
  Date: 2020/6/2
  Time: 15:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<%--====================--%>
    <meta charset="UTF-8">
    <title>商城用户登录</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

</head>
<body>

<div class="materialContainer">
    <div class="box">
        <form action="${pageContext.request.contextPath}/LoginController" method="post">
        <div class="title">登录</div>
        <div class="input" style="margin-top: 0px">
            <label for="name" style="margin-top: 0px" >用户名</label>
            <input type="text" name="username" id="name" required>
            <span class="spin"></span>
        </div>
        <div class="input" style="margin-top: 0px">
            <label for="pass" style="margin-top: -10px">密码</label>
            <input type="password" name="password" id="pass" required>
            <span class="spin"></span>
        </div>
            <div class="input" style="margin-top: 0px">
            <label for="code">验证码</label>
                <%--验证码刷新--%>
                <input type="text" name="validate" id="code">
                <input id="yanzheng" type="hidden"  name="truevalidate" value="" required>
                <span><canvas class="label-input100" id="canvas" width="120" height="45" style="float: right; margin-top: -50px" ></canvas></span><a id="changeImg" style="height: 30px; float: right; margin-top: 10px;color: #cc3300" >看不清，换一张</a>
                <span class="spin"></span>
            </div>
            <div class="button login">
            <button TYPE="submit">
                <span>登录</span>
                <i class="fa fa-check"></i>
            </button>
        </div>
<%--        <a href="javascript:" class="pass-forgot">忘记密码？</a>--%>
        </form>
    </div>
<%--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++caritem++++++++++++++++++++--%>
    <div class="overbox">
        <form action="${pageContext.request.contextPath}/RegistController">
        <div class="material-button alt-2">
            <span class="shape"></span>
        </div>
        <div class="title">注册</div>
        <div class="input">
            <label for="regname">用户名</label>
            <input type="text" name="username" id="regname" required>
            <span class="spin"></span>
        </div>
        <div class="input">
            <label for="regpass">密码</label>
            <input type="password" name="password" id="regpass" required>
            <span class="spin"></span>
        </div>
            <div class="input">
                <label for="nicknamea">昵称</label>
                <input type="text" name="nickname" id="nicknamea" required>
                <span class="spin"></span>
            </div>
        <div class="button">
            <button type="submit">
                <span>注册</span>
            </button>
        </div>
        </form>
    </div>

</div>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/index.js"></script>

<%
    String message = (String)request.getAttribute("message");
    if(message == "online"){
%>
<script type="text/javascript">
    alert("用户已在线!");
    window.location.href="./Login";
</script>
<%
}else if(message == "false"){
%>
<script type="text/javascript">
    alert("用户状态更新失败!");
    window.location.href="./Login";
</script>
<%
}else if(message == "no"){
%>
<script type="text/javascript">
    alert("用户不存在或用户名、密码错误!");
    window.location.href="./Login";
</script>
<%
}
else if(message == "paranull"){
%>
<script type="text/javascript">
    alert("登录输入项不能为空!");
    window.location.href="./Login";
</script>
<%
}
else if(message == "validateerror"){
%>
<script type="text/javascript">
    alert("验证码错误!");
    window.location.href="./Login";
</script>
<%
    }
%>
<script>
    /**生成一个随机数**/
    function randomNum(min,max){
        return Math.floor( Math.random()*(max-min)+min);
    }
    /**生成一个随机色**/
    function randomColor(min,max){
        var r = randomNum(min,max);
        var g = randomNum(min,max);
        var b = randomNum(min,max);
        return "rgb("+r+","+g+","+b+")";
    }
    var valida=drawPic();
    document.getElementById('yanzheng').value=valida;
    valida = document.getElementById("changeImg").onclick = function(){
        valida = drawPic();
        document.getElementById('yanzheng').value=valida;
    }

    /**绘制验证码图片**/
    function drawPic(){
        var canvas=document.getElementById("canvas");
        var width=canvas.width;
        var height=canvas.height;
        var ctx = canvas.getContext('2d');
        ctx.textBaseline = 'bottom';

        /**绘制背景色**/
        ctx.fillStyle = randomColor(180,240); //颜色若太深可能导致看不清
        ctx.fillRect(0,0,width,height);
        /**绘制文字**/
        var str = 'ABCEFGHJKLMNPQRSTWXY123456789';
        var result = '';
        for(var i=0; i<4; i++){
            var txt = str[randomNum(0,str.length)];
            ctx.fillStyle = randomColor(50,160);  //随机生成字体颜色
            ctx.font = randomNum(15,40)+'px SimHei'; //随机生成字体大小
            var x = 10+i*25;
            var y = randomNum(25,45);
            var deg = randomNum(-45, 45);
            //修改坐标原点和旋转角度
            ctx.translate(x,y);
            ctx.rotate(deg*Math.PI/180);
            ctx.fillText(txt, 0,0);
            //恢复坐标原点和旋转角度
            ctx.rotate(-deg*Math.PI/180);
            ctx.translate(-x,-y);
            result+=txt;
        }
        // /**绘制干扰线**/
        // for(var i=0; i<8; i++){
        //     ctx.strokeStyle = randomColor(240,300);
        //     ctx.beginPath();
        //     ctx.moveTo( randomNum(0,width), randomNum(0,height) );
        //     ctx.lineTo( randomNum(0,width), randomNum(0,height) );
        //     ctx.stroke();
        // }
        /**绘制干扰点**/
        for(var i=0; i<100; i++){
            ctx.fillStyle = randomColor(0,255);
            ctx.beginPath();
            ctx.arc(randomNum(0,width),randomNum(0,height), 1, 0, 2*Math.PI);
            ctx.fill();
        }
        return result;
    }
</script>
</body>
</html>
<%--====================--%>

