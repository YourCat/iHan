<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    String date = request.getParameter("mydate");//用request得到 
%>
<!DOCTYPE>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hello ECharts</title>
<!--  <base href="<%=basePath%>">-->
<!-- 使用单文件引入的方式使用ECharts.JS -->
<script src="<%=basePath%>bootstrap/js/echarts.common.min.js"></script>
<script src="<%=basePath%>bootstrap/js/jquery-1.8.3.js"></script>
<script src="<%=basePath%>bootstrap/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
function GetQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]); return null;
}
function bl(s){
	return s<10?'0'+s:s;
}
</script>
<style>
	body{
		margin:auto;
		padding:auto
	}
</style>
</head>

<body onload="loadData()">
	<div id="myLineDiv" style="height: 400px; width: 800px;display:inline-block;"></div>

    <script type="text/javascript">
    <!--这个是折线图-->
    var bdate = GetQueryString("bdate");
    var edate = GetQueryString("edate");
    var id = GetQueryString("id");
    var category = GetQueryString("category");
    function loadData(option) {
        $.ajax({
            type : 'post',  //传输类型
            async : false,  //同步执行
            url : 'BarDao?bdate='+bdate+"&edate="+edate+"&id="+id+"&category="+category,   //web.xml中注册的Servlet的url-pattern
            //data : {},
            dataType : 'json', //返回数据形式为json
            success : function(result) {
                if (result) {
                	var str = result[0].time.substring(0,10);
                	str = new Date(str);   
                	var now = str.getFullYear()+'/'+(str.getMonth()+1)+'/'+str.getDate();
                	var end = new Date(result[result.length-1].time.substring(0,10));
                	end = +end+1000*60*60*24;
                	end = new Date(end);
                	
                	var item2 = {
                		name:now+' 00:00:00',
                		value:new Array(now+' 00:00:00',0)
                	};
                	
                	//now.setDate(now.getDate()+1);
                	var ss = end.getFullYear()+"-"+(end.getMonth()+1)+"-"+end.getDate();
                	var item3 = {
                		name:ss+' 00:00:00',
                		value:new Array(ss+' 00:00:00',0)        //造一条的水平线
                	
                	};
                	//alert(now+ss);
                	option.series[1].data=[];
                	option.series[1].data.push(item2);
                	option.series[1].data.push(item3);           //加入水平线
                	
                	option.series[0].data=[];
                	for (var i=0; i<result.length; i++) {
	                    var item={
	                    	name:result[i].time,
	                    	value:new Array(result[i].time,result[i].data)
	                    };
	                    option.series[0].data.push(item);
	                    
                	}
                }

            },
            error : function(errorMsg) {
                alert("加载数据失败");
            }
        });//AJAX
    }//loadData()

    var myChart = echarts.init(document.getElementById('myLineDiv'));
    var option = {
        title: {
            text: '当天心率'
        },
        tooltip: {
            trigger: 'axis',
            formatter: function (params) {
                params = params[0];
                var date = new Date(params.name);
               
                return bl(date.getHours()) + ':' + bl(date.getMinutes())   + ' - ' + params.value[1];
            },
            axisPointer: {
                animation: false
            }
        },    
        toolbox: {
            show: true,
            feature: {
                dataZoom: {
                    yAxisIndex: 'none'
                },
                dataView: {readOnly: false},
                magicType: {type: ['line', 'bar']},
                restore: {},
                saveAsImage: {}
            }
        },
        xAxis :  {
            type : 'time',
            splitLine:{
            	show:false
            }
        } ,
        yAxis :  {
            type : 'value',
            boundaryGap:[0,'100%'],
            splitLine:{
               show:false
            }
        },
        series : [{        //图表系列
            name : '心率',
            type : 'line',
            showSymbol : false
        	//data : data
        },
        {
        	name : 'ii',
        	type : 'line',
        	showSymbol : false,
        	itemStyle:{normal:{opacity:0}},
        	lineStyle:{normal:{opacity:0}}
        }]
    };
    //加载数据到option
    loadData(option);
    //设置option
    myChart.setOption(option);
	</script>
</body>
</html>