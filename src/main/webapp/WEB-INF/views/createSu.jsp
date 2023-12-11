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
		<title>毕过兼职网-修改兼职</title>
		<meta name="description" content="毕过兼职网-修改兼职">
		<meta name="keywords" content="毕过兼职网-修改兼职">

		<link href="http://www.lagou.com/images/favicon.ico" rel="Shortcut Icon">
		<link href="style/css/style.css" type="text/css" rel="stylesheet">
		<link href="style/css/external.min.css" type="text/css" rel="stylesheet">
		<link href="style/css/popup.css" type="text/css" rel="stylesheet">

		<script type="text/javascript" src="style/js/jquery.1.10.1.min.js"></script>
		<script src="style/js/jquery.lib.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="style/js/ajaxfileupload.js"></script>
		<script src="style/js/additional-methods.js" type="text/javascript"></script>
		<script type="text/javascript" src="style/js/excanvas.js"></script>

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

				if (type != "company") {
					window.location.href = 'index';
				}
			});
		</script>
		<script src="style/js/conv.js" type="text/javascript"></script>

	</head>
	<body>
		<link href="style/css/jiathis_share.css" rel="stylesheet" type="text/css"><iframe frameborder="0"
			style="position: fixed; display: none; opacity: 0;"></iframe>
		<div class="jiathis_style"
			style="position: absolute; z-index: 1000000000; display: none; top: 50%; left: 50%; overflow: auto;"></div>
		<div class="jiathis_style" style="position: absolute; z-index: 1000000000; display: none; overflow: auto;">
		</div><iframe frameborder="0" style="display: none;"
			src="http://v3.jiathis.com/code_mini/jiathis_utility.html"></iframe>
			
		<div id="body">
			<div id="header">
				<div class="wrapper">
					<a class="logo" href="index.html">
						<img width="229" height="43" alt="毕过兼职网-修改兼职" src="style/images/logo.png">
					</a>
					<ul id="navheader" class="reset">
						<li><a href="index">首页</a></li>
						<li><a href="comIndex">公司主页</a></li>
						<% if(session.getAttribute("type")==null) { %>
						<li><a href="login" rel="nofollow">登录</a></li>
						<li><a href="register" rel="nofollow">注册</a></li>
						<%}%>
					</ul>
					<dl class="collapsible_menu">
						<dt>
							<span id="ex">${sessionScope.email}</span>
							<span class="red dn" id="noticeDot-0"></span>
							<i></i>
						</dt>
						<dd style="display: none;"><a href="resume">我发布的职位</a></dd>
						<dd style="display: none;"><a href="resume">我收到的简历</a></dd>
						<dd class="btm" style="display: none;"><a href="comIndex">我的公司主页</a></dd>
						<dd style="display: none;"><a href="updatePwd">修改密码</a></dd>
						<dd class="logout" style="display: none;"><a rel="nofollow" href="outLogin">退出</a></dd>
					</dl>
					<div class="dn" id="noticeTip">
						<span class="bot"></span>
						<span class="top"></span>
						<a target="_blank" href="delivery.html"><strong>0</strong>条新投递反馈</a>
						<a class="closeNT" href="javascript:"></a>
					</div>
				</div>
			</div><!-- end #header -->
			<div id="container">

				<div class="sidebar">
					<a class="btn_create" href="create">发布新兼职</a>
					<dl class="company_center_aside">
						<dt>我收到的报名</dt>
						<dd>
							<a href="resume#unmanage">待处理</a>
						</dd>
						<dd>
							<a href="resume#pass">已通过</a>
						</dd>
						<dd>
							<a href="resume#unpass">未通过</a>
						</dd>
					</dl>
					<dl class="company_center_aside">
						<dt>我发布的兼职</dt>
						<dd>
							<a href="resume#vaild">有效兼职</a>
						</dd>
						<dd>
							<a href="resume#unvaild">下线兼职</a>
						</dd>
					</dl>

				</div>
				<!-- end .sidebar -->

			</div>
			<!-- end #container -->
		</div>
		<!-- end #body -->


		<script src="style/js/core.min.js" type="text/javascript"></script>
		<script src="style/js/popup.min.js" type="text/javascript"></script>
	</body>
</html>
