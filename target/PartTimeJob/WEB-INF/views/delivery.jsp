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
		<title>毕过兼职网-报名状态</title>
		<meta name="description" content="毕过兼职网-报名">
		<meta name="keywords" content="毕过兼职网-报名">

		<link media="screen" href="style/js/statics/grade1.css" type="text/css" rel="stylesheet" />
		<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
		<link href="style/css/style.css" type="text/css" rel="stylesheet">
		<link href="style/css/external.min.css" type="text/css" rel="stylesheet">
		<link href="style/css/popup.css" type="text/css" rel="stylesheet">
		
		<script type="text/javascript" src="style/js/jquery.1.10.1.min.js"></script>
		<script src="style/js/jquery.lib.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="style/js/ajaxfileupload.js"></script>
		<script src="style/js/additional-methods.js" type="text/javascript"></script>
		<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script src="style/js/statics/grade2.js" type="text/javascript"></script>
		<script type="text/javascript" src="style/js/excanvas.js"></script>

		<script type="text/javascript">
			var email = "${sessionScope.email}";
			var type = "${sessionScope.type}";
			$(document).ready(function() {
				if (email != null && email != "") {} else {
					$("#ex").html("未登录");
					window.location.href = 'login';
				}

				if (type != "student") {
					window.location.href = 'index';
				}
				
				//请求报名信息
				disApply();

				//申诉 选择
				$("#loAll").click(function() {
					$("#cAll").addClass('current');
					$("#cPass").removeClass('current');
					$("#cUnPass").removeClass('current');
					$("#cLook").removeClass('current');
					$("#com").removeClass('current');
					$("#allRe").removeClass('dn');
					$("#pass").addClass('dn');
					$("#unPass").addClass('dn');
					$("#comp").addClass('dn');
					$("#look").addClass('dn');
				});

				//未查看 选择
				$("#loLook").click(function() {
					$("#cAll").removeClass('current');
					$("#cPass").removeClass('current');
					$("#cUnPass").removeClass('current');
					$("#cLook").addClass('current');
					$("#com").removeClass('current');
					$("#allRe").addClass('dn');
					$("#comp").addClass('dn');
					$("#pass").addClass('dn');
					$("#unPass").addClass('dn');
					$("#look").removeClass('dn');
				});

				//未通过 选择
				$("#loPass").click(function() {
					$("#cAll").removeClass('current');
					$("#cLook").removeClass('current');
					$("#cPass").addClass('current');
					$("#cUnPass").removeClass('current');
					$("#com").removeClass('current');
					$("#allRe").addClass('dn');
					$("#pass").removeClass('dn');
					$("#comp").addClass('dn');
					$("#unPass").addClass('dn');
					$("#look").addClass('dn');
				});

				//不合适 选择
				$("#loUnPass").click(function() {
					$("#cAll").removeClass('current');
					$("#cLook").removeClass('current');
					$("#cPass").removeClass('current');
					$("#cUnPass").addClass('current');
					$("#com").removeClass('current');
					$("#allRe").addClass('dn');
					$("#pass").addClass('dn');
					$("#comp").addClass('dn');
					$("#unPass").removeClass('dn');
					$("#look").addClass('dn');
				});

				//已完成 选择
				$("#complete").click(function() {
					$("#cAll").removeClass('current');
					$("#cLook").removeClass('current');
					$("#cPass").removeClass('current');
					$("#cUnPass").removeClass('current');
					$("#com").addClass('current');
					$("#allRe").addClass('dn');
					$("#pass").addClass('dn');
					$("#unPass").addClass('dn');
					$("#comp").removeClass('dn');
					$("#look").addClass('dn');
				});

			});

			//请求报名记录
			function disApply() {
				var htm = '',
					htm1 = '',
					htm2 = '',
					htm3 = '',
					htm4 = '';
				var number1 = 0,
					number2 = 0,
					number3 = 0,
					number4 = 0;
				$.ajax({
					type: "post",
					data: {
						"email": email
					},
					url: 'showRecord', /*请求报名记录*/
					dataType: 'json',
					success: function(response) {
						var obj = response.recordList;  //报名表
						var obj1 = response.allegeList; //申诉表
						var s = "";
						for (var i = 0; i < obj.length; i++) {
							if (obj[i].stuState == "0") {
								number1++;
								s = "待查看";
								htm1 += '<li><div class="d_item"><h2><a href="applyRe?id=' + obj[i].applyId +
									'" target="_blank""><em>' +
									obj[i].jobName + '</em> <span>' + obj[i].salary +
									'</span></a></h2><div class="clear"></div><a class="d_jobname">地点：' +
									obj[i].department + '<span>&nbsp;&nbsp;&nbsp;&nbsp;人数：' + obj[i].number +
									'</span></a><span class="d_time">' +
									obj[i].applyTime +
									'</span><div class="clear"></div><div class="d_resume">使用简历：<span>' + obj[i]
									.name + '的简历</span></div><a class="btn_showprogress" href="javascript:;">' +
									s + '</a></div></li>'
							} else if (obj[i].stuState == "1") {
								number2++;
								s = "已通过";
								htm2 += '<li><div class="d_item"><h2><a href="applyRe?id=' + obj[i].applyId +
									'" target="_blank""><em>' +
									obj[i].jobName + '</em> <span>' + obj[i].salary +
									'</span></a></h2><div class="clear"></div><a class="d_jobname">地点：' +
									obj[i].department + ' <span>&nbsp;&nbsp;&nbsp;&nbsp;人数：' + obj[i].number +
									'</span></a><span class="d_time">' +
									obj[i].applyTime +
									'</span><div class="clear"></div><div class="d_resume">使用简历：<span>' + obj[i]
									.name + '的简历</span></div><a class="btn_showprogress" href="javascript:;">' +
									s + '</a><a class="btn_showprogress" onclick="stuDel(' + obj[i].id +
									')">删除</a></div></li>'
							} else if (obj[i].stuState == "2") {
								number3++;
								s = "不合适";
								htm3 += '<li><div class="d_item"><h2><a href="applyRe?id=' + obj[i].applyId +
									'" target="_blank""><em>' +
									obj[i].jobName + '</em> <span>' + obj[i].salary +
									'</span></a></h2><div class="clear"></div><a class="d_jobname" >地点：' +
									obj[i].department + '<span>&nbsp;&nbsp;&nbsp;&nbsp;人数：' + obj[i].number +
									'</span></a><span class="d_time">' +
									obj[i].applyTime +
									'</span><div class="clear"></div><div class="d_resume">使用简历：<span>' + obj[i]
									.name + '的简历</span></div>' +
									'<a class="btn_showprogress" onclick="stuDel(' + obj[i].id +
									')">删除</a></div></li>'
							} else if (obj[i].stuState == "4") {
								var aaa = 0;
								number4++;
								s = "已完成";
								if (obj[i].comGrade == null || obj[i].comGrade.length <= 0) {
									htm4 += '<li><div class="d_item"><h2><a href="applyRe?id=' + obj[i].applyId +
										'" target="_blank""><em>' +
										obj[i].jobName + '</em> <span>' + obj[i].salary +
										'</span></a></h2><div class="clear"></div><a class="d_jobname" >地点：' +
										obj[i].department + '<span>&nbsp;&nbsp;&nbsp;&nbsp;人数：' + obj[i].number +
										'</span></a><span class="d_time">' +
										obj[i].applyTime +
										'</span><div class="clear"></div><div class="d_resume">使用简历：<span>' + obj[i]
										.name + '的简历</span></div><a class="btn_showprogress" onclick="appraise(' +
										obj[i].id + ')">' +
										'评价</a>';

									for (var j = 0; j < obj1.length; j++) {
										if (obj1[j].allId == obj[i].id) { //申诉表的id = 报名报的id,取出
											aaa = 1;
										}
									}

									if (aaa == 1) {
										aaa = 0;
										htm4 +=
											'<a class="btn_showprogress">已申诉</a><a class="btn_showprogress" onclick="stuDel(' +
											obj[i].id + ')">删除</a></div></li>'
									} else {
										htm4 += '<a class="btn_showprogress" id="' + obj[i].id +
											'" onclick="allege(' + obj[i].id + ',\'' + obj[i].comEmail +
											'\')">申诉</a><a class="btn_showprogress" onclick="stuDel(' + obj[i].id +
											')">删除</a></div></li>'
									}

								} else {
									htm4 += '<li><div class="d_item"><h2><a href="applyRe?id=' + obj[i].applyId +
										'" target="_blank""><em>' +
										obj[i].jobName + '</em> <span>' + obj[i].salary +
										'</span></a></h2><div class="clear"></div><a class="d_jobname" >地点：' +
										obj[i].department + '<span>&nbsp;&nbsp;&nbsp;&nbsp;人数：' + obj[i].number +
										'</span></a><span class="d_time">' +
										obj[i].applyTime +
										'</span><div class="clear"></div><div class="d_resume">使用简历：<span>' + obj[i]
										.name + '的简历</span></div><a class="btn_showprogress">' +
										'已评价</a>'

									for (var j = 0; j < obj1.length; j++) {
										if (obj1[j].allId == obj[i].id) { //申诉表的id = 报名报的id,取出
											aaa = 1;
										}
									}

									if (aaa == 1) {
										aaa = 0;
										htm4 +=
											'<a class="btn_showprogress">已申诉</a><a class="btn_showprogress" onclick="stuDel(' +
											obj[i].id + ')">删除</a></div></li>'
									} else {
										htm4 += '<a class="btn_showprogress" id="' + obj[i].id +
											'" onclick="allege(' + obj[i].id + ',\'' + obj[i].comEmail +
											'\')">申诉</a><a class="btn_showprogress" onclick="stuDel(' + obj[i].id +
											')">删除</a></div></li>'
									}
								}

							}

						}
						$("#tot1").html(number1); /*未查看 数量*/
						$("#tot2").html(number2); /*已通过 数量*/
						$("#tot3").html(number3); /*不合适 数量*/
						$("#tot4").html(number4); /*已完成 数量*/
						$("#look").html(htm1); /*未查看 主体添加*/
						$("#pass").html(htm2);
						$("#unPass").html(htm3);
						$("#comp").html(htm4);

						//申诉主体
						var allegeNumber = 0;
						for (var i = 0; i < obj1.length; i++) {
							allegeNumber++;
							htm += '<li><div class="d_item"><h2> <span>申诉人：' +
								obj1[i].email + '</span><br/><br/><span>申诉对象：' +
								obj1[i].allEmail + '</span></h2><span style="float:right;">申诉时间：' +
								obj1[i].allTime + '</span><div class="clear"></div><div>原因：' +
								obj1[i].allReason + '</div><div>描述：' +
								obj1[i].allText + '</div><div class="clear"></div><div class="d_resume">处理结果：'

							if (obj1[i].dealText == null || obj1[i].dealText == "") {
								htm += '<span>暂未处理</span></div></div></li>'
							} else {
								htm += '<span>' + obj1[i].dealText +
									'</span></div><span style="float:right;">处理时间：' +
									obj1[i].dealTime + '</span></div></li>'
							}
						}
						$("#allRe").html(htm);
						$("#tot5").html(allegeNumber);

					}
				});
			}

			//评价弹出显示
			function appraise(id) {
				$("#myModal").modal('show');
				$("#userModal").modal('hide');
				$("#pointV4").val(id);
			}

			//申诉弹出显示
			function allege(id, comEmail) {
				$("#userModal").modal('show');
				$("#myModal").modal('hide');
				$("#pointId").val(id);
				$("#pointEmail").val(comEmail);
			}

			//评价请求
			function grade() {
				var tot = parseInt($("#pointV1").val()) + parseInt($("#pointV2").val()) + parseInt($("#pointV3").val());
				tot = (tot / 3).toFixed(1); //防止精度丢失，四舍五入取平均分
				$.post("appraiseCom", {
					id: $("#pointV4").val(),
					comGrade: tot.toString(),
					comText: $("#pj").val()
				}, function(response) {
					if (response.tip = true) {
						alert("评价成功");
						$("#myModal").modal('hide');
						disApply();
						$("#cAll").removeClass('current');
						$("#com").addClass('current');
						$("#allRe").addClass('dn');
						$("#comp").removeClass('dn');
					} else {
						alert("评价失败");
						$("#myModal").modal('hide');
						disApply();
						$("#cAll").removeClass('current');
						$("#com").addClass('current');
						$("#allRe").addClass('dn');
						$("#comp").removeClass('dn');
					}
				});
			}

			//删除兼职信息
			function stuDel(id) {
				$.ajax({
					type: "POST",
					url: "stuDel",
					data: {
						id: id
					},
					dataType: "json",
					success: function(result) {
						if (result == true) {
							disApply();
							$("#cAll").addClass('current');
							$("#cLook").removeClass('current');
							$("#cPass").removeClass('current');
							$("#cUnPass").removeClass('current');
							$("#com").removeClass('current');
							$("#allRe").removeClass('dn');
							$("#pass").addClass('dn');
							$("#unPass").addClass('dn');
							$("#comp").addClass('dn');
							$("#look").addClass('dn');
							alert("删除成功");
						}
					}
				})
			}
		</script>
		<script src="style/js/conv.js" type="text/javascript"></script>

	</head>
	<body>
		<div id="body">
			<div id="header">
				<div class="wrapper">
					<a class="logo" href="index">
						<img width="229" height="43" alt="毕过兼职网-报名" src="style/images/logo.png">
					</a>
					<ul id="navheader" class="reset">
						<li><a href="index">找工作</a></li>
						<li><a rel="nofollow" href="stuResume">我的信息</a></li>
						<li><a target="_blank" href="preview?email=${sessionScope.email}">预览简历</a></li>
					</ul>
					<dl class="collapsible_menu">
						<dt style="height:30px;line-height:30px;">
							<span id="ex">${sessionScope.email}</span>
							<span class="red dn" id="noticeDot-0"></span>
							<i></i>
						</dt>
						<dd style="display: none;"><a rel="nofollow" href="stuResume">修改简历</a></dd>
						<dd style="display: none;"><a href="delivery">我投递的兼职 <span id="noticeNo"
									class="red dn">(0)</span></a></dd>
						<dd class="btm" style="display: none;"><a target="_blank"
								href="preview?email=${sessionScope.email}">预览简历</a></dd>
						<dd style="display: none;"><a href="index">职位</a></dd>
						<dd style="display: none;"><a href="updatePwd">密码修改</a></dd>
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

			<%--主体内容--%>
			<div id="container">

				<div class="clearfix">
					<%--左菜单--%>
					<div class="content_l">
						<dl class="c_delivery">
							<dt>
								<h1><em></em>已投递简历状态</h1>
								<a class="d_refresh" href="javascript:">刷新</a>
							</dt>
							<dd>
								<div class="delivery_tabs">
									<ul class="reset">
										<li id="cLook">
											<a id="loLook">未查看(<span id="tot1"></span>)</a>
										</li>
										<li id="cPass">
											<a id="loPass">已通过(<span id="tot2"></span>)</a>
										</li>
										<li id="cUnPass">
											<a id="loUnPass">不合适(<span id="tot3"></span>)</a>
										</li>
										<li id="com">
											<a id="complete">已完成(<span id="tot4"></span>)</a>
										</li>
										<li class="current" id="cAll">
											<a id="loAll">申述(<span id="tot5"></span>)</a>
										</li>
									</ul>
								</div>
								<form id="deliveryForm">
									<ul class="reset my_delivery" id="allRe"></ul>
									<ul class="reset my_delivery dn" id="look"></ul>
									<ul class="reset my_delivery dn" id="pass"></ul>
									<ul class="reset my_delivery dn" id="unPass"></ul>
									<ul class="reset my_delivery dn" id="comp"></ul>
								</form>
							</dd>
						</dl>
					</div>
					<%--右菜单--%>
					<div class="content_r">
						<div class="mycenterR" id="myInfo">
							<h2>我的信息</h2>
							<a href="stuResume">我收藏的职位</a>
							<br>
							<a href="#">我投递的职位<span id="noticeNoPage" class="red dn">&nbsp;(0)</span></a>
							<br>

						</div>
						<!--end #myInfo-->

					</div>
				</div>

				<%--学生评价公司--%>
				<div>
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
						aria-hidden="true" style="display: none;">
						<div class="modal-dialog">
							<div class="modal-content" style="color:#666">
								<div class="modal-header">

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
												<p>请点击以下星级进行评分：综合评分=(描述属实+酬劳发放+工作环境)/3</p>
												<table cellspacing="0" cellpadding="0" border="0">
													<tbody>
														<tr>
															<th>描述属实：</th>
															<td><span class="star5" id="item1"
																	v="5"><small>1</small><small>2</small><small>3</small><small>4</small><small>5</small><small>6</small><small>7</small><small>8</small><small>9</small><small>10</small></span>
															</td>
															<td><strong>5</strong> <em>(合格)</em></td>
														</tr>
														<tr>
															<th>酬劳发放：</th>
															<td><span class="star5" id="item2"
																	v="5"><small>1</small><small>2</small><small>3</small><small>4</small><small>5</small><small>6</small><small>7</small><small>8</small><small>9</small><small>10</small></span>
															</td>
															<td><strong>5</strong> <em>(合格)</em></td>
														</tr>
														<tr>
															<th>工作环境：</th>
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
							</div><!-- /.modal-content -->
						</div><!-- /.modal -->
					</div>

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
						<script src="style/js/delivery.js"></script>
						<script>
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
									$.post("stuAllege", {
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

							//分页
							$(function() {
								$('.Pagination').pager({
									currPage: 1,
									pageNOName: "pageNo",
									form: "deliveryForm",
									pageCount: 1,
									pageSize: 5
								});
							});
						</script>
						<div class="clear"></div>
						<input type="hidden" value="" id="resubmitToken">
						<a rel="nofollow" title="回到顶部" id="backtop" style="display: none;"></a>
					</div><!-- end #container -->
				</div><!-- end #body -->


				<script src="style/js/core.min.js" type="text/javascript"></script>
				<script src="style/js/popup.min.js" type="text/javascript"></script>
	</body>
</html>
