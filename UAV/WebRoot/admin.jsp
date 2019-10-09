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
<link rel="stylesheet" href="layui/css/layui.css">
<title>UAV~Administrator</title>
</head>

<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">无人机管理平台</div>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          <img src="http://t.cn/RCzsdCq" class="layui-nav-img">管理员用户名${adminname}
        </a>
      </li>
      <li class="layui-nav-item"><a href="adminlogin.jsp">退出登录</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree" lay-filter="adminmain">
        <li class="layui-nav-item layui-nav-itemed">
          <a href="javascript:;">飞行记录</a>
          <dl class="layui-nav-child">
            <dd id="realtime_monitor"><a href="javascript:;"><i class="layui-icon">&#xe715;</i>实时监控</a></dd>
            <dd id="history"><a href="javascript:;"><i class="layui-icon">&#xe705;</i>历史记录</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item layui-nav-itemed">
          <a href="javascript:;">飞行计划</a>
          <dl class="layui-nav-child">
            <dd id="flightsearch"><a href="javascript:;"><i class="layui-icon">&#xe615;</i>飞行计划查询</a></dd>
            <dd id="flightapprove"><a href="javascript:;"><i class="layui-icon">&#xe62a;</i>飞行计划审批</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item layui-nav-itemed">
          <a href="javascript:;">禁飞区</a>
          <dl class="layui-nav-child">
            <dd id="set_nofly"><a href="javascript:;"><i class="layui-icon">&#xe631;</i>禁飞区报备</a></dd>
            <dd id="noflysearch"><a href="javascript:;"><i class="layui-icon">&#xe615;</i>禁飞区查询</a></dd>
          </dl>
        </li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <iframe id="matter1" src="admin_realtime.do" style="display: block;overflow: auto;" scrolling="no" frameborder="0" width="100%" height="100%"></iframe>
    <iframe id="matter2" src="history.jsp" style="display: none;overflow: auto;" scrolling="yes" frameborder="0" width="100%" height="100%"></iframe>
    <iframe id="matter3" src="flight.jsp" style="display: none;overflow: auto;" scrolling="yes" frameborder="0" width="100%" height="100%"></iframe>
    <iframe id="matter4" src="flight.jsp" style="display: none;overflow: auto;" scrolling="yes" frameborder="0" width="100%" height="100%"></iframe>
    <iframe id="matter5" src="set_nofly.jsp" style="display: none;overflow: auto;" scrolling="no" frameborder="0" width="100%" height="100%"></iframe>
    <iframe id="matter6" src="flight.jsp" style="display: none;overflow: auto;" scrolling="yes" frameborder="0" width="100%" height="100%"></iframe>
  </div>
  
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    ©2018 上海海事大学-信息工程学院-无人机管理平台
  </div>
</div>

<script src="layui/layui.js"></script>
<script src="js/trackmap.js"></script>

<script src="js/jquery-1.11.1.js"></script>
<script>
$(document).ready(function(){
	var temp = "none";
	$("#realtime_monitor").click(function(){openMatter(1);});
	$("#history").click(function(){openMatter(2);});
	$("#flightsearch").click(function(){openMatter(3);});
	$("#flightapprove").click(function(){openMatter(4);});
	$("#set_nofly").click(function(){openMatter(5);});
	$("#noflysearch").click(function(){openMatter(6);});
	function openMatter(obj){
		for(var i = 1; i < 7; i++){
			if(i == obj){
				temp = "block";
			}else{
				temp = "none";
			}
			document.getElementById("matter" + i).style.display = temp;
		}
	}
});

//导航栏跳转
layui.use('element', function(){
	var element = layui.element;
	//监听导航点击
	element.on('nav(adminmain)', function(elem) {
	//console.log(elem)
	
	}); 
});
</script>
</body>

</html>