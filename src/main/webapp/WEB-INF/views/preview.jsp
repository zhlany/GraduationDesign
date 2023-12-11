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
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
		<title>简历预览-毕过兼职网</title>
		<meta name="description" content="简历预览-毕过兼职网 主体信息">
		<meta name="keywords" content="简历预览-毕过兼职网">

		<link href="h/images/favicon.ico" rel="Shortcut Icon">
		<link href="style/css/style.css" type="text/css" rel="stylesheet">
		<link href="style/css/popup.css" type="text/css" rel="stylesheet">

		<script type="text/javascript" src="style/js/jquery.1.10.1.min.js"></script>

	</head>

	<body>
		<div id="previewWrapper">
			<div class="preview_header">
				<h1 title="jason的简历">${student.name}的简历</h1>
			</div>
			<!--end .preview_header-->

			<div class="preview_content">
				<div class="profile_box" id="basicInfo">
					<h2>基本信息</h2>
					<div class="basicShow">
						<table>
							<tbody>
								<tr>
									<td>名字：${student.name}</td>
									<td>性别：${student.sex}</td>
									<td>年龄：${student.age}</td>
								</tr>
								<tr>
									<td>身高：${student.height}</td>
									<td>体重：${student.weight}</td>
									<td>手机：${student.phone}</td>
								</tr>
							</tbody>
						</table>

					</div>
					<!--end .basicShow-->
				</div>
				<!--end #basicInfo-->

				<!--教育背景-->
				<div class="profile_box" id="educationalBackground">
					<h2>教育背景</h2>
					<div class="educationalShow">
						<ul class="elist clearfix ">
							<li data-id="" class="clear" style="margin-left:30px;">
								<i class="sm_edit dn"></i>
								<span style="font-size:20px;">学校：${student.school}</span><br />
								<br />
								<span>时间：${student.beginYear}-${student.endYear}</span>&nbsp;&nbsp;&nbsp;&nbsp;
								<span>学历：${student.rank}</span>
							</li>
						</ul>
					</div>
					<!--end .educationalShow-->
				</div>
				<!--end #educationalBackground-->
				
				<!-- 期望工作 -->
				<div class="profile_box" id="expectJob">
					<h2>期望工作</h2>
					<div class="expectShow">
						<span style="margin-left:25px;">期待兼职：${student.exJob}</span>
						<span style="margin-left:25px;">期待地点：${student.exSite}</span><br /><br />
						<span style="margin-left:25px;">空余时间：${student.freeTime}</span>
					</div>
					<!--end .expectShow-->
				</div>
				<!--end #expectJob-->
				
				<div class="profile_box" id="selfDescription">
					<h2>自我描述</h2>
					<div class="descriptionShow">
						&nbsp;&nbsp;&nbsp;&nbsp;${student.introduce}
					</div>
					<!--end .descriptionShow-->
				</div>
				<!--end #selfDescription-->


			</div>
			<!--end .preview_content-->
		</div>
		<!--end #previewWrapper-->
	</body>
</html>
