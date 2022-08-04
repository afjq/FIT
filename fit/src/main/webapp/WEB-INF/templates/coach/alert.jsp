<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>遮罩弹出窗口</title>
<meta charset="UTF-8">
<script type="text/javascript"
	src="/webjars/jquery/3.2.1/dist/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/webjars/bootstrap/4.1.3/css/bootstrap.min.css" />
<script src="/webjars/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/delete.css" />
<script src="/js/delete.js"></script>
</head>

<body>

	<div class="divShow">
		<input type="checkbox" id="chexkBox1"> <a href="#">这是一条可以删除的记录</a>
		<input id="button1" type="button" value="删除" class="btn">
	</div>
	<div class="mask"></div>
	<div class="dialog">
		<div class="title">
			<img alt="点击可以关闭" src="delete.gif" width="30px" height="30px;">
			删除时提示
		</div>
		<div class="content">
			<img alt="" src="delete.gif" width="60px" height="60px"> <span>你真的要删除这条记录吗？</span>
		</div>
		<div class="bottom">
			<input type="button" id="ok" value="确定" class="btn"> <input
				type="button" id="noOk" value="取消" class="btn">
		</div>
	</div>
</body>
</html>