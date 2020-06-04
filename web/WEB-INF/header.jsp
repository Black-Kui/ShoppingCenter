<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<%--	@@@@@@@--%>
	<style>
		.button {
			height: 40px;
			margin-top: -2px;
			display: inline-block;
			padding: 15px 25px;
			font-size: 10px;
			cursor: pointer;
			text-align: center;
			text-decoration: none;
			outline: none;
			color: #000000;
			background-color: #FF6600;
			border: none;
			border-radius: 10px;
			box-shadow: 0 9px #DD6D22;
		}

		.button:hover {background-color: #FF6600}

		.button:active {
			background-color: #FF6600;
			box-shadow: 0 5px #DD6D22;
			transform: translateY(4px);
		}
	</style>
<%--	@@@@@@@--%>
	<link href="../css2/hmstyle.css" rel="stylesheet" type="text/css"/>
	<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
	<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
	<link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />
	<link href="../css2/personal.css" rel="stylesheet" type="text/css">
	<link href="../css2/orstyle.css" rel="stylesheet" type="text/css">
	<link href="../css2/skin.css" rel="stylesheet" type="text/css" />
	<link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />

<%--	——————————————————————————————————————————————————————————————————————————————————————————————————————————————————————--%>
<base href="<%=basePath%>">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-2.1.0.min.js"></script>
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-2.1.0.min.js"></script>
<script
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<title>Blackui商城</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<!--
		<link rel="stylesheet" type="text/css" href="styles.css">
-->

<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/list.css'/>">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/list.js"></script>
</head>

<body>
	 <%
		String message = (String)request.getSession().getAttribute("message");
		if(message == "logfalse"){
			%>
	 			<script type="text/javascript">
						alert("注销失败!");
				 </script>
			<%
		}
	 %>
	<nav class="navbar navbar-default">
	<div class="container-fluid" class="shadow p-3 mb-5 bg-white rounded">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" style="cursor:pointer;"> 
			<span class="glyphicon glyphicon-th-large"></span>黑魁商城</a>
		</div>
		
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
            <c:if test="${param.categoryFlag != null}">
                <ul class="nav navbar-nav">
                    <li class="dropdown"><a href="#" class="dropdown-toggle"
                                            data-toggle="dropdown" role="button" aria-haspopup="true"
                                            aria-expanded="false">所有分类<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a id="action-1"
                                   href="${pageContext.request.contextPath }/">所有分类</a></li>
                            <c:forEach items="${categorys}" var="category">
                                <li><a
                                        href="${pageContext.request.contextPath }/CategoryPageController?categoryId=${category.id}&current=1">${category.name }</a></li>
                            </c:forEach>

                        </ul></li>

                </ul>
            </c:if>

			<ul class="nav navbar-nav navbar-right">
				<li><a onclick="javascript:history.back(-1);"style="cursor:pointer;"><img src="/images/back.png" style="height: 20px;width: 20px" alt="返回">&nbsp;&nbsp;&nbsp;返回</a></li>
				<li><a href="${pageContext.request.contextPath}/"><img src="/images/page.png" style="height: 20px;width: 20px" alt="首页">&nbsp;&nbsp;&nbsp;首页</a></li>
				<li><a href="${pageContext.request.contextPath }/showMyCar"><img src="/images/car.png" style="height: 20px;width: 20px" alt="购物车">&nbsp;&nbsp;购物车</a></li>
				<li><a href="${pageContext.request.contextPath }/showMyOrder"><img src="/images/order.png" style="height: 20px;width: 20px" alt="订单管理">&nbsp;订单管理</a></li>


				<c:if test="${empty customer }">
					<li><a href="${pageContext.request.contextPath }/Login"><img src="/images/login.png" style="height: 20px;width: 20px" alt="登录">&nbsp;&nbsp;&nbsp;登录</a></li>
					<%--<li><a href="${pageContext.request.contextPath }/Regist">注册</a></li>--%>
				</c:if>
				<c:if test="${not empty customer }">
					<li><a href="#" style="font-weight: bold">${customer.nickname }</a></li>
					<li><a href="${pageContext.request.contextPath }/LogoutController"><img src="/images/logout.png" style="height: 20px;width: 20px" alt="注销"></a></li>
				</c:if>
			</ul>

			<Form action="${pageContext.request.contextPath }/search?current=1" method="post" class="uesr_search">

				<div class="navbar-form navbar-right">
					<div class="input-group">
						<div class="input-group-addon">
							<i><img src="../images/search.png" style="height: 20px; width: 20px"></i>
						</div>
						<input type="text" class="form-control" id="relatedField"
							name="relatedField" value="${relatedField }" placeholder="搜索"/>
					</div>
					<select name="field" id="field" class="form-control selectpicker"
							title="请选择字段">
						<option value="all">全选</option>
						<optgroup label="图书">
							<option value="bookName">名称</option>
							<option value="bookAuthor">作者</option>
							<option value="bookDesc">描述</option>
						</optgroup>
						<optgroup label="分类">
							<option value="categoryName">名称</option>
							<option value="categoryDesc">描述</option>
						</optgroup>
					</select>
					<script type="text/javascript">
						$(function() {
							$(".selectpicker").selectpicker({
								noneSelectedText : '请选择',
								countSelectedText : function() {}
							});
						});
						function selectValue() {
							//获取选择的值
							alert($('#field').selectpicker('val'));
						}
					</script>

					<button type="submit" class="button">搜索</button>
<%--						<button TYPE="submit">--%>
<%--							<span>登录</span>--%>
<%--							<i class="fa fa-check"></i>--%>
<%--						</button>--%>
				</div>
			</Form>


		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>
<%-------------------------------------------------------------------------------%>

<%-------------------------------------------------------------------------------%>
</body>
<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script src="../AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>

<script type="text/javascript" src="../angularjs/angular.min.js"></script>
<script type="text/javascript" src="../angularjs/base.js"></script>
<script type="text/javascript" src="../angularjs/service/homeService.js"></script>
<script type="text/javascript" src="../angularjs/service/searchService.js"></script>
<script type="text/javascript" src="../angularjs/controller/homeController.js"></script>
<script type="text/javascript" src="../angularjs/controller/searchController.js"></script>
<!-- 用户信息 -->
<script type="text/javascript" src="../basic/js/jquery.cookie.js"></script>
<script type="text/javascript" src="../custom/userInfo.js"></script>
<script src="AmazeUI-2.4.2/assets/js/amazeui.js"></script>
</html>