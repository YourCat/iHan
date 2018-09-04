<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>后台管理系统</title>
<!-- Custom Theme files -->
<link href="<%=basePath%>index/css/style.css" rel="stylesheet" type="text/css" media="all"/>
<!-- Custom Theme files -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="keywords" content="后台登录" />
</head>
<script type="text/javascript" src="<%=basePath%>bootstrap/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">	
	function login(){
		window.event.returnValue = false;   //禁止请求(提交表单)！！
		var username = $('#username').val();
		var password = $("#password").val();
		$.ajax({
			type:'post',
			url: 'user/MyCheck?username='+username+"&password="+password,
			dataType: 'json',
			//contentType:'application/json;charset=utf-8',
			success:function(data){
				if($.isEmptyObject(data)){
					alert("我是假的？");
				}
				else{
					window.location.href='Person/Main';
				}
			}
		});
	}
</script>
<body>
<!--header start here-->
<div class="login-form">
	<div class="top-login">
		<span><img src="<%=basePath%>index/images/group.png" alt=""/></span>
	</div>
	<h1>后台管理系统</h1>
	<div class="login-top">
	<form onsubmit="return login();">
		<div class="login-ic">
			<i ></i>
			<input type="text" id="username" value="User name" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'User name';}"/>
			<div class="clear"> </div>
		</div>
		<div class="login-ic">
			<i class="icon"></i>
			<input type="password" id="password"  value="password" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'password';}"/>
			<div class="clear"> </div>
		</div>
			
		<div class="log-bwn">
			<input type="submit" value="LOGIN" >
		</div>
	</form>
	</div>
	<p class="copy">© 2018 xxxxxxxxxxx</p>
</div>		
<!--header start here-->
</body>
</html>