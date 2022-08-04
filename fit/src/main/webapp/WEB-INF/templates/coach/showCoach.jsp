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
<link rel="stylesheet" type="text/css" href="/css/index.css" />
<link rel="stylesheet" type="text/css" href="/css/updateCoach.css" />
<script src="/js/updateCoach.js"></script>
<meta http-equiv="content-Type" content="text/html; charset=utf-8" />
<title>展示教练个人信息</title>
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
	<br>
	<div class="table">
		<h1>教练个人信息展示</h1>
		<form
			action="${pageContext.request.contextPath }/coach/updateCoach?coachId=${coach.coachId}"
			method="post">
			<table>
				<tr>
					<td>教练头像:</td>
					<td><img alt="图片丢失"
						src="/static/imgs/coachImg/${requestScope.coach.coachImg }"
						id="icon" style="with: 100px; height: 100px"></td>
				</tr>
				<tr>
					<td>电话:</td>
					<td>${requestScope.coach.coachPhone }</td>
				</tr>
				<tr>
					<td>姓名:</td>
					<td>${requestScope.coach.coachName }</td>
				</tr>
				<%-- <tr>
		         <td>密码:</td>
		         <td>${requestScope.coach.coachPsw }</td>
		       </tr> --%>
				<tr>
					<td>性别:</td>
					<td>${requestScope.coach.coachSex }</td>
				</tr>
				<tr>
					<td>教练简介:</td>
					<td>${requestScope.coach.coachInfo }</td>
				</tr>
				<tr>
					<td><a
						href="${pageContext.request.contextPath }/coach/showAllCoachTrain?coachId=${coach.coachId}">返回课程页面</a></td>
					<td><a
						href="${pageContext.request.contextPath }/coach/toCoachLogin?coachPhone=${coach.coachPhone}&coachPsw=${coach.coachPsw}">返回首页登录
					</a></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>