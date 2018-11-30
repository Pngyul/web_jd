<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>个人注册</title>
<link rel="shortcut icon" href="favicon.ico" />
<link type="text/css" rel="stylesheet" href="css/register-ui-base.css">
<link type="text/css" rel="stylesheet" href="css/register-gd.css">
<link type="text/css" rel="stylesheet"
	href="css/register-tinyscrollor.css">
<link type="text/css" rel="stylesheet" href="css/register1.css">
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>

<script>
	$(function() {

		var flag = false;
		var flagUsername = false;
		var flagPassword = false;
		var flagMobilenum = false;
		var flagPwdRepeat = false;
		var flagEmail = false;

		$(".clear").click(function() {
			$("#form-account").val("");
		});

		var arrInput = $("input[class='field']");

		arrInput.each(function() {
			var _this = $(this);
			var form_item = _this.offsetParent();
			var input_tip = form_item.next().children();
			var spanError = $(input_tip[0]);
			//input获得焦点
			_this.focusin(function() {
				//获得焦点移除validate
				form_item.removeClass("form-item-valid");
			});

			//input失去焦点
			_this.blur(function() {
						var val = _this.val();
						//判空，空不报错
						if (val == "") {
							//单独判断username.如果是空i-cancel隐藏
							spanError.hide();
						}
						//password失去焦点
						else if (_this.attr("name") == "password"
								&& val.length<3) {
							spanError.show();
							flagPassword = false;
							if ($("#form-equalTopwd").val() != "") {
								$("#form-equalTopwd-error").show();
								flagPwdRepeat = false;
							}

						}
						//username失去焦点
						else if (_this.attr("name") == "username"
								&& val.length < 3) {
							spanError.show();
							$("#isExist").hide();
							flagUsername = false;
						}
						//mobilenum失去焦点
						else if (_this.attr("name") == "mobilenum"
								&& val.length < 11) {
							spanError.show();
							flagMobilenum = false;
						}
						//pwdRepeat失去焦点
						else if (_this.attr("name") == "pwdRepeat"
								&& $("#form-pwd").val() != val) {
							spanError.show();
							flagPwdRepeat = false;
						}
						//email失去焦点
						else if (_this.attr("name") == "email"
								&& !val.match("@")) {
							spanError.show();
							flagEmail = false;
						}
						//input输入符合规定
						else {
							//以下是为了判断在提交时各个imput是否完成正确
							if (_this.attr("name") == "username") {
								spanError.hide();
								//判断该用户是否已经存在
								var isExist = false;
								var usernameInput = val;
								$.post("${pageContext.request.contextPath}/UserAction_checkUsername", {
									"username" : usernameInput
								}, function(data) {
									isExist = data.isExist;
									if (isExist) {
										$("#isExist").show();
										flagUsername = false;
									} else {
										$("#isExist").hide();
										spanError.hide();
										form_item.addClass("form-item-valid");
										flagUsername = true;
									}
								}, "json");
							} else if (_this.attr("name") == "password") {
								spanError.hide();
								form_item.addClass("form-item-valid");
								var equalTo = $("#form-pwd").val() != $(
										"#form-equalTopwd").val();
								var equalTopwdNotnull = $("#form-equalTopwd")
										.val() != "";
								if (equalTo && equalTopwdNotnull) {
									$("#form-equalTopwd-error").show();
									$(".form-item-equalTopwd").removeClass(
											"form-item-valid");
									flagPwdRepeat = false;
								} else if (equalTopwdNotnull) {
									$("#form-equalTopwd-error").hide();
									$(".form-item-equalTopwd").addClass(
											"form-item-valid");
									flagPwdRepeat = true;
								}
								flagPassword = true;
							} else if (_this.attr("name") == "pwdRepeat") {
								spanError.hide();
								form_item.addClass("form-item-valid");
								flagPwdRepeat = true;
							} else if (_this.attr("name") == "mobilenum") {
								spanError.hide();
								form_item.addClass("form-item-valid");
								flagMobilenum = true;
							} else if (_this.attr("name") == "email") {
								spanError.hide();
								form_item.addClass("form-item-valid");
								flagEmail = true;
							}
						}
					});
		});

		//点击按钮
		$("#form-register").click(
				function() {
					var username = $("#form-account");
					var password = $("#form-pwd");
					var repassword = $("#form-equalTopwd");
					var mobilenum = $("#form-mobilenum");
					var email = $("#form-email");
					flag = flagUsername && flagPassword && flagPwdRepeat
							&& flagMobilenum && flagEmail;
					if (flag) {
						window.location.href = "${pageContext.request.contextPath }/UserAction_regist?username="
								+ username.val() + "&password="
								+ password.val() + "&mobilenum="
								+ mobilenum.val() + "&email=" + email.val();
					} else {
						if (!flagUsername) {
							username.focus();
							username.val("");
						} else if (!flagPassword) {
							password.focus();
							password.val("");
						} else if (!flagPwdRepeat) {
							repassword.focus();
							repassword.val("");
						} else if (!flagMobilenum) {
							mobilenum.focus();
							mobilenum.val("");
						} else if (!flagEmail) {
							email.focus();
							email.val("");
						}
					}
					return;
				});

		
	});
