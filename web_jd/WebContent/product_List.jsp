<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="root61">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>家居日用_灯具_家装软饰_家纺床品</title>
<link rel="shortcut icon" href="favicon.ico" />
<link type="text/css" rel="stylesheet" href="css/productList1.css" />
<link type="text/css" rel="stylesheet" href="css/productList2.css" />
<link type="text/css" rel="stylesheet" href="css/page9.css" />
<link type="text/css" rel="stylesheet" href="css/base.css" />

</head>
<body>
	<!--导航栏开始-->
	<div class="shortcut">
		<div class="w">
			<div class="fl">
				<div class="dt">
					送至：广东 <i><s>◇</s></i>
				</div>
			</div>
			<div class="fr">
				<ul>
					<c:if test="${empty user }">
						<li><a href="login.jsp" id="login">你好，请登录&nbsp&nbsp&nbsp</a>
							<a href="register.jsp" class="col-red">免费注册</a></li>
					</c:if>
					<c:if test="${!empty user }">
						<li><a href="#" id="login" class="col-red">你好，${user.username }&nbsp&nbsp&nbsp</a>
							<a href="login.jsp">退出</a></li>
					</c:if>
					<li class="line"></li>
					<li>我的订单</li>
					<li class="line"></li>
					<li class="fore">我的京东 <i><s>◇</s></i>
					</li>
					<li class="line"></li>
					<li>京东会员</li>
					<li class="line"></li>
					<li>企业采购</li>
					<li class="line"></li>
					<li class="fore tel-jd" id="mobile_jpg"><em class="tel"></em>
						手机京东 <i><s>◇</s></i>
						<div id="mobile_qr"></div></li>
					<li class="line"></li>
					<li class="fore">关注京东 <i><s>◇</s></i>
					</li>
					<li class="line"></li>
					<li class="fore">客户服务 <i><s>◇</s></i>
					</li>
					<li class="line"></li>
					<li class="fore">网站导航 <i><s>◇</s></i>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!--导航结束-->

	<!--nav 部分开始-->
	<div class="w clearfix">
		<div class="log" style="width: 250px;">
			<a href="http://www.jd.com" target="_blank" title="京东" class="jd-a">点击京东</a>

		</div>
		<div class="search">
			<input type="text" name="" id="txt" value=""> <label
				for="txt" id="message">遥控飞机</label>
			<button>搜索</button>
		</div>
		<div class="car"
			onclick="window.location.href='${pageContext.request.contextPath }/cart.jsp'">
			<a href="javascript:;" class="col-red">我的购物车</a> <span class="icom1"></span>
			<span class="icom2">></span>
			<c:if test="${cart.cartItems.size()>0}">
				<span class="icom3">${cart.cartItems.size()}</span>
			</c:if>
			<c:if test="${empty cart}">
				<span class="icom3">0</span>
			</c:if>

		</div>
		<div class="hostwords">
			<a href="#" class="col-red">美妆春上新</a> <a href="#">599减300</a> <a
				href="#">500减50</a> <a href="#">五粮液</a> <a href="#">领券减千</a> <a
				href="#">清明踏青</a> <a href="#">肥料囤货</a> <a href="#">地方特产</a>
		</div>
	</div>
	<div class="w">
		<div id="season-hots" class="m m1 season-hots">
			<div class="mt">
				<strong class="mt-title">应季爆款</strong>
			</div>
			<div class="mc">
				<ul class="season-hots-list">
					<c:forEach items="${pageBean.list }" var="product">
						<li class='fore1'>
							<div class='p-img'>
								<a href='#'> <img width='215' height='215'
									alt='${product.pname }' data-img='1' class='err-product'
									src='${product.pimage}' title='${product.pname }'>
								</a>
							</div>
							<div class='p-name'>
								<a href='#' title='${product.pname }'>${product.pname }</a>
							</div>
							<div class='p-price'>
								京东价：<strong class='price'>&yen;<em
									class='J-p-25756244796'>${product.shop_price }</em></strong> <a
									href='${pageContext.request.contextPath }/ProductAction_addProductToCart?pid=${product.pid }&currentPage=${pageBean.currentPage}'
									class='buy-btn'>抢购</a>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div class="page clearfix">
				<div class="p-wrap">
					<c:if test="${pageBean.currentPage==1 }">
						<a class="p-num-prev disabled" href="javascript:void(0);"> <i><</i>
							<em>上一页</em>
						</a>
					</c:if>
					<c:if test="${pageBean.currentPage!=1 }">
						<a class="p-num-prev"
							href="${pageContext.request.contextPath }/ProductAction_productList?currentPage=${pageBean.currentPage-1}">
							<i><</i> <em>上一页</em>
						</a>
					</c:if>


					<!--判断当前页  -->
					<c:forEach begin="1" end="${pageBean.totalPage }" var="page">
						<c:if test="${pageBean.currentPage==page }">
							<a href="javascript:void(0);" class="current">${page }</a>
						</c:if>
						<c:if test="${pageBean.currentPage!=page }">
							<a
								href="${pageContext.request.contextPath }/ProductAction_productList?currentPage=${page}">${page }</a>
						</c:if>
					</c:forEach>

					<c:if test="${pageBean.currentPage==pageBean.totalPage }">
						<a class="p-num-next disabled" href="javascript:void(0);"> <em>下一页</em>
							<i>></i>
						</a>
					</c:if>
					<c:if test="${pageBean.currentPage!=pageBean.totalPage }">
						<a class="p-num-next"
							href="${pageContext.request.contextPath }/ProductAction_productList?currentPage=${pageBean.currentPage+1}">
							<em>下一页</em> <i>></i>
						</a>
					</c:if>

				</div>
			</div>
		</div>
	</div>
	
	<!-- 已下还没实现购买 -->
	<!-- season-hots end-->
	<div class="w">
		<div id="chosen-activity" class="m m1 chosen-activity">
			<div class="mt">
				<strong class="mt-title">精选活动</strong>
			</div>
			<div class="mc">
				<ul class="chosen-act-list clearfix">
					<li class='fore0'><a target='_blank' href='#'> <img
							class='loading-style2'
							src='images/products/selected_activity/5b06990eN61236443.jpeg'
							width='226' height='460' alt='净化除味专场' />
					</a></li>
					<li class='fore1'><a target='_blank' href='#'> <img
							class='loading-style2'
							src='images/products/selected_activity/5b069928Nd746e897.jpeg'
							width='226' height='460' alt='蕉下太阳伞专场' />
					</a></li>
					<li class='fore2'><a target='_blank' href='#'> <img
							class='loading-style2'
							src='images/products/selected_activity/5b052c18N4bb13f96.jpeg'
							width='226' height='460' alt='金号' />
					</a></li>
					<li class='fore3'><a target='_blank' href='#'> <img
							class='loading-style2'
							src='images/products/selected_activity/5b052c4eN8987a367.jpeg'
							width='226' height='460' alt='帘到家' />
					</a></li>
					<li class='fore4'><a target='_blank' href='#'> <img
							class='loading-style2'
							src='images/products/selected_activity/5b069961N3f499f90.jpeg'
							width='226' height='460' alt='天堂伞专场' />
					</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- chosen-activity end -->
	<div class="w">
		<div id="floor-brand" class="m m1 floor-brand">
			<div class="mt">
				<strong class="mt-title">品牌推荐</strong>
			</div>
			<div class="mc clearfix">
				<div class="floor-left">
					<a target='_blank' href="#" target="_blank"> <img class="" width="242" height="466" alt="自营罗莱"
						src="images/products/brank/5b052d85N5103ebae.jpeg">
					</a>
				</div>
				<div class="floor-center">
					<ul class="floor-brand-list">
						<li class='fore0'><a target='_blank' href='#' target='_blank'>
								<img class='loading-style2'
								src='images/products/brank/5955f299Ndd9cc531.jpeg' width='249'
								height='232' alt='宝优妮' />
						</a></li>
						<li class='fore1'><a target='_blank' href='#'> <img
								class='loading-style2'
								src='images/products/brank/5a45f096N0257d85d.jpeg' width='249'
								height='232' alt='帘到家' />
						</a></li>
						<li class='fore2'><a target='_blank' href='#'> <img
								class='loading-style2'
								src='images/products/brank/5907fe8dN726c3fb0.jpeg' width='249'
								height='232' alt='2017.5天字' />
						</a></li>
						<li class='fore3'><a target='_blank'
							href='//mall.jd.com/index-40040.html'> <img
								class='loading-style2'
								src='images/products/brank/599e9260Nb7cbf3c0.jpeg' width='249'
								height='232' alt='蕉下' />
						</a></li>
						<li class='fore4'><a target='_blank'
							href='//mall.jd.com/index-32631.html'> <img
								class='loading-style2'
								src='images/products/brank/5a2a3c58N388f3818.jpeg' width='249'
								height='232' alt='家之物语' />
						</a></li>
						<li class='fore5'><a href='#' target='_blank'> <img
								class='loading-style2'
								src='images/products/brank/5af0216dN729a7988.jpeg' width='249'
								height='232' alt='三利' />
						</a></li>
					</ul>

				</div>
				<div class="floor-right">
					<a target='_blank' href="#"> <img class="" data-lazyload="done"
						width="220" height="466" alt="太力"
						src="images/products/brank/5b051f76Nbfd2b27e.jpeg">
					</a>
				</div>
			</div>
		</div>
	</div>
	<!-- floor-brand end -->
	<div class="w">
		<div id="floor-grid1" class="m m1 floor-grid">
			<div class="mt">
				<strong class="mt-title">家纺</strong>
				<div class="mt-extra">
					<ul class="lh">
						<li class='fore0'><a target='_blank'
							href='#'
							title='四件套'>四件套</a></li>
						<li class='fore1'><a target='_blank'
							href='#'
							title='被子'>被子</a></li>
						<li class='fore2'><a target='_blank'
							href='#'
							title='电热毯'>电热毯</a></li>
						<li class='fore3'><a target='_blank'
							href='#'
							title='毛巾'>毛巾</a></li>
						<li class='fore4'><a target='_blank'
							href='#'
							title='枕头'>枕头</a></li>
					</ul>
				</div>
			</div>
			<div class="mc">
				<ul class="list1">
					<li><a target='_blank'
						href="#"><img class="" width="240" height="240" alt=""
							src="//img12.360buyimg.com/jdcms/s240x240_jfs/t12184/233/2606728099/23066/cf222311/5a4346e4Nc9e31c95.jpeg"></a></li>
				</ul>
				<ul class="list2">
					<li>
						<div class="floor-recommend">
							<p class="title">特色推荐</p>
							<ul class="floor-hot-words">
								<li><a target='_blank'
									href='#'
									title='窗帘'>窗帘</a></li>
								<li><a target='_blank'
									href='#'
									title='婚庆四件套'>婚庆四件套</a></li>
								<li><a target='_blank'
									href='#'
									title='床垫'>床垫</a></li>
								<li><a target='_blank'
									href='#'
									title='浴巾'>浴巾</a></li>
								<li><a target='_blank'
									href='#'
									title='床单'>床单</a></li>
								<li><a target='_blank'
									href='#'
									title='抱枕'>抱枕</a></li>
								<li><a target='_blank'
									href='#'
									title='毛毯'>毛毯</a></li>
								<li><a target='_blank'
									href='#'
									title='羽绒被'>羽绒被</a></li>
								<li><a target='_blank'
									href='#'
									title='床上用品'>床上用品</a></li>
							</ul>
							<ul class="floor-hot-brands"#>
								<li><a target='_blank'
									href='#'><img class='' width='95' height='30' alt=''
										src='//img11.360buyimg.com/jdcms/s95x30_jfs/t2905/105/2445000428/5532/200f2edb/5764087fN0a16a49e.jpeg'></a></li>
								<li><a target='_blank'
									href='#'><img class='' width='95' height='30' alt=''
										src='//img13.360buyimg.com/jdcms/s95x30_jfs/t2161/91/1323118606/4717/3449faef/565282ccNcba76c76.jpg'></a></li>
								<li><a target='_blank'
									href='#'><img class=''  width='95' height='30' alt=''
										src='//img10.360buyimg.com/jdcms/s95x30_jfs/t3253/195/1101893655/5349/c0b8d73a/57c69e92N10cdb7d0.jpeg'></a></li>
								<li><a target='_blank'
									href='#'><img class='' width='95' height='30' alt=''
										src='//img10.360buyimg.com/jdcms/s95x30_jfs/t1681/24/825404630/3206/52ea0eeb/55d1b7b0N1d30760c.jpg'></a></li>
							</ul>
						</div>
					</li>
				</ul>
				<ul class="list3">

					<li class='fore0'><a
						target='_blank' href='#'> <img
							class='loading-style2'
							data-lazyload='//img10.360buyimg.com/jdcms/s525x240_jfs/t18466/73/2685437451/26348/6b72fd4e/5b05300bN5f75a9f8.jpeg'
							width='525' height='240' alt='' />
					</a></li>
					<li class='fore1'><a
						target='_blank' href='#'> <img
							class='loading-style2'
							data-lazyload='//img13.360buyimg.com/jdcms/s525x240_jfs/t22279/54/215762563/24508/b2049db9/5b053069N7956c645.jpeg'
							width='525' height='240' alt='' />
					</a></li>
				</ul>

				<ul class="list4">
					<li class='fore0'>
						<div class='p-img'>
							<a target='_blank' href='#'> <img
								width='130' height='130'
								alt=''
								class='err-product'
								src='//img14.360buyimg.com/n3/jfs/t7447/31/3892572255/141935/2a765fac/59fd5da5Nd2c9a729.jpg'>
							</a>
						</div>
						<div class='p-name'>
							<a target='_blank' href='#'>寝是金生</a>
						</div>
						<div class='p-price'>
							京东价：<strong class='price'>&yen;<em
								class='J-p-19282193807'></em></strong>
						</div>


					</li>
					<li class='fore1' clstag='furniture|keycount|jiaju|e7'>
						<div class='p-img'>
							<a target='_blank' href='#'> <img width='130'
								height='130' alt='' class='err-product'
								src='//img11.360buyimg.com/n3/jfs/t3067/239/1088412882/465192/f3134413/57c67148Ne17309be.jpg'>
							</a>
						</div>
						<div class='p-name'>
							<a target='_blank' href='//item.jd.com/10623458039.html'>床品
								1.之旅</a>
						</div>
						<div class='p-price'>
							京东价：<strong class='price'>&yen;<em
								class='J-p-10623458039'></em></strong>
						</div>


					</li>
					<li class='fore2'>
						<div class='p-img'>
							<a target='_blank' href='#'> <img
								width='130' height='130'
								class='err-product'
								src='//img11.360buyimg.com/n3/jfs/t2998/340/1521085205/517946/abad08e7/57c671bfN70a997c5.jpg'>
							</a>
						</div>
						<div class='p-name'>
							<a target='_blank' href='#'>纯棉三件套床品
								1.2米床上用品全棉 寝室床单被套枕套单人 俏皮星空-蓝</a>
						</div>
						<div class='p-price'>
							京东价：<strong class='price'>&yen;<em
								class='J-p-10623458044'></em></strong>
						</div>


					</li>
					<li class='fore3'>
						<div class='p-img'>
							<a target='_blank' href='#'> <img
								width='130' height='130'
								alt='' class='err-product'
								src='//img14.360buyimg.com/n3/jfs/t5995/179/5112456113/274515/9a7b3e57/5968c29dNd8767cbd.jpg'>
							</a>
						</div>
						<div class='p-name'>
							<a target='_blank' href='//item.jd.com/13985956427.html'>简约纯色全
								纯棉床单被套床</a>
						</div>
						<div class='p-price'>
							京东价：<strong class='price'>&yen;<em
								class='J-p-13985956427'></em></strong>
						</div>


					</li>
				</ul>

			</div>
		</div>
	</div>
	<!-- floor-grid1 end -->

	<!--页面底部开始-->
	<div class="jd-footer">
		<div class="service">
			<div class="slogen">
				<span class="item slogen1"> <img src="images/slogen1.png"
					alt="" />
				</span> <span class="item slogen2"> <img src="images/slogen2.png"
					alt="" />
				</span> <span class="item slogen3"> <img src="images/slogen3.png"
					alt="" />
				</span> <span class="item slogen4"> <img src="images/slogen4.png"
					alt="" />
				</span>
			</div>
		</div>
		<div class="w shopping clearfix">
			<dl>
				<dt>
					<a href="#">购物指南</a>
				</dt>
				<dd>
					<a href="#">购物流程</a>
				</dd>
				<dd>
					<a href="#">会员介绍</a>
				</dd>
				<dd>
					<a href="#">生活旅行/团购</a>
				</dd>
				<dd>
					<a href="#">常见问题</a>
				</dd>
				<dd>
					<a href="#">大家电</a>
				</dd>
				<dd>
					<a href="#">联系客服</a>
				</dd>
			</dl>
			<dl>

				<dt>
					<a href="#">配送方式</a>
				</dt>
				<dd>
					<a href="#">购物指南</a>
				</dd>
				<dd>
					<a href="#">购物流程</a>
				</dd>
				<dd>
					<a href="#">会员介绍</a>
				</dd>
				<dd>
					<a href="#">生活旅行/团购</a>
				</dd>
				<dd>
					<a href="#">海外配送</a>
				</dd>
			</dl>
			<dl>
				<dt>
					<a href="#">支付方式</a>
				</dt>
				<dd>
					<a href="#">货到付款</a>
				</dd>
				<dd>
					<a href="#">在线支付</a>
				</dd>
				<dd>
					<a href="#">分期付款</a>
				</dd>
				<dd>
					<a href="#">邮局汇款</a>
				</dd>
				<dd>
					<a href="#">公司转账</a>
				</dd>
			</dl>
			<dl>
				<dt>
					<a href="#">特色服务</a>
				</dt>
				<dd>
					<a href="#">夺宝岛</a>
				</dd>
				<dd>
					<a href="#">DIY装机</a>
				</dd>
				<dd>
					<a href="#">延保服务</a>
				</dd>
				<dd>
					<a href="#">京东E卡</a>
				</dd>
				<dd>
					<a href="#">京东通信</a>
				</dd>
				<dd>
					<a href="#">京东JD+</a>
				</dd>
			</dl>

			<div class="coverage">
				<div class="dt">京东自营覆盖区县</div>
				<div class="dd">
					<p>京东已向全国2357个区县提供自营配送服务，支持货到付款、POS机刷卡和售后上门服务。</p>

					<p class="lookmore">
						<a href="#">查看详情 ></a>
					</p>
				</div>
			</div>
		</div>
		<div class="w againw">
			<div class="links">
				<a href="#">关于我们</a>| <a href="#">联系我们</a>| <a href="#">联系客服</a>| <a
					href="#">合作招商</a>| <a href="#">商家帮助</a>| <a href="#">营销中心</a>| <a
					href="#">手机京东</a>| <a href="#">友情链接</a>| <a href="#">销售联盟</a>| <a
					href="#">京东社区</a>| <a href="#">风险监测</a>| <a href="#">隐私政策</a>| <a
					href="#">京东公益</a>| <a href="#">English Site</a>| <a href="#">Media
					& IR</a>
			</div>
			<div class="copyright">
				网安备 11000002000088号 | 京ICP证070359号 | 互联网药品信息服务资格证编号(京)-经营性-2014-0008
				| 新出发京零 字第大120007号<br> 互联网出版许可证编号新出网证(京)字150号 | 出版物经营许可证 |
				网络文化经营许可证京网文[2014]2148-348号 | 违法和不良信息举报电话：4006561155<br>
				Copyright © 2004-2018 京东JD.com 版权所有 | 消费者维权热线：4006067733 经营证照<br>
				京东旗下网站：京东支付 | 京东云
			</div>
			<div class="message">
				<a href="#"><img src="images/mess.png" alt=""></a> <a href="#"><img
					src="images/mess2.png" alt=""></a> <a href="#"><img
					src="images/mess3.png" alt=""></a> <a href="#"><img
					src="images/mess4.png" alt=""></a> <a href="#"><img
					src="images/mess5.png" alt=""></a>
			</div>
		</div>
	</div>
	<!--页面底部结束-->
</body>
</html>