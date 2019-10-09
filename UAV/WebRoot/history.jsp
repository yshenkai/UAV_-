<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link rel="stylesheet" href="layui/css/layui.css" media="all">
<title>历史记录</title>
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript">

</script>
</head>

<body>
	<div class="layui-fluid">
		<div class="layui-row">
			<form class="layui-form" action="">
				<div class="layui-form-item">
  					<div class="layui-col-xs8">
  						<div class="layui-col-xs6">
    					<div class="layui-inline">
  							<input type="text" class="layui-input" id="begintime" placeholder="2018-03-19 20:08:08">
						</div>
						</div>
						<div class="layui-col-xs6">
						<div class="layui-inline">
  							<input type="text" class="layui-input" id="endtime" placeholder="2018-03-19 20:08:08">
						</div>
						</div>
  					</div>
  					<div class="layui-col-xs2">
    					<button class="layui-btn layui-btn-radius layui-btn-normal" lay-submit lay-filter="formHistory">
							<i class="layui-icon" style="font-size: 20px; color: #FFFFF0;">&#xe615;</i>Search
						</button>
  					</div>
  				</div>
  			</form>	
		</div>
		<div class="layui-row">
			<div class="layui-col-xs12">
				<table class="layui-table" >
  					<thead>
    					<tr>
      						<th lay-data="{field:'id', width:80, sort: true, fixed: true}">编号</th>
      						<th lay-data="{field:'departure_time', width:160, sort: true}">起飞时间</th>
      						<th lay-data="{field:'landing_time', width:160, sort: true}">降落时间</th>
      						<th lay-data="{field:'departure_position', width:180}">起飞位置</th>
      						<th lay-data="{field:'landing_position', width:180}">降落位置</th>
    					</tr>
  					</thead>
  					<tbody>
  						<c:forEach items="${history_list}" var="list">
  							<tr>
  								<td>${list.username}</td>
  								<td>${list.startime}</td>
  								<td>${list.endtime }</td>
  								<td>Lon:${list.startLon},Lat:${list.startLat}</td>
  								<td>Lon:${list.endLon},Lat:${list.endLat}</td>
  							</tr>
  						</c:forEach>
  					</tbody>
				</table>
			</div>
		</div>
		
	</div>
	
	<script src="layui/layui.js"></script>
	<script>
	//日期
	
	layui.use(['form','laydate','table'], function(){
  	var form = layui.form
  	,table = layui.table
  	,laydate = layui.laydate;
  	
  	//DateTime
  	laydate.render({
    	elem: '#begintime' //开始时间
    	,type: 'datetime'
  		});
  	laydate.render({
    	elem: '#endtime' //结束时间
    	,type: 'datetime'
  		});
	});
	
  	//History监听提交
  	/*
  	form.on('submit(formHistory)', function(data){
    	layer.msg(JSON.stringify(data.field));
    	return false;
  		});
  	form.render();
	*/
	</script> 
</body>

</html>