<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<base href="<%=basePath%>">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap-select.min.css">
<script type="text/javascript" src="bootstrap/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap-datetimepicker.zh-CN.js"></script>
<style>
	.container{
		padding:20px 20px 20px 20px;
	}
</style>
</head>
<body>
	<div class="container">
	<div class="row"></div>
	<div class="row">
			<div class="col-md-3 col-md-offset-2" >
				<label>用户</label><br/>
				<select id="user" name="user" class="selectpicker show-tick form-control" multiple data-max-options="1" data-live-search="true">  
					<option value="1">张智</option>   
					<option value="2">艾俊豪</option>  
					<option value="3">虞亦涵</option>  
					<option value="4">宋雪怡</option>  
					<option value="5">庞天依</option>  
					<option value="6">许利燕</option>  
				</select>

			</div>
			<div class="col-md-3">
				<label>类别</label><br/>
				<select id="usertype" name="usertype" class="selectpicker show-tick form-control" multiple data-max-options="1" data-live-search="true">  
					<option value="temperature">体温</option>   
					<option value="heartrate">心率</option>  
					<option value="bloodoxygen">血氧浓度</option>  
					<option value="breatefraquency">呼吸频率</option>  
					<option value="systolicpressure">收缩压</option>  
					<option value="disastolicpressure">舒张压</option>  
				</select>
			</div>
		</div><br/>
		<div class="row">
			<div class="col-md-9 col-md-offset-4">
				<a href="javascript:void(0);" onclick="check()">
					<button type="button" class="btn btn-default ">查询</button>
				</a>
			</div>
		</div>
	</div>
</body>
<script>
	function check(){            //带参数跳转到视图界面,获取select选中的项并编码
		var user = document.getElementById("user");
		var a = user.options[user.selectedIndex].value;
		var usertype = document.getElementById("usertype");
		var b = usertype.options[usertype.selectedIndex].value;
		window.location.href="<%=basePath %>Person/Try?id="+a+"&category="+b;
	}
</script>


</html>