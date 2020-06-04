<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%--

这个指的是:   商城旁边的分类选项的页面展示!!!!!!!!!!!!!!!!!

--%>
<jsp:include page="header.jsp" flush="true">
<jsp:param value="${categorys}" name="categorys"/>
<jsp:param value="true" name="categoryFlag"/>
</jsp:include>

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
						src="<c:url value='/${book.image_b }'/>" width = 200 border="0" /></a>
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
				<li><a href="${pageContext.request.contextPath }/CategoryPageController?categoryId=${page.books[0].category.id }&current=${status.index}">${status.index }</a></li>
			</c:forEach>
 	
<%-- 			<c:forEach var="book" begin="1" end="${page.totalPage}"
				varStatus="status" items="${page.books }">
				<li><a
					href="${pageContext.request.contextPath }/CategoryPageController?categoryId=${book.category.id }&current=${status.index}">${status.index }</a></li>
			</c:forEach> --%>
		</ul>
	</nav>
</center>

<%--&lt;%&ndash;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++&ndash;%&gt;--%>
<%--<!--菜单 -->--%>
<%--<div class=tip>--%>
<%--	<div id="sidebar">--%>
<%--		<div id="wrap">--%>
<%--			<div id="prof" class="item ">--%>
<%--				<a href="# ">--%>
<%--					<span class="setting "></span>--%>
<%--				</a>--%>
<%--				<div class="ibar_login_box status_login ">--%>
<%--					<div class="avatar_box ">--%>
<%--						<p class="avatar_imgbox "><img src="images/no-img_mid_.jpg " /></p>--%>
<%--						<ul class="user_info ">--%>
<%--							<li>Hi,你好</li>--%>
<%--						</ul>--%>
<%--					</div>--%>
<%--				</div>--%>
<%--			</div>--%>

<%--			<div id="shopCart " class="item ">--%>
<%--				<a href="# ">--%>
<%--					<span class="message "></span>--%>
<%--				</a>--%>
<%--				<div class="mp_tooltip ">--%>
<%--					购物车--%>
<%--					<i class="icon_arrow_right_black "></i>--%>
<%--				</div>--%>
<%--			</div>--%>
<%--			<div id="asset " class="item ">--%>
<%--				<a href="# ">--%>
<%--					<span class="view "></span>--%>
<%--				</a>--%>
<%--				<div class="mp_tooltip ">--%>
<%--					我的资产--%>
<%--					<i class="icon_arrow_right_black "></i>--%>
<%--				</div>--%>
<%--			</div>--%>

<%--			<div id="foot " class="item ">--%>
<%--				<a href="# ">--%>
<%--					<span class="zuji "></span>--%>
<%--				</a>--%>
<%--				<div class="mp_tooltip ">--%>
<%--					我的足迹--%>
<%--					<i class="icon_arrow_right_black "></i>--%>
<%--				</div>--%>
<%--			</div>--%>

<%--			<div id="brand " class="item ">--%>
<%--				<a href="#">--%>
<%--					<span class="wdsc "><img src="images/wdsc.png " /></span>--%>
<%--				</a>--%>
<%--				<div class="mp_tooltip ">--%>
<%--					我的收藏--%>
<%--					<i class="icon_arrow_right_black "></i>--%>
<%--				</div>--%>
<%--			</div>--%>

<%--			<div id="broadcast " class="item ">--%>
<%--				<a href="# ">--%>
<%--					<span class="chongzhi "><img src="images/chongzhi.png " /></span>--%>
<%--				</a>--%>
<%--				<div class="mp_tooltip ">--%>
<%--					我要充值--%>
<%--					<i class="icon_arrow_right_black "></i>--%>
<%--				</div>--%>
<%--			</div>--%>

<%--			<div class="quick_toggle ">--%>
<%--				<li class="qtitem ">--%>
<%--					<a href="# "><span class="kfzx "></span></a>--%>
<%--					<div class="mp_tooltip ">客服中心<i class="icon_arrow_right_black "></i></div>--%>
<%--				</li>--%>
<%--				<!--二维码 -->--%>
<%--				<li class="qtitem ">--%>
<%--					<a href="#none "><span class="mpbtn_qrcode "></span></a>--%>
<%--					<div class="mp_qrcode " style="display:none; "><img src="images/weixin_code_145.png " /><i class="icon_arrow_white "></i></div>--%>
<%--				</li>--%>
<%--				<li class="qtitem ">--%>
<%--					<a href="#top " class="return_top "><span class="top "></span></a>--%>
<%--				</li>--%>
<%--			</div>--%>

<%--			<!--回到顶部 -->--%>
<%--			<div id="quick_links_pop " class="quick_links_pop hide "></div>--%>
<%--		</div>--%>
<%--	</div>--%>
<%--	&lt;%&ndash;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++&ndash;%&gt;--%>
</div>
</html>
