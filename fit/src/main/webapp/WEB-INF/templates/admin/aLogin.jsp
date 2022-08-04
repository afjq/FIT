<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理员登录</title>
<script type="text/javascript"
	src="/webjars/jquery/3.2.1/dist/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/webjars/bootstrap/4.1.3/css/bootstrap.min.css" />
<script src="/webjars/bootstrap/4.1.3/js/bootstrap.min.css"></script>
<link rel="stylesheet" type="text/css" href="/css/user/userlogin.css" />
</head>
<body>
	<div class="page">
		<div class="container">
			<div class="left">
				<div class="login"><h2>管理员登录</h2></div>
				<div class="eula">
					<h5>健身管理系统</h5><br>
					<a href="/user/toUserLogin">用户登录</a>&nbsp;&nbsp;&nbsp;
					<a href="/coach/toCoachLogin">教练登录</a>
				</div>
			</div>
			<div class="right">
				<svg viewBox="0 0 320 300">
					<defs>
						<linearGradient inkscape:collect="always" id="linearGradient"
						x1="13" y1="193.49992" x2="307" y2="193.49992"
						gradientUnits="userSpaceOnUse">
							<stop style="stop-color:#ff00ff;" offset="0" id="stop876" />
							<stop style="stop-color:#ff0000;" offset="1" id="stop878" />
						</linearGradient>
					</defs>
					<path
						d="m 40,120.00016 239.99984,-3.2e-4 c 0,0 24.99263,0.79932 25.00016,35.00016 0.008,34.20084 -25.00016,35 -25.00016,35 h -239.99984 c 0,-0.0205 -25,4.01348 -25,38.5 0,34.48652 25,38.5 25,38.5 h 215 c 0,0 20,-0.99604 20,-25 0,-24.00396 -20,-25 -20,-25 h -190 c 0,0 -20,1.71033 -20,25 0,24.00396 20,25 20,25 h 168.57143" />
					</svg>
				<div class="form">
					<form id="form1" action="${pageContext.request.contextPath }/admin/aLogin" method="post">
						<label for="adminPhone">管理员账号</label>
						<span style="color: red">${msg}</span><br>
						<input type="text" id="adminPhone" name="adminPhone">
						<p id="p1"></p>
						<label for="adminPsw">密码</label>
						<span style="color: red">${msg}</span>
						<input type="password" id="adminPsw" name="adminPsw">
						<p id="p2"></p> 
						<input type="submit" id="submit" value="登录">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>