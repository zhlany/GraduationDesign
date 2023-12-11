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
		<title>公司信息-毕过兼职网</title>
		<meta name="description" content="简历预览-毕过兼职网">
		<meta name="keywords" content="简历预览-毕过兼职网">

		<link href="h/images/favicon.ico" rel="Shortcut Icon">
		<link href="style/css/style.css" type="text/css" rel="stylesheet">
		<link href="style/css/colorbox.min.css" type="text/css" rel="stylesheet">
		<link href="style/css/popup.css" type="text/css" rel="stylesheet">

		<script type="text/javascript" src="style/js/jquery.1.10.1.min.js"></script>
		<script src="style/js/jquery.colorbox-min.js" type="text/javascript"></script>

	</head>

	<body>
		<div id="previewWrapper" style="margin-top:35px;">
			<div class="preview_header">
				<h1 title="">${company.name}</h1>
			</div>
			<!--end .preview_header-->

			<div class="preview_content">
				<div class="profile_box" id="basicInfo">
					<h2>基本信息</h2>
					<div class="basicShow">
						<table>
							<tbody>
								<tr>
									<td>公司网址：${company.website}</td>
									<td>公司地址：${company.city}</td>

								</tr>
								<tr>
									<td>规模：${company.select_scale_hidden}</td>
									<td>领域：${company.select_industry_hidden}</td>

								</tr>
							</tbody>
						</table>

					</div>
					<!--end .basicShow-->
				</div>
				<!--end #basicInfo-->
				<div class="profile_box" id="expectJob">
					<h2>负责</h2>
					<div class="expectShow">
						<span style="margin-left:25px;">负责人：${company.principal}</span><br /><br />
						<span style="margin-left:25px;">联系电话：${company.phone}</span>
					</div>
					<!--end .expectShow-->
				</div>
				<!--end #expectJob-->
				<div class="profile_box" id="selfDescription">
					<h2>公司介绍</h2>
					<div class="descriptionShow">
						&nbsp;&nbsp;&nbsp;&nbsp;${company.temptation}
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
