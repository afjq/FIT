<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<meta http-equiv="content-Type" content="text/html; charset=utf-8" />
<title>得到教练订单详情</title>
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
	<div
		style="width: 2000px; border: 1px solid black; background-color: #ddd;">
		<div style="color: red"></div>
		<a href="/coachOrder/getCoachOrder?coachId=${coach.coachId }">&lt;&lt;返回
		</a>
		<table width="50%" border="1" cellpadding="3" cellspacing="1"
			align="center" border="1">
			<tr>
				<td>序号</td>
				<td>课程名称</td>
				<td>课程价格</td>
			</tr>
			<c:forEach items="${requestScope.CoachOrderDetailList }"
				var="coachOrder" varStatus="statu">
				<tr>
					<td>${statu.count }</td>
					<td>${coachOrder.coDetailTrainName}</td>
					<td>${coachOrder.coDetailTrainPrice}</td>
			</c:forEach>
		</table>
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