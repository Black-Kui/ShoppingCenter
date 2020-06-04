<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<jsp:include page="header.jsp" flush="true">
	<jsp:param value="${categorys}" name="categorys" />
	<jsp:param value="true" name="categoryFlag" />
</jsp:include>
<body class="am-container activity ">
<center>

	<table class="table" border="0px">

		<%-- <c:forEach items="${page.books }" var="book">
				<td><c:if test="${book.image_b !=null}">
					<img src="<%=path %>${book.image_b}" width=50 />
					</c:if>

					书籍名称:${book.name }<br /> 书籍价格:${book.price }<br /> <a href="${pageContext.request.contextPath }/BuyController?bookId=${book.id}">加入购物车</a>
				</td>
			</c:forEach> --%>
		<tr><c:forEach items="${page.books }" var="book">
				<td>
					<div class="inner">
						<a class="pic" href="<c:url value='/showDetail?id=${book.id}'/>"><img
							src="<c:url value='${book.image_w}'/>" width = 200 border="0" /></a>
						<p class="price">
							<span class="price_n">&yen;${book.currprice }</span> <span
								class="price_r">&yen;${book.price }</span> (<span
								class="price_s">${book.discount }折</span>)
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
							<a
								href="<c:url value='/search?relatedField=${book.author}&field=bookAuthor'/>"
								name='P_zz' title='${book.author }'>${book.author }</a>
						</p>
						<p class="publishing">
							<span>出 版 社：</span><a
								href="<c:url value='/search?relatedField=${book.press}&field=press'/>">${book.press }</a>
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
					 -->
			<c:forEach var="i" begin="1" end="${page.totalPage }"
				varStatus="status">
				<li><a
					href="${pageContext.request.contextPath }/client/ShowController?current=${status.index}">${status.index }</a></li>
			</c:forEach>

		</ul>
	</nav>
</center>
<%-----------------------------------------------------------------%>

<div class="shopTitle ">
	<h4>活动</h4>
	<h3>每期活动 优惠享不停 </h3>
	<span class="more ">
                              <a href="javascript:void(0)">全部活动<i class="am-icon-angle-right" style="padding-left:10px ;" ></i></a>
                        </span>
</div>
<div class="am-g am-g-fixed " style="margin-left: 75px">
	<div class="am-u-sm-3">
		<div class="icon-sale one "></div>
		<h4>秒杀</h4>
		<div class="activityMain ">
			<img src="../images/activity1.jpg "></img>
		</div>
		<div class="info ">
			<h3>春节送礼优选</h3>
		</div>
	</div>

	<div class="am-u-sm-3 ">
		<div class="icon-sale two "></div>
		<h4>特惠</h4>
		<div class="activityMain ">
			<img src="../images/activity2.jpg "></img>
		</div>
		<div class="info ">
			<h3>春节送礼优选</h3>
		</div>
	</div>

	<div class="am-u-sm-3 ">
		<div class="icon-sale three "></div>
		<h4>团购</h4>
		<div class="activityMain ">
			<img src="../images/activity3.jpg "></img>
		</div>
		<div class="info ">
			<h3>春节送礼优选</h3>
		</div>
	</div>

	<div class="am-u-sm-3 last ">
		<div class="icon-sale "></div>
		<h4>超值</h4>
		<div class="activityMain ">
			<img src="../images/activity.jpg "></img>
		</div>
		<div class="info ">
			<h3>春节送礼优选</h3>
		</div>
	</div>
</div>

