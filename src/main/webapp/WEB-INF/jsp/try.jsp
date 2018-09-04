<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<!--<base href="<%=basePath%>"> -->
	<title>My JSP 'Login.jsp' starting page</title>
	<link rel="stylesheet" href="<%=basePath%>bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=basePath%>bootstrap/css/bootstrap-datetimepicker.min.css"/>
	<script type="text/javascript" src="<%=basePath%>bootstrap/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>bootstrap/js/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>bootstrap/js/bootstrap-datetimepicker.zh-CN.js"></script>
</head>
<body>
	<div class="container" align="center" style="padding:20px 20px 20px 20px;">
		<div class="row">
			<div class="col-md-3 col-md-offset-2" >
				<label>起始日期</label><br/>
				<input type="text" class="form-control form_datetime" id="bdate" style="width:160px">
			</div>
			<div class="col-md-3">
				<label>终止日期</label><br/>
				<input type="text" class="form-control form_datetime" id="edate" style="width:160px">
			</div>
		</div><br/><br/>


		<iframe src="" id="myFrame" name="myFrame" frameborder="0" width="100%"  height="500px" frameBorder="0"></iframe>
	</div>
</body>
<script>
	$(function () {                 //日历
		$(".form_datetime").datetimepicker({
			format: "yyyy-mm-dd",
			autoclose: true,
			todayBtn: true,
			todayHighlight: true,
			showMeridian: true,
			pickerPosition: "bottom-left",
			language: 'zh-CN',
			startView: 2,
			minView: 2
		});
	});
	
	document.getElementById("edate").onchange=function(){
    	var d = GetQueryString("id");
    	var e = GetQueryString("category");
    	var f = document.getElementById("bdate").value+" 00:00:00";
    	var g = document.getElementById("edate").value+" 23:59:59";
    	myFrame.location.href="Echart?id="+d+"&category="+e+"&bdate="+f+"&edate="+g;
	}
</script>
<script>                       //获取url参数
function GetQueryString(name) {
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
	var r = window.location.search.substr(1).match(reg);
	if (r != null) return unescape(r[2]); return null;
}
</script>
</html>
