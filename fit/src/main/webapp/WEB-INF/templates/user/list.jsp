<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="/webjars/jquery/3.2.1/dist/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/webjars/bootstrap/4.1.3/css/bootstrap.min.css" />
<script type="text/javascript"
	src="/webjars/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/showUser.css" />
<link rel="stylesheet" type="text/css" href="/css/list.css" />
<link rel="stylesheet" type="text/css" href="/css/index.css" />
</head>
<body>
<body>
	<!-- 头部导航栏模块 -->
	<div class="o-header2">
		<div class="o-header2_inner">
			<a href="/index" class="o-header_logo"> <img src="/imgs/logo.png">
			</a>
			<div class="o-header2_nav">
				<div data-hicms-tmpl="hiyd-nav">
					<div>
						<a href="#" target="_self" class="item">健身动作库</a> <a
							href="/train/toShowTrain" target="_self" class="item">训练计划</a> <a
							href="#" target="_self" class="item">健身肌肉库</a> <a href="#"
							target="_self" class="item">饮食查询</a> <a href="#" target="_self"
							class="item">健身知识</a> <a href="#" target="_self" class="item">健身视频</a>
						<a href="#" target="_self" class="item">健身工具</a> <a href="#"
							target="_self" class="item">下载APP</a>
					</div>
				</div>
				<div class="title">
					<ul>
						<li><img  style="width:50px; height:50px; border-radius:50%; overflow:hidden;" src="/static/imgs/${requestScope.user.uImg }">${requestScope.user.uPhone }
							<ul class="home_ul">
								<li><a href="/user/userInfo?uPhone=${requestScope.user.uPhone}">个人中心</a></li>
								<li><a href="#">我的VIP</a></li>
								<li><a href="/user/outUserLogin">退出登录</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</div>

		<!-- <div class="title" >
		<ul>
			<li><a href=""><img src="/imgs/img4.PNG">Alber</a>
				<ul class="home_ul">
					<li><a href="#">个人中心</a></li>
					<li><a href="#">我的VIP</a></li>
					<li><a href="#">退出登录</a></li>
				</ul>
			</li>
		</ul>
		</div> -->
</body>
</html>