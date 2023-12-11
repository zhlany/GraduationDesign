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

 		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
 		<title>毕过兼职网-发布兼职</title>
 		<meta content="23635710066417756375" property="qc:admins">
 		<meta name="description" content="毕过兼职网-发布兼职">
 		<meta name="keywords" content="毕过兼职网-发布兼职">

 		<link media="screen" href="style/js/statics/grade1.css" type="text/css" rel="stylesheet" />
 		<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
 		<link href="style/css/style.css" type="text/css" rel="stylesheet">
 		<link href="style/css/external.min.css" type="text/css" rel="stylesheet">
 		<link href="style/css/popup.css" type="text/css" rel="stylesheet">

 		<script type="text/javascript" src="style/js/jquery.1.10.1.min.js"></script>
 		<script src="style/js/jquery.lib.min.js" type="text/javascript"></script>
 		<script type="text/javascript" src="style/js/ajaxfileupload.js"></script>
 		<script src="style/js/additional-methods.js" type="text/javascript"></script>
		<script type="text/javascript" src="style/js/excanvas.js"></script>

 		<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script> 

 		<script src="style/js/conv.js" type="text/javascript"></script>


 		<script src="style/js/statics/grade2.js" type="text/javascript"></script>
 		<link rel="stylesheet" href="style/css/ui.css">
 		<link rel="stylesheet" href="style/css/window.css">
 		<script type="text/javascript">
 			var email = "${sessionScope.email}";
 			var type = "${sessionScope.type}";
 			var tip = false;
 			$(document).ready(function() {
 				if (email != null && email != "") {} else {
 					$("#ex").html("未登录");
 					window.location.href = 'login';
 				}

 				if (type != "company") {
 					window.location.href = 'index';
 				}
				//获取兼职信息
 				disResume();
				//显示报名
 				disApply();
 				$("#department,#number,#deRequest,#salary,#time,#detail").focus(function() {	//将焦点放在操作上
 					if ($("#ggg").val() != "OK") {
 						$.post("isJobName", {
 								"email": email,
 								"jobName": $("#positionName").val()
 							},
 							function(response) {
 								if (response.tip == true) {
 									$('#beError').show();
 									$('#beError').html("该兼职名称已存在");
 									$("#select_category").focus();
									//attr获取其值的属性
 									$("#jobPreview").find(":submit").attr("disabled", true); 	//如果已经存在同命名的兼职则禁止发布提交
 								} else {
 									$('#beError').hide();
 									$("#jobPreview").find(":submit").attr("disabled", false);
 								}
 							});
 					}
 				});
				
				//动态增加、移除class类名 dn , 以显示对应模块，以下相同
				//通过
 				$("#pa").click(function() {
 					$("#allAllege").addClass("dn");
 					$("#pass").removeClass("dn");
 					$("#unmanage").addClass("dn");
 					$("#unpass").addClass("dn");
 					$("#valid").addClass("dn");
 					$("#unvalid").addClass("dn");
 					$("#complete").addClass("dn");
 					$("#createIndex").addClass("dn");
 					$("#create").addClass("dn");
 					$("#createSu").addClass("dn");
 				});
				
				//未通过
 				$("#unpa").click(function() {
 					$("#allAllege").addClass("dn");
 					$("#unpass").removeClass("dn");
 					$("#unmanage").addClass("dn");
 					$("#complete").addClass("dn");
 					$("#pass").addClass("dn");
 					$("#valid").addClass("dn");
 					$("#unvalid").addClass("dn");
 					$("#createIndex").addClass("dn");
 					$("#create").addClass("dn");
 					$("#createSu").addClass("dn");
 				});

				//待处理
 				$("#unman").click(function() {
 					$("#allAllege").addClass("dn");
 					$("#unmanage").removeClass("dn");
 					$("#complete").addClass("dn");
 					$("#createIndex").addClass("dn");
 					$("#create").addClass("dn");
 					$("#createSu").addClass("dn");
 					$("#pass").addClass("dn");
 					$("#unpass").addClass("dn");
 					$("#valid").addClass("dn");
 					$("#unvalid").addClass("dn");
 				});

				//下线
 				$("#unva").click(function() {
 					$("#allAllege").addClass("dn");
 					$("#unvalid").removeClass("dn");
 					$("#pass").addClass("dn");
 					$("#unpass").addClass("dn");
 					$("#unmanage").addClass("dn");
 					$("#complete").addClass("dn");
 					$("#valid").addClass("dn");
 					$("#createIndex").addClass("dn");
 					$("#create").addClass("dn");
 					$("#createSu").addClass("dn");
 				});
				
				//已完成
 				$("#comp").click(function() {
 					$("#allAllege").addClass("dn");
 					$("#unvalid").addClass("dn");
 					$("#pass").addClass("dn");
 					$("#unpass").addClass("dn");
 					$("#unmanage").addClass("dn");
 					$("#complete").removeClass("dn");
 					$("#valid").addClass("dn");
 					$("#createIndex").addClass("dn");
 					$("#create").addClass("dn");
 					$("#createSu").addClass("dn");
 				});


 			});

			//发布兼职
 			function create() {
 				$("#allAllege").addClass("dn");
 				$("#create").removeClass("dn");
 				$("#createIndex").addClass("dn");
 				$("#unvalid").addClass("dn");
 				$("#pass").addClass("dn");
 				$("#unpass").addClass("dn");
 				$("#complete").addClass("dn");
 				$("#unmanage").addClass("dn");
 				$("#valid").addClass("dn");
 				$("#createSu").addClass("dn");
 				$("#kkk").show();
 				$("#select_category").val("");
 				$("#positionType").val("");
 				$("#positionName").val("");
 				$("#department").val("");
 				$("#number").val("");
 				$("#deRequest").val("");
 				$("#salary").val("");
 				$("#time").val("");
 				$("#detail").val("");
 				$("#ggg").val("");
 			}
			
			//获取兼职信息
 			function disResume() {
 				$.ajax({
 					type: "POST",
 					url: "disResume",
 					data: {
 						email: email
 					},
 					dataType: "json",
 					success: function(response) {
 						var obj = response.reList;
 						var html = "";
 						var j = 0;
 						var x = 0;
 						var html1 = "";
 						for (var i = 0; i < obj.length; i++) {
 							if (obj[i].state == "有效") {
 								j++;
 								html += '<ul class="reset my_jobs"><li><h3><a target="_blank" href="applyRe?id=' +
 									obj[i].id + '">' +
 									obj[i].jobName +
 									'</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>' + obj[i].department +
 									'</span></h3><span class="receivedResumeNo"><a href="">应聘简历（1）</a></span><div>' +
 									obj[i].number + '/' + obj[i].salary +
 									'</div><div class="c9">' +
 									obj[i].time +
 									'</div><div class="links"><a class="job_edit" onclick="editResume(' + obj[i]
 									.id + ')">编辑</a><a class="job_offline" onclick="downResume(' + obj[i].id +
 									')">下线</a></div></li></ul>'
 							} else {
 								x++;
 								html1 += '<ul class="reset my_jobs"><li><h3><a target="_blank" href="applyRe?id=' +
 									obj[i].id + '">' +
 									obj[i].jobName +
 									'</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>' + obj[i].department +
 									'</span></h3><span class="receivedResumeNo"><a href="">应聘简历（1）</a></span><div>' +
 									obj[i].number + '/' + obj[i].salary +
 									'</div><div class="c9">' +
 									obj[i].time +
 									'</div><div class="links"><a onclick="editResume(' + obj[i].id +
 									')">编辑</a><a class="job_offline" onclick="upResume(' + obj[i].id +
 									')">上线</a><a class="job_del" onclick="delResume(' + obj[i].id +
 									')">删除</a></div></li></ul>'
 							}
 						}
 						$("#searchForm").html(html);
 						$("#positionNumber").html(j);
 						$("#positionNumber1").html(x);
 						$("#searchForm1").html(html1);


 					},
 					error: function(response) {
 						alert("失败");
 					}

 				});
 			}

			//构建主体信息
 			function disApply() {
 				var ht = '',
 					ht1 = '',
 					ht2 = '',
 					ht3 = '',
 					ht4 = '',
 					html2 = '';
 				var xx1 = 0,
 					xx2 = 0,
 					xx3 = 0,
 					xx4 = 0;
 				$.ajax({
 					type: "post",
 					data: {
 						"email": email
 					},
 					url: 'showAp',
 					dataType: 'json',
 					success: function(response) {
 						var obj = response.applyList;
 						var obj1 = response.showAllege;
 						var s = "";
 						for (var i = 0; i < obj.length; i++) {
							//待处理主体页面
 							if (obj[i].applyState == "0") {
 								xx1++;
 								s = "待查看";
 								ht1 +=
 									'<li data-id="" class="onlineResume"><div class="resumeShow"><a title="预览在线简历" target="_blank" class="resumeImg" href="preview?email=' +
 									obj[i].stuEmail +
 									'"><img src="style/images/default_headpic.png"></a><div class="resumeIntro"><h3 class="unread"><a target="_blank" title="预览简历" href=""></a><em></em></h3><span class="fr">报名时间：' +
 									obj[i].applyTime + '</span><div>' +
 									obj[i].name + '&nbsp;/&nbsp;' + obj[i].sex + '&nbsp;/&nbsp;' + obj[i].rank +
 									'&nbsp;/&nbsp;' + obj[i].height + '&nbsp;/&nbsp;' + obj[i].weight +
 									'<br>期望兼职·' +
 									obj[i].exJob + '&nbsp;&nbsp;|&nbsp;&nbsp;空闲时间：' + obj[i].freeTime +
 									'</div><div class="jdpublisher"><span>应聘职位：<a title="查看兼职信息" target="_blank" href="applyRe?id=' +
 									obj[i].applyId + '">' +
 									obj[i].jobName + '</a></span></div></div><div class="links">' +
 									'<a class="resume_del"  onclick="passApply(' + obj[i].id + ')">通过</a>' +
 									'<a class="resume_del"  onclick="unPassApply(' + obj[i].id +
 									')">不通过</a></div></div></li>'
 							} else if (obj[i].applyState == "1") {
								//已通过主体页面
 								xx2++;
 								s = "已通过";
 								ht2 +=
 									'<li data-id="1686182" class="onlineResume"><div class="resumeShow"><a title="预览在线简历" target="_blank" class="resumeImg" href="preview?email=' +
 									obj[i].stuEmail +
 									'"><img src="style/images/default_headpic.png"></a><div class="resumeIntro"><h3 class="unread"><a target="_blank" title="预览简历" href=""></a><em></em></h3><span class="fr">报名时间：' +
 									obj[i].applyTime + '</span><div>' +
 									obj[i].name + '&nbsp;/&nbsp;' + obj[i].sex + '&nbsp;/&nbsp;' + obj[i].rank +
 									'&nbsp;/&nbsp;' + obj[i].height + '&nbsp;/&nbsp;' + obj[i].weight +
 									'<br>期望兼职·' +
 									obj[i].exJob + '&nbsp;&nbsp;|&nbsp;&nbsp;空闲时间：' + obj[i].freeTime +
 									'</div><div class="jdpublisher"><span>应聘职位：<a title="查看兼职信息" target="_blank" href="applyRe?id=' +
 									obj[i].applyId + '">' +
 									obj[i].jobName + '</a></span></div></div><div class="links">' +
 									'<a class="resume_del" onclick="comApply(' + obj[i].id + ')">完成</a>' +
 									'<a class="resume_del" onclick="delApply(' + obj[i].id +
 									')">删除</a></div></div></li>'
 							} else if (obj[i].applyState == "2") {
								//未通过主体页面
 								xx3++;
 								s = "不合适";
 								ht3 +=
 									'<li data-id="1686182" class="onlineResume"><div class="resumeShow"><a title="预览在线简历" target="_blank" class="resumeImg" href="preview?email=' +
 									obj[i].stuEmail +
 									'"><img src="style/images/default_headpic.png"></a><div class="resumeIntro"><h3 class="unread"><a target="_blank" title="预览简历" href=""></a><em></em></h3><span class="fr">报名时间：' +
 									obj[i].applyTime + '</span><div>' +
 									obj[i].name + '&nbsp;/&nbsp;' + obj[i].sex + '&nbsp;/&nbsp;' + obj[i].rank +
 									'&nbsp;/&nbsp;' + obj[i].height + '&nbsp;/&nbsp;' + obj[i].weight +
 									'<br>期望兼职·' +
 									obj[i].exJob + '&nbsp;&nbsp;|&nbsp;&nbsp;空闲时间：' + obj[i].freeTime +
 									'</div><div class="jdpublisher"><span>应聘职位：<a title="查看兼职信息" target="_blank" href="applyRe?id=' +
 									obj[i].applyId + '">' +
 									obj[i].jobName + '</a></span></div></div><div class="links">' +
 									'<a class="resume_del" onclick="delApply(' + obj[i].id +
 									')">删除</a></div></div></li>'
 							} else if (obj[i].applyState == "4") {
								//已完成主体页面
 								var bbb = 0;
 								xx4++;
 								s = "已完成";
 								if (obj[i].stuGrade == null || obj[i].stuGrade.length <= 0) {
 									ht4 +=
 										'<li data-id="1686182" class="onlineResume"><div class="resumeShow"><a title="预览在线简历" target="_blank" class="resumeImg" href="preview?email=' +
 										obj[i].stuEmail +
 										'"><img src="style/images/default_headpic.png"></a><div class="resumeIntro"><h3 class="unread"><a target="_blank" title="预览简历" href=""></a><em></em></h3><span class="fr">报名时间：' +
 										obj[i].applyTime + '</span><div>' +
 										obj[i].name + '&nbsp;/&nbsp;' + obj[i].sex + '&nbsp;/&nbsp;' + obj[i].rank +
 										'&nbsp;/&nbsp;' + obj[i].height + '&nbsp;/&nbsp;' + obj[i].weight +
 										'<br>期望兼职·' + obj[i].exJob + '&nbsp;&nbsp;|&nbsp;&nbsp;空闲时间：' + obj[i]
 										.freeTime +
 										'</div><div class="jdpublisher"><span>应聘职位：<a title="查看兼职信息" target="_blank" href="applyRe?id=' +
 										obj[i].applyId + '">' + obj[i].jobName +
 										'</a></span></div></div><div class="links">' +
 										'<a class="resume_del" onclick="appraise(' + obj[i].id + ')">评价</a>'

 									for (var j = 0; j < obj1.length; j++) {
 										if (obj1[j].allId == obj[i].id) {
 											bbb = 1;
 										}
 									}

 									if (bbb == 1) {
 										bbb = 0;
 										ht4 += '<a class="resume_del">已申诉</a>' +
 											'<a class="resume_del" onclick="delApply(' + obj[i].id +
 											')">删除</a></div></div></li>'
 									} else {
 										ht4 += '<a class="resume_del" onclick="allege(' + obj[i].id + ',\'' + obj[i]
 											.stuEmail + '\')">申诉</a>' + '<a class="resume_del" onclick="delApply(' +
 											obj[i].id + ')">删除</a></div></div></li>'
 									}






 								} else {

 									ht4 +=
 										'<li data-id="1686182" class="onlineResume"><div class="resumeShow"><a title="预览在线简历" target="_blank" class="resumeImg" href="preview?email=' +
 										obj[i].stuEmail +
 										'"><img src="style/images/default_headpic.png"></a><div class="resumeIntro"><h3 class="unread"><a target="_blank" title="预览简历" href=""></a><em></em></h3><span class="fr">报名时间：' +
 										obj[i].applyTime + '</span><div>' +
 										obj[i].name + '&nbsp;/&nbsp;' + obj[i].sex + '&nbsp;/&nbsp;' + obj[i].rank +
 										'&nbsp;/&nbsp;' + obj[i].height + '&nbsp;/&nbsp;' + obj[i].weight +
 										'<br>期望兼职·' + obj[i].exJob + '&nbsp;&nbsp;|&nbsp;&nbsp;空闲时间：' + obj[i]
 										.freeTime +
 										'</div><div class="jdpublisher"><span>应聘职位：<a title="查看兼职信息" target="_blank" href="applyRe?id=' +
 										obj[i].applyId + '">' + obj[i].jobName +
 										'</a></span></div></div><div class="links">' +
 										'<a class="resume_del">已评价</a>'

 									for (var j = 0; j < obj1.length; j++) {
 										if (obj1[j].allId == obj[i].id) {
 											bbb = 1;
 										}
 									}

 									if (bbb == 1) {
 										bbb = 0;
 										ht4 += '<a class="resume_del">已申诉</a>' +
 											'<a class="resume_del" onclick="delApply(' + obj[i].id +
 											')">删除</a></div></div></li>'
 									} else {
 										ht4 += '<a class="resume_del" onclick="allege(' + obj[i].id + ',\'' + obj[i]
 											.stuEmail + '\')">申诉</a>' + '<a class="resume_del" onclick="delApply(' +
 											obj[i].id + ')">删除</a></div></div></li>'
 									}




 								}
 							}
 						}
 						$("#unMa").html(ht1); //待处理
 						$("#p").html(ht2); //通过
 						$("#uP").html(ht3);  //未通过
 						$("#complete1").html(ht4); //已完成
 						$("#dcl").html("（共" + xx1 + "份）");
 						$("#tg").html("（共" + xx2 + "份）");
 						$("#btg").html("（共" + xx3 + "份）");
 						$("#comNum").html("（共" + xx4 + "份）");

 						var allegeNumber = 0;
 						for (var i = 0; i < obj1.length; i++) {
 							allegeNumber++;
 							html2 += '<ul class="reset my_jobs"><li><h3><a style="text-decoration:none;">申述人：' +
 								obj1[i].email + '</a></h3><span>申述时间：' +
 								obj1[i].allTime + '</span><h3><a style="text-decoration:none;">申述对象：' + obj1[i]
 								.allEmail + '</a></h3><div>申述原因：' +
 								obj1[i].allReason + '</div><div>描述：' + obj1[i].allText +
 								'</div><div class="c9">处理结果：'

 							if (obj1[i].dealText == null || obj1[i].dealText == "") {
 								html2 += '暂未处理</div></li></ul>'
 							} else {
 								html2 += obj1[i].dealText + '</div><div><div style="margin-left:405px;">处理时间：' +
 									obj1[i].dealTime + '</div></div></li></ul>'
 							}

 						}
 						$("#allegeForm").html(html2);
 						$("#allegeNumber").html(allegeNumber);

 					}
 				});

 			}
			
			//下线兼职
 			function downResume(id) {
 				$.ajax({
 					type: "POST",
 					url: "downResume",
 					data: {
 						id: id,
 						email: email
 					},
 					dataType: "json",
 					success: function(result) {
 						if (result == true) {
 							disResume();
 							$("#valid").addClass("dn");
 							$("#createSu").removeClass("dn");
 							$("#createSu #showTip").html("恭喜你，下线成功！");
 						}
 					}
 				})
 			}
			
			//删除兼职
 			function delResume(id) {
 				$.ajax({
 					type: "POST",
 					url: "delResume",
 					data: {
 						id: id,
 						email: email
 					},
 					dataType: "json",
 					success: function(result) {
 						if (result == true) {
 							disResume();
 							$("#unvalid").addClass("dn");
 							$("#valid").addClass("dn");
 							$("#createSu").removeClass("dn");
 							$("#createSu #showTip").html("恭喜你，删除兼职成功！");
 						}
 					}
 				})
 			}

			//上线兼职
 			function upResume(id) {
 				$.ajax({
 					type: "POST",
 					url: "upResume",
 					data: {
 						id: id,
 						email: email
 					},
 					dataType: "json",
 					success: function(result) {
 						if (result == true) {
 							disResume();
 							$("#unvalid").addClass("dn");
 							$("#createSu").removeClass("dn");
 							$("#createSu #showTip").html("恭喜你，上线成功！");
 						}
 					}
 				})
 			}
			
			//申请通过
 			function passApply(id) {
 				$.ajax({
 					type: "POST",
 					url: "passApply",
 					data: {
 						id: id
 					},
 					dataType: "json",
 					success: function(result) {
 						if (result == true) {
 							disApply();
 							$("#unmanage").addClass("dn");
 							$("#createSu").removeClass("dn");
 							$("#createSu #showTip").html("恭喜你，操作成功！");
 						}
 					}
 				})
 			}

			//申请不通过
 			function unPassApply(id) {
 				$.ajax({
 					type: "POST",
 					url: "unPassApply",
 					data: {
 						id: id
 					},
 					dataType: "json",
 					success: function(result) {
 						if (result == true) {
 							disApply();
 							$("#unmanage").addClass("dn");
 							$("#createSu").removeClass("dn");
 							$("#createSu #showTip").html("恭喜你，操作成功！");
 						}
 					}
 				})
 			}

			//删除申请
 			function delApply(id) {
 				$.ajax({
 					type: "POST",
 					url: "delApply",
 					data: {
 						id: id
 					},
 					dataType: "json",
 					success: function(result) {
 						if (result == true) {
							//重新显示报名
 							disApply();
 							$("#allAllege").addClass("dn");
 							$("#complete").addClass("dn");
 							$("#createIndex").addClass("dn");
 							$("#create").addClass("dn");
 							$("#unpass").addClass("dn");
 							$("#valid").addClass("dn");
 							$("#unvalid").addClass("dn");
 							$("#unmanage").addClass("dn");
 							$("#pass").addClass("dn");
 							$("#createSu").removeClass("dn");
 							$("#createSu #showTip").html("恭喜你，操作成功！");
 						}
 					}
 				})
 			}

			//已完成申请
 			function comApply(id) {
 				$.ajax({
 					type: "POST",
 					url: "comApply",
 					data: {
 						id: id
 					},
 					dataType: "json",
 					success: function(result) {
 						if (result == true) {
 							disApply();
 							$("#pass").addClass("dn");
 							$("#createSu").removeClass("dn");
 							$("#createSu #showTip").html("恭喜你，操作成功！");
 						}
 					}
 				})
 			}

			//查看有效兼职 检测
 			function lookRe() {
 				$("#valid").removeClass("dn");
 				$("#pass").addClass("dn");
 				$("#unpass").addClass("dn");
 				$("#unmanage").addClass("dn");
 				$("#complete").addClass("dn");
 				$("#unvalid").addClass("dn");
 				$("#createIndex").addClass("dn");
 				$("#create").addClass("dn");
 				$("#createSu").addClass("dn");
 				$("#allAllege").addClass("dn");
 			}
			
			//我的申诉 检测
 			function myAllege() {
 				$("#allAllege").removeClass("dn");
 				$("#valid").addClass("dn");
 				$("#pass").addClass("dn");
 				$("#unpass").addClass("dn");
 				$("#unmanage").addClass("dn");
 				$("#complete").addClass("dn");
 				$("#unvalid").addClass("dn");
 				$("#createIndex").addClass("dn");
 				$("#create").addClass("dn");
 				$("#createSu").addClass("dn");
 			}
			
			//评价弹出显示
 			function appraise(id) {
 				$("#myModal").modal('show');
 				$("#pointV4").val(id);
 			}

			//申诉弹出显示
 			function allege(id, comEmail) {
 				$("#userModal").modal('show');
 				$("#myModal").modal('hide');
 				$("#pointId").val(id);
 				$("#pointEmail").val(comEmail);
 			}

			/* 修改兼职 */
 			function editResume(id) {
 				$("#valid").addClass("dn");
 				$("#unvalid").addClass("dn");
 				$("#create").removeClass("dn");
 				$("#create #editTip").html("<em></em>修改兼职");
 				$.ajax({
 					type: "POST",
 					url: "getResumeById",
 					data: {
 						id: id
 					},
 					dataType: "json",
 					success: function(response) {
 						$("#select_category").val(response.resume.jobType);
 						$("#positionType").val(response.resume.jobType);
 						$("#positionName").val(response.resume.jobName);
 						$("#department").val(response.resume.department);
 						$("#number").val(response.resume.number);
 						$("#deRequest").val(response.resume.deRequest);
 						$("#salary").val(response.resume.salary);
 						$("#time").val(response.resume.time);
 						$("#detail").val(response.resume.detail);
 						$("#kkk").hide();
 						$("#ggg").val("OK");
 						$("#positionType").attr("readOnly", "true");
 						$("#positionName").attr("readOnly", "true");
 					},
 					error: function() {
 						$("#create").addClass("dn");
 						$("#createSu").removeClass("dn");
 						$("#createSu #showTip").html("很遗憾，修改失败！");
 					}
 				})

 			}
 		</script>
 	</head>
 	<body>
		<!-- //页面主要内容 -->
 		<div id="body">
			<!-- //头部 -->
 			<div id="header">
 				<div class="wrapper">
 					<a class="logo" href="comIndex">
 						<img width="229" height="43" alt="毕过兼职网-发布兼职" src="style/images/logo.png">
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
 						<dt style="height:30px;line-height:30px;">
 							<span id="ex">${sessionScope.email}</span>
 							<span class="red dn" id="noticeDot-1"></span>
 							<i></i>
 						</dt>
 						<dd style="display: none;"><a href="resume">我发布的职位</a></dd>
 						<dd style="display: none;"><a href="resume">我收到的简历</a></dd>
 						<dd class="btm" style="display: none;"><a href="comIndex">我的公司主页</a></dd>
 						<dd style="display: none;"><a href="updatePwd">修改密码</a></dd>
 						<dd class="logout" style="display: none;"><a rel="nofollow" href="outLogin">退出</a></dd>
 					</dl>
 				</div>
 			</div>
			
			<!-- 主体 -->
 			<div id="container">
				
				<!-- 左菜单列表 -->
 				<div class="sidebar">
 					<a class="btn_create" onclick="create()">发布新兼职</a>
 					<dl class="company_center_aside" style="text-align:center;">
 						<dt>报名</dt>
 						<dd>
 							<a id="unman">待处理</a>
 						</dd>
 						<dd>
 							<a id="pa">已通过</a>
 						</dd>
 						<dd>
 							<a id="unpa">未通过</a>
 						</dd>
 						<dd>
 							<a id="comp">已完成</a>
 						</dd>
 					</dl>
 					<dl class="company_center_aside" style="text-align:center;">
 						<dt>兼职</dt>
 						<dd>
 							<a id="va" onclick="lookRe()">有效兼职</a>
 						</dd>
 						<dd>
 							<a id="unva">下线兼职</a>
 						</dd>
 					</dl>

 					<dl class="company_center_aside" style="text-align:center;">
 						<dt>申述</dt>
 						<dd><a onclick="myAllege()">我的申述</a></dd>
 					</dl>
 				</div><!-- end .sidebar -->

				<!-- 主体首页 -->
 				<div class="content" id="createIndex">
 					<dl class="company_center_content">
 						<dt>
 							<h1><em></em>兼职主页</h1>
 						</dt>
 						<dd>
 							<div class="publish_tip">
 								<h2>恭喜你，可以发布兼职了，你希望？</h2>
 								<a onclick="lookRe()">查看兼职</a><br><a class="greylink" onclick="create()">发布新兼职</a><br>
 								<a class="greylink" href="comIndex"> 进入我的公司主页</a><br>
 								<div style="float:left;" class="invite_share"></div>
 							</div>
 						</dd>
 					</dl>
 				</div>

				<!-- 发布成功后的提示 -->
 				<div class="content dn" id="createSu">
 					<dl class="company_center_content">
 						<dt>
 							<h1><em></em>提示</h1>
 						</dt>
 						<dd>
 							<div class="publish_tip">
 								<h2 id="showTip">恭喜你，兼职发布成功！</h2>
 								<a onclick="lookRe()">查看兼职</a><br><a class="greylink"
 									onclick="create()">继续发布新兼职</a><br>
 								<a class="greylink" href="comIndex"> 进入我的公司主页</a><br>
 								<div style="float:left;" class="invite_share"></div>
 							</div>
 						</dd>
 					</dl>
 				</div>


				<!-- 主体内容 待处理简历 -->
 				<div class="content dn" id="unmanage">
 					<dl class="company_center_content">
 						<dt>
 							<h1><em></em>待处理简历 <span id="dcl"></span></h1>
 						</dt>
 						<dd>
 							<form action="haveRefuseResumes.html" method="get" id="filterForm">
 								<ul class="reset resumeLists" id="unMa"></ul>
 							</form>
 						</dd>
 					</dl>
 				</div>

				<!-- 主体内容 通过简历 -->
 				<div class="content dn" id="pass">
 					<dl class="company_center_content">
 						<dt>
 							<h1><em></em>通过简历 <span id="tg"></span></h1>
 						</dt>
 						<dd>
 							<form action="haveRefuseResumes.html" method="get" id="filterForm">
 								<ul class="reset resumeLists" id="p"></ul>
 							</form>
 						</dd>
 					</dl>
 				</div>

				<!-- 主体内容 未通过简历 -->
 				<div class="content dn" id="unpass">
 					<dl class="company_center_content">
 						<dt>
 							<h1><em></em>未通过简历 <span id="btg"></span></h1>
 						</dt>
 						<dd>
 							<form action="haveRefuseResumes.html" method="get" id="filterForm">
 								<ul class="reset resumeLists" id="uP"></ul>
 							</form>
 						</dd>
 					</dl>
 				</div>

				<!-- 主体内容 已完成简历 -->
 				<div class="content dn" id="complete">
 					<dl class="company_center_content">
 						<dt>
 							<h1><em></em>已完成 <span id="comNum"></span></h1>
 						</dt>
 						<dd>
 							<form action="haveRefuseResumes.html" method="get" id="filterForm">
 								<ul class="reset resumeLists" id="complete1"></ul><!-- end .resumeLists -->
 							</form>
 						</dd>
 					</dl>
 				</div><!-- end .content -->

				<!-- 主体内容 有效职位 -->
 				<div class="content dn" id="valid">
 					<dl class="company_center_content">
 						<dt>
 							<h1><em></em>有效职位 <span>（共<i style="color:#fff;font-style:normal"
 										id="positionNumber"></i>个）</span></h1>
 						</dt>
 						<dd>
 							<form id="searchForm"></form>
 						</dd>
 					</dl>
 				</div><!-- end .content -->

				<!-- 主体内容 申诉 -->
 				<div class="content dn" id="allAllege">
 					<dl class="company_center_content">
 						<dt>
 							<h1><em></em>我的申述 <span>（共<i style="color:#fff;font-style:normal"
 										id="allegeNumber"></i>个）</span> </h1>
 						</dt>
 						<dd>
 							<form id="allegeForm"></form>
 						</dd>
 					</dl>
 				</div>

				<!-- 主体内容 下线兼职 -->
 				<div class="content dn" id="unvalid">
 					<dl class="company_center_content">
 						<dt>
 							<h1><em></em>已下线职位 <span>（共<i style="color:#fff;font-style:normal"
 										id="positionNumber1"></i>个）</span></h1>
 						</dt>
 						<dd>
 							<form id="searchForm1"></form>
 						</dd>
 					</dl>
 				</div><!-- end .content -->

				<!-- 兼职发布表单 -->
 				<div class="content dn" id="create">
 					<dl class="company_center_content">
 						<dt>
 							<h1 id="editTip">
 								<em></em>发布新兼职
 							</h1>
 						</dt>
 						<dd>
 							<div class="ccc_tr">今日已发布 <span>0</span>个职位还可发布 <span>5</span>个职位
 							</div>
 							<form id="jobForm">

 								<table class="btm">
 									<tbody>
 										<tr id="kkk">
 											<td width="25"><span class="redstar">*</span></td>
 											<td width="85">兼职类型</td>
 											<td>

 												<input type="button" value="请选择兼职类型" id="select_category"
 													class="selectr selectr_380" name="select_category">
												<input type="hidden" id="positionType" value="" name="positionType">
 												<div class="dn" id="box_job" style="display: none;">
 													<dl>
 														<dt>兼职类型</dt>
 														<dd>
 															<ul class="reset job_main">
 																<li>
 																	<span>热门兼职</span>
 																	<ul class="reset job_sub dn">
 																		<li>服务员</li>
 																		<li>促销导购</li>
 																		<li>打包分拣</li>
 																		<li>礼仪模特</li>
 																		<li>话务客服</li>
 																		<li>家教助教</li>
 																		<li>充场</li>
 																		<li>问卷调查</li>
 																	</ul>
 																</li>
 																<li>
 																	<span>演艺达人</span>
 																	<ul class="reset job_sub dn">
 																		<li>礼仪模特</li>
 																		<li>群众演员</li>
 																		<li>演出</li>
 																	</ul>
 																</li>
 																<li>
 																	<span>简单易做</span>
 																	<ul class="reset job_sub dn">
 																		<li>传单派发</li>
 																		<li>打包分拣</li>
 																		<li>充场</li>
 																		<li>问卷调查</li>
 																		<li>审核录入</li>
 																		<li>保洁</li>
 																		<li>地推拉访</li>
 																	</ul>
 																</li>
 																<li>
 																	<span>跑腿办事</span>
 																	<ul class="reset job_sub dn">
 																		<li>挂号排队</li>
 																		<li>送餐员</li>
 																		<li>宠物寄养</li>
 																		<li>车票代购</li>
 																	</ul>
 																</li>
 																<li>

 																	<span>室内推荐</span>
 																	<ul class="reset job_sub dn">
 																		<li>话务客服</li>
 																		<li>促销导购</li>
 																		<li>文员</li>
 																		<li>展会协助</li>
 																	</ul>
 																</li>
 																<li>
 																	<span>体力达人</span>
 																	<ul class="reset job_sub dn">
 																		<li>餐饮工</li>
 																		<li>服务员</li>
 																		<li>安保</li>
 																		<li>会展执行</li>
 																		<li>快递配送</li>
 																	</ul>
 																</li>
 																<li>
 																	<span>专业技能</span>
 																	<ul class="reset job_sub dn">
 																		<li>司机代驾</li>
 																		<li>技师技工</li>
 																		<li>美容美发</li>
 																		<li>月嫂阿姨</li>
 																		<li>销售房产</li>
 																		<li>经纪人</li>
 																		<li>保险</li>
 																		<li>在线老师</li>
 																	</ul>
 																</li>
 																<li>
 																	<span>特色职位</span>
 																	<ul class="reset job_sub dn">
 																		<li>校园代理</li>
 																		<li>家教助教</li>
 																		<li>健身教练</li>
 																		<li>翻译</li>
 																		<li>婚礼主持</li>
 																		<li>摄影摄像</li>
 																		<li>旅行导游</li>
 																		<li>美工设计</li>
 																		<li>创意策划</li>
 																		<li>财务会计</li>
 																		<li>项目外包</li>
 																		<li>软件开发</li>
 																	</ul>
 																</li>
 																<li>
 																	<span>优秀青年</span>
 																	<ul class="reset job_sub dn">
 																		<li>志愿者</li>
 																		<li>救生员</li>
 																		<li>实习生</li>
 																		<li>社会义工</li>
 																	</ul>
 																</li>
 															</ul>
 														</dd>
 													</dl>
 												</div>
 											</td>
 										</tr>
 										<tr>
 											<td><span class="redstar">*</span></td>
 											<td>兼职名称</td>
 											<td>
 												<input type="text" placeholder="请选择兼职名称" value="" name="positionName"
 													id="positionName"><span class="error" style="display:none;"
 													id="beError"></span>
 											</td>

 										</tr>
 										<tr>
 											<td><span class="redstar">*</span></td>
 											<td>兼职地点</td>
 											<td>
 												<input type="text" placeholder="请输入兼职地点" value="" name="department"
 													id="department">
 											</td>
 										</tr>
 										<tr>
 											<td><span class="redstar">*</span></td>
 											<td>招聘人数</td>
 											<td>
 												<input type="text" placeholder="请输入招聘人数" value="" name="number"
 													id="number">
 											</td>
 										</tr>
 										<tr>
 											<td><span class="redstar">*</span></td>
 											<td>兼职要求</td>
 											<td>
 												<input type="text" placeholder="请输入兼职要求" value="" name="deRequest"
 													id="deRequest">
 											</td>
 										</tr>
 										<tr>
 											<td><span class="redstar">*</span></td>
 											<td>兼职报酬</td>
 											<td>
 												<input type="text" placeholder="请输入报酬" value="" id="salary"
 													name="salary">
 											</td>
 										</tr>
 										<tr>
 											<td><span class="redstar">*</span></td>
 											<td>兼职时间</td>
 											<td>
 												<input type="text" placeholder="请输入时间" value="" id="time" name="time">
 											</td>
 										</tr>
 										<tr>
 											<td><span class="redstar">*</span></td>
 											<td>兼职描述</td>
 											<td>
 												<input type="text" placeholder="请输入兼职内容" value="" name="detail"
 													id="detail">
 											</td>
 										</tr>
 									</tbody>
 								</table>


 								</tbody>
 								</table>



 								<table>
 									<tbody>

 										<tr>
 											<td width="25"></td>
 											<td colspan="2">
 												<input type="submit" value="发布" id="jobPreview" class="btn_32">
 												<input type="text" id="ggg" style="display:none">
 												<input type="button" value="取消" id="formSubmit" class="btn_32"
 													name="button">
 											</td>
 										</tr>
 									</tbody>
 								</table>
 							</form>
 						</dd>
 					</dl>
 				</div><!-- end .content -->

				<!-- 评价学生 -->
 				<div>
 					<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
 						aria-hidden="true">
 						<div class="modal-dialog">
 							<div class="modal-content" style="color:#666">
 								<div class="modal-header">
 									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
 										&times;
 									</button>
 									<h4 class="modal-title" id="myModalLabel">
 										评价
 									</h4>
 								</div>
 								<div class="modal-body">
 									<div id="box">
 										<h4>我的评分</h4>
 										<div class="cont">
 											<div id="myPoint">
 												<span><big>5</big><small>.0</small></span>
 												<div>
 													<img src="style/js/statics/star5.gif" />
 													<em>(合格)</em>
 												</div>
 											</div>

 											<div id="doPoint">
 												<p>请点击以下星级进行评分：综合评分=(工作态度+工作效率+完成情况)/3</p>
 												<table cellspacing="0" cellpadding="0" border="0">
 													<tbody>
 														<tr>
 															<th>工作态度：</th>
 															<td><span class="star5" id="item1"
 																	v="5"><small>1</small><small>2</small><small>3</small><small>4</small><small>5</small><small>6</small><small>7</small><small>8</small><small>9</small><small>10</small></span>
 															</td>
 															<td><strong>5</strong> <em>(合格)</em></td>
 														</tr>
 														<tr>
 															<th>工作效率：</th>
 															<td><span class="star5" id="item2"
 																	v="5"><small>1</small><small>2</small><small>3</small><small>4</small><small>5</small><small>6</small><small>7</small><small>8</small><small>9</small><small>10</small></span>
 															</td>
 															<td><strong>5</strong> <em>(合格)</em></td>
 														</tr>
 														<tr>
 															<th>完成情况：</th>
 															<td><span class="star5" id="item3"
 																	v="5"><small>1</small><small>2</small><small>3</small><small>4</small><small>5</small><small>6</small><small>7</small><small>8</small><small>9</small><small>10</small></span>
 															</td>
 															<td><strong>5</strong> <em>(合格)</em></td>
 														</tr>
 													</tbody>
 												</table>
 											</div>
 											<form id="form1" name="form1">
 												<input id="pointV1" type="hidden" value="5" name="pointV1" />
 												<input id="pointV2" type="hidden" value="5" name="pointV2" />
 												<input id="pointV3" type="hidden" value="5" name="pointV3" />
 												<input id="pointV4" type="hidden" name="pointV4" />
 												<label>
 													<h3>评论内容:</h3>
 												</label>
 												<textarea name="pj" id="pj" rows="3" cols="20"></textarea>
 											</form>
 										</div>
 									</div>
 								</div>
 								<div class="modal-footer">
 									<button type="button" class="btn btn-default" data-dismiss="modal">关闭
 									</button>
 									<button type="button" class="btn btn-primary" onclick="grade()">
 										评价
 									</button>
 								</div>
 							</div>
 						</div>
 					</div>
				
				<!-- 申诉学生 -->
 					<div>
 						<div class="modal fade" id="userModal" tabindex="-1" role="dialog"
 							aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
 							<div class="modal-dialog">
 								<div class="modal-content" style="color:#666">
 									<div class="modal-header">
 										<h4 class="modal-title" id="userModalLabel">
 											申述
 										</h4>
 									</div>
 									<div class="modal-body">
 										<form class="form-horizontal" role="form">
 											<div class="form-group">
 												<label for="stuAllege" class="col-sm-2 control-label">申述原因</label>
 												<div>
 													<textarea class="form-control" rows="1" placeholder="请输入申述原因"
 														id="stuAllege" style="width:465px;font-size:15px"></textarea>
 													<span class="error" style="display:none;margin-left:100px;"
 														id="beError"></span>
 												</div>
 											</div>
 											<div class="form-group">
 												<label for="stuAllegeText" class="col-sm-2 control-label">描述</label>
 												<div>
 													<textarea class="form-control" rows="3" placeholder="请输入详细描述"
 														id="stuAllegeText"
 														style="width:465px;font-size:15px"></textarea>
 													<span class="error" style="display:none;margin-left:100px;"
 														id="beError1"></span>
 												</div>
 											</div>
 											<input id="pointId" type="hidden" name="pointId" />
 											<input id="pointEmail" type="hidden" name="pointEmail" />
 										</form>
 									</div>
 									<div class="modal-footer">
 										<button type="button" class="btn btn-default" data-dismiss="modal">关闭
 										</button>
 										<button type="button" class="btn btn-primary" onclick="stuAllege()">
 											申述
 										</button>
 									</div>
 								</div><!-- /.modal-content -->
 							</div><!-- /.modal -->
 						</div>
 					</div>
					
					<!-- 评价、申诉实现 -->
 					<script>
 						function grade() {
 							var tot = parseInt($("#pointV1").val()) + parseInt($("#pointV2").val()) + parseInt($("#pointV3").val());
 							tot = (tot / 3).toFixed(1);
 							$.post("appraiseStu", {
 								id: $("#pointV4").val(),
 								stuGrade: tot.toString(),
 								stuText: $("#pj").val()
 							}, function(response) {
 								if (response.tip = true) {
 									alert("评价成功");
 									$("#myModal").modal('hide');
 									disApply();
 								} else {
 									alert("评价失败");
 									$("#myModal").modal('hide');
 									disApply();
 								}
 							});

 						}

 						function stuAllege() {
 							if ($("#stuAllege").val() == null || $("#stuAllege").val().length <= 0) {
 								$("#beError").show();
 								$("#beError").html("请输入申述原因");
 							} else if ($("#stuAllegeText").val() == null || $("#stuAllegeText").val().length <= 0) {
 								$("#beError").hide();
 								$("#beError1").show();
 								$("#beError1").html("请输入描述");
 							} else {
 								$("#beError1").hide();
 								$.post("comAllege", {
 										allId: $("#pointId").val(),
 										email: email,
 										allEmail: $("#pointEmail").val(),
 										allReason: $("#stuAllege").val(),
 										allText: $("#stuAllegeText").val()
 									},
 									function(response) {
 										if (response == true) {
 											alert("成功");
 											$("#userModal").modal('hide');
 											$("#stuAllege").val("");
 											$("#stuAllegeText").val("");
 											disApply();
 										}
 									})
 							}
 						}
 					</script>
 					<script src="style/js/jquery.tinymce.js" type="text/javascript"></script>
 					<script src="style/js/job8.min.js" type="text/javascript"></script>
					<script src="style/js/core.min.js" type="text/javascript"></script>
					<script src="style/js/popup.min.js" type="text/javascript"></script>
 				</div>
			</div>
		</div>
 	</body>
 </html>
