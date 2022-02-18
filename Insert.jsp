<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>插入数据</title>
 <link rel="stylesheet" href="css/bootstrap.min.css">
     <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<form id="ajaxFrm">
        商品编号 <input type="text" name="number"><br> 商品名称
        <input type="text" name="name"><br> 商品进价
        <input type="text" name="sale"><br>商品售价
        <input type="text" name="price"><br>商品单位
        <input type="text" name="unit"><br>商品产地
        <input type="text" name="where"><br>商品分区
        <input type="text" name="area"><br>进货数量
        <input type="text" name="count"><br>
        <input type="button" id="submit" value="添加">
    </form>
</body>
<script type="text/javascript">
$("#submit").click(function(){
	$.ajax({
		type:'POST',
		url:'Insert.java',
		data:$('#ajaxFrm').serialize(),
		error: function(request) {
			alert("插入失败！");
			},
		success:function(response){
			alert("插入成功");
	        $("#ajaxFrm").load("Insert.jsp");
	        window.location.reload();
		}
	})
})
</script>
</html>