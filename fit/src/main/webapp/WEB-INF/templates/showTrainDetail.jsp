<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${requestScope.train.trainName}详情</title>
<link rel="stylesheet" type="text/css" href="/css/showTrainDetail.css" />
</head>
<body>
	<!-- 头部导航栏模块 -->
	<div class="o-header2">
		<div class="o-header2_inner">
			<a href="/index" class="o-header_logo"> <img src="/imgs/logo.png">
			</a>
			<div class="o-header2_nav">
				<div data-hicms-tmpl="hiyd-nav">
					<div>
							<a href="/act/toShowAct" target="_self" class="item">健身动作库</a> <a href="/train/toShowTrain"
								target="_self" class="item">训练计划</a> <a href="/muscle/toShowMuscle" target="_self"
								class="item">健身肌肉库</a> <a href="#" target="_self" class="item">饮食查询</a>
							<a href="#" target="_self" class="item">健身知识</a> <a href="#"
								target="_self" class="item">健身视频</a> <a href="#" target="_self"
								class="item">健身工具</a> <a href="#" target="_self" class="item">下载APP</a>
						</div>
				</div>
				
				<!-- 用户登录按钮 -->
					<div class="left-login">
						<% String name=(String)session.getAttribute("uPhone");
						    if(name!=null){%>
						    <div class="title">
								<ul>
									<li><img
										style="width: 30px; height: 30px; border-radius: 50%; overflow: hidden;"
										src="/static/imgs/userImg/${user.uImg }">${user.uPhone }
										<ul class="home_ul">
											<li><a
												href="/user/userInfo?uPhone=${user.uPhone}">个人中心</a></li>
											<li><a href="/car/toShowCar">我的购物车</a></li>
											<li><a href="#">我的课程</a></li>
											<li><a href="/user/outUserLogin" id="loginout">退出登录</a></li>
										</ul></li>
								</ul>
							</div>
						        <%}else{ %>
						        <div class="login">
									<a href="/user/toUserLogin" >登录</a>&nbsp;|&nbsp;<a href="/user/toUserRegist">注册</a>
								</div>
						 <%} %>
					</div>
				
				
			</div>
		</div>
	</div>
	
	<div class="page">
		
		<!-- 等级导航栏 -->
		<div class="t-left">
			<h3>课程详情</h3>
			<a class="d-return" href="/train/toShowTrain">返回</a>
		</div>
		<div class="d-right">
			<form action="" method="post">
				<img src="/static/imgs/trainImg/${train.trainImg}" alt="图片瘦不见了">
				<!-- 训练宣传图 -->
				<h2>${requestScope.train.trainName}</h2>
				<!-- 训练名称 -->
				<h4>${train.trainDesc}</h4>
				<!-- 训练描述 -->

				<table>
					<tr>
						<th>训练级别</th>
						<td>${train.trainGrade.gradeName}</td>
					</tr>
					<tr>
						<th>授课课时</th>
						<td>${train.trainPeriod}周</td>
					</tr>
					<tr class="coachimg">
						<th>授课教练</th>
						<td>${train.trainCoach.coachName}<img alt="图片丢失"
							src="/static/imgs/coachImg/${train.trainCoach.coachImg}">
						</td>
					</tr>
					<tr>
						<th>教练简介</th>
						<td>${train.trainCoach.coachInfo}</td>
					</tr>
					<tr>
						<th>参考价格</th>
						<td>${train.trainPrice}RMB</td>
					</tr>
					<tr>
						<td colspan="2"><a
			href="/car/addIntoCar?trainPrice=${requestScope.train.trainPrice }&trainImg=${requestScope.train.trainImg}&trainName=${requestScope.train.trainName}">
			添加到购物车</a> <span>购物车数量为</span></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<!-- 页尾信息模块 -->
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
</body>
</html>