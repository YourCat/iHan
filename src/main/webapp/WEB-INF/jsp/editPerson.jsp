<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<title>编辑用户</title>
<base href="<%=basePath%>">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<script src="bootstrap/js/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
    function updatePerson() {
        var form = document.forms[0];
        form.action = "<%=basePath %>Person/updatePerson";
        form.method = "post";
        form.submit();
    }
</script>
<style>
	.form-control{
		width:200px;
	}
</style>
</head>
<body>
	<div class="container">
	    <div class="row">
	        <div class="col-md-12">
	            <h1>编辑用户：${Person.id}</h1>
	        </div>
	    </div>
	    <div class="row">
	    	<div class="col-md-12">
			    <form action="" name="PersonForm">
			    	<input type="hidden" name="id" value="${Person.id }" />   
			    	<table class="table table-hover">
				         <tr>
				         	<td>IP：</td>
				         	<td><input type="text" name="ip" value="${Person.ip}"></td>
				         </tr>
				         <!-- <tr>
				         	<td>ID：</td>
				         	<td><input type="text" name="id" value="${Person.id}"></td>
				         </tr> -->
				     	 <tr>
				     	 	<td>姓名：</td>
				     	 	<td><input type="text" name="name" value="${Person.name}"></td>
				     	 </tr>
				     	 <tr>
				         	<td>性别：</td>
				         	<td><input type="text" name="gender" value="${Person.gender}"></td>
				         </tr>	
				         <tr>
				         	<td>年龄：</td>
				         	<td><input type="text" name="age" value="${Person.age}"></td>
				         </tr>		
				         <tr>
				         	<td>身高：</td>
				         	<td><input type="text" name="hight" value="${Person.hight}"></td>
				         </tr>	
				         <tr>
				         	<td>体重：</td>
				         	<td><input type="text" name="weight" value="${Person.weight}"></td>
				         </tr>	
				         <tr>
				         	<td>佩戴位置：</td>
				         	<td><input type="text" name="wearposition" value="${Person.wearposition}"></td>
				         </tr>		         
				         <tr>
				         	<td><input type="button" value="修改" onclick="updatePerson()"></td>
				         </tr>
			         </table>
			    </form>
			</div>
		</div>
	</div>
	
</body>

</html>