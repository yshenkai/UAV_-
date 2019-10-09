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
<title>禁飞区查询</title>
</head>

<body>
	<div class="layui-fluid">
		<div class="layui-row">
			<div class="layui-col-xs12">
				<table class="layui-table">
					<colgroup>
    					<col width="100">
    					<col width="100">
    					<col width="200">
    					<col width="200">
    					<col>
  					</colgroup>
  					<thead>
    					<tr>
      						<th id="id">编号</th>
      						<th id="type">类型</th>
      						<th id="start_time">开始时间</th>
      						<th id="end_time">结束时间</th>
      						<th id="info">信息</th>
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