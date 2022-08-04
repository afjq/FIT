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
<script src="/webjars/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/getTotalOrder.css" />
<link rel="stylesheet" type="text/css" href="/css/showUser.css" />
<script src="/js/getTotalOrder.js"></script>
<link rel="stylesheet" type="text/css" href="/css/showTrain.css" />
<link rel="stylesheet" type="text/css" href="/css/index.css" />
<title>getTotalOrder Page</title>
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
										src="/static/imgs/userImg/${requestScope.user.uImg }">${requestScope.user.uPhone }
										<ul class="home_ul">
											<li><a
												href="/user/userInfo?uPhone=${requestScope.user.uPhone}">个人中心</a></li>
											<li><a href="/car/toShowCar">我的购物车</a></li>
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
	<br>
	<br>
	<br>

	<div class="segmenting-line">
		<hr>
		<div>
			<span>查看所有订单</span>
		</div>
	</div>

	<div class="panel panel-info">
		<div class="panel-heading">
			<h5 class="panel-title"></h5>
			<button type="button" class="btn btn-default">
				<span class="add">添加</span>
			</button>
			<button type="button" class="btn btn-default">
				<span class="rest">返回</span>
			</button>
		</div>
		<table class="table table-hover table-striped">
			<form
				action="${pageContext.request.contextPath }/totalorder/getTotalOrder">
				<table class="table table-condensed">
					<thead>
						<tr>
							<td>序号</td>
							<td>课程教练</td>
							<td>订单创建时间</td>
						</tr>
						<tr ng-repeat="c in categories">
							<c:forEach items="${requestScope.totalOrderList }"
								var="totalOrder" varStatus="statu">
								<tr>
									<td>${statu.count }</td>
									<td>${totalOrder.totalOrderCoach.coachName }</td>
									<td>${totalOrder.totalOrderCreatetime }</td>
									<td><a
										href="${pageContext.request.contextPath }/torderdetail/getTOrderDetail?totalOrderId=${totalOrder.totalOrderId }">点我查看订单详情</a></td>
								</tr>
							</c:forEach>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<td colspan="10" style="text-align: right">现总计：10笔订单</td>
						</tr>
					</tfoot>
				</table>
			</form>
		</table>

		<br> <br> <br>

		<!-- 尾部页脚模块 -->
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