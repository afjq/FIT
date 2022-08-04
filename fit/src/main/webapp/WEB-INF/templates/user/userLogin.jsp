<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userLogin</title>
<script type="text/javascript"
	src="/webjars/jquery/3.2.1/dist/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/webjars/bootstrap/4.1.3/css/bootstrap.min.css" />
<script src="/webjars/bootstrap/4.1.3/js/bootstrap.min.css"></script>
<script type="text/javascript"
	src="/webjars/jquery-validation/1.19.0/dist/jquery.validate.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/user/userlogin.css" />
<script type="text/javascript">
$(document.body).ready(function () {
        //首次获取验证码
    $("#imgVerify").attr("src","/user/getVerify?"+Math.random());
    });
    
    //获取验证码
    function getVerify(){
        var src1=document.getElementById('imgVerify')
        var inputStr = $("#checks").val();
        src1.src = "/user/getVerify?"+Math.random();
        inputStr = inputStr.toUpperCase();//将输入的字母全部转换成大写
    }
    
    //登录，目前只检测验证码
	 function login(){
		 var user_input_verifyCode=$("#user_input_verifyCode").val();
		 $.ajax({
				type : 'post',
				url : "${pageContext.request.contextPath}/user/userLogin",
				data:{verifyCode:user_input_verifyCode},
				//dataType : "json",
				success : function(data) {	
					alert(data);
				},
				error : function() {
					alert(data);
				}
			}); 
	 }
    
/*     //校验验证码
    function checkSum(){
        var html1=document.getElementById('userLoginingForm');
        var inputStr = $("#checks").val();
        if(inputStr!=null && inputStr!="" && inputStr!="验证码:"){
            inputStr = inputStr.toUpperCase();//将输入的字母全部转换成大写
            html1.action="/user/userLogin?inputStr="+inputStr;//提交表单
        }else{
            alert("验证码不能为空!")
        }
    }  */
</script>
</head>
<body>

	<div class="page">
		<div class="container">
			<div class="left">
				<div class="login">
					<h2>用户登录</h2>
				</div>
				<div class="eula">
					<h5>健身管理系统</h5>
					<br> <a href="/coach/toCoachLogin">教练登录</a>&nbsp;&nbsp;&nbsp;
					<a href="/admin/toLogin">管理员登录</a>
				</div>
			</div>
			<div class="right">
				<svg viewBox="0 0 320 300">
					<defs>
						<linearGradient inkscape:collect="always" id="linearGradient"
						x1="13" y1="193.49992" x2="307" y2="193.49992"
						gradientUnits="userSpaceOnUse">
							<stop style="stop-color:#ff00ff;" offset="0" id="stop876" />
							<stop style="stop-color:#ff0000;" offset="1" id="stop878" />
						</linearGradient>
					</defs>
					<path
						d="m 40,120.00016 239.99984,-3.2e-4 c 0,0 24.99263,0.79932 25.00016,35.00016 0.008,34.20084 -25.00016,35 -25.00016,35 h -239.99984 c 0,-0.0205 -25,4.01348 -25,38.5 0,34.48652 25,38.5 25,38.5 h 215 c 0,0 20,-0.99604 20,-25 0,-24.00396 -20,-25 -20,-25 h -190 c 0,0 -20,1.71033 -20,25 0,24.00396 20,25 20,25 h 168.57143" />
					</svg>
				<div class="form">
					<form id="form1" action="/user/userLogin" method="post">
						<span style="color: red">${msg}</span><br> <label
							for="uPhone">用户账号</label> 
							<input type="text" id="uPhone"	name="uPhone" required> 
							<label for="uPsw">密码</label> <input type="password" id="uPsw" name="uPsw" required> 
							
							验证码:
							<input id="user_input_verifyCode" class="input-text size-L" name="inputStr" type="text"
							style="width: 150px;" required /><br> 
							
							<img id="imgVerify"
							alt="点击更换验证码" /> 
							<a href="" rel="nofollow">看不清，换一张</a><br>

						<input type="submit" id="submit" value="登录" onclick="login()"> 
						
						用户不存在？请先<a
							href="${pageContext.request.contextPath }/user/toUserRegist">注册</a>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>