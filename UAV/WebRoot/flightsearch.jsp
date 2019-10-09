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
<script src="layui/layui.js"></script>
<title>飞行计划查询</title>
</head>

<body>
	<div class="layui-fluid">
		<div class="layui-row">
			<div class="layui-col-xs12">
				<table class="layui-table">
					<colgroup>
    					<col width="50">
    					<col width="100">
    					<col width="100">
    					<col width="150">
    					<col width="100">
    					<col width="100">
    					<col width="100">
    					<col width="100">
    					<col width="100">
    					<col width="100">
  					</colgroup>
  					<thead>
    					<tr>
      						<th id="id">ID</th>
      						<th id="flightzone">区域名称</th>
      						<th id="city">申请地区</th>
      						<th id="useful">空域用途</th>
      						<th id="maxheight">最大高度</th>
      						<th id="onposition">起飞位置</th>
      						<th id="offposition">降落位置</th>
      						<th id="ontime">起飞时间</th>
      						<th id="offtime">降落时间</th>
      						<th id="istrue">申请是否通过</th>
    					</tr>
  					</thead>
				</table>
			</div>
		</div>
	</div>
	
	<script>
	//表格       
	layui.use('table', function(){
    var table = layui.table;
    });
  
	</script> 
</body>

</html>