<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品信息</title>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
    table{
    text-align:center;
    }
    </style>
</head>
<body>
<form>
<input type="button" value = "查询数据" onClick = "doFind()">
<input id="ajaxFrm" type="text" name="number"><br>
</form>
<div id="ajaxDiv">
<table id="tag"  class="table table-striped">
<tr>
<td>商品编号</td>
<td>商品名称</td>
<td>商品产地</td>
<td>商品分区</td>
<td>执行操作</td>
</tr>
</table>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel" >
					修改商品信息
				</h4>
			</div>
			<div class="modal-body" >
				<form id="content">
        商品编号 <input type="text" name="number" id="number"><br> 商品名称
        <input type="text" name="name" id="name"><br> 商品进价
        <input type="text" name="sale" id="sale"><br>商品售价
        <input type="text" name="price" id="price"><br>商品单位
        <input type="text" name="unit" id="unit"><br>商品产地
        <input type="text" name="where" id="where"><br>商品分区
        <input type="text" name="area" id="area"><br>进货数量
        <input type="text" name="count" id="count"><br>
        </form>
        <div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button class="btn btn-primary" data-dismiss="modal" onClick = "doUpdate()">提交修改</button>
			</div>
    
			</div>
			
		</div>
	</div>
	</div>
</body>
<script>

$.ajax({
	type: "POST",
	datatype:"json",
	url:"Query.java", 
	data:$('#ajaxFrm').serialize(),
	error: function(request) {
	alert("查询失败！");
	},
	success: function(data) {
		var dataObj=eval("("+data+")");
        for(var i = 0; i < data.length; i++) {
          s = "<tr id =1><td>" + dataObj[i].SNO + "</td><td>" + dataObj[i].SNAME + "</td><td>" +
            dataObj[i].SWHERE + "</td><td>" +
            dataObj[i].SAREA + "</td><td>"+
            "<input type= button name= btn onclick=javascript:Delete(this) value=删除><input type= button data-toggle=modal data-target=#myModal name= btn1 onclick=javascript:Update1(this) value=编辑>"+"</td></tr>";
          $("#tag").append(s);
        }
        }
	});

function doFind(){
	$("tr").hide()
	$.ajax({
	type: "POST",
	datatype:"json",
	url:"Query.java", 
	data:$('#ajaxFrm').serialize(), //要发送的是ajaxFrm表单中的数据
	error: function(request) {
	alert("查询失败！");
	},
	success: function(data) {
		alert("查询成功");
		var dataObj=eval("("+data+")");
		var a = "<tr><td>商品编号</td><td>商品名称</td><td>商品产地</td><td>商品分区</td><td>执行操作</td></tr>"
			$("#tag").append(a);
        for(var i = 0; i < data.length; i++) {
          s = "<tr id =1><td>" + dataObj[i].SNO + "</td><td>" + dataObj[i].SNAME + "</td><td>" +
            dataObj[i].SWHERE + "</td><td>" +
            dataObj[i].SAREA + "</td><td>"+
            "<input type= button name= btn onclick=javascript:Delete(this) value=删除><input type= button data-toggle=modal data-target=#myModal name= btn1 onclick=javascript:Update1(this) value=编辑>"+"</td></tr>";
          $("#tag").append(s);
        }
        }
	});
	}
	
	
	
function Delete(btn){
	var tds = btn.parentElement.parentElement.children;
    var td = (tds[0]).innerHTML ;
    var con = confirm("是否删除?");
    if(con){
    	$.ajax({
            url:'Delete.java',
            data:{
                td:td
            },
            type:'post',
            error: function(request) {
    			alert("删除失败！");
    			},
            success:function(response){
                alert("删除成功！");
		        $("#tag").load("Query.jsp");
            }
        });
    }
}

function Update1(btn1){
	var tds = btn1.parentElement.parentElement.children;
    var td = (tds[0]).innerHTML ;
    	$.ajax({
            url:'Message.java',
            data:{
                td:td
            },
            type:'post',
            datatype:"json",
            error:function(request){
            	alert("获取相关数据失败");
            },
            success:function(data){
            	var dataObj=eval("("+data+")");
            	for(var i=0;i<data.length;i++)
            		{
            		if(dataObj[i].sno==td)
            		{
            			document.getElementById("number").value=dataObj[i].sno;
            			document.getElementById("name").value=dataObj[i].sname;
            			document.getElementById("sale").value=dataObj[i].PIN;
            			document.getElementById("price").value=dataObj[i].PSALE;
            			document.getElementById("unit").value=dataObj[i].unit;
            			document.getElementById("where").value=dataObj[i].swhere;
            			document.getElementById("area").value=dataObj[i].sarea;
            			document.getElementById("count").value=dataObj[i].win;
            			break;
            		}
            		}
            	
            }
        });
    }

function doUpdate(){
	$.ajax({
	type: "POST",
	datatype:"json",
	url:"Update.java", 
	data:$('#content').serialize(),
	error: function(request) {
	alert("修改失败！");
	},
	success: function(data) {
		alert("修改成功");
		$("#tag").load("Query.jsp");
        }
	});
	}
</script>
</html>