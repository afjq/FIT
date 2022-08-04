<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome~）</title>
<script type="text/javascript"
	src="/webjars/jquery/3.2.1/dist/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/webjars/bootstrap/4.1.3/css/bootstrap.min.css" />
<script type="text/javascript"
	src="/webjars/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/videoTest.css" />
<script src="/js/videoTest.js" type="text/javascript" charset="utf-8"></script>

<!-- 让视屏慢速播放 -->
<!-- <script>
    var video= document.getElementById('v1');
    video.playbackRate = 0.5;
</script> -->


</head>
<body>

	<video id="v1" autoplay muted loop style="width: 100%">
		<source src="/video/full.mp4">
	</video>
	 <!-- <div class="ziti">
		<h1>科师健身</h1>
		</div> -->
	



</body>
</html>