</script>

</head>
<body>
	<!-- widget header begin -->
	<div class="header">
		<div class="logo-con w clearfix">
			<a href="https://www.jd.com" class="logo"> </a>
			<div class="logo-title">欢迎注册</div>

			<div class="have-account">
				已有账号？ <a href="login.jsp">请登录&gt;</a>
			</div>

		</div>
	</div>
	<!-- widget header end -->
	<div class="container w">

		<!-- widget reg-steps begin -->
		<div class="main ">
			<div class="reg-form">
				<form action="${pageContext.request.contextPath }/UserAction_regist"
					id="register-form" method="POST">
					<input name="uid" type="hidden" id="uid"/>
					<div id="step2-wrap" style="display: block;">
						<div class="form-item form-item-account" id="form-item-account">
							<label>用 户 名</label> <input type="text" id="form-account"
								name="username" class="field" autocomplete="off" maxlength="20"
								placeholder="您的账户名和登录名"> <i class="i-status"></i> <i
								class="i-cancel clear"></i> <span id="isExist"
								style="position: absolute; left: 415px; top: 0; width: 300px; height: 52px; line-height: 52px; color: #e2231a; display: none;">该用户名已经存在</span>
						</div>
						<div class="input-tip">
							<span id="form-account-error" class="error"><i
								class="i-error"></i>长度只能在4-20个字符之间</span>
						</div>
						<div class="form-item">
							<label>设 置 密 码</label> <input autocomplete="off" type="password"
								name="password" id="form-pwd" class="field" maxlength="20"
								placeholder="建议使用两种或两种以上字符组合"> <i class="i-status"></i>
							<i class="i-cancel"></i>
						</div>
						<div class="input-tip">
							<span id="form-pwd-error" class="error"><i class="i-error"></i>长度只能在6-20个字符之间</span>
						</div>
						<div class="form-item form-item-equalTopwd">
							<label>确 认 密 码</label> <input type="password" name="pwdRepeat"
								id="form-equalTopwd" class="field" maxlength="20"
								placeholder="请再次输入密码 "> <i class="i-status"></i> <i
								class="i-cancel"></i>
						</div>
						<div class="input-tip">
							<span id="form-equalTopwd-error" class="error"><i
								class="i-error"></i>两次密码输入不一致</span>
						</div>

						<div class="form-item form-item-account" id="form-item-account">
							<label>手 机 号 码 </label> <input type="text" id="form-mobilenum"
								name="mobilenum" class="field" maxlength="11" autocomplete="off"
								maxlength="20" placeholder="请输入您的手机号"> <i
								class="i-status"></i> <i class="i-cancel"></i>
						</div>
						<div class="input-tip">
							<span id="form-account-error" class="error"><i
								class="i-error"></i>手机格式错误</span>
						</div>
						<div class="item-email-wrap">
							<div class="form-item">
								<label>邮 箱 号</label> <input type="text" name="email"
									id="form-email" class="field" autocomplete="off" maxlength="50"
									placeholder="请输入邮箱"> <i class="i-status"></i> <i
									class="i-cancel"></i>
							</div>

							<div class="input-tip">
								<span id="form-email-error" class="error"><i
									class="i-error"></i>邮箱格式错误</span>
							</div>
						</div>

						<div>
							<input type="button" class="btn-register" id="form-register"
								value="立即注册">
						</div>
						<div class="input-tip">
							<span id="form-account-error" class="error"><i
								class="i-error"></i>长度只能在4-20个字符之间</span>
						</div>
						<!--<div class="back-btn" id="back-btn">返回上一步</div>-->
					</div>
				</form>
			</div>

		</div>
	</div>
	<!-- widget footer begin -->
	<div id="form-footer" class="footer w">
		<div class="links">
			<a href="#"> 关于我们</a>| <a href="#">联系我们</a>| <a href="#">人才招聘</a>| <a
				href="#">商家入驻</a>| <a href="#">广告服务</a>| <a href="#">手机京东</a>| <a
				href="#">友情链接</a>| <a href="#">销售联盟</a>| <a href="#">京东社区</a>| <a
				href="#">京东公益</a>| <a href="#">English Site</a>
		</div>
		<div class="copyright">
			Copyright&copy;2004-2018&nbsp;&nbsp;京东JD.com&nbsp;版权所有</div>
	</div>
	<!-- widget footer end -->
</body>
</html>