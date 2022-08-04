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
<script type="text/javascript" src="/js/showAllCoachTrain.js"></script>
<link rel="stylesheet" type="text/css" href="/css/showTrain.css" />
<script type="text/javascript" src="/js/showTrain.js"></script>
 <link rel="stylesheet" type="text/css" href="/css/index.css" />
<title>Insert title here</title>

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
						<a href="#" target="_self" class="item">健身动作库</a> <a
							href="/train/toShowTrain" target="_self" class="item">训练计划</a> <a
							href="#" target="_self" class="item">健身肌肉库</a> <a href="#"
							target="_self" class="item">饮食查询</a> <a href="#" target="_self"
							class="item">健身知识</a> <a href="#" target="_self" class="item">健身视频</a>
						<a href="#" target="_self" class="item">健身工具</a> <a href="#"
							target="_self" class="item">下载APP</a>
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
										src="/static/imgs/${requestScope.user.uImg }">${requestScope.user.uPhone }
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
	<!-- 页面主体内容 -->
	<!-- 等级导航栏 -->
	<div class="t-left">
		<br> <br>
		<h2 class="menu-label">健身视频</h2>
		<br>

		<div class="menu-item-bd">
			<button class="anniu" style="background-color: #333333;">
				<a href="http://localhost:8080/web/showTrain" class="sort-item select"
					style="height: 20px; width: 68px; display: inline-block;">不限部位</a>
			</button>
			</button>
			<button class="anniu" style="background-color: #333333;">
				<a href="http://localhost:8080/web/gongertouji" class="sort-item" title="肱二头肌怎么练/肱二头肌肌肉锻炼方法视频"
					style="height: 20px; width: 68px; display: inline-block;">肱二头肌</a>
			</button>
			<button class="anniu" style="background-color: #333333;">
				<a href="http://localhost:8080/web/xiongji" class="sort-item" title="胸肌怎么练/胸肌肌肉锻炼方法视频"
					style="height: 20px; width: 68px; display: inline-block;">胸肌</a>
			</button>
			<button class="anniu" style="background-color: #333333;">
				<a href="#" class="sort-item" title="前臂怎么练/前臂肌肉锻炼方法视频"
					style="height: 20px; width: 68px; display: inline-block;">前臂</a>
			</button>
			<button class="anniu" style="background-color: #333333;">
				<a href="#" class="sort-item" title="中背部怎么练/中背部肌肉锻炼方法视频"
					style="height: 20px; width: 68px; display: inline-block;">中背部</a>
			</button>
			<button class="anniu" style="background-color: #333333;">
				<a href="#" class="sort-item" title="下背部怎么练/下背部肌肉锻炼方法视频"
					style="height: 20px; width: 68px; display: inline-block;">下背部</a>
				<button class="anniu" style="background-color: #333333;">
					<a href="#" class="sort-item" title="颈部怎么练/颈部肌肉锻炼方法视频"
						style="height: 20px; width: 68px; display: inline-block;">颈部</a>
				</button>
				<button class="anniu" style="background-color: #333333;">
					<a href="#" class="sort-item" title="股四头肌怎么练/股四头肌肌肉锻炼方法视频"
						style="height: 20px; width: 68px; display: inline-block;">股四头肌</a>
				</button>
				<button class="anniu" style="background-color: #333333;">
					<a href="#" class="sort-item" title="腘绳肌怎么练/腘绳肌肌肉锻炼方法视频"
						style="height: 20px; width: 68px; display: inline-block;">腘绳肌</a>
				</button>
				<button class="anniu" style="background-color: #333333;">
					<a href="#" class="sort-item" title="小腿群肌怎么练/小腿群肌肌肉锻炼方法视频"
						style="height: 20px; width: 68px; display: inline-block;">小腿群肌</a>
				</button>
				<button class="anniu" style="background-color: #333333;">
					<a href="#" class="sort-item" title="斜方肌怎么练/斜方肌肌肉锻炼方法视频"
						style="height: 20px; width: 68px; display: inline-block;">斜方肌</a>
				</button>
				<button class="anniu" style="background-color: #333333;">
					<a href="#" class="sort-item" title="背部怎么练/背部肌肉锻炼方法视频"
						style="height: 20px; width: 68px; display: inline-block;">背部</a>
				</button>
				<button class="anniu" style="background-color: #333333;">
					<a href="#" class="sort-item" title="腹肌怎么练/腹肌肌肉锻炼方法视频"
						style="height: 20px; width: 68px; display: inline-block;">腹肌</a>
				</button>
				<button class="anniu" style="background-color: #333333;">
					<a href="#" class="sort-item" title="臀部肌群怎么练/臀部肌群肌肉锻炼方法视频"
						style="height: 20px; width: 68px; display: inline-block;">臀部肌群</a>
				</button>
				<button class="anniu" style="background-color: #333333;">
					<a href="#" class="sort-item" title="内收肌群怎么练/内收肌群肌肉锻炼方法视频"
						style="height: 20px; width: 68px; display: inline-block;">内收肌群</a>
				</button>
				<button class="anniu" style="background-color: #333333;">
					<a href="#" class="sort-item" title="外展肌群怎么练/外展肌群肌肉锻炼方法视频"
						style="height: 20px; width: 68px; display: inline-block;">外展肌群</a>
				</button>
				<button class="anniu" style="background-color: #333333;">
					<a href="#" class="sort-item" title="背阔肌怎么练/背阔肌肌肉锻炼方法视频"
						style="height: 20px; width: 68px; display: inline-block;">背阔肌</a>
				</button>
				<button class="anniu" style="background-color: #333333;">
					<a href="#" class="sort-item" title="肱二头肌怎么练/肱二头肌肌肉锻炼方法视频"
						style="height: 20px; width: 68px; display: inline-block;">肱二头肌</a>
				</button>
				<button class="anniu" style="background-color: #333333;">
					<a href="#" class="sort-item" title="髂腰肌怎么练/髂腰肌肌肉锻炼方法视频"
						style="height: 20px; width: 68px; display: inline-block;">髂腰肌</a>
				</button>
		</div>
	</div>
	<br>
	<br>

	<h3>肱二头肌：</h3>
	<div class="videoList">
		<div class="videoshow">
			<br> <img
				src="/imgs/muscle/20161028_0424c3f20ffe8dbcf3882efc6120eda7.jpg"
				style="width: 270px; height: 250px; align: center;"> <br>
			<div class="a1">
				<p><a href="http://localhost:8080/web/gongertoujivideo" style="text-decoration:none; color:#808080;">绳索坐姿肩上弯举</a></p>
			</div>
		</div>

		<div class="videoshow">
			<br> <img
				src="/imgs/muscle/24f27c7110e8d21257f549ddf10ae181.jpg"
				style="width: 270px; height: 250px; align: center;"> <br>
			<div class="a1">
				<p><a href="#" style="text-decoration:none;color:#808080;">绳索坐姿肩上弯举</a></p>
			</div>

		</div>

		<div class="videoshow">
			<br> <img
				src="/imgs/muscle/3e251de5e2810913506dcd1c9762ed88.jpg"
				style="width: 270px; height: 250px; align: center;"> <br>
			<div class="a1">
				<p><a href="#" style="text-decoration:none;color:#808080;">哑铃直臂卷举</a></p>
			</div>

		</div>

		<div class="videoshow">
			<br> <img
				src="/imgs/muscle/5fe55eb2f006f25f6df7bc488d43e214.jpg"
				style="width: 270px; height: 250px; align: center;"> <br>
			<div class="a1">
				<p><a href="#" style="text-decoration:none;color:#808080;">仰卧窄握高位直杆弯举</a></p>
			</div>

		</div>
		<div class="videoshow">
			<br> <img
				src="/imgs/muscle/7e277cdb954443ea8fefaaa35e846453.jpg"
				style="width: 270px; height: 250px; align: center;"> <br>
			<div class="a1">
				<p><a href="#" style="text-decoration:none;color:#808080;">仰卧窄握高位直杆弯举</a></p>
			</div>
		</div>
	</div>



	<div class="videoList">
		<div class="videoshow">
			<br> <img
				src="/imgs/muscle/8cf018471f1e47fb67bc2a4819c0559a.jpg"
				style="width: 270px; height: 250px; align: center;"> <br>
			<div class="a1">
				<p><a href="#" style="text-decoration:none;color:#808080;">仰卧窄握高位直杆弯举</a></p>
			</div>
		</div>

		<div class="videoshow">
			<br> <img
				src="/imgs/muscle/aa5f677ca1c4e779fc20287a1a16f0b7.jpg"
				style="width: 270px; height: 250px; align: center;"> <br>
			<div class="a1">
				<p><a href="#" style="text-decoration:none;color:#808080;">仰卧窄握高位直杆弯举</a></p>
			</div>

		</div>

		<div class="videoshow">
			<br> <img
				src="/imgs/muscle/d8f11a4650a1091ecb442babee3402e6.jpg"
				style="width: 270px; height: 250px; align: center;"> <br>
			<div class="a1">
				<p><a href="#" style="text-decoration:none;color:#808080;">仰卧窄握高位直杆弯举</a></p>
			</div>

		</div>

		<div class="videoshow">
			<br> <img
				src="/imgs/muscle/daf2d6a77c9593d058552b6ac2c97103.jpg"
				style="width: 270px; height: 250px; align: center;"> <br>
			<div class="a1">
				<p><a href="#" style="text-decoration:none;color:#808080;">仰卧窄握高位直杆弯举</a></p>
			</div>

		</div>
		<div class="videoshow">
			<br> <img
				src="/imgs/muscle/e4465e61e28fa44e8fc4a6e0b036e239.jpg"
				style="width: 270px; height: 250px; align: center;"> <br>
			<div class="a1">
				<p><a href="http://localhost:8080/web/showTrainvideo" style="text-decoration:none;color:#808080;">仰卧窄握高位直杆弯举</a></p>
			</div>
		</div>
	</div>

	<div class="ep-pages">
		<span class="ep-pages-e5e5e5">首页</span> <span
			class="ep-pages-ctrl ep-pages-e5e5e5">&lt;</span> <a href="#"
			target="_self" class="current">1</a> <a href="#" target="_self">2</a>
		<a href="#" target="_self">3</a> <span>...</span> <a href="#"
			target="_self" class="ep-pages-ctrl">&gt;</a> <a href="#"
			target="_self">尾页</a> 
	</div>

</body>
</html>