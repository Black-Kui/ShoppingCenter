<i><%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<jsp:include page="header.jsp"></jsp:include>
  <head>

<%--
这个是: 点击某个商品之后的商品详情页面!!!!!!!!!!!
--%>
    <title>图书详细</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<%-- 	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/pager/pager.css'/>" /> --%>
<%--     <script type="text/javascript" src="<c:url value='/jsps/pager/pager.js'/>"></script> --%>
	<script src="<c:url value='/js/jquery-1.5.1.js'/>"></script>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/desc.css'/>">
	<script src="<c:url value='/js/desc.js'/>"></script>
  </head>
  <body class="am-container activity">
  <center>
  <div class="divBookName ">${book.name }</div>
  <div class="col-md-offset-2">
    <img align="top" src="<c:url value='${book.image_w}'/>"  style="width: 200px;height: 200px" class="img_image_w">
    <div class="divBookDesc">
	    <ul>
	    	<li>商品编号：${book.id }</li>
	    	<li>商城价：<span class="price_n">&yen;${book.currprice }</span></li>
	    	<li>定价：<span class="spanPrice">&yen;${book.price }</span>　折扣：<span style="color: #c30;">${book.discount }</span>折</li>
	    </ul>
		<hr class="hr1">
		<table>
			<tr>
				<td colspan="3">
					作者：${book.author } 著
				</td>
			</tr>
			
			<c:if test="${book.description != null}">
					<tr>
						<td colspan="3">书籍介绍：${book.description } </td>
					</tr>
				</c:if>
			<tr>
				<td colspan="3">
					出版社：${book.press }
				</td>
			</tr>
			<tr>
				<td colspan="3">出版时间：${book.publishtime }</td>
			</tr>
			<tr>
				<td>版次：${book.edition }</td>
				<td>页数：${book.pagenum }</td>
				<td>字数：${book.wordnum }</td>
			</tr>
			<tr>
				<td width="180">印刷时间：${book.printtime }</td>
				<td>开本：${book.booksize }开</td>
				<td>纸张：${book.paper }</td>
			</tr>
		</table>
		<div class="divForm">
			<form id="form1" action="<c:url value='/BuyController'/>" method="post">
				<input id="bookid"type="hidden" name="bookId" value="${book.id }">
  				我要买：<input id="cnt" style="width: 40px;text-align: center;" type="text" name="quantity" value="1">件
  				<button id="btn"   class="btn btn-danger" style="color: #FF6600" >添加到购物车</button>
  			</form>
  			 
  		</div>
  		
	</div>
  </div>
<%--  =====================================================--%>

  <%--  =====================================================--%>

  <%
		String message = (String)request.getAttribute("message");
		if(message == "overnum"){
			%>
	 			<script type="text/javascript">
	 					var bookid = document.getElementById('bookid').value;
						alert("购物车种类已达上限!最多添加5种!");
						window.location.href="./showDetail?id="+bookid;
				 </script>
			<%
		}
	 %>

</center>
  </body>
</html>
