<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page isELIgnored="false" %>

 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <html>
 	<head>
 		<script id="allmobilize" charset="utf-8" src="style/js/allmobilize.min.js"></script>
 		<meta http-equiv="Cache-Control" content="no-siteapp" />
 		<link rel="alternate" media="handheld" />

 		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 		<title>注册-毕过兼职网</title>
 		<meta content="注册-毕过兼职网" name="description">
 		<meta content="注册-毕过兼职网" name="keywords">

 		<link rel="stylesheet" type="text/css" href="style/css/style.css" />

 		<script src="style/js/jquery.1.10.1.min.js" type="text/javascript"></script>
 		<script type="text/javascript" src="style/js/jquery.lib.min.js"></script>
 		<script type="text/javascript" src="style/js/core.min.js"></script>
 		<script type="text/javascript" src="style/js/conv.js"></script>
 	</head>

 	<body id="login_bg"
 		style="background-color: #5bc0de">
 		<div class="login_wrapper">
 			<div class="login_header">

 				<div id="cloud_s"><img src="style/images/cloud_s.png" width="81" height="52" alt="cloud" /></div>
 				<div id="cloud_m"><img src="style/images/cloud_m.png" width="136" height="95" alt="cloud" /></div>
 			</div>

 			<div class="login_box">
 				<form id="loginForm">
 					<ul class="register_radio clearfix">
 						<li>
 							我是商家
 							<input type="radio" value="company" name="type" />
 						</li>
 						<li>
 							我是学生
 							<input type="radio" value="student" name="type" />
 						</li>
 					</ul>
					
					<!-- tabindex 可使用Tab键获取焦点 -->
 					<input type="text" id="email" name="email" tabindex="1" placeholder="请输入常用邮箱地址" />
 					<span class="error" style="display:none;" id="beError"></span>
					
 					<input type="password" id="password" name="password" tabindex="2" placeholder="请输入密码" />
					
 					<label class="fl registerJianJu" for="checkbox">
 						<input type="checkbox" id="checkbox" name="checkbox" checked class="checkbox valid" />我已阅读并同意<a
 							href="privacy.html" target="_blank">《用户协议》</a>
 					</label>
 					<input type="submit" id="submitLogin" value="注 &nbsp; &nbsp; 册" />
 				</form>
 				<div class="login_right">
 					<br /><br /><br />
 					<div>已有帐号</div>
 					<a href="login" class="registor_now" style="color: #0A246A">直接登录</a>
 				</div>
 			</div>
 			<div class="login_box_btm"></div>
 		</div>

 		<script type="text/javascript">
 			$(document).ready(function(e) {
				//选择添加重点标记
 				$('.register_radio li input').click(function(e) {
 					$(this).parent('li').addClass('current').append('<em></em>').siblings().removeClass(
 						'current').find('em').remove();
 				});
				
				//选择用户类型后将焦点移到输入框
 				$('#email').focus(function() {
 					//$('#beError').hide();
 				});

 				//验证用户名是否已用
 				$("#loginForm #email").blur(function() {
 					$.post("isEmailExist.do", {
 						"email": $("#email").val()
 					}, function(response) {
 						if (response.tip == "error") {
 							$('#beError').show();
 							$('#beError').html("该电子邮箱已被注册");
							/* 获取焦点，点击无效 */
 							$("#loginForm #email").focus();
 							$("#loginForm").find(":submit").attr("disabled", true);
 						} else {
 							$('#beError').hide();
 							$("#loginForm").find(":submit").attr("disabled", false);
 						}
 					});
 				});

 				//验证表单
 				$("#loginForm").validate({
 					rules: {
 						type: {
 							required: true
 						},
 						email: {
 							required: true,
 							email: true
 						},
 						password: {
 							required: true,
 							rangelength: [6, 16]
 						},
 						checkbox: {
 							required: true
 						}
 					},
 					messages: {
 						type: {
 							required: "请选择注册的类型"
 						},
 						email: {
 							required: "请输入常用邮箱地址",
 							email: "请输入有效的邮箱地址，如：1186xxxx@qq.com"
 						},
 						password: {
 							required: "请输入密码",
 							rangelength: "请输入6-16位密码，字母区分大小写"
 						},
 						checkbox: {
 							required: "请接受用户协议"
 						}
 					},
					
 					//JQ验证插件 - 表单外的错误标签
 					errorPlacement: function(label, element) {
 						if (element.attr("type") == "radio") {
 							label.insertAfter($(element).parents('ul')).css('marginTop', '-20px');
 						} else if (element.attr("type") == "checkbox") {
 							label.insertAfter($(element).parent()).css('clear', 'left');
 						} else {
 							label.insertAfter(element);
 						}
 					},
					
 					//表单验证通过后会自动提交
 					submitHandler: function(form) {
 						var type = $('input[type="radio"]:checked', form).val();
 						var email = $('#email').val();
 						var password = $('#password').val();

 						$(form).find(":submit").attr("disabled", true);


 						$.ajax({
 							type: 'POST',
 							data: {
 								"email": email,
 								"password": password,
 								"type": type
 							},
 							url: 'reg',
 							async: false,
 							dataType: 'json',
 							success: function(response) {
 								alert("注册成功！");
 								window.location = 'login';
 								$(form).find(":submit").attr("disabled", false);
 							},
 							error: function(response) {
 								alert("注册失败！");
 								$(form).find(":submit").attr("disabled", false);
 							}
 						});
 					}
 				});
 			});
 		</script>
 	</body>
 </html>
