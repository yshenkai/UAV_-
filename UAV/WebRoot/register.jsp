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
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">

    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/login.css">
    <title>Register</title>
	<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
	<script type="text/javascript">
			$(function(){
				$("#register_username").blur(function(){
					console.log($("#register_username").val());
					$.ajax({
						url:"checkname.do",
						type:"post",
						data:"username="+$("#register_username").val(),
						success:function(event){
							$("#check_name_re").html(event);
							
						}
					});
				});
				$("#ack_password").blur(function(){
					
					if(($("#ack_password")).val()==($("#register_password").val())){
						$("#re_ack_password").html("密码前后输入相同");
					}else{
						$("#re_ack_password").html("密码前后输入不同");
					}
				});
			});
		
		
	</script>
</head>

<body>
    <div class="container">
        <div class="form row">
            <div class="form-horizontal col-xs-offset-3 col-md-offset-3" id="register_form">
                <h3 class="form-title">REGISTER</h3>
                <div class="col-xs-9 col-md-9">
                    <form class="form-group" action="toregister.do" method="post">
                        <div class="form-group">
                            <i class="fa fa-user fa-lg"></i>
                            <label for="register_username">用户名</label>
                            <input class="form-control required" type="text" placeholder="6-15位数字或字母" id="register_username" name="register_username"
                                 maxlength="20" /><span id="check_name_re"></span>
                        </div>
                        <div class="form-group">
                            <i class="fa fa-lock fa-lg"></i>
                            <label for="register_password">密码</label>
                            <input class="form-control required" type="password" placeholder="至少6位以上字母，数字和符号的组合" id="register_password" name="register_password"
                                maxlength="15" />
                        </div>
                        <div class="form-group">
                            <i class="fa fa-lock fa-lg"></i>
                            <label for="register_password">确认密码</label>
                            <input class="form-control required" type="password" placeholder="至少6位以上字母，数字和符号的组合" id="ack_password" name="ack_password"
                                maxlength="15" /><span id="re_ack_password"></span>
                        </div>
                        <div class="form-group">
                            <i class="fa fa-plane" aria-hidden="true"></i>
                            <label for="device_code">设备码</label>
                            <input class="form-control required" type="text" placeholder="153****234" id="device_code" name="device_code"
                                maxlength="20" />
                        </div>

                        <div class="form-group col-xs-offset-9 col-md-offset-9">
                            <input type="submit" class="btn btn-success pull-right" value="Sign Up" />
                            <input type="button" class="btn btn-primary pull-left" value="Back" onclick="history.go(-1);" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
    <script src="//cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
</body>

</html>