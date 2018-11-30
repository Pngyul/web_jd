<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<!--导航栏开始-->
<div class="shortcut">
	<div class="ww">
		<div class="fl">
			<div class="dt">
				送至：广东 <i><s>◇</s></i>
			</div>
		</div>
		<div class="fr">
			<ul>
				<c:if test="${empty user }">
					<li><a href="login.jsp" id="login">你好，请登录&nbsp&nbsp&nbsp</a> <a
						href="register.jsp" class="col-red">免费注册</a></li>
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
<!--京东topbanner部分-->
<div class="topbanner" id="top_banner">
	<div class="ww top-close">
		<img src="images/topbanner.jpg" alt="" /> <a href="javascript:;"
			class="close-banner" id="close_banner"></a>
	</div>
</div>
<!--京东topbanner结束-->
<!--nav 部分开始-->
<div class="ww clearfix">
	<div class="log" style="width: 250px;">
		<a href="http://www.jd.com" target="_blank" title="京东" class="jd-a">点击京东</a>

	</div>
	<div class="search">
		<input type="text" name="" id="txt" value=""> <label for="txt"
			id="message">遥控飞机</label>
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
<!--nav 部分结束-->