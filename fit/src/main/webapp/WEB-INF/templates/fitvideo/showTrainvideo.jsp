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
<link rel="stylesheet" type="text/css" href="/css/showTrainvideo.css" />
 <link rel="stylesheet" type="text/css" href="/css/index.css" />
<title>Insert title here</title>

<script type="text/javascript">

function init() { // Master function, encapsulates all functions
var video = document.getElementById("Video1"); 
if (video.canPlayType) { // tests that we have HTML5 video support
// if successful, display buttons and set up events
document.getElementById("buttonbar").style.display = "block"; 
document.getElementById("inputField").style.display = "block";
// helper functions
// play video
function vidplay(evt) {
if (video.src == "") { // inital source load
getVideo();
}
button = evt.target; // get the button id to swap the text based on the state 
if (video.paused) { // play the file, and display pause symbol
video.play();
button.textContent = "||";
} else { // pause the file, and display play symbol 
video.pause();
button.textContent = ">";
}
}
// load video file from input field
function getVideo() {
var fileURL = document.getElementById("videoFile").value; // get input field 
if (fileURL != "") {
video.src = fileURL;
video.load(); // if HTML source element is used
document.getElementById("play").click(); // start play
} else {
errMessage("Enter a valid video URL"); // fail silently
}
}
  
// button helper functions 
// skip forward, backward, or restart
function setTime(tValue) {
// if no video is loaded, this throws an exception 
try {
if (tValue == 0) {
video.currentTime = tValue;
}
else {
video.currentTime += tValue;
}
 
} catch (err) {
// errMessage(err) // show exception
errMessage("Video content might not be loaded");
}
}
// display an error message 
function errMessage(msg) {
// displays an error message for 5 seconds then clears it
document.getElementById("errorMsg").textContent = msg;
setTimeout("document.getElementById('errorMsg').textContent=''", 5000);
}
// change volume based on incoming value 
function setVol(value) {
var vol = video.volume;
vol += value;
// test for range 0 - 1 to avoid exceptions
if (vol >= 0 && vol <= 1) {
// if valid value, use it
video.volume = vol;
} else {
// otherwise substitute a 0 or 1
video.volume = (vol < 0) ? 0 : 1; 
}
}
// button events 
// Play
document.getElementById("play").addEventListener("click", vidplay, false);
// Restart
document.getElementById("restart").addEventListener("click", function () {
setTime(0);
}, false);
// Skip backward 10 seconds
document.getElementById("rew").addEventListener("click", function () {
setTime(-10);
}, false);
// Skip forward 10 seconds
document.getElementById("fwd").addEventListener("click", function () {
setTime(10);
}, false);
// set src == latest video file URL
document.getElementById("loadVideo").addEventListener("click", getVideo, false);
// fail with message 
video.addEventListener("error", function (err) {
errMessage(err);
}, true);
// volume buttons
document.getElementById("volDn").addEventListener("click", function () {
setVol(-.1); // down by 10%
}, false);
document.getElementById("volUp").addEventListener("click", function () {
setVol(.1); // up by 10%
}, false);
// playback speed buttons
document.getElementById("slower").addEventListener("click", function () {
video.playbackRate -= .25;
}, false);
document.getElementById("faster").addEventListener("click", function () {
video.playbackRate += .25;
}, false);
document.getElementById("normal").addEventListener("click", function () {
video.playbackRate = 1;
}, false);
document.getElementById("mute").addEventListener("click", function (evt) {
if (video.muted) {
video.muted = false;
evt.target.innerHTML = "<img alt='volume on button' src='vol2.png' />"
} else {
video.muted = true;
evt.target.innerHTML = "<img alt='volume off button' src='mute2.png' />"
}
}, false);
} // end of runtime
}// end of master 
</script>

