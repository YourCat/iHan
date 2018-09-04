<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<title>添加用户</title>
<base href="<%=basePath%>">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<script src="bootstrap/js/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
	    <div class="row">
	        <div class="col-md-12">
	            <h1>添加用户</h1>
	        </div>
	    </div>
	    <div class="row">
	    	<div class="col-md-12">
			    <form action="" name="PersonForm">
			    	<table class="table table-hover">
				         <tr>
				         	<td>ip：</td>
				         	<td><input type="text" name="ip"></td>
				         </tr>
				     	 <tr>
				     	 	<td>姓名：</td>
				     	 	<td><input type="text" name="name"></td>
				     	 </tr>
				     	 <tr>
				         	<td>性别：</td>
				         	<td><input type="text" name="gender"></td>
				         </tr>	
				         <tr>
				         	<td>年龄：</td>
				         	<td><input type="text" name="age"></td>
				         </tr>		
				         <tr>
				         	<td>身高：</td>
				         	<td><input type="text" name="hight"></td>
				         </tr>	
				         <tr>
				         	<td>体重：</td>
				         	<td><input type="text" name="weight"></td>
				         </tr>	
				         <tr>
				         	<td>佩戴位置：</td>
				         	<td><input type="text" name="wearposition"></td>
				         </tr>		         
				         <tr>
				         	<td><input type="button" value="添加" onclick="addPerson()"></td>
				         </tr>
			         </table>
			    </form>
			</div>
		</div>
	</div>
    <script type="text/javascript">
        function addPerson() {
            var form = document.forms[0];
            form.action = "Person/addPerson";
            form.method = "post";
            form.submit();
        }
    </script>

</body>
</html>