<%--_______________________________________________________________________--%>
<div id="f2">
	<!--甜点-->
	<div class="am-container ">
		<div class="shopTitle ">
			<h4>甜品</h4>
			<h3>每一道甜品都有一个故事</h3>
			<div class="today-brands ">
				<a href="javascript:void(0)">桂花糕</a>
				<a href="javascript:void(0)">奶皮酥</a>
				<a href="javascript:void(0)">栗子糕 </a>
				<a href="javascript:void(0)">马卡龙</a>
				<a href="javascript:void(0)">铜锣烧</a>
				<a href="javascript:void(0)">豌豆黄</a>
			</div>
			<span class="more ">
                    <a href="javascript:void(0)">更多美味<i class="am-icon-angle-right" style="padding-left:10px ;" ></i></a>
                        </span>
		</div>
		<div class="am-g am-g-fixed floodThree ">
			<div class="am-u-sm-4 text-four list" >
				<div class="word">
					<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
					<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
					<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
					<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
					<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
					<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
				</div>
				<a href="javascript:void(0)">
					<img src="../images/act1.png " />
					<div class="outer-con ">
						<div class="title ">
							雪之恋和风大福
						</div>
					</div>
				</a>
				<div class="triangle-topright"></div>
			</div>
			<div class="am-u-sm-4 text-four">
				<a href="javascript:void(0)">
					<img src="../images/6.jpg" />
					<div class="outer-con ">
						<div class="title ">
							雪之恋和风大福
						</div>
						<div class="sub-title ">
							¥13.8
						</div>
						<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
					</div>
				</a>
			</div>
			<div class="am-u-sm-4 text-four sug">
				<a href="javascript:void(0)">
					<img src="../images/7.jpg" />
					<div class="outer-con ">
						<div class="title ">
							雪之恋和风大福
						</div>
						<div class="sub-title ">
							¥13.8
						</div>
						<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
					</div>
				</a>
			</div>

			<div class="am-u-sm-6 am-u-md-3 text-five big ">
				<a href="javascript:void(0)">
					<img src="../images/10.jpg" />
					<div class="outer-con ">
						<div class="title ">
							雪之恋和风大福
						</div>
						<div class="sub-title ">
							¥13.8
						</div>
						<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
					</div>
				</a>
			</div>
			<div class="am-u-sm-6 am-u-md-3 text-five ">
				<a href="javascript:void(0)">
					<img src="../images/8.jpg" />
					<div class="outer-con ">
						<div class="title ">
							雪之恋和风大福
						</div>
						<div class="sub-title ">
							¥13.8
						</div>
						<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
					</div>
				</a>
			</div>
			<div class="am-u-sm-6 am-u-md-3 text-five sug">
				<a href="javascript:void(0)">
					<img src="../images/9.jpg" />
					<div class="outer-con ">
						<div class="title ">
							雪之恋和风大福
						</div>
						<div class="sub-title ">
							¥13.8
						</div>
						<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
					</div>
				</a>
			</div>
			<div class="am-u-sm-6 am-u-md-3 text-five big">
				<a href="javascript:void(0)">
					<img src="../images/10.jpg" />
					<div class="outer-con ">
						<div class="title ">
							雪之恋和风大福
						</div>
						<div class="sub-title ">
							¥13.8
						</div>
						<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
					</div>
				</a>
			</div>

		</div>

		<div class="clear "></div>
	</div>

	<%--_______________________________________________________________________--%>
	<div id="f2">
		<!--坚果-->
		<div class="am-container ">
			<div class="shopTitle ">
				<h4>坚果</h4>
				<h3>酥酥脆脆，回味无穷</h3>
				<div class="today-brands ">
					<a href="javascript:void(0)">腰果</a>
					<a href="javascript:void(0)">松子</a>
					<a href="javascript:void(0)">夏威夷果 </a>
					<a href="javascript:void(0)">碧根果</a>
					<a href="javascript:void(0)">开心果</a>
					<a href="javascript:void(0)">核桃仁</a>
				</div>
				<span class="more ">
                    <a href="javascript:void(0)">更多美味<i class="am-icon-angle-right" style="padding-left:10px ;" ></i></a>
                        </span>
			</div>
	<div class="am-g am-g-fixed floodThree ">
		<div class="am-u-sm-4 text-four list">
			<div class="word">
				<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
				<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
				<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
				<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
				<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
				<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
			</div>
			<a href="javascript:void(0)">
				<img src="images/act1.png " />
				<div class="outer-con ">
					<div class="title ">
						雪之恋和风大福
					</div>
				</div>
			</a>
			<div class="triangle-topright"></div>
		</div>
		<div class="am-u-sm-4 text-four">
			<a href="javascript:void(0)">
				<img src="images/6.jpg" />
				<div class="outer-con ">
					<div class="title ">
						雪之恋和风大福
					</div>
					<div class="sub-title ">
						¥13.8
					</div>
					<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
				</div>
			</a>
		</div>
		<div class="am-u-sm-4 text-four sug">
			<a href="javascript:void(0)">
				<img src="images/7.jpg" />
				<div class="outer-con ">
					<div class="title ">
						雪之恋和风大福
					</div>
					<div class="sub-title ">
						¥13.8
					</div>
					<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
				</div>
			</a>
		</div>

		<div class="am-u-sm-6 am-u-md-3 text-five big ">
			<a href="javascript:void(0)">
				<img src="images/10.jpg" />
				<div class="outer-con ">
					<div class="title ">
						雪之恋和风大福
					</div>
					<div class="sub-title ">
						¥13.8
					</div>
					<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
				</div>
			</a>
		</div>
		<div class="am-u-sm-6 am-u-md-3 text-five ">
			<a href="javascript:void(0)">
				<img src="images/8.jpg" />
				<div class="outer-con ">
					<div class="title ">
						雪之恋和风大福
					</div>
					<div class="sub-title ">
						¥13.8
					</div>
					<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
				</div>
			</a>
		</div>
		<div class="am-u-sm-6 am-u-md-3 text-five sug">
			<a href="javascript:void(0)">
				<img src="images/9.jpg" />
				<div class="outer-con ">
					<div class="title ">
						雪之恋和风大福
					</div>
					<div class="sub-title ">
						¥13.8
					</div>
					<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
				</div>
			</a>
		</div>
		<div class="am-u-sm-6 am-u-md-3 text-five big">
			<a href="javascript:void(0)">
				<img src="images/10.jpg" />
				<div class="outer-con ">
					<div class="title ">
						雪之恋和风大福
					</div>
					<div class="sub-title ">
						¥13.8
					</div>
					<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
				</div>
			</a>
		</div>

	</div>

	<div class="clear "></div>
