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
<link rel="stylesheet" type="text/css" href="/css/showUser.css" />
<script src="/js/addCoach.js"></script>
<script src="/js/jquery.validate.min.js"></script>
<script src="/js/messages_zh.js"></script>
<link rel="stylesheet" type="text/css" href="/css/addCoach.css" />
<link rel="stylesheet" type="text/css" href="/css/index.css" />
<title>addCoach page</title>
</head>
<body>

	<!-- 头部导航栏模块 -->
	<div class="o-header2">
		<div class="o-header2_inner">
			<a href="#" class="o-header_logo"> <img src="/imgs/logo.png"
				style="with: 200px; height: 40px">
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
	<br>

	<div class="table">
		<%-- <p style="color:red">${msg}</p><hr> --%>
		<h1>添加教练</h1>
		<form id="signupForm" class="form-horizontal" action="${pageContext.request.contextPath }/coach/addCoach"
						enctype="multipart/form-data" method="post">
			<table class="t1">
				<tr>
					<td>选择头像：</td>
					<td><div id="ImportHead">
							<table class="frm"
								style="height: 35px; width: auto; padding-left: 5px; padding-top: 1px;">
								<tr style="width: 100px; height: 100px;">
									<td><input type="file" id="file" name="file" />
										<div id="image-wrap1"
											style="width: 100px; height: 100px; border: solid 1px lightGray">
										</div></td>
								</tr>
							</table>
						</div></td>
				</tr>
				<tr>
					<td>教练账号：</td>
					<td><input type="text" name="coachPhone" id="coachPhone" class="required"/><span
						id="sp1" style="color: red">${msg}</span></td>
				</tr>
				<tr>
					<td>教练姓名：</td>
					<td><input type="text" name="coachName" id="coachName" class="required"/></td>
				</tr>
				<tr>
					<td>教练密码：</td>
					<td><input type="password" name="coachPsw" id="coachPsw" class="required" /></td>
				</tr>
				<tr>
					<td>确认密码：</td>
					<td><input type="password" class="required" name="confirm_coachPsw"
									id="confirm_coachPsw" onkeyup="validate()" ><span
									id="tishi"></span></td>
				</tr>
				<tr>
					<td>用户性别：</td>
					<td><input name="coachSex" type="radio" value="男" checked required><span
						class="left">男</span> <input name="coachSex" type="radio" value="女"><span
						class="left">女</span> <br></td>
				</tr>
				<tr>
					<td>教练信息：</td>
					<td><input type="text" name="coachInfo" id="coachInfo" class="required" /></td>
				</tr>
				<tr>
					<td><button type="sumbit" id="addItem" class="btn btn-success">添加</button></td>
					<td><a role="button" id="cancel" class="btn btn-danger" ui-sref="listCategories">取消</a></td>
				</tr>

			</table>
		</form>
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