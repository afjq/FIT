<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.fit.domain.coach.Coach"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="/webjars/jquery/3.2.1/dist/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/webjars/bootstrap/4.1.3/css/bootstrap.min.css" />
<script src="/webjars/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/showUser.css" />
<script type="text/javascript" src="/js/showAllCoachTrain.js"></script>
<link rel="stylesheet" type="text/css" href="/css/showAllCoachTrain.css" />
<link rel="stylesheet" type="text/css" href="/css/showTrain.css" />
<script type="text/javascript" src="/js/showTrain.js"></script>
<link rel="stylesheet" type="text/css" href="/css/index.css" />
<meta http-equiv="content-Type" content="text/html; charset=utf-8" />
<title>显示本教练课程主页面</title>
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
							href="/muscle/toShowMuscle" target="_self" class="item">健身肌肉库</a>
						<a href="#" target="_self" class="item">饮食查询</a> <a href="#"
							target="_self" class="item">健身知识</a> <a href="#" target="_self"
							class="item">健身视频</a> <a href="#" target="_self" class="item">健身工具</a>
						<a href="#" target="_self" class="item">下载APP</a>
					</div>
				</div>
				<!-- 用户登录按钮 -->
				<div class="left-login">
					<% Coach coach=(Coach)session.getAttribute("coach");
						    if(coach!=null){%>
					<div class="title">
						<ul>
							<li><img
								style="width: 30px; height: 30px; border-radius: 50%; overflow: hidden;"
								src="/static/imgs/coachImg/${coach.coachImg }">${coach.coachPhone }
								<ul class="home_ul">
									<li><a
										href="${pageContext.request.contextPath }/coach/showCoach?coachId=${coach.coachId}">个人中心</a></li>
									<li><a
										href="${pageContext.request.contextPath }/coach/update?coachId=${coach.coachId}">修改个人信息</a></li>
									<li><a
										href="${pageContext.request.contextPath }/coach/toUpdatePsw?">修改密码</a></li>
									<li><a href="/coach/outCoachLogin" id="loginout">退出登录</a></li>
								</ul></li>
						</ul>
					</div>
					<%}else{ %>
					<div class="login">
						<a href="/user/toUserLogin">登录</a>&nbsp;|&nbsp;<a
							href="/user/toUserRegist">注册</a>
					</div>
					<%} %>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<!-- 页面主体内容 -->
	<!-- 等级导航栏 -->
	<div class="t-left">
		<br> <br>
		<h2 class="menu-label">显示本教练课程主页面</h2>
		<br>

		<div class="menu-item-bd">
			<button class="anniu" style="background-color: #333333;">
				<a href="${pageContext.request.contextPath }/coach/showAllTrain"
					class="sort-item" title="肱二头肌怎么练/肱二头肌肌肉锻炼方法视频"
					style="height: 20px; width: 68px; display: inline-block;">展示课程</a>
			</button>
			<button class="anniu" style="background-color: #333333;">
				<a href="${pageContext.request.contextPath }/train/toAddTrain"
					class="sort-item" title="肱二头肌怎么练/肱二头肌肌肉锻炼方法视频"
					style="height: 20px; width: 68px; display: inline-block;">添加课程</a>
			</button>
			<button class="anniu" style="background-color: #333333;">
				<a
					href="${pageContext.request.contextPath }/coachOrder/getCoachOrder"
					class="sort-item" title="胸肌怎么练/胸肌肌肉锻炼方法视频"
					style="height: 20px; width: 68px; display: inline-block;">查看本教练订单</a>
			</button>
		</div>
	</div>
	<br>
	<br>
	</div>
	<div
		style="width: 2000px; border: 1px solid black; background-color: #ddd;">
		<div style="color: red"></div>
		<table width="50%" border="0" cellpadding="3" cellspacing="1"
			align="center" border="1">
			<tr>
				<td>序号</td>
				<td>课程名称</td>
				<td>课时</td>
				<td>价格</td>
				<td>课程描述</td>
				<td>图片展示</td>
				<td>任课教练</td>
			</tr>
			<c:forEach items="${requestScope.trainList }" var="train"
				varStatus="statu">
				<tr>
					<td>${statu.count }</td>
					<td>${train.trainName}</td>
					<td>${train.trainPeriod}</td>
					<td>${train.trainPrice}</td>
					<td>${train.trainDesc}</td>
					<td><img alt="" src="/static/imgs/trainImg/${train.trainImg}"
						style="with: 100px; height: 100px"></td>
					<td>${train.trainCoach.coachName}</td>
					<td><a
						href="${pageContext.request.contextPath }/train/deleteTrainById?trainId=${train.trainId }">删除</a></td>
				</tr>
			</c:forEach>

		</table>

		<div class="ep-pages">
			<span class="ep-pages-e5e5e5">首页</span> <span
				class="ep-pages-ctrl ep-pages-e5e5e5">&lt;</span> <a href="#"
				target="_self" class="current">1</a> <a href="#" target="_self">2</a>
			<a href="#" target="_self">3</a> <span>...</span> <a href="#"
				target="_self" class="ep-pages-ctrl">&gt;</a> <a href="#"
				target="_self">尾页</a>
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