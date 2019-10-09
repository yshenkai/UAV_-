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
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.css" />
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=m13m1WknFGkeLFww8QqvTGwVixp40vtg"></script>
<script type="text/javascript" src="http://api.map.baidu.com/library/GeoUtils/1.2/src/GeoUtils_min.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.js"></script>
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<title>实时监控</title>

</head>

<body>
	<div class="layui-body">
		<div id="allmap"></div>
	</div>
<script src="js/trackmap.js"></script>
<!-- <script src="layui/layui.js"></script> -->

<script type="text/javascript">
	$(function(){
		$.ajax({
			url:"find_no_fly.do",
			success:function(event){
				AddNoFly(event);
				//console.log(event);
			}
		});
	});
</script>

<script type="text/javascript">
	$(function(){
		setInterval(function() {
			$.ajax({
				url:"admin_realtime_monitor.do",
				success:function(info){
					addAllPlane(info);
				}
			});
		}, 1000)
	});
</script>
</body>

</html>	