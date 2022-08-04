<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.fit.domain.coach.Coach"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="/webjars/jquery/3.2.1/dist/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/webjars/bootstrap/4.1.3/css/bootstrap.min.css" />
<script src="/webjars/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/showUser.css" />
<script type="text/javascript" src="/js/showAllCoachTrain.js"></script>
<link rel="stylesheet" type="text/css" href="/css/showAllCoachTrain.css" />
<link rel="stylesheet" type="text/css" href="/css/index.css" />
<script src="/js/addTrain.js"></script>
<link rel="stylesheet" type="text/css" href="/css/addTrain.css" />
<link rel="stylesheet" type="text/css" href="/css/showTrain.css" />
<link rel="stylesheet" type="text/css" href="/css/index.css" />
<meta http-equiv="content-Type" content="text/html; charset=utf-8" />
<title>添加课程</title>
<script type="text/javascript">
function clear() {
	$("#file").remove();
	$('#myform')
			.prepend("<input type=\"file\" id=\"file\" name=\"file\"/>");
	$.imageFileVisible({
		wrapSelector : "#image-wrap1",
		fileSelector : "#file",
		width : 100,
		height : 100
	});
}
//图片显示插件
(function($) {
	$.imageFileVisible = function(options) {
		// 默认选项
		var defaults = {
			//包裹图片的元素
			wrapSelector : null,
			//<input type=file />元素
			fileSelector : null,
			width : '100%',
			height : 'auto',
			errorMessage : "不是图片"
		};
		// Extend our default options with those provided.
		var opts = $.extend(defaults, options);
		$(opts.fileSelector).on("change", function() {
			$("#image-wrap1").empty();
			var file = this.files[0];
			var imageType = /image.*/;
			if (file.size > 1024 * 500) {
				alert("请上传小于512k的图片");
				clear();
				return;
			}
			if (file.type.match(imageType)) {
				var reader = new FileReader();
				reader.onload = function() {
					var img = new Image();
					img.src = reader.result;
					$(img).width(opts.width);
					$(img).height(opts.height);
					$(opts.wrapSelector).append(img);
				};
				reader.readAsDataURL(file);
			} else {
				clear();
				alert(opts.errorMessage);
			}
		});
	};
})(jQuery);
$(document).ready(function(e) {
	//图片显示插件
	if (typeof FileReader == 'undefined')
		$("#destination").css({
			'background' : 'none'
		}).html('亲,您的浏览器还不支持HTML5的FileReader接口,无法使用图片本地预览,请更新浏览器获得最好体验');
	$.imageFileVisible({
		wrapSelector : "#image-wrap1",
		fileSelector : "#file",
		width : 100,
		height : 100
	});

	//获取展示的user信息
	$.ajax({
		//访问地址
		url : "/coach/addCoach",
		//访问方式，一般有GET或POST两种
		type : 'GET',
		//返回的数据格式，这个是可选参数，jquery回默认判断返回参数的类型
		dataType : 'json'
	})
	//成功后的处理函数,res为服务器返回的数据
	.done(function(coach) {
		//如果返回结果不为空
		if (coach != null) {
			$("#trianName").text(train.trianName);
			$("#gradeId").text(train.gradeId);
			$("#trainPeriod").text(train.trainPeriod);
			$("#trainDesc").text(train.trainDesc);
			$("#icon").attr('src', train.trainImg);
		}
	})
})
</script>
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
	<br>

<div class="table">
		<%-- <p style="color:red">${msg}</p><hr> --%>
		<h1>添加课程</h1>
		<form class="form-horizontal" action="/train/addTrain" enctype="multipart/form-data" method="post">
			<table>
				<tr>
					<td>课程名称：</td>
					<td><input type="text" name="trainName" id="trainName" class="required"/><span
						id="sp1" style="color: red">${msg}</span></td>
				</tr>
				<tr>
					<td>课程级别：</td>
					<td><select name="gradeId">
						<option selected="selected" value="1">初级</option>
						<option value="2">中级</option>
						<option value="3">高级</option>
						</select>
						</td>
				</tr>
				<tr>
					<td>训练时长：</td>
					<td><input type="text" name="trainPeriod" id="trainPeriod" class="required" /></td>
				</tr>
				<tr>
					<td>训练价格：</td>
					<td><input type="text" class="required" name="trainPrice" id="trainPrice"></td>
				</tr>
				<tr>
					<td>课程描述：</td>
					<td><input type="text" class="required" name="trainDesc" id="trainDesc"></td>
				</tr>
				<tr>
					<td>图片展示：</td>
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
					<td><button type="sumbit" id="addItem" class="btn btn-success">添加</button></td>
					<td><a href="${pageContext.request.contextPath}/coach/showAllCoachTrain?coachId=${coach.coachId}" 
								class="btn btn-danger">取消</a></td>
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
