<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My京东-欢迎登录</title>
<link rel="shortcut icon" href="favicon.ico" />
<link rel="stylesheet" href="css/login2.css" />
<script src="js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script type="text/javascript">
			$(function() {
				//判断用户输入，判断焦点
				$("#loginname").focusin(function() {
					$(this).next().show();
					$(".item-fore1").addClass("item-focus");
				});
				$("#nloginpwd").focusin(function() {
					$(this).next().show();
					$(".item-fore2").addClass("item-focus");
				});
				$("#loginname").blur(function() {
					var value = $(this).val();
					if(value ==""){
						$(this).next().hide();
					}
					$(".item-fore1").removeClass("item-focus");
				});
				$("#nloginpwd").blur(function() {
					var value = $(this).val();
					if(value ==""){
						$(this).next().hide();
					}
					$(".item-fore2").removeClass("item-focus");
				});
				//点击删除文字
				$(".clear1").click(function() {
					$("#loginname").val("");
				});
				$(".clear2").click(function() {
					$("#nloginpwd").val("");
				});

			});
		</script>
</head>
<body>
	<!-- 顶部 -->
	<div class="w">
		<div id="logo">
			<a href="index.jsp"> <img src="images/logo-201305-b.png" alt="京东"
				width="170" height="60">
			</a> <span
				style="font-family: 'Microsoft YaHei'; color: #4d5e73; font-size: 30px; font-weight: 400; position: absolute; right: -190px; top: 30px;">不是所有网页都叫京东</span>
		</div>
		<a href="#" class="q-link"><b></b>登录页面，调查问卷</a>
	</div>
	<!-- 内容 -->
	<div id="content">
		<!-- 内容顶部提示 -->
		<div class="tips-wrapper">
			<div class="tips-inner">
				<div class="cont-wrapper">
					<i class="icon-tips"></i>
					<p>
						依据《网络安全法》，为保障您的账户安全和正常使用，请尽快完成手机号验证！ 新版<a href="#" class="black">《京东隐私政策》</a>已上线，将更有利于保护您的个人隐私。
					</p>
				</div>
			</div>
		</div>
		<!-- 内容登录 -->
		<div class="login-wrap">
			<div class="w">
				<div class="login-form">
					<!--登录提示-->
					<div class="tips-wrapper">
						<div class="tips-inner">
							<div class="cont-wrapper">
								<i class="icon-tips"></i>
								<p>京东不会以任何理由要求您转账汇款，谨防诈骗。</p>
							</div>
						</div>
					</div>
					<!--选择登录方式-->
					<div class="login-tab login-tab-l">
						<a href="javascript:void(0)" class="checked"
							style="outline: rgb(109, 109, 109) none 0px;">账户登录</a>

					</div>

					<!--登录主要盒子-->
					<div class="login-box" style="display: block; visibility: visible;">
						<div class="mt tab-h"></div>
						<div class="msg-wrap">
						    
						    <s:if test="exception.message==null"></s:if>
								<div class="msg-error hide">
									<b></b>
								</div>
							<s:else>
								<div class="msg-error">
									<b></b><s:property value="exception.message"/>
								</div>
							</s:else>
						</div>
						<div class="mc">
							<div class="form">
								<!--表单-->
								<form id="formlogin" method="post"
									action="${pageContext.request.contextPath }/UserAction_login">

									<div class="item item-fore1">
										<label for="loginname" class="login-label name-label"></label>
										<input id="loginname" type="text" class="itxt"
											name="username" tabindex="1" autocomplete="off"
											placeholder="邮箱/用户名/已验证手机" /> <span class="clear-btn clear1"></span>
									</div>

									<div id="entry" class="item item-fore2"
										style="visibility: visible;">
										<label class="login-label pwd-label" for="nloginpwd"></label>
										<input type="password" id="nloginpwd" name="password"
											class="itxt itxt-error" tabindex="2" autocomplete="off"
											placeholder="密码" /> <span class="clear-btn clear2"></span>
									</div>
									<div class="item item-fore4">
										<div class="safe">
											<span><input type="checkbox" id="autoLogin"
												name="autoLogin" value="autoLogin" />自动登录</span> <span
												class="forget-pw-safe"> <a href="#" class="">忘记密码</a>
											</span>
										</div>
									</div>

									<div class="item item-fore5">
										<div class="login-btn">
											<input type="submit" class="btn-img btn-entry"
												id="loginsubmit" tabindex="6" value="登      录"
												style="outline: rgb(109, 109, 109) none 0px;"></a>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<!--辅助登录-->
					<div class="coagent" id="kbCoagent">
						<ul>
							<li><b></b> <a href="javascript:void(0)"
								onclick="window.location='#'" class="pdl"><b class="QQ-icon"></b><span>QQ</span></a>
								<span class="line">|</span></li>
							<li><a href="javascript:void(0)" class="pdl"><b
									class="weixin-icon"></b><span>微信</span></a></li>
							<li class="extra-r">
								<div>
									<div class="regist-link">
										<a href="register.jsp"><b></b>立即注册</a>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<!-- 内容banner -->
			<div class="login-banner" style="background-color: #D7CCEC">
				<div class="w">
					<div id="banner-bg" class="i-inner"
						style="background: url(./images/loginbg.jpg) 0px 0px no-repeat; background-color: #D7CCEC">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- footer部分 -->
	<div class="w">
		<div id="footer-2013">
			<div class="links">
				<a href="#"> 关于我们 </a> | <a href="#"> 联系我们 </a> | <a href="#">
					人才招聘 </a> | <a href="#"> 商家入驻 </a> | <a href="#"> 广告服务 </a> | <a
					href="#"> 手机京东 </a> | <a href="#"> 友情链接 </a> | <a href="#">
					销售联盟 </a> | <a href="#"> 京东社区 </a> | <a href="#"> 京东公益 </a> | <a
					href="#">English Site</a>
			</div>
			<div class="copyright">
				Copyright&nbsp;&copy;&nbsp;2004-2018&nbsp;&nbsp;京东JD.com&nbsp;版权所有</div>
		</div>
	</div>


</body>
</html>