<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>首页</title>
<script src="js/echarts.common.js"></script>
<script src="js/jquery-3.4.1.min.js"></script>
</head>
<body>
<div id="main" style="height:600px;width:600px"></div>
</body>
<script>
var myChart = echarts.init(document.getElementById('main'));
myChart.setOption({
    title: {
        text: '商品利润'
    },
    dataZoom: [
        {
            type: 'slider',
            show: true,
            xAxisIndex: [0],
            start: 1,
            end: 35
        },
        {
            type: 'slider',
            show: true,
            yAxisIndex: [0],
            left: '93%',
            start: 29,
            end: 36
        },
        {
            type: 'inside',
            xAxisIndex: [0],
            start: 1,
            end: 35
        },
        {
            type: 'inside',
            yAxisIndex: [0],
            start: 29,
            end: 36
        }
    ],
    tooltip: {},
    toolbox: {
        show: true,
        feature: {
            mark: {
                show: true
            },
            dataView: {
                show: true,
                readOnly: false
            },
            magicType: {
                show: true,
                type: ['line', 'bar', 'stack', 'tiled']
            },
        }
    },
    legend: {
        data:['利润']
    },
    xAxis: {
        data: []
    },
    yAxis: {},
    series: [{
        name: '利润',
        type: 'bar',
        data: []
    }]
});

myChart.showLoading();

var names=[];
var nums=[];

$.ajax({
type : "post",
async : true,            
url : "Home.java",
data : {},
dataType : "json",
success : function(data) {
    
    if (data) {
           for(var i=0;i<data.length;i++){
               names.push(data[i].SNAME);
            }
           for(var i=0;i<data.length;i++){
               nums.push(data[i].PPROFIT);
             }
           myChart.hideLoading();
           myChart.setOption({
               xAxis: {
                   data: names
               },
               series: [{
                   name: '利润',
                   data: nums
               }]
           });

    }

},
error : function(errorMsg) {
alert("图表生成失败!");
myChart.hideLoading();
}
})

</script>
</html>