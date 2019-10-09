<%@page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<!DOCTYPE html>
<html>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">

    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/login.css">
    <title>Login</title>

</head>

<body>
    <div class="container">
        <div class="form row">
            <div class="form-horizontal col-xs-offset-3 col-md-offset-3" id="login_form">
                <h3 class="form-title">LOGIN</h3>
                <div class="col-xs-9 col-md-9">
                    <form class="form-group" action="tologin.do" method="post">
                        <div class="form-group">
                            <i class="fa fa-user fa-lg"></i>
                            <input class="form-control required" type="text" placeholder="Username" id="username" name="username"
                                autofocus="autofocus" maxlength="20" value="${username}"/>
                        </div>
                        <div class="form-group">
                            <i class="fa fa-lock fa-lg"></i>
                            <input class="form-control required" type="password" placeholder="Password" id="password"
                                name="password" maxlength="15" value="${password}"/>
                        </div>
                        <div class="form-group">
                            <label class="checkbox">
                                <input type="checkbox" name="remember" value="1" />记住我
                            </label>
                        </div>
                        <div class="form-group col-xs-offset-9 col-md-offset-9">
                            <input type="submit" class="btn btn-primary pull-right" value="Login">
                        </div>
                        <a href="register.do" id="register_btn" class="pull-left">还没有账号？点我注册</a>
                        <a href="adminlogin.do" id="admin_btn" class="pull-right">管理员</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
    <script src="//cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
</body>

</html>