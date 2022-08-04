<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我的课程</title>
</head>
<body>
	<ul>
		<c:forEach items="${trainList }" var="train" >
			<li>
				<h3>${train.trainName }</h3>
				<h5>${train.trainDesc }</h5>
				<span>训练周期：${train.trainPeriod}周</span>
				<img alt="图片 暂时丢失" src="/static/imgs/trainImg/${train.trainImg }">
				<h4>授课教练：${train.trainCoach.coachName }</h4>
				<span>教练联系方式：${train.trainCoach.coachPhone }</span>
				<h6>${train.trainCoach.coachInfo }</h6>
			</li>
		</c:forEach>
	</ul>
</body>
</html>