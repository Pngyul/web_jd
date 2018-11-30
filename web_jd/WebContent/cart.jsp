<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html class=" jd_retina">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的购物车 - 京东商城</title>
<link rel="shortcut icon" href="favicon.ico" />
<link type="text/css" rel="stylesheet" href="css/base.css" />
<link type="text/css" rel="stylesheet" href="css/cart1.css" />
<link type="text/css" rel="stylesheet" href="css/cart2.css" />
<link type="text/css" rel="stylesheet" href="css/cart_empty.css" />
<link type="text/css" rel="stylesheet" href="css/cart_dialog.css" />
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script>
	$(function() {
	    //删除已选择商品
	   // $(".remove-batch").click(function(){
	    	
	   // 	$.each($("input:checked") , function(i, j){
	   // });
	   
	   //删除dialogJS
	   
	   
		//如果CheckedBox已选择,添加背景颜色,刷新已选择商品
		$.each($("input:checked") , function(i, j){
			var isSelected = $(this).offsetParent().offsetParent()
			.offsetParent();
			isSelected.addClass("item-selected");
			if ($(".jdcheckboxOne:checked").length==${cart.cartItems.size()}) {
				$(".toggle-checkboxes")[0].checked = true;
				$(".toggle-checkboxes")[1].checked = true;
			}
			var pid = $(this).val();
			var buyNumInputIdStr = "1_0_74_01"+pid;
			var buyNum = $("#"+buyNumInputIdStr).val();
			var isSelectBox = this.checked;
			//传递i的目的是在freshSelectedProductCart中判断是否是第一个一选择商品
			//如果是，session中的cart的总数量和金额为0，也就是重新计算
			var first = i;
			freshSelectedProductCart(pid,buyNum,isSelectBox,first,"/CartItemAction_freshSelectedProductCart");
        });
		
		
		//全选和全不选
		$(".toggle-checkboxes").click(function() {
			$(".jdcheckbox").prop("checked", this.checked);
			//如果全选，循环所有的checkbox
			if (this.checked == true) {
				$.each($("input:checked"),function(i, j){
				var pid = $(this).val();
				var buyNumInputIdStr = "1_0_74_01"+pid;
				var buyNum = $("#"+buyNumInputIdStr).val();
				var isSelectBox = this.checked;
				var flag = i;
				//除开首位box,访问selectProductToOrder计算总商品和金额
				if(flag>0&&flag<$("input:checked").length-1){
					selectAllProductCart(pid,buyNum,isSelectBox,flag,"/CartItemAction_selectProductToOrder");
				}
				});
				//添加已选择背景颜色
				$(".item-single").addClass("item-selected ");
				
			} else {
				//如果全不选，执行allNotSelect
				allNotSelect();
				//移除背景颜色
				$(".item-single").removeClass("item-selected ");
			}
			
		});
		//如果单独按checkbox,达到全选，则上下两个全选checkbox勾上
		$(".jdcheckboxOne").click(
				function() {
					//获得每个checkbox对应商品的背景元素
					var isSelected = $(this).offsetParent().offsetParent()
							.offsetParent();
					//如果取消勾选
					if (this.checked == false) {
						//两个全选取消
						$(".toggle-checkboxes")[0].checked = false;
						$(".toggle-checkboxes")[1].checked = false;
						//移除背景颜色
						isSelected.removeClass("item-selected");
					} else {
						//如果勾选，添加背景颜色
						isSelected.addClass("item-selected");
					}
					//如果单独按checkbox,达到全选，则上下两个全选checkbox勾上
					if ($(".jdcheckboxOne:checked").length == ${cart.cartItems.size() }) {
						$(".toggle-checkboxes")[0].checked = true;
						$(".toggle-checkboxes")[1].checked = true;
					}
				});
		
		//单个checkbox点击执行selectProductToOrder，该serlvet会判断是取消还是勾选
		$(".jdcheckboxOne").click(function(){
			var pid = $(this).val();
			var buyNumInputIdStr = "1_0_74_01"+pid;
			var buyNum = $("#"+buyNumInputIdStr).val();
			//获得状态作为参数传递到selectProductToOrder
			var isSelectBox = this.checked;
			isSelectedProduct(pid,buyNum,isSelectBox,"/CartItemAction_selectProductToOrder");
			
		});
		//购买数量增加或者减少js
		//循环所有的buyNum的input
		$("input[class='itxt buyNum']").each(function() {
			var this_ = $(this);
			//获取减少的jquery对象
			var decrement = $(this).siblings(".decrement");
			//获取增加的jquery对象
			var increment = $(this).siblings(".increment");
			//刚开始如果数量大于1，移除disabled
			if(parseInt(this_.val())>1){
				decrement.removeClass("disabled");
			}
			//increment点击
			increment.click(function() {
				var val = parseInt(this_.val());
				if (val == 1) {
					decrement.removeClass("disabled");
				}
				val++;
				this_.val(val);
			});
			//decrement点击
			decrement.click(function() {
				var val = parseInt(this_.val());
				if (val > 2) {
					val--;
					this_.val(val);
				} else if (val == 2) {
					val--;
					this_.val(val);
					$(this).addClass("disabled");
				}
			});
		});
	});
