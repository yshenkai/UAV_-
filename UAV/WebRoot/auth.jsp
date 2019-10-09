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
<title>用户认证</title>
</head>

<body>
	<div class="layui-fluid">
		<div class="layui-row">
			<div class="layui-col-xs6">
				<form class="layui-form layui-form-pane" action="">
					<div class="layui-form-item">
						<label class="layui-form-label">姓名</label>
						<div class="layui-input-block">
							<input type="text" name="yourname" required lay-verify="required"
								placeholder="YourName" autocomplete="off" class="layui-input">
							<div class="layui-form-mid layui-word-aux">请输入你的真实姓名</div>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">身份证</label>
						<div class="layui-input-block">
							<input type="text" name="idcard" required lay-verify="required"
								placeholder="IDCard" autocomplete="off" class="layui-input">
							<div class="layui-form-mid layui-word-aux">请输入你的二代身份证</div>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">驾驶证</label>
						<div class="layui-input-block">
							<input type="text" name="drivecard" required lay-verify="required" 
								placeholder="DriveCard" autocomplete="off" class="layui-input">
							<div class="layui-form-mid layui-word-aux">请输入你的驾驶证</div>
						</div>
					</div>
					<div class="layui-form-item" pane>
						<label class="layui-form-label">有效期</label>
						<div class="layui-input-block">
							<input type="radio" name="deadline" value="long" title="长期"
								checked> <input type="radio" name="deadline"
								value="short" title="即将到期">
						</div>
					</div>
					<div class="layui-form-item" pane>
						<label class="layui-form-label">同意</label>
						<div class="layui-input-block">
							<input type="checkbox" name="switch" lay-skin="switch"
								lay-text="ON|OFF" checked>
						</div>
					</div>
					<div class="layui-form-item" pane>
						<label class="layui-form-label">有效证件</label>
						<div class="layui-upload-drag layui-input-block" id="upfile">
							<i class="layui-icon">&#xe67c;</i>
							<p>点击上传，或将文件拖拽到此处</p>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-inline">
							<button class="layui-btn" lay-submit lay-filter="formAuth">立即提交</button>
							<button type="reset" class="layui-btn layui-btn-primary">重置</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="layui/layui.js"></script>
	<script>
	layui.use('upload', function(){
  		var $ = layui.jquery, upload = layui.upload;
		//拖拽上传
  		upload.render({
    		elem: '#upfile'
    		,url: '上传的文件的url'
    		,done: function(res){
      			console.log(res)
    		}
  		});
  	});
  	
	layui.use(['layer', 'form'], function(){
  		var form = layui.form;
  		form.render();
	});
	</script>
</body>

</html>