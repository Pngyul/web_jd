<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单结算页 -京东商城</title>
<link type="text/css" rel="stylesheet" href="css/orderInfo.css">
<link rel="shortcut icon" href="favicon.ico" />
<link type="text/css" rel="stylesheet" href="css/orderInfo-logo.css">

<link type="text/css" rel="stylesheet" href="css/base.css" />
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	$(function() {

		var submitFlag = false;
		var errorFlag = true;
		//点击保存收件人按钮
		$("#save_Consignee").click(function() {
							errorFlag = true;
							submitFlag = false;
							var name = $("#consignee_name").val().trim();
							var address = $("#consignee_address").val().trim();
							var telephone = $("#consignee_mobile").val().trim();
							//判断收件人信息是否已填写，没写显示提示信息
							$(".itxt").each(function() {
								var val = $(this).val().trim();
								if (val == "") {
									$(this).next().addClass("message");
									errorFlag = false;
								} else {
									$(this).next().removeClass("message");
								}
							});
							if (errorFlag) {
								submitFlag = true;
								//Ajax异步提交
								$.post(
										"${pageContext.request.contextPath}/OrderAction_saveConsignee",
										{"name" : name,
										 "address" : address,
										"telephone" : telephone
										},
										function(data) {
											   //更新页面上的收件人信息
												$("#sendAddr").html("寄送至："+ data.address);
												$("#sendMobile").html("收货人："+ data.name+ "   "+ data.telephone);
												},
										"json");
							}
						});
		//点击提交订单
		$("#order-submit").click(
				function() {
					errorFlag = true;
					var name = $("#consignee_name").val().trim();
					var address = $("#consignee_address").val().trim();
					var telephone = $("#consignee_mobile").val().trim();
					//点击提交按钮时再次判断，并显示错误信息
					$(".itxt").each(function() {
						var val = $(this).val().trim();
						if (val == "") {
							$(this).next().addClass("message");
							errorFlag = false;

						} else {
							$(this).next().removeClass("message");
						}
					});
					//如果条件符合，提交订单
					if (errorFlag && submitFlag) {
						window.location.href="${pageContext.request.contextPath }/OrderAction_submitOrder";
					} else if (!errorFlag) {
						//收件人信息没填写提交订单上方提示错误信息3秒，三秒后隐藏
						$("#submit_check_info_message").fadeIn(500).delay(3000)
								.fadeOut(1000);
					} else {
						//收件人信息没保存提交订单上方提示错误信息3秒，三秒后隐藏
						$("#submit_message").fadeIn(500).delay(3000).fadeOut(
								1000);
					}
				});
	});
</script>
<script>
	
