<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>My 404</title>
<link rel="stylesheet" href="<%=basePath%>bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>bootstrap/css/htmleaf-demo.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>bootstrap/css/nav.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>bootstrap/fonts/iconfont.css">
<style>
	video{
          position: fixed;
          right:0;
          bottom: 0;
          min-width: 100%;
          min-height: 100%;
          width: auto;
          height: auto;
          z-index: -9999;
          /*灰色调*/
          /*-webkit-filter:grayscale(100%)*/

      }
      .text{
      	color:white;
      	text-align:center;
      	font-family:"宋体","Arial Narrow";
      }
</style>
</head>
<body>
	<div class="text">
		<h1>we are looking for your page...but we can't find it</h1>
		<a class="htmleaf-icon icon-htmleaf-arrow-forward-outline" href="#" onclick="javascript:history.back(-1)" title="返回"></a>
	</div>
	<video id="v1" autoplay muted loop style="width: 100%">
    	<source  src="<%=basePath%>bootstrap/avi/error.mp4">
	</video>
</body>
</html>