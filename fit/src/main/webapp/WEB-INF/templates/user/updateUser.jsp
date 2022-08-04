<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.fit.domain.user.User"%>
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
<link rel="stylesheet" type="text/css" href="/css/updateuser.css" />
<script src="/js/updateUser.js"></script>
<script>
$(function(){
	var sex = '${requestScope.user.uSex }';
	if($.trim(sex) == $.trim("男")){
		$("#uSexMan").attr("checked","checked");
		$("#uSexWoman").removeAttr("checked");
	}else{
		$("#uSexWoman").attr("checked","checked");
		$("#uSexMan").removeAttr("checked");
	}
});
</script>
<meta http-equiv="content-Type" content="text/html; charset=utf-8" />
<title>修改用户个人信息</title>
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
						<% User user=(User)session.getAttribute("user");
						    if(user!=null){%>
						    <div class="title">
								<div class="title">
								<ul>
									<li><img
										style="width: 30px; height: 30px; border-radius: 50%; overflow: hidden;"
										src="/static/imgs/userImg/${user.uImg }">${user.uPhone }
										<ul class="home_ul">
											<li><a
												href="/user/userInfo?uPhone=${user.uPhone}">个人中心</a></li>
											<li><a 
										        href="${pageContext.request.contextPath }/user/update?uId=${user.uId}">修改个人信息</a></li>
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
	<div class="table">
	<h1>修改个人信息</h1>
	   <form action="/user/updateUser"	method="post">
		   <table>
		       <tr>
		         <td>我的头像:</td>
		         <td><img alt="图片丢失"
						src="/static/imgs/userImg/${requestScope.user.uImg }" id="icon"
						style="with: 100px; height: 100px"></td>
		       </tr>
		       <tr>
		         <td>用户帐号:</td>
		         <td><input type="text" name="uPhone" id="uPhone" value="${user.uPhone }"></td>
		       </tr>
		       <tr>
		         <td>用户名:</td>
		         <td><input type="text" name="uName" id="uName" value="${user.uName }"></td>
		       </tr>
<!-- 		       <tr> -->
<!-- 		         <td>密码:</td> -->
<%-- 		         <td><input type="password" name="uPsw" id="uPsw" value="${user.uPsw }"></td> --%>
<!-- 		       </tr> -->
		       <tr>
		         <td>性别:</td>
		         <td>
		         	<input id="uSexMan" name="uSex" type="radio" 	value="男"/>男  
		         	<input id="uSexWoman" name="uSex" type="radio"  value="女"/>女
		         </td>
		       </tr>
		       <tr>
		         <td>年龄:</td>
		         <td><input type="text" name="uAge" id="uAge" value="${user.uAge }"></td>
		       </tr>
		       <tr>
		         <td><button type="submit" class="btn btn-success">编辑</button></td>
		         <td><a href="${pageContext.request.contextPath}/user/userInfo?uPhone=${user.uPhone}" 
								class="btn btn-danger">取消</a></td>
		       </tr>
		   </table>		
	   </form>
	</div>
	<div id="ImportHead">
		<table border="0" class="frm" style="height: 35px; width: auto; padding-left: 5px; padding-top: 1px;">
			<tr style="width: 300px; height: 400px;">
				<th>选择新头像：</th>
				<td>
					<form action="${pageContext.request.contextPath }/user/updateUImg?uId=${user.uId}" method="post" enctype="multipart/form-data">
						<input type="file" id="file" name="file" /> <input type="submit" value="上传" />
						<div id="image-wrap1" style="width: 300px; height: 300px; border: solid 1px lightGray">
						</div>
					</form>
				</td>
			</tr>
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