</script>

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
	<!-- logol -->
	<div class="w w1 header clearfix">
		<div id="logo-2014">
			<a href="${pageContext.request.contextPath }/index.jsp" class="logo"
				target="_blank"></a> <a href="javascript:;" class="link2"><b></b>"结算页"</a>
		</div>
	</div>
	<!-- logo结束 -->
	<div id="container">
		<div id="content" class="w">
			<div class="checkout-tit">
				<span class="tit-txt">填写并核对订单信息</span>
			</div>

			<div class="checkout-steps">
				<!-- 收获人信息 start-->
				<div class="step-tit">
					<h3 style="font-weight: 800; margin-top: 10px;">收货人信息</h3>
				</div>
				<div class="form-new" id="consignee-form" name="consignee-form"
					style="margin-top: 20px; margin-bottom: 20px;">
					<!-- 收货人 -->
					<div class="item" id="name_div">
						<span class="label"><em>*</em>收货人</span>
						<div class="fl">
							<input type="text" class="itxt" id="consignee_name" name="name"
								maxlength="20" value="${user.username }"> <span
								class="error-msg">请您填写收货人姓名</span>
						</div>
					</div>
					<!-- 详细地址 -->
					<div class="item">
						<span class="label"><em>*</em>详细地址</span>
						<div class="fl">
							<!--span id="areaNameTxt"></span-->
							<input type="text" class="itxt itxt02" id="consignee_address"
								name="address" maxlength="50" value="广东省广州市天河区黄村001号"> <span
								class="error-msg">请您填写收货人详细地址</span>
						</div>
					</div>
					<!-- 手机号码 -->
					<div class="item">
						<span class="label"><em>*</em>手机号码</span>
						<div class="fl">
							<input type="text" class="itxt" id="consignee_mobile"
								name="telephone" maxlength="11" value="${user.mobilenum }">
							<span class="error-msg">请您填写收货人手机号码</span>
						</div>
					</div>
					<!-- 提交信息 -->
					<div class="item mt20">
						<span class="label">&nbsp;</span>
						<div class="fl">
							<a href="javascript:;" id="save_Consignee" class="btn-1"><span
								id="saveConsigneeTitleDiv">保存收货人信息</span></a>
						</div>
					</div>
				</div>
				<!-- 收获人信息 end-->
				<div class="hr"></div>
				<!-- 订单信息 start -->
				<div class="step-tit">
					<h3 style="font-weight: 800;">送货清单</h3>
					<div class="extra-r">
						<a href="${pageContext.request.contextPath }/CartItemAction_freshSelectedProductCart" id="cartRetureUrl" class="return-edit ftx-05">返回修改购物车</a>
					</div>
				</div>
				<div class="step-cont" id="skuPayAndShipment-cont">
					<div class="shopping-lists" id="shopping-lists">
						<div class="shopping-list ABTest" style="float: none;">
							<div class="goods-list" style="float: none; width: 100%;">

								<div class="goods-tit" style="margin-bottom: 10px;">
									<h4 class="vendor_name_h" id="602721" style="font-weight: 800">商家：优衣库官方旗舰店</h4>
								</div>
								<div class="goods-items 8686786778">
									<div class="goods-suit goods-last">
										<!-- 商品列表 start-->
										<c:forEach items="${order.orderItems }" var="orderItem">
											<div class="goods-item">
												<div class="p-img">
													<a href="javascript:;"><img
														src="${orderItem.product.pimage }"
														alt="${orderItem.product.pname }"></a>
												</div>
												<div class="goods-msg" style="width: 89%;">
													<div class="goods-msg-gel" style="width: 100%;">
														<div class="p-name">

															<a href="javascript:;">${orderItem.product.pname }</a>
														</div>
														<div class="p-price">
															<strong class="jd-price" style="width: 100px;">
																￥ ${orderItem.product.shop_price } </strong> <span class="p-num"
																style="width: 100px;"> x${orderItem.count} </span> <span
																id="pre-state" class="p-state" skuid="27837053911"
																style="width: 100px;">有货</span>

														</div>
													</div>
												</div>
												<div class="clr"></div>
											</div>
										</c:forEach>
										<!-- 商品列表  end -->
									</div>
								</div>
							</div>
						</div>
						<div class="clr"></div>
					</div>
				</div>
				<!-- 订单信息 end -->
			</div>
			<div class="trade-foot w" style="margin-top: 20px;">
				<div class="trade-foot-detail-com">
					<div class="fc-price-info">
						<span class="price-tit">应付总额：</span> <span class="price-num"
							id="sumPayPriceId">￥${order.total }</span>
					</div>
					<div class="fc-consignee-info">
						<span class="mr20" id="sendAddr">寄送至： 江西 萍乡市 安源区 安源镇
							萍乡学院19栋712</span> <span id="sendMobile">收货人：彭宇 187****9764</span>
					</div>
				</div>
				<div id="checkout-floatbar" class="group">
					<div class="ui-ceilinglamp checkout-buttons">
						<div class="sticky-placeholder hide" style="display: none;">
						</div>
						<div class="sticky-wrap">
							<div class="inner">
								<button type="submit" class="checkout-submit" id="order-submit">
									提交订单<b></b>
								</button>
							</div>
							<span id="submit_message" style="display: none"
								class="submit-error">请保存收货人信息</span>

							<div class="submit-check-info" id="submit_check_info_message"
								style="display: none">请填写收货人信息</div>
						</div>
					</div>
				</div>

			</div>
		</div>

	</div>
	<!--页面底部开始-->
	<div class="jd-footer">

		<div class="w againw">
			<div class="links">
				<a href="#">关于我们</a>| <a href="#">联系我们</a>| <a href="#">联系客服</a>| <a
					href="#">合作招商</a>| <a href="#">商家帮助</a>| <a href="#">营销中心</a>| <a
					href="#">手机京东</a>| <a href="#">友情链接</a>| <a href="#">销售联盟</a>| <a
					href="#">京东社区</a>| <a href="#">风险监测</a>| <a href="#">京东公益</a>| <a
					href="#">English Site</a>| <a href="#">Media & IR</a>
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