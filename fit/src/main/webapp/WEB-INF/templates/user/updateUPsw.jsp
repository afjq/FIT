<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改密码</title>
<script type="text/javascript"
	src="/webjars/jquery/3.2.1/dist/jquery.min.js"></script>
<script src="/js/jquery.validate.min.js"></script>
<script src="/js/messages_zh.js"></script>
<script type="text/javascript">
function validate() {
	var upwd1 = document.getElementById("newUPsw").value;
	var upwd2 = document.getElementById("confirm_uPsw").value;
	/*对比两次输入的密码 */
	if (upwd1 == upwd2) {
		document.getElementById("tishi").innerHTML = "<font color='green'>两次密码相同</font>";
		document.getElementById("submit").disabled = false;
	} else {
		document.getElementById("tishi").innerHTML = "<font color='red'>两次密码不相同</font>";
		document.getElementById("submit").disabled = true;
	}
}
</script>
</head>
<body>
   <p style="color:red">${msg }</p>
   <form action="/user/updateUPsw" method="post">
      <div>
           请输入现在的密码:<input id="uPsw" name="uPsw" type="password" required/><br>
           请设置新的密码:<input id="newUPsw" name="newUPsw" type="password" required/><br>
           请再次输入新的密码:<input id="confirm_uPsw" name="confirm_uPsw" type="password" onkeyup="validate()" required/>
           <span id="tishi"></span><br>
     <input type="submit" class="formBtn" value="确认修改" style="margin-right:20px;"/>
      </div>
   </form>

</body>
</html>