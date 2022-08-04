<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.fit.domain.user.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>动作库</title>
<link rel="stylesheet" type="text/css" href="/css/showAct.css" />
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
	    <!-- 使用angular遍历输出 -->
		<ul>
			<c:forEach items="${requestScope.actList }" var="act">
				<div class="a-act">
					<li>
						<!-- 动作名称 -->
						<span>动作名称：${act.actName }</span></p>
						<!-- 动作图片 -->
						<span class="a-img">
							<c:if test="${act.actImg != null}">示图：
								<img alt="" src="/static/imgs/actImg/${act.actImg }">
							</c:if>
						</span></p>
						<!-- 动作描述 -->
						<span>描述：${act.actDesc }</span></br>
						<!-- 动作等级 -->
						<span>等级：${act.actGrade.gradeName }</span></br>
						<!-- 动作使用器械 -->
						<span>使用器械：${act.actFacility.facilityName }</span></br>
						<!-- 动作锻炼的肌肉 -->
						<span>
							锻炼部位：
							<ul>
								<c:forEach items="${act.muscleList }" var="actMuscle">
									<li>
										${actMuscle.muscleName }&nbsp;&nbsp;
									</li>
								</c:forEach>
							</ul>
						</span>
					</li>
				</div>
			</c:forEach>
		</ul>
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
	<script src="/webjars/angular/1.7.8/angular.min.js"></script>
</body>
</html>