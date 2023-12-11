<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page errorPage="showError.jsp" %>
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
		<title>毕过兼职网</title>
		<meta content="毕过兼职网-首页" name="description">
		<meta content="毕过兼职网-首页" name="keywords">
		<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
		<link rel="Shortcut Icon" href="images/favicon.ico">
		<link rel="stylesheet" type="text/css" href="style/css/style.css" />
		<link rel="stylesheet" type="text/css" href="style/css/external.min.css" />
		<link rel="stylesheet" type="text/css" href="style/css/popup.css" />
		<script src="style/js/jquery.1.10.1.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="style/js/jquery.lib.min.js"></script>
		<script src="style/js/ajaxfileupload.js" type="text/javascript"></script>
		<script type="text/javascript" src="style/js/additional-methods.js"></script><%--验证方法--%>
		<script type="text/javascript" src="style/js/excanvas.js"></script><%--动画库的使用--%>
		<script type="text/javascript" src="style/js/conv.js"></script>
		<style type="text/css">
			.con {
				display: inline-block;
				vertical-align: middle;
				width: 200px;
				white-space: nowrap;
				overflow: hidden;
				text-overflow: ellipsis;
			}
		</style>

		<script type="text/javascript">
			var email = "${sessionScope.email}";
			var type = "${sessionScope.type}";
			$(document).ready(function() {
				/* 请求所有兼职信息 */
				$.ajax({
					type: "post",
					url: "allResume",
					data: {},
					dataType: "json",
					success: function(response) {
						obj = response.list;
						var html = "";
						/*构建兼职列表*/
						for (var i = 0; i < obj.length; i++) {
							html += '<li class="odd clearfix" style="width:750px;margin-top:8px;">' +
								'<div class="hot_pos_l" ><div class="mb10">' +
								'<a href="applyRe?id=' +
								obj[i].id + '" target="_blank" style="text-decoration:blink ">' +
								obj[i].jobName +
								'</a></div><div style="float:left;"><span><em class="c7">兼职类型： </em>' +
								obj[i].jobName + '</span> <br /><span><em class="c7">人数：</em>' +
								obj[i].number +
								'</span></div><div style="float:left;"><span class="con"><em class="c7">时间：</em>' +
								obj[i].time + '</span><br /><span class="con"><em class="c7">地点：</em>' +
								obj[i].department +
								'</span></div></div><div class="hot_pos_r" style="width:350px;"><div class="apply" style="margin-top:25px;"><a href="applyRe?id=' +
								obj[i].id +
								'" target="_blank"  style="width:120px;height:40px;text-align:center;line-height:40px;">报名参加</a></div><div class="mb10" style="margin-top:35px;margin-left:30px;"><span><em class="c7">报酬： </em>' +
								obj[i].salary + '</span></div></div></li>'
						}
						$("#allRe").html(html);

					}
				});

				//搜索
				$("dl dd a,#search_button").click(function() {
					var key = $(this).text();
					if (key.length == 0) {
						key = $("#search_input").val();
					}
					$.ajax({
						type: "post",
						url: "findResumeByName",
						data: {
							jobName: key
						},
						dataType: "json",
						success: function(response) {
							obj = response.list;
							var html = "";
							for (var i = 0; i < obj.length; i++) {
								html +=
									'<li class="odd clearfix" style="width:750px;margin-top:8px;"><div class="hot_pos_l" ><div class="mb10"><a href="applyRe?id=' +
									obj[i].id + '" target="_blank" style="text-decoration:blink ">' +
									obj[i].jobName +
									'</a></div><div style="float:left;"><span><em class="c7">兼职类型： </em>' +
									obj[i].jobName + '</span> <br /><span><em class="c7">人数：</em>' +
									obj[i].number +
									'</span></div><div style="float:left;"><span class="con"><em class="c7">时间：</em>' +
									obj[i].time +
									'</span><br /><span class="con"><em class="c7">地点：</em>' +
									obj[i].department +
									'</span></div></div><div class="hot_pos_r" style="width:350px;"><div class="apply" style="margin-top:25px;"><a href="applyRe?id=' +
									obj[i].id +
									'" target="_blank" style="width:120px;height:40px;text-align:center;line-height:40px;">报名参加</a></div><div class="mb10" style="margin-top:35px;margin-left:30px;"><span><em class="c7">报酬： </em>' +
									obj[i].salary + '</span></div></div></li>'
							}
							$("#allRe").html(html);
						}
					})
				});
			});
		</script>
	</head>
	<body>
		<div id="body">
			<div id="header">
				<div class="wrapper">
					<a href="index" class="logo">
						<img src="style/images/logo.png" width="229" height="43" alt="毕过兼职网" />
					</a>
					<ul class="reset" id="navheader">
						<li class="current"><a href="index">首页</a></li>
						<% if(session.getAttribute("type")!=null) { %>
						<%if(session.getAttribute("type").equals("company")){%>
						<li><a href="create" rel="nofollow">兼职招聘</a></li>
                        <li><a href="comIndex" rel="nofollow">公司主页</a></li>
						<%} else if(session.getAttribute("type").equals("student")){%>
						<li><a href="delivery" rel="nofollow">我的投递信息</a></li>
						<li><a href="stuResume" rel="nofollow">我的基本信息</a></li>
						<%} else if(session.getAttribute("type").equals("noCom")){%>
						<li><a href="company" rel="nofollow">完善公司信息</a></li>
                        <%} else if(session.getAttribute("type").equals("admin")){%>
                        <li><a href="maSystem" rel="nofollow">后台管理</a></li>
                        <li><a href="outLogin" rel="nofollow">退出</a></li>
						<%} } else{%>
                        <li><a href="login" rel="nofollow">登录</a></li>
                        <li><a href="register" rel="nofollow">注册</a></li>
						<%}%>
	    	</ul>
        </div>
    </div><!-- end #header -->
    <div id="container">

		<div id="sidebar">
			<div class="mainNavs" id="kk">

					<div class="menu_box">
						<div class="menu_main">
							<h2>热门兼职 <span></span></h2>
			            </div>
					   	<div class="menu_sub dn">
                            <dl class="reset">
                                <dt><a href="#">热门兼职</a></dt>
                                <dd><a href="#">服务员</a>
                                    <a href="#">游戏代打</a>
                                    <a href="#">传单派发</a>
                                    <a href="#">礼仪模特</a>
                                    <a href="#">客服</a>
                                    <a href="#">家教</a>
                                    <a href="#">问卷调查</a>
                                </dd>
                            </dl>
                        </div>
                    </div>
                   <div class="menu_box">
                   						<div class="menu_main">
                   							<h2>简单易做<span></span></h2>
                   			            </div>
                   					   	<div class="menu_sub dn">
                                               <dl class="reset">
                                                   <dt><a href="#">简单易做</a></dt>
                                                   <dd><a href="#">传单派发</a>
                                                       <a href="#">打包分拣</a>
                                                       <a href="#">问卷调查</a>
                                                       <a href="#">审核录入</a>
                                                       <a href="#">保洁</a>
                                                   </dd>
                                               </dl>
                                           </div>
                                       </div>

                   <div class="menu_box">
                   						<div class="menu_main">
                   							<h2>跑腿办事<span></span></h2>
                   			            </div>
                   					   	<div class="menu_sub dn">
                                               <dl class="reset">
                                                   <dt><a href="#">跑腿办事</a></dt>
                                                   <dd><a href="#">挂号排队</a>
                                                       <a href="#">送餐员</a>
                                                       <a href="#">宠物寄养</a>
                                                       <a href="#">车票代购</a>
                                                   </dd>
                                               </dl>
                                           </div>
                                       </div>

                   <div class="menu_box">
                   						<div class="menu_main">
                   							<h2>室内推荐<span></span></h2>
                   			            </div>
                   					   	<div class="menu_sub dn">
                                               <dl class="reset">
                                                   <dt><a href="#">室内推荐</a></dt>
                                                   <dd><a href="#">客服</a>
                                                       <a href="#">促销导购</a>
                                                       <a href="#">文员</a>
                                                       <a href="#">展会协助</a>
                                                   </dd>
                                               </dl>
                                           </div>
                                       </div>



                    <div class="menu_box">
                    						<div class="menu_main">
                    							<h2>体力达人<span></span></h2>
                    			            </div>
                    					   	<div class="menu_sub dn">
                                                <dl class="reset">
                                                    <dt><a href="#">体力达人</a></dt>
                                                    <dd><a href="#">餐饮工</a>
                                                        <a href="#">服务员</a>
                                                        <a href="#">安保</a>
                                                        <a href="#">外卖带领</a>
                                                        <a href="#">快递配送</a>
                                                    </dd>
                                                </dl>
                                            </div>
                                        </div>



                    <div class="menu_box">
                    						<div class="menu_main">
                    							<h2>专业技能<span></span></h2>
                    			            </div>
                    					   	<div class="menu_sub dn">
                                                <dl class="reset">
                                                    <dt><a href="#">专业技能</a></dt>
                                                    <dd><a href="#">司机代驾</a>
                                                        <a href="#">美容美发</a>
                                                        <a href="#">保险</a>
                                                        <a href="#">在线老师</a>
                                                    </dd>
                                                </dl>
                                            </div>
                                        </div>





                    <div class="menu_box">
                    						<div class="menu_main">
                    							<h2>特色职位<span></span></h2>
                    			            </div>
                    					   	<div class="menu_sub dn">
                                                <dl class="reset">

                                                    <dt><a href="#">特色职位</a></dt>
                                                    <dd><a href="#">校园代理</a>
                                                        <a href="#">家教助教</a>
                                                        <a href="#">健身教练</a>
                                                        <a href="#">翻译</a>
                                                        <a href="#">婚礼主持</a>
                                                        <a href="#">摄影摄像</a>
                                                        <a href="#">旅行导游</a>
                                                        <a href="#">美工设计</a>
                                                        <a href="#">创意策划</a>
                                                        <a href="#">财务会计</a>
                                                        <a href="#">项目外包</a>
                                                        <a href="#">软件开发</a>
                                                    </dd>
                                                </dl>
                                            </div>
                                        </div>


                    <div class="menu_box">
                    						<div class="menu_main">
                    							<h2>优秀青年<span></span></h2>
                    			            </div>
                    					   	<div class="menu_sub dn">
                                                <dl class="reset">
                                                    <dt><a href="#">优秀青年</a></dt>
                                                    <dd><a href="#">志愿者</a>
                                                        <a href="#">实习生</a>
                                                        <a href="#">社会义工</a>
                                                    </dd>
                                                </dl>
                                            </div>
                                        </div>


                    <div class="menu_box">
                    						<div class="menu_main">
                    							<h2>其他<span></span></h2>
                    			            </div>
                    					   	<div class="menu_sub dn">
                                                <dl class="reset">
                                                    <dt><a href="#">其他</a></dt>
                                                    <dd><a href="#">临时工</a>
                                                        <a href="#">其他</a>
                                                    </dd>
                                                </dl>
                                            </div>
                                        </div>

					</div>
		</div>

        <%--搜索框--%>
		<b class="content">
            <div id="search_box" style="solid-color: #00aaff">

                <ul id="searchType">
                    <li class="type_selected">职位</li>
                </ul>
                <div class="searchtype_arrow" style="solid-color: #00aaff"></div>
                <input type="text" id="search_input" name = "kd"  tabindex="1" value=""  placeholder="请输入兼职名称，如：服务员"  />
                <input type="submit" id="search_button" value="搜索" style="background-color: #00aaff"/>
            </div>

       <%-- 兼职列表--%>
        <div class="content">
            <ul class="hot_pos reset" id="allRe"></ul>
        </div>

		<script type="text/javascript" src="style/js/Chart.min.js"></script>
		<script type="text/javascript" src="style/js/home.min.js"></script>
		<script type="text/javascript" src="style/js/count.js"></script>

		<script type="text/javascript" src="style/js/core.min.js"></script>
		<script type="text/javascript" src="style/js/popup.min.js"></script>

	</body>
</html>
