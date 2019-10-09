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
<title>政策法规</title>
</head>

<body>
	<div class="layui-fluid">
		<div class="layui-row">
			<div class="layui-col-xs12">
				<ul class="layui-timeline">
  					<li class="layui-timeline-item">
    					<i class="layui-icon layui-timeline-axis">&#xe63f;</i>
    					<div class="layui-timeline-content layui-text">
      						<h3 class="layui-timeline-title">8月18日<!-- 可以插入jsp标签显示Java时间格式 --></h3>
      						<p>
        						为了规范无人驾驶航空器飞行及相关活动，维护国家安全、公共安全、飞行安全，促进行业健康可持续发展，
        						<br>国家空中交通管制委员会办公室组织起草了《无人驾驶航空器飞行管理暂行条例（征求意见稿）》
        						<br><a href="http://www.caac.gov.cn">中国民用航空局</a>
      						</p>
    					</div>
  					</li>
  					<li class="layui-timeline-item">
    					<i class="layui-icon layui-timeline-axis">&#xe63f;</i>
    					<div class="layui-timeline-content layui-text">
      						<h3 class="layui-timeline-title">8月16日</h3>
      						<p>为创新许可管理方式，鼓励新兴业态发展，满足企业合规经营需要，拓展无人机应用服务领域，
      						<br>民航局运输司起草了《民用无人驾驶航空器经营性飞行活动管理办法》 （以下简称《办法》 ）
      						<br><a href="http://www.caac.gov.cn/XXGK/XXGK/GFXWJ/201804/P020180409336678475193.pdf">民用无人驾驶航空器经营性飞行活动管理办法（暂行）</a>
      						</p>
    					</div>
  					</li>
  					<li class="layui-timeline-item">
    					<i class="layui-icon layui-timeline-axis">&#xe63f;</i>
    					<div class="layui-timeline-content layui-text">
      						<h3 class="layui-timeline-title">8月15日</h3>
      						<p>《征求意见稿》突破现行“所有飞行必须预先提出申请，经批准后方可实施”的规定，对部分运行场景的飞行计划申请与批复流程作出适当简化。
      						<br>微型无人机在禁止飞行空域外飞行，无需申请飞行计划；轻型、植保无人机在相应适飞空域内飞行，只需实时报送动态信息；
      						<br>轻型无人机在适飞空域上方不超过飞行安全高度飞行，具备一定条件的小型无人机在轻型无人机适飞空域及上方不超过飞行安全高度的飞行，只需申请飞行计划；
      						<br>国家无人机在飞行安全高度以下遂行作战战备、反恐维稳、抢险救灾等飞行任务，可适当简化飞行计划审批流程。
      						<br>同时，将紧急任务飞行申请时限由现行“1小时前”调整为“30分钟前”，为用户提供方便。
      						<br><a href="http://www.caac.gov.cn/XXGK/XXGK/GFXWJ/201601/P020170527591647559640.pdf">轻小无人机运行规定（试行）</a>
      						</p>
    					</div>
  					</li>
  					<li class="layui-timeline-item">
    					<i class="layui-icon layui-timeline-axis">&#xe63f;</i>
    					<div class="layui-timeline-content layui-text">
      					<div class="layui-timeline-title">过去</div>
    				</div>
  					</li>
				</ul>
			</div>
		</div>
	</div>
	
	<script src="layui/layui.js"></script>
</body>

</html>