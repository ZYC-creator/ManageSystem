<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <script src="js/jquery-3.4.1.min.js"></script>
<title>管理员信息</title>
    <style>
        
        #box5 {
            height: 500px;
            width: 700px;
            background: rgb(240 239 239 / 0.8);
            margin-left: 140px;
            margin-top: 20px;
        }
        
        #space {
            height: 50px;
            width: 20px
        }
        
        #img {
            height: 300px;
            width: 300px;
            margin-left: 400px;
            margin-top: -438px;
        }
        
        span {
            margin-top: 20px
        }
        
        #btn6 {
            margin: 120px;
            width: 60px;
            height: 30px;
        }
    </style>
</head>
<body>

        <div id="box5">
            <span>用户名：<input type="text" id="username" style="border-top:0;border-left:0;border-right:0;background: rgb(240 239 239 / 0.8);"></span><br>
            <div id="space"></div>
            <span>姓名：<input type="text" id="name" style="border-top:0;border-left:0;border-right:0;background: rgb(240 239 239 / 0.8);"></span><br>
            <div id="space"></div>
            <span>年龄：<input type="text" id="age" style="border-top:0;border-left:0;border-right:0;background: rgb(240 239 239 / 0.8);"></span><br>
            <div id="space"></div>
            <span>职工号：<input type="text" id="number" style="border-top:0;border-left:0;border-right:0;background: rgb(240 239 239 / 0.8);"></span><br>
            <div id="space"></div>
            <span>入职时间：<input type="text" id="time" style="border-top:0;border-left:0;border-right:0;background: rgb(240 239 239 / 0.8);"></span><br>
            <div id="space"></div>
            <span>所在职位：<input type="text" id="position" style="border-top:0;border-left:0;border-right:0;background: rgb(240 239 239 / 0.8);"></span><br>
            <div id="space"></div>
            <div id="img">
                <img alt="用户.svg" src="用户.svg">
            </div>
            <button id="btn6">保存</button><button id="btn6">修改</button>
        </div>
</body>
<script>
    	$.ajax({
            url:'Administrator.java',
            data:{},
            type:'post',
            datatype:"json",
            error:function(request){
            	alert("获取相关数据失败");
            },
            success:function(data){
            	var dataObj=eval("("+data+")");
            	console.log(dataObj);
            }
            	})
</script>
</html>