<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
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
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.css" />
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=m13m1WknFGkeLFww8QqvTGwVixp40vtg"></script>
<script type="text/javascript" src="http://api.map.baidu.com/library/GeoUtils/1.2/src/GeoUtils_min.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.js"></script>
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>

<script type="text/javascript">
	$(function(){
		setInterval(function() {
			$.ajax({
				url:"getuva_info.do",
				type: "post",
				data: "username=<%=request.getAttribute("username")%>",
				success:function(data){
					var da=data.split(";");
					$("#pit").val(da[0]);
					$("#row").val(da[1]);
					$("#yaw").val(da[2]);
					$("#lon").val(da[3]);
					$("#lat").val(da[4]);
					$("#alt").val(da[5]);
				}
				
			});
		}, 1000)
	});
	
</script>
<title>实时监控</title>
</head>

<body>
	<div class="layui-side layui-bg-gray">
    	<div class="layui-side-scroll">
      		<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
			<div class="layui-row">
				<div class="layui-inline">
    				<label class="layui-form-label">俯仰角</label>
    				<div class="layui-input-inline">
      					<input type="text" name="pitch" autocomplete="off" class="layui-input" id="pit">
    				</div>
				</div>
			</div>
			<div class="layui-row">
				<div class="layui-inline">
    				<label class="layui-form-label">横滚角</label>
    				<div class="layui-input-inline">
      					<input type="text" name="roll" autocomplete="off" class="layui-input" id="row">
    				</div>
				</div>
			</div>
			<div class="layui-row">
				<div class="layui-inline">
    				<label class="layui-form-label">偏航角</label>
    				<div class="layui-input-inline">
      					<input type="text" name="yaw" autocomplete="off" class="layui-input" id="yaw">
    				</div>
				</div>
			</div>
			<div class="layui-row">
				<div class="layui-inline">
    				<label class="layui-form-label">经度</label>
    				<div class="layui-input-inline">
      					<input type="text" name="longitude" autocomplete="off" class="layui-input" id="lon">
    				</div>
				</div>
			</div>
			<div class="layui-row">
				<div class="layui-inline">
    				<label class="layui-form-label">纬度</label>
    				<div class="layui-input-inline">
      					<input type="text" name="latitude" autocomplete="off" class="layui-input" id="lat">
    				</div>
				</div>
			</div>
			<div class="layui-row">
				<div class="layui-inline">
    				<label class="layui-form-label">高度</label>
    				<div class="layui-input-inline">
      					<input type="text" name="altitude" autocomplete="off" class="layui-input" id="alt">
    				</div>
				</div>
			</div>
      	</div>
      </div>
	<div class="layui-body">
		<div id="allmap"></div>
	</div>
  	
<script src="js/trackmap.js"></script>
<!--  <script src="layui/layui.js"></script>-->
<script type="text/javascript">
	$(function(){
		setInterval(function() {
			$.ajax({
				url:"find_plane.do",
				type: "post",
				data:"username=<%=request.getAttribute("username")%>",
				success:function(info){
					addAllPlane(info);
				}
			});
		}, 1000)
	});
</script>
<script type="text/javascript">
	$(function(){
		$.ajax({
			url:"find_no_fly.do",
			success:function(event){
				AddNoFly(event);
				console.log(event);
			}
		});
	});
</script>
</body>

</html>	