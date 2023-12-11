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
 		<title>毕过兼职网</title>
 		<meta name="description" content="毕过兼职网">
 		<meta name="keywords" content="毕过兼职网">

 		<link href="http://www.lagou.com/images/favicon.ico" rel="Shortcut Icon">
 		<link href="style/css/style.css" type="text/css" rel="stylesheet">
 		<link href="style/css/external.min.css" type="text/css" rel="stylesheet">
 		<link href="style/css/popup.css" type="text/css" rel="stylesheet">
 		<script type="text/javascript" src="style/js/jquery.1.10.1.min.js"></script>
 		<script src="style/js/jquery.lib.min.js" type="text/javascript"></script>
 		<script type="text/javascript" src="style/js/ajaxfileupload.js"></script>
 		<script src="style/js/additional-methods.js" type="text/javascript"></script>
 
 		<script type="text/javascript">
 			var youdao_conv_id = 271546;
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
 		<script src="http://tajs.qq.com/jiathis.php?uid=1626433&amp;dm=www.lagou.com" charset="utf-8"></script>
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
 						<img width="229" height="43" alt="大学生兼职平台" src="style/images/logo5.png">
 					</a>
 					<ul id="navheader" class="reset">
 						<li><a href="index">首页</a></li>
 						<li><a href="comIndex">公司</a></li>
 						<li><a href="index" rel="nofollow">学生版</a></li>
 						<li><a href="login" rel="nofollow">登录</a></li>
 						<li><a href="register" rel="nofollow">注册</a></li>
 					</ul>
 					<dl class="collapsible_menu">
 						<dt>
 							<span id="ex">${sessionScope.email}</span>
 							<span class="red dn" id="noticeDot-0"></span>
 							<i></i>
 						</dt>
 						<dd style="display: none;"><a href="resume">我发布的职位</a></dd>
 						<dd style="display: none;"><a href="">我收到的简历</a></dd>
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

 				</div><!-- end .sidebar -->
 				<div class="content">
 					<dl class="company_center_content">
 						<dt>
 							<h1>
 								<em></em>
 								发布新兼职
 							</h1>
 						</dt>
 						<dd>
 							<div class="ccc_tr">今日已发布 <span>1</span> 个兼职 还可发布 <span>4</span> 个兼职</div>
 							<div class="publish_tip">
 								<h2>恭喜你，兼职修改成功！</h2>
 								<a href="resume#vaild">查看兼职</a><br>
 								<a class="greylink" href="create">发布新兼职</a><br>
 								<a class="greylink" href="comIndex"> 进入我的公司主页</a><br>
 								<div style="float:left;" class="invite_share">

 								</div>
 							</div>

 						</dd>
 					</dl>
 				</div>
				<!-- end .content -->
 			</div>
			<!-- end #container -->
 		</div>
		<!-- end #body -->

 		<script src="style/js/core.min.js" type="text/javascript"></script>
 		<script src="style/js/popup.min.js" type="text/javascript"></script>
 	</body>
 </html>
