<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>首页</title>
<script src="js/jquery-3.4.1.min.js"></script>
 <style>
        #box1 {
            height: 660px;
            width: 200px;
            border: 1px solid black;
        }
        
        #box2 {
            height: 60px;
            width: 1000px;
            border: 1px solid #19224b42;
            margin-left: 201px;
            margin-top: -662px;
            background-color:#19224b42;
            color: #00000066;
        }
        
        #box3 {
            height: 599px;
            width: 1000px;
            border: 1px solid black;
            margin-left: 201px;
            margin-top: -1px;
        }
        
        #h1{
            font-size: 20px;
            align-items:center;
            justify-content:center;
        }
        
        #btn1,#btn2,#btn3,#btn4,#btn5 {
            margin-top: 60px;
            height: 60px;
            width: 200px;
            background-color: rgb(50, 64, 87);
            color:#00adff;
            font-size: 20px;
            align-items:center;
            justify-content:center;
            display:flex;
            border:none
        }
        .btn:hover{
        background-color:#008eff45;
        cursor:pointer;
        }
    </style>
</head>
<body>
 <div id="box1" style="min-height: 100%; background-color: rgb(50, 64, 87);">
        <div class="btn" id="btn1">首页</div>
        <div class="btn" id="btn2">数据管理</div>
        <div class="btn" id="btn3">添加数据</div>
        <div class="btn" id="btn4">图表</div>
        <div class="btn" id="btn5">管理员信息</div>
    </div>
    <div id="box2">
    <h1 id = "h1"></h1>
    </div>
    <div id="box3"></div>
</body>
<script>

$.ajax({
	type : "post",
    url: "Home.jsp",
    cache: false,
    success: function() {
        $("#box3").load("Home.jsp");
        $("#h1").html("首页");
    }
})

$("#btn1").click(function() {
    $.ajax({
    	type : "post",
        url: "Home.jsp",
        cache: false,
        success: function() {
            $("#box3").load("Home.jsp");
            $("#h1").html("首页");
        }
    })
})

$("#btn2").click(function() {
    $("#box3").load('Query.jsp');
    $("#h1").html("数据管理");
})

$("#btn3").click(function() {
    $.ajax({
    	type : "post",
        url: "Insert.jsp",
        cache: false,
        success: function() {
            $("#box3").load("Insert.jsp");
            $("#h1").html("添加数据");
        }
    })
})

$("#btn4").click(function() {
    $.ajax({
    	type : "post",
        url: "Chart.jsp",
        cache: false,
        success: function() {
            $("#box3").load("Chart.jsp");
            $("#h1").html("图表");
        }
    })
})

$("#btn5").click(function() {
    $.ajax({
    	type : "post",
        url: "Administrator.jsp",
        cache: false,
        success: function() {
            $("#box3").load("Administrator.jsp");
            $("#h1").html("管理员信息");
        }
    })
})
</script>
</html>