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
		<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
		<title>${resume.jobName}-毕过兼职网</title>
		<meta name="description" content="简历信息">
		<meta name="keywords" content="简历信息">


		<link href="style/css/style.css" type="text/css" rel="stylesheet">
		<link href="style/css/external.min.css" type="text/css" rel="stylesheet">
		<link href="style/css/popup.css" type="text/css" rel="stylesheet">

		<script type="text/javascript" src="style/js/jquery.1.10.1.min.js"></script>
		<script src="style/js/jquery.lib.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="style/js/ajaxfileupload.js"></script>
		<script type="text/javascript" src="style/js/jquery-hbzx.js"></script>

		<script type="text/javascript">
			var email = "${sessionScope.email}";
			var type = "${sessionScope.type}";
			$(document).ready(function() {
/*				if (email != null && email != "") {} else {
					$("#ex").html("未登录");
					window.location.href = 'login';
				}*/
				/* 请求学生信息 */
				$.ajax({
					type: "post",
					url: "showStu",
					data: {
						email: email
					},
					success: function(response) {
						if (response.student != null) {
							$("#upTime").html("简历更新于" + response.student.upTime);
							$("#stuName").html(response.student.name + "的简历");
						}
					}
				});

			});
			/* 检测登录 报名 */
			function checkStudent() {
				if (type == null || type == "") {
					alert("请先登录!");
				} else if (type != "student") {
					alert("只有学生用户才可以报名!");
				} else {
					$.ajax({
						type: "post",
						url: "checkStudent",
						data: {
							email: email
						},
						async: "false",
						success: function(response) {
							if (response.tip != "success") {
								alert(response.tip);
								window.location.href = "stuResume";
							} else {
								var id = $("#reId").text();
								/*是否已经申请*/
								$.ajax({
									type: "post",
									url: "isApply",
									data: {
										email: email,
										id: $("#reId").text()
									},
									success: function(response) {
										if (response.tip == true) {
											alert("您已经申请过该职位了");
										} else {
											/*报名*/
											$.ajax({
												type: "post",
												url: "stuApply",
												data: {
													email: email,
													id: $("#reId").text()
												},
												success: function(response) {
													if (response.tip == true) {
														alert("恭喜你，报名成功!");
													} else {
														alert("很遗憾，报名失败！");
													}
												}
											});
										}
									}
								});

							}
						}
					});

				}

			}

			/*检测登录 收藏*/
			function stuCollect(){
				if (type == null || type == "") {
					alert("请先登录!");
				} else if (type != "student") {
					alert("只有学生用户才可以收藏!");
				} else {
					/*先检测是否已经收藏*/
					$.ajax({
						type: "post",
						url:"isCollect",
						data:{
							email:email,
							id:$("#reId").text()
						},
						success: function (response) {
							if (response.tip == true) {
								/*移除收藏*/
								$.ajax({
									type: "post",
									url:"delCollect",
									data:{
										email:email,
										id:$("#reId").text()
									},
									success: function (response) {
										if (response == true) {
											alert(response+"  您之前已经收藏，现在为你移除收藏");
										}else {
											alert(response+"  取消收藏失败，请重试");
										}

									}
								});
							} else {
								/*添加收藏*/
								$.ajax({
									type: "post",
									url:"stuCollect",
									data:{
										email:email,
										id:$("#reId").text()
									},
									success:function (response) {
										if (response.tip == true) {
											alert("收藏成功");
										}else {
											alert("收藏失败，请重试");
										}
									}
								});
							}
						}
					});
				}
			}
		</script>
		<script src="style/js/conv.js" type="text/javascript"></script>
	</head>
	<body>
		<div id="body">
			<div id="header">
				<div class="wrapper">
					<a class="logo" href="index">
						<img width="229" height="43" alt="毕过兼职网" src="style/images/logo.png">
					</a>
					<ul id="navheader" class="reset">
						<li><a href="index">首页</a></li>
						<% if(session.getAttribute("type")!=null) { %>
						<%if(session.getAttribute("type").equals("company")){%>
						<li><a href="create" rel="nofollow">兼职招聘</a></li>
						<li><a href="comIndex" rel="nofollow">公司主页</a></li>
						<%} else if(session.getAttribute("type").equals("student")){%>
						<li><a href="delivery" rel="nofollow">报名</a></li>
						<li><a href="stuResume" rel="nofollow">简历</a></li>
						<li><a rel="nofollow" target="_blank" href="preview?email=${sessionScope.email}">预览</a></li>
						<%} } else{%>
						<li><a href="login" rel="nofollow">登录</a></li>
						<li><a href="register" rel="nofollow">注册</a></li>
						<%}%>
					</ul>
					
					<dl class="collapsible_menu">
						<dt>
							<span id="ex">${sessionScope.email}</span>
							<span class="red dn" id="noticeDot-1"></span>
							<i></i>
						</dt>
						<dd style="display: none;"><a href="positions.html">我发布的职位</a></dd>
						<dd style="display: none;"><a href="stuResume">我的简历</a></dd>
						<dd style="display: none;"><a href="index">我要找工作</a></dd>
						<dd style="display: none;"><a href="updatePwd">帐号设置</a></dd>
						<dd class="logout" style="display: none;"><a rel="nofollow" href="outLogin">退出</a></dd>
					</dl>
				</div>
			</div><!-- end #header -->
			<div id="container">
				<div class="clearfix">
					<div class="content_l">
										<dl class="job_detail">
							<dt>
								<h1 >
									<em></em>
										<div id="reId" style="display:none">${resume.id}</div>
										${resume.jobName}
								</h1>
								<div class="jd_collection" id="jobCollection" onclick="stuCollect()">
								<div class="jd_collection_success">
										<span>已成功收藏该职位，</span>
										<%--<a class="jd_collection_page" href="collections.html">查看全部</a>
										<a class="jd_collection_x" href="javascript:"></a>--%>
									</div>
								</div>
													</dt>
							<dd class="job_request">
							<div style="float:left;margin-top:-5px;">
							<span class="red">人数：${resume.number}</span><br/><br/>
							<span class="red">报酬：${resume.salary}</span><br/><br/>
							<span class="red">地点：${resume.department}</span>

							</div>
					<a title="报名参加" class="btn fr btn_apply" id="stuApply" onclick="checkStudent()">报名参加</a>
			  <!--inline-->
							</dd>
							<dd class="job_bt">
								<h3 class="description">联系</h3>
								<p><strong>联系人邮箱</strong>&nbsp;${resume.email}</p>
								<p><strong>要求：&nbsp;</strong>${resume.deRequest}</p>
								<p><strong>时间：&nbsp;</strong>${resume.time}</p>
							</dd>

							<dd class="job_bt">
								<h3 class="description">职位详情</h3>
								<p><strong>职位详情：</strong>&nbsp;${resume.detail}</p>
								<p><strong>要求：&nbsp;</strong>${resume.deRequest}</p>
								<p><strong>时间：&nbsp;</strong>${resume.time}</p>
							</dd>

													<!-- 用户是否激活 0-否；1-是 -->
							<% if(session.getAttribute("type")!=null) { %>
							<%if(session.getAttribute("type").equals("student")){%>
								<dd class="resume resume_web">
									<div>
										<span> 你已有可投递的在线简历：<a target="_blank" href="preview?email=${sessionScope.email}"><strong
													id="stuName"></strong></a></span><br>
										<span id="upTime"></span>
									</div>
									<span class="setBtns">
										<a target="_blank" title="预览" href="preview?email=${sessionScope.email}">预览</a> |
										<a title="修改" href="stuResume">修改</a>
									</span>
								</dd>
								<%} }else {%>
								<dd class="resume resume_web">
									<div>
										<span>您还未登录，现在就 <a target="_blank" href="login">登录</a>
										<strong> / </strong>
											<a target="_blank" href="register">注册</a>
										</span><br>
									</div>
								</dd>
								<%}%>

						</dl>
										<div id="weibolist"></div>
					</div>

					<!-- 右模块 -->
					<div class="content_r">
						<dl class="job_company">
							<dt>
								<a target="_blank" href="h/c/5004.html">
									<img width="80" height="80" alt="" src="style/images/company.png" class="b2"> </a>
									<div style="margin-left:20px;">
										<h2 class="fl">
											${company.name}
										</h2>
									</div>

							</dt>
							<dd>
								<ul class="c_feature reset">
									<li><span>领域</span> ${company.select_industry_hidden}</li>
									<li><span>规模</span> ${company.select_scale_hidden}</li>
									<li>
										<span>主页</span>
									<a rel="nofollow" title="" target="_blank" href="${company.website}">${company.website}</a>
																	</li>
								</ul>

								<h4>联系 方式</h4>
								<ul class="c_feature reset">
									<li><span>负责人</span> ${company.principal}</li>
									<li><span>联系方式</span> ${company.phone}</li>
								</ul>
									<h4>公司简介</h4>
								<div>&nbsp;&nbsp;&nbsp;&nbsp;${company.temptation}</div>
							</dd>
						</dl>
					</div>
				</div>
			</div>
		</div>
	<script src="style/js/core.min.js" type="text/javascript"></script>
	<script src="style/js/popup.min.js" type="text/javascript"></script>

	</body>
</html>
