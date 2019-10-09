<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link rel="stylesheet" href="layui/css/layui.css" media="all">
<title>查询和审批模板</title>
</head>

<body>
	<div class="layui-fluid">
		<div class="layui-row">
			<div class="layui-col-xs12 layui-col-md12">
				<table id="flight"></table>
			</div>
		</div>
	</div>
	
	<script src="layui/layui.js"></script>
	<script>
	//表格         如何嵌入到jsp里面	
	layui.use('table', function(){
    var table = layui.table;
  
    //第一个实例
    table.render({
    	elem: '#flight'
    	,height: 315
    	,url: '/demo/table/user/' //数据接口，传过来的数据
    	,page: true //开启分页
    	,cols: [[ //表头
      		{field: 'id', title: '编号', width: 80, sort: true, fixed: 'left'}
      		,{field: 'departure_time', title: '起飞时间', width: 160, sort: true}
      		,{field: 'landing_time', title: '降落时间', width: 160, sort: true}
      		,{field: 'departure_position', title: '起飞位置', width: 180} 
      		,{field: 'landing_position', title: '降落位置', width: 180}
    		]]
  		});
	});
	</script> 
</body>

</html>