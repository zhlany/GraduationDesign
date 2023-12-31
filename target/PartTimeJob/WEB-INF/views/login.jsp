 <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
System.out.println(basePath);
%>
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
<link rel="alternate" media="handheld"  />

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>毕过兼职网-登录</title>
<meta content="毕过兼职网-登录" name="description">
<meta content="毕过兼职网-登录" name="keywords">

<link rel="Shortcut Icon" href="h/images/favicon.ico">
<link rel="stylesheet" type="text/css" href="style/css/style.css"/>

<script src="style/js/jquery.1.10.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="style/js/jquery.lib.min.js"></script>
<script type="text/javascript" src="style/js/core.min.js"></script>
<script type="text/javascript" src="style/js/conv.js"></script>
</head>
<% Cookie c=new Cookie("email","");
			/*设置cookie有效时间*/
           c.setMaxAge(600);
           response.addCookie(c);
           %>

<body id="login_bg" style="background-color: #5bc0de">
	<div class="login_wrapper">
		<div class="login_header">
            <div id="cloud_s"><img src="style/images/cloud_s.png" width="81" height="52" alt="cloud" /></div>
            <div id="cloud_m"><img src="style/images/cloud_m.png" width="136" height="95"  alt="cloud" /></div>
        </div>

    	<input type="hidden" id="resubmitToken" value="" />
		 <div class="login_box">
        	<form id="loginForm">
				<input type="text" id="email" name="email" value="" tabindex="1" placeholder="请输入登录邮箱地址" />
			  	<input type="password" id="password" name="password" tabindex="2" placeholder="请输入密码" />
				<span class="error" style="display:none;" id="beError"></span>
			    <label class="fl" for="remember"><input type="checkbox" id="remember" value="" checked="checked" name="autoLogin" /> 记住我</label>
			    <a href="reset" class="fr" target="_blank">忘记密码？</a>
				<input type="submit" id="submitLogin" value="登 &nbsp; &nbsp; 录" />

			</form>

			<div class="login_right">
			<br/>
			<br/>
				<div>还没有帐号？</div>
				<a  href="register"  class="registor_now" style="color: #0A246A">立即注册</a>
			</div>
        </div>
        <div class="login_box_btm"></div>
    </div>

<script type="text/javascript">
$(function(){
	//验证表单
	 	$("#loginForm").validate({
	 		/* onkeyup: false,
	    	focusCleanup:true, */
	        rules: {
	    	   	email: {
	    	    	required: true,
	    	    	email: true
	    	   	},
	    	   	password: {
	    	    	required: true
	    	   	}
	    	},
	    	messages: {
	    	   	email: {
	    	    	required: "请输入登录邮箱地址",
	    	    	email: "请输入有效的邮箱地址，如：vivi@lagou.com"
	    	   	},
	    	   	password: {
	    	    	required: "请输入密码"
	    	   	}
	    	},
			//记住我
	    	submitHandler:function(form){
	    		if($('#remember').prop("checked")){
	      			$('#remember').val(1);
	      		}else{
	      			$('#remember').val(null);
	      		}
	    		var email = $('#email').val();
	    		var password = $('#password').val();
	    		var remember = $('#remember').val();

	    		$(form).find(":submit").attr("disabled", true);
	            $.ajax({
	            	type:'POST',
	            	data:{"email":email,"password":password},
	            	url:'UserType.do',
					async:false,
					dataType: 'json',
	            }).done(function(result) {
	                if(result.tip=="lock"){
	                        alert("你的账户已被锁定，请联系管理员解锁（1186901832@qq.com）");
	                }else if(result.tip=="no"){
                     		$('#beError').show();
                            $('#beError').html("用户未注册！");
                    }else if(result.tip=="company"){
	            			window.location='comIndex';
					}else if(result.tip=="noCom"){
					        window.location='company';
					}else if(result.tip=="student"){
					        window.location='stuResume';
					}else if(result.tip=="admin"){
				            window.location='maSystem';
				    }
					else {
						$('#beError').show();
						$('#beError').html("密码错误，请重新输入！");
					}
					$(form).find(":submit").attr("disabled", false);
	            });
	        }
		});
})
</script>
</body>
</html>