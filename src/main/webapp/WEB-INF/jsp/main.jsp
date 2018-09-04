<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <!--<base href="<%=basePath%>">-->
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <link rel="stylesheet" href="<%=basePath%>bootstrap/css/bootstrap.min.css">
  <!--  这三行毒瘤注意一下-->
  <link rel="stylesheet" type="text/css" href="<%=basePath%>bootstrap/css/htmleaf-demo.css">
  <link rel="stylesheet" type="text/css" href="<%=basePath%>bootstrap/css/nav.css">
  <link rel="stylesheet" type="text/css" href="<%=basePath%>bootstrap/fonts/iconfont.css">
  <title>后台管理界面</title>
</head>
<body>
  <div class="nav">
    <div class="nav-top">
      <div id="mini" style="border-bottom:1px solid rgba(255,255,255,.1)"><img src="<%=basePath%>bootstrap/images/mini.png" ></div>
    </div>
    <ul>
      <li class="nav-item">
        <a href="javascript:;"><i class="my-icon nav-icon icon_1"></i><span>核心功能</span><i class="my-icon nav-more"></i></a>
        <ul>
          <li><a href="PersonInfo" target="mainFrame"><span>用户信息</span></a></li>
          <li><a href="Find" target="mainFrame"><span>健康指标</span></a></li>
          <li><a href="Jiangyou"><span>打个酱油</span></a></li>
          <li><a href="javascript:;"><span>也打酱油</span></a></li>
        </ul>
      </li>
      <li class="nav-item">
        <a href="javascript:;"><i class="my-icon nav-icon icon_2"></i><span>关关雎鸠</span><i class="my-icon nav-more"></i></a>
        <ul>
          <li><a href="javascript:;"><span>在河之洲</span></a></li>
          <li><a href="javascript:;"><span>窈窕淑女</span></a></li>
          <li><a href="javascript:;"><span>君子好逑</span></a></li>
        </ul>
      </li>
      <li class="nav-item">
        <a href="javascript:;"><i class="my-icon nav-icon icon_3"></i><span>昔我往矣</span><i class="my-icon nav-more"></i></a>
        <ul>
          <li><a href="javascript:;"><span>杨柳依依</span></a></li>
          <li><a href="javascript:;"><span>今我来思</span></a></li>
          <li><a href="javascript:;"><span>雨雪霏霏</span></a></li>
        </ul>
      </li>
    </ul>
  </div>
  <div class="htmleaf-container">
    <header class="htmleaf-header">
      <h1>后台管理系统</h1>
      <div class="htmleaf-links">
        <a class="htmleaf-icon icon-htmleaf-home-outline" href="Main" title="主页"></a>
        <a class="htmleaf-icon icon-htmleaf-arrow-forward-outline" href="#" onclick="javascript:history.back(-1)" title="返回"></a>
      </div>
      <div style="float:right;">
      	<h4 style="display:inline-block;">${user.username}</h4>
      	<a href="${path}/iHan/user/LogOut" title="注销"><i class="my-icon icon-tuichu" ></i></a>
      </div>  
    </header>
    <div class="related" >
      <iframe src="Tmp" id="mainFrame" name="mainFrame" frameborder="0" width="100%"  height="650px" frameBorder="0"></iframe>
    </div>

  </div>
  
</body>

<script src="<%=basePath%>bootstrap/js/jquery-3.2.1.min.js"></script>
<script src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>bootstrap/js/nav.js"></script>
</html>