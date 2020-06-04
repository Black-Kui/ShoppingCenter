<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<jsp:include page="header.jsp"></jsp:include>
<html>
<body class="am-container activity ">
<center>
	<!-- 
		empty为null的意思
	 -->
<%--



这是:   购物车页面!!!!!!!!!!!!!!

--%>

	<c:if test="${empty car.carItems }">
		<h1>空空如也~</h1>
		<img src="http://a.mayouwang.com/addons/mihua_mall/recouse/images/emptycart.png" style="height: 300px; width: 300px">
	</c:if>
	<c:if test="${not empty car.carItems }">
		<table class="table table-striped table-dark" >
  			<tr>
  				<th scope="col" class="success" style="width: 160px">商品名称</th>
  				<th scope="col" class="danger" style="width: 300px">商品图片</th>
  				<th scope="col" class="warning" style="width: 120px">商品数量</th>
  				<th scope="col" class="active" style="width: 120px">商品单价</th>
  				<th scope="col"  class="info" >小计</th>
  				<th scope="col" class="success" style="width: 80px">操作</th>
  			</tr>
  			<!-- 
  				得到的是car对象 car对象里面有很多东西
  				总数量：totalnum
  				总金额：totalmoney
  			 -->
  			<c:forEach items="${car.carItems }" var="item">
  				<tr>
  					<td scope="col" class="success">${item.book.name}</td>
  					<td scope="col" class="danger"><img src="<%=path %>${item.book.image_w}" style="width: 50px;height: 50px" /></td>
  					<td scope="col" class="warning">${item.num}</td>
  					<td scope="col" class="active">${item.book.currprice}</td>
  					<td scope="col" class="info">${item.money}</td>
  					<td scope="col" class="success"><a href="${pageContext.request.contextPath }/DeleteCarItem?caritemid=${item.id }"><button type="button" class="btn btn-outline-danger">删除</button></a></td>
  				</tr>
  			</c:forEach>
  			<tr style="right: auto">
  				<th scope="col">总数量:${car.totalNum }</th>
  				<th scope="col">总金额:${car.totalMoney }</th>
  				<!--<td><a href="${pageContext.request.contextPath }/OrderController?op=order&num=${car.totalNum }&money=${car.totalMoney }">去结算</a></td>
  				-->
  			</tr>
  		</table>
		<form class="col-sm-12" action="${pageContext.request.contextPath }/OrderController" method="post">
			<input type="hidden" name="car" value="${car}" />
			<input  type="submit"  class="btn btn-manager"  value="去结算"/>
		</form>
    </c:if>






<%--    --%>
    <div class="footer" style="margin-top: 900px" >
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
</center>




</body>
</html>
