<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<title>JSP Page</title>
<script type="text/javascript"
	src="/webjars/jquery/3.2.1/dist/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/webjars/bootstrap/3.3.5/css/bootstrap.min.css" />
<script src="/webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/css/showAllCoachshouye.css" />
<link rel="stylesheet" type="text/css" href="/css/showUser.css" />
<script type="text/javascript" src="/js/showAllCoachshouye.js"></script>
<link rel="stylesheet" type="text/css" href="/css/showTrain.css" />
</head>
<body>
	<!-- 头部导航栏模块 -->
	<div class="o-header2">
		<div class="o-header2_inner">
			<a href="#" class="o-header_logo"> <img src="/imgs/logo.png">
			</a>
			<div class="o-header2_nav">
				<div data-hicms-tmpl="hiyd-nav">
					<div>
						<a href="/act/toShowAct" target="_self" class="item">健身动作库</a> <a
							href="/train/toShowTrain" target="_self" class="item">训练计划</a> <a
							href="/muscle/toShowMuscle" target="_self" class="item">健身肌肉库</a>
						<a href="#" target="_self" class="item">饮食查询</a> <a href="#"
							target="_self" class="item">健身知识</a> <a href="#" target="_self"
							class="item">健身视频</a> <a href="#" target="_self" class="item">健身工具</a>
						<a href="#" target="_self" class="item">下载APP</a>
					</div>
				</div>
				<div class="user menu item">
					<a href="/user/toUserLogin">登录</a>&nbsp;|&nbsp;<a
						href="/user/toUserRegist">注册</a>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<HR
		style="FILTER: progid:DXImageTransform.Microsoft.Shadow(color:#987cb9, direction:145, strength:15)"
		width="80%" color=#987cb9 SIZE=1>
	<br>
	<br>

	<div class="divcss5">
		<div calss="div1">
			<a href="#" class="thumbnail"> <img src="/imgs/70.png"
				width="54%">
			</a>
			<div class="div2">
				<ul class="content">
					<li class="all">序号:1</li>
					<li class="all">姓名:胖胖胖</li>
					<li class="all">性别:男</li>
					<li class="all">入职:3年</li>
					<li class="all">简介:广西科技师范学院 <br> 首席设计师拥有丰富的健身 <br>
						教练经验，曾代表我校获得 <br> 大大小小奖项,圆你健身梦！
						<button id="finditem" calss="btn btn-info" href="#" role="button">
							<a href="${pageContext.request.contextPath }/coach/showAllCoach">查看详情</a>
						</button></li>
				</ul>
			</div>
		</div>
		<div calss="div1">
			<a href="#" class="thumbnail"> <img src="/imgs/711.png"
				width="54%">
			</a>

			<div class="div2">
				<ul class="content">
					<li class="all">序号:1</li>
					<li class="all">姓名:胖胖胖</li>
					<li class="all">性别:男</li>
					<li class="all">入职:3年</li>
					<li class="all">简介:广西科技师范学院 <br> 首席设计师拥有丰富的健身 <br>
						教练经验，曾代表我校获得 <br> 大大小小奖项,圆你健身梦！
						<button id="finditem" calss="btn btn-info" href="#" role="button">
							<a href="${pageContext.request.contextPath }/coach/showAllCoach">查看详情</a>
						</button></li>
				</ul>
			</div>
		</div>
		<div calss="div1">
			<a href="#" class="thumbnail"> <img src="/imgs/74.png"
				width="54%">
			</a>

			<div class="div2">
				<ul class="content">
					<li class="all">序号:1</li>
					<li class="all">姓名:胖胖胖</li>
					<li class="all">性别:男</li>
					<li class="all">入职:3年</li>
					<li class="all">简介:广西科技师范学院 <br> 首席设计师拥有丰富的健身 <br>
						教练经验，曾代表我校获得 <br> 大大小小奖项,圆你健身梦！
						<button id="finditem" calss="btn btn-info" href="#" role="button">
							<a href="${pageContext.request.contextPath }/coach/showAllCoach">查看详情</a>
						</button></li>
				</ul>
			</div>
		</div>

		<div calss="div1">
			<a href="#" class="thumbnail"> <img src="/imgs/74.png"
				width="54%">
			</a>
			<div class="div2">
				<ul class="content">
					<li class="all">序号:1</li>
					<li class="all">姓名:胖胖胖</li>
					<li class="all">性别:男</li>
					<li class="all">入职:3年</li>
					<li class="all">简介:广西科技师范学院 <br> 首席设计师拥有丰富的健身 <br>
						教练经验，曾代表我校获得 <br> 大大小小奖项,圆你健身梦！
						<button id="finditem" calss="btn btn-info" href="#" role="button">
							<a href="${pageContext.request.contextPath }/coach/showAllCoach">查看详情</a>
						</button></li>
				</ul>
			</div>
		</div>
		<div calss="div1">
			<a href="#" class="thumbnail"> <img src="/imgs/74.png"
				width="54%">
			</a>

			<div class="div2">
				<ul class="content">
					<li class="all">序号:1</li>
					<li class="all">姓名:胖胖胖</li>
					<li class="all">性别:男</li>
					<li class="all">入职:3年</li>
					<li class="all">简介:广西科技师范学院 <br> 首席设计师拥有丰富的健身 <br>
						教练经验，曾代表我校获得 <br> 大大小小奖项,圆你健身梦！
						<button id="finditem" calss="btn btn-info" href="#" role="button">
							<a href="${pageContext.request.contextPath }/coach/showAllCoach">查看详情</a>
						</button></li>
				</ul>
			</div>
		</div>
		<div calss="div1">
			<a href="#" class="thumbnail"> <img src="/imgs/74.png"
				width="54%">
			</a>
			<div class="div2">
				<ul class="content">
					<li class="all">序号:1</li>
					<li class="all">姓名:胖胖胖</li>
					<li class="all">性别:男</li>
					<li class="all">入职:3年</li>
					<li class="all">简介:广西科技师范学院 <br> 首席设计师拥有丰富的健身 <br>
						教练经验，曾代表我校获得 <br> 大大小小奖项,圆你健身梦！
						<button id="finditem" calss="btn btn-info" href="#" role="button">
							<a href="${pageContext.request.contextPath }/coach/showAllCoach">查看详情</a>
						</button></li>
				</ul>
			</div>

			<div calss="div1">
				<a href="#" class="thumbnail"> <img src="/imgs/74.png"
					width="54%">
				</a>
				<div class="div2">
					<ul class="content">
						<li class="all">序号:1</li>
						<li class="all">姓名:胖胖胖</li>
						<li class="all">性别:男</li>
						<li class="all">入职:3年</li>
						<li class="all">简介:广西科技师范学院 <br> 首席设计师拥有丰富的健身 <br>
							教练经验，曾代表我校获得 <br> 大大小小奖项,圆你健身梦！
							<button id="finditem" calss="btn btn-info" href="#" role="button">
								<a href="${pageContext.request.contextPath }/coach/showAllCoach">查看详情</a>
							</button></li>
					</ul>
				</div>

				<div calss="div1">
					<a href="#" class="thumbnail"> <img src="/imgs/74.png"
						width="54%">
					</a>
					<div class="div2">
						<ul class="content">
							<li class="all">序号:1</li>
							<li class="all">姓名:胖胖胖</li>
							<li class="all">性别:男</li>
							<li class="all">入职:3年</li>
							<li class="all">简介:广西科技师范学院 <br> 首席设计师拥有丰富的健身 <br>
								教练经验，曾代表我校获得 <br> 大大小小奖项,圆你健身梦！
								<button id="finditem" calss="btn btn-info" href="#"
									role="button">
									<a
										href="${pageContext.request.contextPath }/coach/showAllCoach">查看详情</a>
								</button></li>
						</ul>
					</div>

					<div calss="div1">
						<a href="#" class="thumbnail"> <img src="/imgs/74.png"
							width="54%">
						</a>
						<div class="div2">
							<ul class="content">
								<li class="all">序号:1</li>
								<li class="all">姓名:胖胖胖</li>
								<li class="all">性别:男</li>
								<li class="all">入职:3年</li>
								<li class="all">简介:广西科技师范学院 <br> 首席设计师拥有丰富的健身 <br>
									教练经验，曾代表我校获得 <br> 大大小小奖项,圆你健身梦！
									<button id="finditem" calss="btn btn-info" href="#"
										role="button">
										<a
											href="${pageContext.request.contextPath }/coach/showAllCoach">查看详情</a>
									</button></li>
							</ul>
						</div>
					</div>
				</div>


				<!-- 尾部页脚模块 -->
				<div class="bottom">
					<div class="o-hiyd-footer">
						<div class="o-footer-row">
							<a class="footer-nav-link" href="#" targer="_blank">关于我们</a>| <a
								class="footer-nav-link" href="#" targer="_blank">友情链接</a>| <a
								class="footer-nav-link" href="#" targer="_blank">网站地图</a>| <a
								class="footer-nav-link" href="#" targer="_blank">欢迎加盟</a>| <a
								class="footer-nav-link" href="#" targer="_blank">手机版本</a>| <span>
								KeShiFit (C) 2019 www.keshifit.com 版权所有 广西科技师范学院 软件开发162 科师健身组</span>
						</div>
						<div class="o-footer-row">
							<span>中文网 （2019）8888-666号</span>| <span>科ICP备163012200号</span>
						</div>
					</div>
				</div>
</body>
</html>