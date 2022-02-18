<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="css/bootstrap.min.css">
     <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
<title>登陆</title>
</head>
<body style="background-color: #eee;">
<div style="height:400px;width:400px;margin-left:500px;margin-top:200px">
<h2 class="form-sign-heading">Please Sign in</h2>
<form id="ajaxFrm" class="form-signin">
<input type="text" id="name" name="name" class="form-control" placeholder="职工编号"><br>
<input type="password" id="password" name="password" class="form-control" placeholder="职工姓名"><br>
<input type = "button" onClick="Landing()" value="登陆" class="btn btn=lg btn-primary btn-block">
<button id="register" class="btn btn=lg btn-primary btn-block">注册</button>
</form>
</div>
</body>
<script>
$("#register").click(function(){
	window.open("Register.jsp");
})

function Landing(){
	var na =$("#name").val();
	var pd = $("#password").val();
	$.ajax({
		type: "POST",
		datatype:"json",
		url:"Landing.java", 
		data:$('#ajaxFrm').serialize(),
		error: function(data) {
			alert("登陆失败")
		},
		success: function(data) {
			var dataObj=eval("("+data+")");
			for(var i=0;i<data.length;i++)
				{
				if((na==dataObj[i].ID)&&(pd==dataObj[i].PassWord))
					{
					alert("登陆成功");
					$.ajax({
						type: "POST",
						datatype:"json",
						url:"Administrator.java", 
						data:{na:na}
						});
					window.open("HomePage.jsp");
					window.location.reload("Landing.jsp");break;
					}
				else if((na!=dataObj[i].ID)&&(pd==dataObj[i].PassWord))
					{
					alert("用户名输入错误或用户不存在!");
					window.loaction.reload("Landing.jsp");break;
					}
				else if((na==dataObj[i].ID)&&(pd!=dataObj[i].PassWord))
					{
					alert("密码输入错误，请重新输入");
					window.loaction.reload("Landing.jsp");break;
					}
				}
	        }
		});
	
}
</script>
</html>