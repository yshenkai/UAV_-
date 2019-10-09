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
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link rel="stylesheet" href="layui/css/layui.css" media="all">
<title>飞行计划申请</title>
</head>

<body>
	<div class="layui-fluid">
		<div class="layui-row">
			<div class="layui-col-xs6">
				<form class="layui-form" action="">
					<div class="layui-form-item">
						<label class="layui-form-label"><i class="layui-icon">&#xe609;</i>区域名称</label>
						<div class="layui-input-block">
							<input type="text" name="flightzone" required
								lay-verify="required" placeholder="请输入飞行区名称" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label"><i class="layui-icon">&#xe715;</i>申请地区</label>
						<div class="layui-input-block">
							<select name="city" lay-verify="required">
								<option value=""></option>
								<option value="0">北京</option>
								<option value="1">上海</option>
								<option value="2">广州</option>
								<option value="3">深圳</option>
								<option value="4">杭州</option>
							</select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label"><i class="layui-icon">&#xe63c;</i>空域用途</label>
						<div class="layui-input-block">
							<input type="text" name="useful" required lay-verify="required"
								autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label"><i class="layui-icon">&#xe604;</i>最大高度</label>
						<div class="layui-input-block">
							<input type="text" name="maxheight" required
								lay-verify="required" placeholder="请输入最大飞行高度" autocomplete="off"
								class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label"><i class="layui-icon">&#xe715;</i>起飞位置</label>
						<div class="layui-input-block">
							<input type="text" name="onposition" required
								lay-verify="required" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label"><i class="layui-icon">&#xe715;</i>降落位置</label>
						<div class="layui-input-block">
							<input type="text" name="offposition" required
								lay-verify="required" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label"><i class="layui-icon">&#xe637;</i>起飞时间</label>
						<div class="layui-input-block">
							<input type="text" name="ontime" required autocomplete="off"
								class="layui-input" lay-verify="date">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label"><i class="layui-icon">&#xe637;</i>降落时间</label>
						<div class="layui-input-block">
							<input type="text" name="offtime" required autocomplete="off"
								class="layui-input" lay-verify="date">
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-inline">
							<button class="layui-btn" lay-submit lay-filter="formApply">立即提交</button>
							<button type="reset" class="layui-btn layui-btn-primary">重置</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script src="layui/layui.js" charset="utf-8"></script>
	<script>
		layui.use('form', function() {
			var form = layui.form;
			form.render();
		});
	</script>
</body>

</html>