</script>
<script>
function isSelectedProduct(pid,buyNum,isSelected,servlet){
	$.post(
			"${pageContext.request.contextPath}"+servlet,
			{"product.pid":pid,"buyNum":buyNum,"isSelected":isSelected},
			function(data){
				$("#totalNum").html(data.totalNum);
				$("#totalMOn").html(data.totalMon);
			},
			"json"
		);
}

function freshSelectedProductCart(pid,buyNum,isSelected,first,servlet){
	$.post(
			"${pageContext.request.contextPath}"+servlet,
			{"product.pid":pid,"buyNum":buyNum,"first":first,"isSelected":isSelected},
			function(data){
				$("#totalNum").html(data.totalNum);
				$("#totalMOn").html(data.totalMon);
			},
			"json"
		);
}
//选择所有商品函数
function selectAllProductCart(pid,buyNum,isSelected,flag,servlet){
	$.post(
			"${pageContext.request.contextPath}"+servlet,
			{"product.pid":pid,"buyNum":buyNum,"flag":flag,"isSelected":isSelected},
			function(data){
				$("#totalNum").html(data.totalNum);
				$("#totalMOn").html(data.totalMon);
			},
			"json"
		);
}

//全不选函数
function allNotSelect(){
	$.post(
			"${pageContext.request.contextPath}/CartAction_allNotSelect",
			function(data){
				$("#totalNum").html(data.totalNum);
				$("#totalMOn").html(data.totalMon);
			},
			"json"
		);
}
//显示删除商品Dialog
function showDeleteProductDialog(pid){
       $(".ui-dialog").show();
       $(".ftx-04").html("删除商品？");
       $(".ftx-03").html("您可以选择取消，或删除商品。");
       $("#dialogDel").html("狠心删除");
       $(".ui-mask").css("z-index","9998");
       $(".ui-mask").css("opacity",".15");
       $("#dialogDel").prop("href","${pageContext.request.contextPath}/CartItemAction_delectProduct?pid="+pid);

}
//显示清空购物车Dialog
function showclearCartDialog(){
       $(".ui-dialog").show();
       $(".ftx-04").html("清空购物车？");
       $(".ftx-03").html("您可以选择取消，或清空购物车。");
       $("#dialogDel").html("狠心清空");
       $(".ui-mask").css("z-index","9998");
       $(".ui-mask").css("opacity",".15");
       $("#dialogDel").prop("href","${pageContext.request.contextPath}/CartAction_clearCart");
}
//dialog关闭
function dialogClose(){
	   $(".ui-dialog").hide();
       $(".ui-mask").css("z-index","-9998");
       $(".ui-mask").css("opacity","0");
}

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
	<!-- logo搜索栏开始 -->
	<div class="w w1 header clearfix">
		<div id="logo-2014">
			<a href="${pageContext.request.contextPath }/ProductAction_productList"
				class="logo"></a> <a href="#" class="link2"><b></b>购物车</a>
		</div>
		<div class="cart-search">
			<div class="form">
				<input id="key" type="text" class="itxt"
					style="color: rgb(153, 153, 153);"> <input type="button"
					class="button" value="搜索" onclick="javascript:void(0);">
			</div>
		</div>
	</div>
	<!-- main开始 -->
	<div class="cart" id="container">
		<c:if test="${!empty cart.cartItems }">
			<div class="w">
				<div class="cart-filter-bar">
					<ul class="switch-cart">
						<li class="switch-cart-item curr"><a
							href="${pageContext.request.contextPath }"> <em>全部商品</em> <span
								class="number">${cart.cartItems.size() }</span>
						</a></li>
					</ul>
					<div class="clr"></div>
					<div class="tab-con hide" style="display: none;"></div>
				</div>
			</div>
			<div class="cart-warp">
				<div class="w">
					<div id="jd-cart">
						<div class="cart-main cart-main-new">
							<div class="cart-thead">
								<div class="column t-checkbox">
									<div class="cart-checkbox">
										<input type="checkbox" id="toggle-checkboxes_up"
											name="toggle-checkboxes" class="jdcheckbox toggle-checkboxes">
										<label class="checked" for="">勾选全部商品</label>
									</div>
									全选
								</div>
								<div class="column t-goods">商品</div>
								<div class="column t-price">单价</div>
								<div class="column t-quantity">数量</div>
								<div class="column t-sum">小计</div>
								<div class="column t-action">操作</div>
							</div>
							<div id="cart-list">
								<div class="cart-item-list" id="cart-item-list-01">
									<div class="cart-tbody" id="vender_8888">
										<!-- 商品列表 start -->
										<div class="item-list">
											<!-- 單品 start -->
											<c:forEach items="${cart.cartItems }" var="entry">

												<div class="item-single  item-item ">
													<div class="item-form">
														<div class="cell p-checkbox">
															<div class="cart-checkbox">
																<!--单品-->
																<c:if test="${entry.value.selected }">
																	<input type="checkbox" name="checkItem"
																		value="${entry.value.product.pid }" checked="checked"
																		class="jdcheckbox jdcheckboxOne">
																</c:if>
																<c:if test="${!entry.value.selected }">
																	<input type="checkbox" name="checkItem"
																		value="${entry.value.product.pid }"
																		class="jdcheckbox jdcheckboxOne">
																</c:if>

																<label for="">勾选商品</label> <span class="line-circle"></span>
															</div>
														</div>
														<div class="cell p-goods">
															<div class="goods-item">
																<div class="p-img">
																	<a href="#" class="J_zyyhq_1121787"><img
																		alt="${entry.value.product.pname }"
																		src="${entry.value.product.pimage }"></a>
																</div>
																<div class="item-msg">
																	<div class="p-name">
																		<a href="#">${entry.value.product.pname }</a>
																	</div>
																</div>
															</div>
														</div>
														<div class="cell p-props p-props-new"></div>
														<div class="cell p-price p-price-new ">
															<strong>¥${entry.value.product.shop_price }</strong>
														</div>
														<div class="cell p-quantity">
															<!--单品-->
															<div class="quantity-form">
																<a href="javascript:void(0);" class="decrement disabled">-</a>
																<input id="1_0_74_01${entry.value.product.pid }"
																	autocomplete="off" type="text" class="itxt buyNum"
																	value="${entry.value.buyNum }" minnum="1"> <a
																	href="javascript:void(0);" class="increment">+</a>
															</div>
															<div class="ac ftx-03 quantity-txt"
																_stock="stock_1121787">有货</div>
														</div>
														<div class="cell p-sum">
															<strong>¥${entry.value.subtotal }</strong> <span
																class="weight"></span>
														</div>
														<div class="cell p-ops">
															<!--单品-->
															<a class="cart-remove" href="javascript:;"
																onclick="showDeleteProductDialog('${entry.value.product.pid }')">删除</a>
														</div>
													</div>
												</div>
											</c:forEach>
											<!-- 單品 end -->
										</div>
										<!-- 商品列表 end -->
									</div>
								</div>
								<div class="cart-item-list" id="cart-item-list-02"></div>
							</div>
						</div>
					</div>
					<div id="cart-floatbar">
						<div class="ui-ceilinglamp-1" style="width: 990px; height: 52px;">
							<div class="cart-toolbar" style="width: 988px; height: 50px;">
								<div class="toolbar-wrap">
									<div class="selected-item-list hide" style="display: none;">
									</div>
									<div class="options-box">
										<div class="select-all">
											<div class="cart-checkbox">
												<input type="checkbox" id="toggle-checkboxes_down"
													name="toggle-checkboxes"
													class="jdcheckbox toggle-checkboxes"> <label
													class="checked" for="">勾选全部商品</label>
											</div>
											全选
										</div>
										<div class="operation">
											<a href="javascript:;" class="remove-batch">删除选中的商品</a> <a
												href="javascript:;" onclick="showclearCartDialog()"
												class="cleaner-opt J_clr_all">清理购物车</a>
										</div>
										<div class="toolbar-right">
											<div class="normal">
												<div class="comm-right">
													<div class="btn-area">
														<a href="${pageContext.request.contextPath }/OrderAction_packageOrder"
															class="submit-btn" data-bind="4"> 去结算<b></b></a>
													</div>
													<div class="price-sum">
														<div>
															<span class="txt txt-new">总价：</span> <span
																class="price sumPrice"><em data-bind="0.00"
																id="totalMOn">¥0.00</em></span>
														</div>
													</div>
													<div class="amount-sum">
														已选择<em id="totalNum">0</em>件商品<b class="up"></b>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${empty cart.cartItems }">
			<div class="w">
				<div id="chunjie" class="mb10"></div>
				<div class="cart-empty">
					<div class="message">
						<ul>
							<li class="txt">购物车空空的哦~，去看看心仪的商品吧~</li>
							<li class="mt10"><a
								href="${pageContext.request.contextPath }/ProductAction_productList"
								class="ftx-05"> 去购物&gt; </a></li>
						</ul>
					</div>
				</div>
			</div>
		</c:if>
	</div>
	<!--页面底部开始-->
	<div class="jd-footer">
		<div class="service">
			<div class="slogen">
				<span class="footer-item slogen1"> <img
					src="images/slogen1.png" alt="" />
				</span> <span class="footer-item slogen2"> <img
					src="images/slogen2.png" alt="" />
				</span> <span class="footer-item slogen3"> <img
					src="images/slogen3.png" alt="" />
				</span> <span class="footer-item slogen4"> <img
					src="images/slogen4.png" alt="" />
				</span>
			</div>
		</div>
		<div class="ww shopping clearfix">
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
		<div class="ww againw">
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
	<!-- 删除弹出  start-->
	<div class="ui-dialog"
		style="width: 400px; position: absolute; z-index: 10000; display: none; overflow: hidden; top: 259.5px; left: 560px;">
		<div class="ui-dialog-title" style="width: 380px;">
			<span>删除</span>
		</div>
		<div class="ui-dialog-content"
			style="height: 128px; width: 380px; overflow: hidden;">
			<div class="tip-box icon-box">
				<span class="warn-icon m-icon"></span>
				<div class="item-fore">
					<h3 class="ftx-04">删除商品？</h3>
					<div class="ftx-03">您可以选择取消，或删除商品。</div>
				</div>
				<div class="op-btns ac">
					<a href="#none" id="dialogDel" class="btn-9 select-remove">狠心删除</a><a
						href="javascript:;" class="btn-1 ml10 re-select-follow close"
						onclick="dialogClose()">取 消</a>
				</div>
			</div>
		</div>
		<a href="javascript:;" class="ui-dialog-close" onclick="dialogClose()"
			title="关闭"><span class="ui-icon ui-icon-delete"></span></a>
	</div>
	<!-- 删除弹出  end-->
	<div class="ui-mask"
		style="position: absolute; left: 0px; top: 0px; opacity: 0; z-index: -9998; background-color: rgb(0, 0, 0); width: 100%; height: 3825px;"></div>
</body>
</html>