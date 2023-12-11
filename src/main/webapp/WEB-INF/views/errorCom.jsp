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
 		<link media="handheld" rel="alternate">
 		<meta content="no-siteapp" http-equiv="Cache-Control"> <!-- 禁止浏览器从本地计算机的缓存中访问页面内容 -->
 		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
 		<title>毕过兼职网</title>

 		<meta name="description" content="毕过兼职网-错误页面">
 		<meta name="keywords" content="毕过兼职网">

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
 			$(document).ready(function() {
 				if (email != null && email != "") {
 					$("#ex").html();
 				} else {
 					$("#ex").html("未登录");
 					window.location.href = 'login';
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
 						<li><a target="_blank" href="">论坛</a></li>
 						<li>
 							<a rel="nofollow" href="">简历管理</a>
 						</li>
 						<li><a rel="nofollow" href="create.html">发布职位</a></li>
 					</ul>
 					<dl class="collapsible_menu">
 						<dt>
 							<span>${sessionScope.email}</span>
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

 					<!--发布职位成功 -->
 					<dl class="c_section c_section_mid">
 						<dd class="c_notice">
 							<h4>服务器一不小心打了个瞌睡，公司信息未完善！</h4>
 							<a class="greylink" href="company">完善公司信息</a>
 							<a class="greylink" href="login"> 重新登录（更安全哦）</a>
 						</dd>
 					</dl>
 				</div>

 			</div>
			<!-- end #container -->
 		</div>
		<!-- end #body -->

 		<script src="style/js/core.min.js" type="text/javascript"></script>
 		<script src="style/js/popup.min.js" type="text/javascript"></script>
 	</body>
 </html>
