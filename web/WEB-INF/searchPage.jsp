<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%--

搜索所展示的商品结果页面
--%>
<jsp:include page="header.jsp" flush="true">
<jsp:param value="${categorys}" name="categorys"/>
<jsp:param value="true" name="categoryFlag"/>
<jsp:param value="${relatedField}" name="relatedField"/>
<jsp:param value="${field}" name="field"/>
</jsp:include>
<body class="am-container activity ">
<center>
	<table class="table" border="0px" >
		<tr>
			<%-- <c:forEach items="${page.books }" var="book">
				<td><c:if test="${book.image_b !=null}">
					<img src="<%=path %>${book.image_b}" width=50 />
					</c:if>

					书籍名称:${book.name }<br /> 书籍价格:${book.price }<br /> <a href="${pageContext.request.contextPath }/BuyController?bookId=${book.id}">加入购物车</a>
				</td>
			</c:forEach> --%>
			<c:forEach items="${page.books }" var="book">
			<td>
				<div class="inner">
					<a class="pic"
						href="<c:url value='/showDetail?id=${book.id}'/>"><img
						src="<c:url value="https://img.lanrentuku.com/img/allimg/1302/46_130228224637_1.jpg"/>"width =200 border="0" /></a>
					<p class="price">
						<span class="price_n">&yen;${book.currprice }</span> <span
							class="price_r">&yen;${book.price }</span> (<span class="price_s">${book.discount }折</span>)
					</p>
					<p>
						<a id="bookname" title="${book.name }"
							href="<c:url value='/showDetail?id=${book.id}'/>">${book.name }</a>
					</p>
					<%-- url标签会自动对参数进行url编码 --%>
					<%-- <c:url value="/BookServlet" var="authorUrl">
						<c:param name="method" value="showDetail?id=25" />
						<c:param name="author" value="${book.author}" />
					</c:url>
					<c:url value="/BookServlet" var="pressUrl">
						<c:param name="method" value="showDetail?id=25" />
						<c:param name="press" value="${book.press}" />
					</c:url> --%>
					<p>
						<a href="<c:url value='/search?relatedField=${book.author}&field=bookAuthor'/>" name='P_zz' title='${book.author }'>${book.author }</a>
					</p>
					<p class="publishing">
						<span>出 版 社：</span><a href="<c:url value='/search?relatedField=${book.press}&field=press'/>">${book.press }</a>
					</p>
					<p class="publishing_time">
						<span>出版时间：</span>${book.publishtime }</p>
				</div>
			</td>
		</c:forEach>
		</tr>
	</table>
	<nav aria-label="Page navigation">
		<ul class="pagination">
			<!-- 
						begin:代表从1开始循环
						end：代表从3结束
						varStatus="status"生成一个变量名字随便取的
						status.index = 得到下标
			之前的代码用不到book对象 所以我们直接遍历总页数	-->	
			<c:forEach var="i" begin="1" end="${page.totalPage }"
				varStatus="status">
				<li><a href="${pageContext.request.contextPath }/search?field=${field}&relatedField=${relatedField}&current=${status.index}">${status.index }</a></li>
			</c:forEach>
 	
<%-- 			<c:forEach var="book" begin="1" end="${page.totalPage}"
				varStatus="status" items="${page.books }">
				<li><a
					href="${pageContext.request.contextPath }/CategoryPageController?categoryId=${book.category.id }&current=${status.index}">${status.index }</a></li>
			</c:forEach> --%>
		</ul>
	</nav>
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
