/* user-passport/1.0.0 login.index.2016-1130.js Date:2017-11-02 15:58:21 */
seajs
		.use(
				[
						"//misc.360buyimg.com/user/passport/1.0.0/js/login.username.js",
						"//misc.360buyimg.com/user/passport/1.0.0/js/login.password.js",
						"//misc.360buyimg.com/user/passport/1.0.0/js/login.authcode.js",
						"//misc.360buyimg.com/user/passport/1.0.0/js/login.submit-1130.js",
						"//misc.360buyimg.com/jdf/1.0.0/ui/placeholder/1.0.0/placeholder",
						"//misc.360buyimg.com/user/passport/1.0.0/js/login.qrcode.2016.js" ],
				function(a, b, c, d, e, f) {
					a.init(), b.init(), c.init(), f.init();
					var g = '<div class="tips-wrapper"><div class="tips-inner"><div class="cont-wrapper"><i class="icon-tips"></i><p>\u4f9d\u636e\u300a\u7f51\u7edc\u5b89\u5168\u6cd5\u300b\uff0c\u4e3a\u4fdd\u969c\u60a8\u7684\u8d26\u6237\u5b89\u5168\u548c\u6b63\u5e38\u4f7f\u7528\uff0c\u8bf7\u5c3d\u5feb\u5b8c\u6210\u624b\u673a\u53f7\u9a8c\u8bc1\uff01 \u65b0\u7248<a href="https://about.jd.com/privacy/" class="black" target="_blank">\u300a\u4eac\u4e1c\u9690\u79c1\u653f\u7b56\u300b</a>\u5df2\u4e0a\u7ebf\uff0c\u5c06\u66f4\u6709\u5229\u4e8e\u4fdd\u62a4\u60a8\u7684\u4e2a\u4eba\u9690\u79c1\u3002</p></div></div>';
					$(".login-wrap").before(g);
					var h = '<div class="tips-wrapper"><div class="tips-inner"><div class="cont-wrapper"><i class="icon-tips"></i><p >\u4eac\u4e1c\u4e0d\u4f1a\u4ee5\u4efb\u4f55\u7406\u7531\u8981\u6c42\u60a8\u8f6c\u8d26\u6c47\u6b3e\uff0c\u8c28\u9632\u8bc8\u9a97\u3002</p></div></div>';
					location.href.indexOf("popupLogin") > -1 ? $(".login-form")
							.before(h) : $(".login-form").prepend(h), $(
							"input[placeholder]").bind("keydown", function() {
						$(this).prev("txt").hide()
					}), $("txt").css("font-family",
							"Arial, Verdana, \u5b8b\u4f53"),
							document.msCapsLockWarningOff = !0,
							$("body").delegate(
									"input:checkbox, a",
									"click",
									function() {
										$(this).css("outline",
												"rgb(109, 109, 109) none 0px")
									}), $("body").delegate(
									"input:checkbox, a",
									"focusin",
									function() {
										$.browser.webkit ? $(this).css(
												"outline",
												"rgb(77, 144, 254) auto 5px")
												: $(this).css("outline",
														"#aaa 1px dotted")
									}), $("body").delegate(
									"input:checkbox, a",
									"focusout",
									function() {
										$(this).css("outline",
												"rgb(109, 109, 109) none 0px")
									}), $("body").delegate("#nloginpwd",
									"focus", function() {
										$(this).siblings("txt").hide()
									});
					var i = "placeholder" in document.createElement("input");
					i || $("input[placeholder]").placeholder()
				});