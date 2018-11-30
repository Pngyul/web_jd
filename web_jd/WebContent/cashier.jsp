<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>收银台</title>
<link rel="stylesheet" href="css/cashier1.css" />
<link rel="shortcut icon" href="favicon.ico" />
</head>
<body>
	<!-- shortcut --start-->
	<div class="shortcut">
		<div class="w">
			<a class="s-logo" href="//www.jd.com" target="_blank"><img width="170" height="28"
				src="images/jd-logo.png"></a>
			<ul class="s-right">
				<li class="s-item fore1"><a href="#" class="link-user">${user.username }</a></li>
				<li class="s-div">|</li>
				<li class="s-item fore2"><a
					class="op-i-ext" href="#">我的订单</a></li>
				<li class="s-div">|</li>
				<li class="s-item fore3"><a
					class="op-i-ext"
					href="#">支付帮助</a></li>
			</ul>
			<span class="clr"></span>
		</div>
	</div>
	<!-- shortcut --end -->
	<div class="main main-bg">
		<div class="w">
			<div class="order clearfix order-init order-init-oldUser">
				<!-- 订单信息 -->
				<div class="o-left">
					<h3 class="o-title">订单提交成功，请尽快付款！订单号：${order.oid }</h3>
				</div>
				<!-- 订单信息 end -->
				<!-- 订单金额 -->
				<div class="o-right">
					<div class="o-price">
						<em>应付金额</em><strong>${order.total }</strong><em>元</em>
					</div>
					
				</div>
				<!-- 订单金额 end -->
				<div class="o-list j_orderList"
					style="display: block;">
					<div class="o-list-info">
						<span class="mr10">收货地址：${order.address }</span> <span
							class="mr10">收货人：${order.name }</span> <span>${order.telephone }</span>
					</div>
					<div class="o-list-info">
						<span>商品名称：
						<c:forEach items="${order.orderItems }" var="item">
						${item.product.pname },
						</c:forEach>
						</span>
					</div>
					
				</div>
				<!-- 立即支付 start -->
				<div class="pv-button" style="float:right">
					<a class="ui-button ui-button-XL" href="${pageContext.request.contextPath }/OrderAction_pay">立即支付</a><span
						class="font-red ml10"></span>
				</div>
				<!-- 立即支付 end -->
			</div>
		</div>
	</div>
	<!-- footer start -->
	<div class="p-footer">
		<div class="pf-wrap w">
			<div class="pf-line">
				<span class="pf-l-copyright">Copyright © 2004-2018 京东JD.com
					版权所有</span><img width="185" height="20"
					src="images/footer-auth.png"><span
					class="ml40">由网银在线（北京）科技有限公司提供技术支持</span>
			</div>
		</div>
	</div>
	<!-- footer end -->
</body>
</html>