</head>
<body onload="init();">
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
				<div class="user menu item">
					<a href="/user/toUserLogin">登录</a>&nbsp;|&nbsp;<a
						href="/user/toUserRegist">注册</a>
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
				<a href="http://localhost:8080/web/showTrain" class="sort-item" title="前臂怎么练/前臂肌肉锻炼方法视频"
					style="height: 20px; width: 68px; display: inline-block;">前臂</a>
			</button>
			<button class="anniu" style="background-color: #333333;">
				<a href="http://localhost:8080/web/showTrain" class="sort-item" title="中背部怎么练/中背部肌肉锻炼方法视频"
					style="height: 20px; width: 68px; display: inline-block;">中背部</a>
			</button>
			<button class="anniu" style="background-color: #333333;">
				<a href="http://localhost:8080/web/showTrain" class="sort-item" title="下背部怎么练/下背部肌肉锻炼方法视频"
					style="height: 20px; width: 68px; display: inline-block;">下背部</a>
				<button class="anniu" style="background-color: #333333;">
					<a href="http://localhost:8080/web/showTrain" class="sort-item" title="颈部怎么练/颈部肌肉锻炼方法视频"
						style="height: 20px; width: 68px; display: inline-block;">颈部</a>
				</button>
				<button class="anniu" style="background-color: #333333;">
					<a href="http://localhost:8080/web/showTrain" class="sort-item" title="股四头肌怎么练/股四头肌肌肉锻炼方法视频"
						style="height: 20px; width: 68px; display: inline-block;">股四头肌</a>
				</button>
				<button class="anniu" style="background-color: #333333;">
					<a href="http://localhost:8080/web/showTrain" class="sort-item" title="腘绳肌怎么练/腘绳肌肌肉锻炼方法视频"
						style="height: 20px; width: 68px; display: inline-block;">腘绳肌</a>
				</button>
				<button class="anniu" style="background-color: #333333;">
					<a href="http://localhost:8080/web/showTrain" class="sort-item" title="小腿群肌怎么练/小腿群肌肌肉锻炼方法视频"
						style="height: 20px; width: 68px; display: inline-block;">小腿群肌</a>
				</button>
				<button class="anniu" style="background-color: #333333;">
					<a href="http://localhost:8080/web/showTrain" class="sort-item" title="斜方肌怎么练/斜方肌肌肉锻炼方法视频"
						style="height: 20px; width: 68px; display: inline-block;">斜方肌</a>
				</button>
				<button class="anniu" style="background-color: #333333;">
					<a href="http://localhost:8080/web/showTrain" class="sort-item" title="背部怎么练/背部肌肉锻炼方法视频"
						style="height: 20px; width: 68px; display: inline-block;">背部</a>
				</button>
				<button class="anniu" style="background-color: #333333;">
					<a href="http://localhost:8080/web/showTrain" class="sort-item" title="腹肌怎么练/腹肌肌肉锻炼方法视频"
						style="height: 20px; width: 68px; display: inline-block;">腹肌</a>
				</button>
				<button class="anniu" style="background-color: #333333;">
					<a href="http://localhost:8080/web/showTrain" class="sort-item" title="臀部肌群怎么练/臀部肌群肌肉锻炼方法视频"
						style="height: 20px; width: 68px; display: inline-block;">臀部肌群</a>
				</button>
				<button class="anniu" style="background-color: #333333;">
					<a href="http://localhost:8080/web/showTrain" class="sort-item" title="内收肌群怎么练/内收肌群肌肉锻炼方法视频"
						style="height: 20px; width: 68px; display: inline-block;">内收肌群</a>
				</button>
				<button class="anniu" style="background-color: #333333;">
					<a href="http://localhost:8080/web/showTrain" class="sort-item" title="外展肌群怎么练/外展肌群肌肉锻炼方法视频"
						style="height: 20px; width: 68px; display: inline-block;">外展肌群</a>
				</button>
				<button class="anniu" style="background-color: #333333;">
					<a href="http://localhost:8080/web/showTrain" class="sort-item" title="背阔肌怎么练/背阔肌肌肉锻炼方法视频"
						style="height: 20px; width: 68px; display: inline-block;">背阔肌</a>
				</button>
				<button class="anniu" style="background-color: #333333;">
					<a href="http://localhost:8080/web/showTrain" class="sort-item" title="肱二头肌怎么练/肱二头肌肌肉锻炼方法视频"
						style="height: 20px; width: 68px; display: inline-block;">肱二头肌</a>
				</button>
				<button class="anniu" style="background-color: #333333;">
					<a href="http://localhost:8080/web/showTrain" class="sort-item" title="髂腰肌怎么练/髂腰肌肌肉锻炼方法视频"
						style="height: 20px; width: 68px; display: inline-block;">髂腰肌</a>
				</button>
		</div>
	</div>
	<br>
	<br>
	<h3>不限部位/仰卧窄宽高位直杆弯举</h3>
	<div class="videoList">
		<div class="videoshow">
			<video id="Video1" controls style="border: 0.5px solid blue;"
				height="600px" width="1000px;" title="video element">
			</video>
			<div id="buttonbar" style="display: none;" )>
				<button id="restart" title="Restart button">[]</button>
				<button id="slower" title="Slower playback button">-</button>
				<button id="rew" title="Rewind button">&lt;&lt;</button>
				<button id="play" title="Play button">&gt;</button>
				<button id="fwd" title="Forward button">&gt;&gt;</button>
				<button id="faster" title="Faster playback button">+</button>
			</div>
			<div id="inputField" style="display: none;">
				<label>Type or paste a video URL: <br /> <input type="text"
					id="videoFile" style="width: 600px;" title="video file input field"
					value="/video/full.mp4" />
					<button id="loadVideo" title="Load video button">Load</button>
				</label>
			</div>
			<div title="Error message area" id="errorMsg" style="color: Red;"></div>
		</div>
	</div>



</body>
</html>