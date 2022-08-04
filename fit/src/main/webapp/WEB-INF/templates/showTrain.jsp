<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>训练计划</title>
<script type="text/javascript"
	src="/webjars/jquery/3.2.1/dist/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/showTrain.css" />

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
						<a href="/act/toShowAct" target="_self" class="item">健身动作库</a> <a
							href="/train/toShowTrain" target="_self" class="item">训练计划</a> <a
							href="/muscle/toShowMuscle" target="_self" class="item">健身肌肉库</a> <a href="#"
							target="_self" class="item">饮食查询</a> <a href="#" target="_self"
							class="item">健身知识</a> <a href="#" target="_self" class="item">健身视频</a>
						<a href="#" target="_self" class="item">健身工具</a> <a href="#"
							target="_self" class="item">下载APP</a>
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
	<!-- 页面主体内容 -->
	<div class="page">
		<!-- 等级导航栏 -->
		<div class="t-left">
			<h3>课程等级</h3>
			<ul class="grade">
				<c:forEach items="${requestScope.gradeList }" var="grade">
					<li><a href="/train/toShowTrain?gradeId=${grade.gradeId }">${grade.gradeName }</a></li>
				</c:forEach>
			</ul>
		</div>

		<!-- 默认显示初级训练 -->
		<div class="t-right">
			<ul class="train">
				<c:forEach items="${requestScope.trainList }" var="train">
					<div class="t-train">
						<ul>
							<li class="trainName">课程： ${train.trainName}</li>
							<!-- 训练名 -->
							<li class="trainPeriod">周期：${train.trainPeriod}</li>
							<!-- 训练周期 -->
							<%-- <li id="trainPrice">${train.trainPrice}</li> --%>
							<!-- 训练价格 -->
							<%-- <li id="trainName">${train.trainDesc}</li> --%>
							<!-- 训练描述 -->
							<li class="trainImg"><img
								src="/static/imgs/trainImg/${train.trainImg}" alt="图片瘦不见了"></li>
							<!-- 训练示例图片 -->
							<li class="trainGrade">级别：${train.trainGrade.gradeName}</li>
							<!-- 训练级别 -->
							<li class="trainCoach">教练：${train.trainCoach.coachName}</li>
							<!-- 训练教练 -->
							<li><a
								href="/train/toShowTrainDetail?trainId=${train.trainId }">训练详情</a></li>
						</ul>
					</div>
				</c:forEach>
			</ul>
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