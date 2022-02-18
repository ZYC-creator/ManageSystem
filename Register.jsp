<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="css/bootstrap.min.css">
     <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
<title>注册</title>
</head>
<body  style="background-color: #eee;">
<div id="box1" style="height:400px;width:400px;margin-left:500px;margin-top:100px">
<form id="ajaxFrm" class="form-signin">
请输入用户名:<input type="text" name="username" class="form-control"><br>
请输入密码:<input type ="text" name = "password" class="form-control"><br>
请输入姓名:<input type="text" name="name" class="form-control"><br>
请输入年龄:<input type="text" name="age" class="form-control"><br>
请输入职工号:<input type = "text" name="number" class="form-control"><br>
请输入职位:<input type = "text" name = "position" class="form-control"><br>
<input type="button" onClick="Insert()" value ="注册" class="btn btn=lg btn-primary btn-block">
</form>
</div>
</body>
<script type="text/javascript">
function Insert(){
	$.ajax({
		type: "POST",
		datatype:"json",
		url:"Register.java", 
		data:$('#ajaxFrm').serialize(),
		error: function(response) {
		alert("注册失败！");
		},
		success: function(data) {
			if(data==1)
				{
				alert("注册失败");
				window.location.reload("Register.jsp");
				}
			else{
				alert("注册成功");
				window.open("Landing.jsp");
			}
	        }
		});
}


</script>
</html>