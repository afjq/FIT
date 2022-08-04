<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>订单确认</title>
<link rel="stylesheet" type="text/css" href="/css/user/myCar.css" />
<link rel="stylesheet" type="text/css" href="/css/confirmOrder.css" />
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
					<%
						String name = (String) session.getAttribute("uPhone");
						if (name != null) {
					%>
					<div class="title">
						<ul>
							<li><img
								style="width: 30px; height: 30px; border-radius: 50%; overflow: hidden;"
								src="/static/imgs/userImg/${user.uImg }">${user.uPhone }
								<ul class="home_ul">
									<li><a
										href="/user/userInfo?uPhone=${user.uPhone}">个人中心</a></li>
									<li><a href="/car/toShowCar">我的购物车</a></li>
									<li><a href="/user/outUserLogin" id="loginout">退出登录</a></li>
								</ul></li>
						</ul>
					</div>
					<%
						} else {
					%>
					<div class="login">
						<a href="/user/toUserLogin">登录</a>&nbsp;|&nbsp;<a
							href="/user/toUserRegist">注册</a>
					</div>
					<%
						}
					%>
				</div>

			</div>
		</div>
	</div>
	<div class="span">
		<span>订单编号：${requestScope.shopOrder.shoporderId }</span>
	</div>
	<div class="panel">
		<table id="orderTable">
			<tr>
				<th>序号</th>
				<th>课程名称</th>
				<th>单价</th>
			</tr>
			<c:forEach items="${requestScope.uODetailList }" var="uOdetail"
				varStatus="status">
				<tr>
					<td>${status.count }</td>
					<td>${uOdetail.uoDetailTrainName }</td>
					<td>${uOdetail.uoDetailTrainPrice }</td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<div class="orderFoot">
		<span>合计：${requestScope.shopOrder.shoporderPrice }</span><br> <a
			href="/alipay/toPay?orderId=${requestScope.shopOrder.shoporderId }&price=${requestScope.shopOrder.shoporderPrice }">确认支付</a>
	</div>
</body>
</html>