</div>

<%--		(*************************************--%>
		<div id="f3">
			<!--甜点-->

			<div class="am-container ">
				<div class="shopTitle ">
					<h4>甜品</h4>
					<h3>每一道甜品都有一个故事</h3>
					<div class="today-brands ">
						<a href="javascript:void(0)">桂花糕</a>
						<a href="javascript:void(0)">奶皮酥</a>
						<a href="javascript:void(0)">栗子糕 </a>
						<a href="javascript:void(0)">马卡龙</a>
						<a href="javascript:void(0)">铜锣烧</a>
						<a href="javascript:void(0)">豌豆黄</a>
					</div>
					<span class="more ">
                    <a href="javascript:void(0)">更多美味<i class="am-icon-angle-right" style="padding-left:10px ;" ></i></a>
                        </span>
				</div>
			</div>

			<div class="am-g am-g-fixed floodFour" >
				<div class="am-u-sm-5 am-u-md-4 text-one list" style="margin-left: -88px">
					<div class="word">
						<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
						<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
						<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
						<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
						<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
						<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
					</div>
					<a href="javascript:void(0)">
						<div class="outer-con ">
							<div class="title ">
								开抢啦！
							</div>
							<div class="sub-title ">
								零食大礼包
							</div>
						</div>
						<img src="images/act1.png " />
					</a>
					<div class="triangle-topright"></div>
				</div>

				<div class="am-u-sm-7 am-u-md-4 text-two sug">
					<div class="outer-con ">
						<div class="title ">
							雪之恋和风大福
						</div>
						<div class="sub-title ">
							¥13.8
						</div>
						<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
					</div>
					<a href="javascript:void(0)"><img src="images/2.jpg" /></a>
				</div>

				<div class="am-u-sm-7 am-u-md-4 text-two">
					<div class="outer-con ">
						<div class="title ">
							雪之恋和风大福
						</div>
						<div class="sub-title ">
							¥13.8
						</div>
						<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
					</div>
					<a href="javascript:void(0)"><img src="images/1.jpg" /></a>
				</div>


				<div class="am-u-sm-3 am-u-md-2 text-three big">
					<div class="outer-con ">
						<div class="title ">
							小优布丁
						</div>
						<div class="sub-title ">
							¥4.8
						</div>
						<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
					</div>
					<a href="javascript:void(0)"><img src="images/5.jpg" /></a>
				</div>

				<div class="am-u-sm-3 am-u-md-2 text-three sug">
					<div class="outer-con ">
						<div class="title ">
							小优布丁
						</div>
						<div class="sub-title ">
							¥4.8
						</div>
						<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
					</div>
					<a href="javascript:void(0)"><img src="images/3.jpg" /></a>
				</div>

				<div class="am-u-sm-3 am-u-md-2 text-three ">
					<div class="outer-con ">
						<div class="title ">
							小优布丁
						</div>
						<div class="sub-title ">
							¥4.8
						</div>
						<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
					</div>
					<a href="javascript:void(0)"><img src="images/4.jpg" /></a>
				</div>

				<div class="am-u-sm-3 am-u-md-2 text-three last big ">
					<div class="outer-con ">
						<div class="title ">
							小优布丁
						</div>
						<div class="sub-title ">
							¥4.8
						</div>
						<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
					</div>
					<a href="javascript:void(0)"><img src="images/5.jpg" /></a>
				</div>

			</div>
			<div class="clear "></div>
		</div>
	<%--		(*************************************--%>
</body>
</html>
