<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.fit.domain.admin.Admin"%>
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
<script type="text/javascript" src="/js/showAllCoach.js"></script>
<link rel="stylesheet" type="text/css" href="/css/showAllCoach.css" />
<link rel="stylesheet" type="text/css" href="/css/showTrain.css" />
<link rel="stylesheet" type="text/css" href="/css/index.css" />
<title>showAllCoach page</title>

<script type="text/javascript">
	function confirmd() {
		var msg = "确定删除该条数据？";
		if (confirm(msg) == true) {
			return true;
		} else {
			return false;
		}
	}
</script>
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
					<%
						String name = (String) session.getAttribute("adminPhone");
						if (name != null) {
					%>
					<div class="title">
						<ul>
							<li><img
								style="width: 30px; height: 30px; border-radius: 50%; overflow: hidden;"
								src="/static/imgs/gly.PNG">${admin.adminPhone }
								<ul class="home_ul">
									<li><a href="/admin/outAdminLogin" id="loginout">退出登录</a></li>
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
	<br>
	<br>
	<br>
	<div class="segmenting-line">
		<hr>
		<div>
			<span>查看所有教练</span>
		</div>
	</div>

	<div class="panel panel-info">
		<div class="panel-heading">
			<h5>
				<a href="${pageContext.request.contextPath }/coach/toAddCoach"><button
						id="addCoachitem" calss="btn btn-info" href="#" role="button">添加教练</button>&nbsp<a
					href="${pageContext.request.contextPath }/totalorder/getTotalOrder"><button
							id="findAllitem" calss="btn btn-info" href="#" role="button">查看所有订单</button></a>
					<a href="#"><button id="backitem" calss="btn btn-info" href="#"
							role="button">
							<a
								href="${pageContext.request.contextPath }/coach/showAllCoachshouye">
								返回上一页</a>
						</button></a>
					<div class="searchitem" align="center">
						<form
							action="${pageContext.request.contextPath }/coach/findByCoachName"
							method="post">
							<input type="text" name="search" placeholder="根据教练名查询"
								style="border: 1px solid #E6E6E6; height: 28px; width: 180px;">
							<button class="layui-btn layui-btn-sm">
								<i class="layui-icon">&#xe615;</i> 搜索
							</button>
						</form>
					</div> </a>
			</h5>
		</div>
		<div class="panel panel-info">
			<table class="table table-hover table-striped">
				<tr align="center">
					<th>序号</th>
					<th>账号</th>
					<th>姓名</th>
					<th>性别</th>
					<th>教练照片</th>
					<th>教练信息</th>
					<th>操作</th>
					<th>查看</th>
				</tr>
				<tr ng-repeat="c in categories">
					<c:forEach items="${requestScope.coachList }" var="coach"
						varStatus="statu">
						<tr align="center">
							<td>${statu.count }</td>
							<td>${coach.coachPhone}</td>
							<td>${coach.coachName}</td>
							<td>${coach.coachSex}</td>
							<td><c:if test="${coach.coachImg != null}">
									<img alt="图片瘦不见了"
										src="/static/imgs/coachImg/${coach.coachImg }" id="images"
										style="with: 100px; height: 100px">
								</c:if></td>
							<td>${coach.coachInfo }</td>
							<td><a href="deleteCoachById?coachId=${coach.coachId }">
									<button id="deleitem" calss="btn btn-info" role="button"
										onclick="return confirmd()">删除</button>
							</a></td>
							<td><a
								href="${pageContext.request.contextPath }/coach/showAllTrainCoach?coachId=${coach.coachId }">训练课程</a></td>
						</tr>
					</c:forEach>
				</tr>
			</table>
		</div>
	</div>

	<div align="center">
		<p>每页${pageInfo.pageSize}条 当前页${pageInfo.size}条
			${pageInfo.pageNum}/${pageInfo.pages}页 总条数${pageInfo.total}</p>
		<a
			href="${pageContext.request.contextPath }/coach/showAllCoach?page=1">首页</a>
		<c:if test="${pageInfo.hasPreviousPage==true}">
			<a
				href="${pageContext.request.contextPath }/coach/showAllCoach?page=${pageInfo.prePage}">上一页</a>
		</c:if>

		<c:if test="${pageInfo.hasPreviousPage==false}">
			<a>上一页</a>
		</c:if>
		<c:if test="${pageInfo.hasNextPage==true}">
			<a
				href="${pageContext.request.contextPath }/coach/showAllCoach?page=${pageInfo.nextPage}">下一页</a>
		</c:if>
		<c:if test="${pageInfo.hasNextPage==false}">
			<a>下一页</a>
		</c:if>
		<a
			href="${pageContext.request.contextPath }/coach/showAllCoach?page=${pageInfo.pages}">末页</a>
	</div>


	<!-- 尾部页脚模块 -->
	<!-- <div class="o-hiyd-footer">
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
		</div> -->
	 
</body>
</html>