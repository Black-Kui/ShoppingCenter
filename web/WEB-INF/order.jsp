<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<%--

这个页面是订单管理页面

--%>

<jsp:include page="header.jsp"></jsp:include>
<html>
<body class="am-container activity ">
<center>
	<c:if test="${empty orders}"><div style="width: 300px;height: 300px">
		<div style="text-align: center;position: relative;top: 100px">
			<img src="/images/empty.jpg">
		</div>
		<div style="text-align: center;position: relative;top: 200px">

		<img src=${pageContext.request.contextPath}/images/xiadan.png></div>
	</div>
	</c:if>
	<c:if test="${not empty orders }">
<%--	  	<div align="center" class="table_title" style="width: 80%;">--%>
<%--	    <table border="1px" width="80%" style="height: auto" >--%>
<%--			<thead class="thead-dark">--%>
<%--		<tr>--%>
<%--			<th scope="col"><h4>订单号</h4></th>--%>
<%--			<th scope="col"><h4>订单状态</h4></th>--%>
<%--			<th scope="col"><h4>订单操作</h4></th>--%>
<%--			<th scope="col"><h4>商品图片</h4></th>--%>
<%--			<th scope="col"><h4>商品单价</h4></th>--%>
<%--			<th scope="col"><h4>商品数量</h4></th>--%>
<%--		</tr>--%>
<%--		</thead>--%>
<%--	        <tbody>--%>
<%--	        <c:forEach items="${orders}" var="item">--%>
<%--	            <tr>--%>
<%--	                <td rowspan="${fn:length(item.orderItems)}" align="center">${item.ordername }</td>--%>
<%--	                <c:if test="${item.status == 0}">--%>
<%--	                <td rowspan="${fn:length(item.orderItems)}" align="center"><a href="${pageContext.request.contextPath }/PayOrderController?orderid=${item.id }">去支付</a></td>--%>
<%--	                </c:if>--%>
<%--					<c:if test="${item.status == 1}">--%>
<%--	                <td rowspan="${fn:length(item.orderItems)}" align="center">已支付</td>--%>
<%--	                </c:if>--%>
<%--				<td  rowspan="${fn:length(item.orderItems)}"align="center"><a href="${pageContext.request.contextPath }/DeleteOrders?orderid=${item.id }"><button type="button" class="btn btn-outline-danger">删除</button></a></td>--%>

<%--                <c:forEach items="${item.orderItems}" var="orderItem" >--%>
<%--	                    <td align="center"><img src="<%=path %>${orderItem.book.image_w}" style="width: 50px;width: 50px" /></td>--%>
<%--	                    <td align="center">${orderItem.book.currprice }</td>--%>
<%--	                    <td align="center">${orderItem.num }</td>--%>
<%--	                </tr>--%>
<%--				</c:forEach>--%>
<%--	        </c:forEach>--%>
<%--	        </tbody>--%>
<%--	    </table>--%>
<%--	</div>--%>


<%--    &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&--%>
    <!--交易成功-->
    <div class="order-status5">
		<c:forEach items="${orders}" var="item">
        <div class="order-title">

            <div class="dd-num" style="width:400px;>订单编号：<span rowspan="${fn:length(item.orderItems)}">${item.ordername }></span></div>
<%--            <span>成交时间：2015-12-20</span>--%>
            <!--    <em>店铺：小桔灯</em>-->

			</div>
            <c:forEach items="${item.orderItems}" var="orderItem" >
                <ul class="item-list" style="margin-left: 0px">
                    <li class="td td-item" >
                        <div class="item-pic">
                            <a href="#" class="J_MakePoint">
                                <img src="<%=path %>${orderItem.book.image_w}" style="width: 80px;height: 80px" class="itempic J_ItemImg">
                            </a>
                        </div>
                        <div class="item-info">
                            <div class="item-basic-info">
                                <a href="javascript:void(0)">
                                    <p>美康粉黛醉美唇膏 持久保湿滋润防水不掉色</p>
                                </a>
                            </div>
                        </div>
                    </li>
                    <li class="td td-price">
                        <div class="item-price" style="margin-top: 30px">
						<span align="center"> ${orderItem.book.currprice }</span>
                        </div>
                    </li>
                    <li class="td td-number">
                        <div class="item-number" style="margin-top: 30px">
                            <span align="center">${orderItem.num }</span>
                        </div>
                    </li>
                    <li class="td td-operation">
                        <div class="item-operation" style="margin-top: 20px">
							<c:if test="${item.status == 0}">

								<p class="Mystatus"  rowspan="${fn:length(item.orderItems)}"><a href="${pageContext.request.contextPath }/PayOrderController?orderid=${item.id }">去支付</a></p>
							</c:if>
							<c:if test="${item.status == 1}">
								<p class="Mystatus"  rowspan="${fn:length(item.orderItems)}"><a style="text-decoration: none">已支付</a></p>
								<p class="Mystatus">交易成功</p>
							</c:if>
                        </div>
                    </li>
					<li class="td td-change" style="margin-top: 30px">
						<div class="am-btn am-btn-danger anniu">
							<p style="margin-top: 10px"><a type="button" style="color: black;margin-top: 10px" href="${pageContext.request.contextPath }/DeleteOrders?orderid=${item.id }">删除订单</a></p>
							</div>
						</li>
                </ul>
			</c:forEach>
			</c:forEach>
		</div>
    </c:if>
</center>
<div class="footer "style="margin-top: 900px" >
    <div class="footer-hd ">
        <p>
            <a href="/">商城首页</a>
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
