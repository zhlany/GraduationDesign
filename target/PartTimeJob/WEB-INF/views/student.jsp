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
 		<script type="text/javascript" async="" src="style/js/conversion.js"></script>
 		<script src="style/js/allmobilize.min.js" charset="utf-8" id="allmobilize"></script>
 		<style type="text/css"></style>
 		<meta content="no-siteapp" http-equiv="Cache-Control">
 		<link media="handheld" rel="alternate">

 		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
 		<title>基本信息-毕过兼职网</title>

 		<meta name="description" content="基本信息-毕过兼职网">
 		<meta name="keywords" content="基本信息-毕过兼职网">

 		<link href="http://www.lagou.com/images/favicon.ico" rel="Shortcut Icon">
 		<link href="style/css/style.css" type="text/css" rel="stylesheet">
 		<link href="style/css/external.min.css" type="text/css" rel="stylesheet">
 		<link href="style/css/popup.css" type="text/css" rel="stylesheet">
 		<script type="text/javascript" src="style/js/jquery.1.10.1.min.js"></script>
 		<script src="style/js/jquery.lib.min.js" type="text/javascript"></script>
 		<script type="text/javascript" src="style/js/ajaxfileupload.js"></script>
 		<script src="style/js/additional-methods.js" type="text/javascript"></script>

 		<script type="text/javascript">
 			var email = "${sessionScope.email}";
 			var type = "${sessionScope.type}";
 			$(document).ready(function() {
 				if (email != null && email != "") {
 					$("#ex").html();
 				} else {
 					$("#ex").html("未登录");
 					window.location.href = 'login';
 				}

 				if (type != "student") {
 					window.location.href = 'index';
 				}


 			});
 		</script>
 		<script src="style/js/conv.js" type="text/javascript"></script>

 	</head>
 	<body>
 		<div id="body">
 			<div id="header">
 				<div class="wrapper">
 					<a class="logo" href="index.html">
 						<img width="229" height="43" alt="毕过兼职网" src="style/images/logo.png">
 					</a>
 					<ul id="navheader" class="reset">
 						<li><a href="index.html">首页</a></li>
 						<li class="current"><a href="companylist.html">公司</a></li>
 						<li><a rel="nofollow" href="">简历管理</a></li>
 						<li><a rel="nofollow" href="create.html">发布职位</a></li>
 					</ul>
 					<dl class="collapsible_menu">
 						<dt>
 							<span id="ex">${sessionScope.email}</span>
 							<span class="red dn" id="noticeDot-1"></span>
 							<i></i>
 						</dt>
 						<dd style="display: none;"><a href="resume">我发布的职位</a></dd>
 						<dd style="display: none;"><a href="resume">我收到的简历</a></dd>
 						<dd class="btm" style="display: none;"><a href="comIndex">我的公司主页</a></dd>
 						<dd style="display: none;"><a href="updatePwd">修改密码</a></dd>
 						<dd class="logout"><a rel="nofollow" href="outLogin">退出</a></dd>
 					</dl>
 				</div>
 			</div><!-- end #header -->
 			<div id="container">


 				<div class="content_mid">
 					<dl class="c_section c_section_mid">
 						<dt>
 							<h2><em></em>填写学生信息</h2>
 						</dt>
 						<dd>
 							<form id="stepForm">
 								<div class="c_text_1">基本信息为必填项，是兼职报名成功的基本依据，认真填写吧！</div>

 								<h3>名字</h3>
 								<input type="text" placeholder="请输入你的名字" name="name" id="name" class="valid">
 								<span class="error" style="display:none;" id="beError"></span>
 								<h3>公司网址</h3>
 								<input type="text" placeholder="请输入公司网址" value="" name="website" id="website">

 								<h3>所在城市</h3>
 								<input type="text" placeholder="请输入工作城市，如：北京" name="city" id="city">

 								<h3>公司简介</h3>
 								<input type="text" placeholder="请输入公司简介" maxlength="300" name="temptation"
 									id="temptation">

 								<h3>公司负责人</h3>
 								<input type="text" placeholder="请输入负责人名字" name="principal" id="principal"
 									class="valid">

 								<h3>联系方式</h3>
 								<input type="text" placeholder="请输入联系方式" value="" name="phone" id="phone">

 								<input type="submit" value="保存" id="stepBtn" class="btn_big fr">
 							</form>
 						</dd>
 					</dl>
 				</div>
 	</body>
 </html>
