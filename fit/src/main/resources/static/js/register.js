/**
 * 表单提交时验证
 * @returns {boolean}
 */
function checkForm() {

	var Form = document.getElementById("formId");
	var bool = true;
	if (!InputUsernameBlur()) bool = false;
	if (!InputPasswordBlur()) bool = false;
	if (!InputRepasswordBlur()) bool = false;
	if (!InputEmailBlur()) bool = false;
	if (bool==true) {
		Form.submit();
	}
	return bool;

}

/**
 * 用户名输入框失去焦点
 */
function InputUsernameBlur() {
	var uname = document.getElementById("InputUsername");
	var ename = document.getElementById("errorName");
	/* 用户名为空/不为空 */
	if (uname.value=="") {
		ename.innerHTML="用户名不能为空。";
		return false;
	}
	else {
		ename.innerHTML="";
	}
	/* 密码长度 */
	if (uname.value.length<4 || uname.value.length>16) {
		ename.innerHTML="长度为4-16。";
		return false;
	}
	else {
		ename.innerHTML="";
	}
	return true;
}

/**
 * 密码输入框失去焦点
 */
function InputPasswordBlur() {
	var pwd = document.getElementById("InputPassword");
	var epwd = document.getElementById("errorPassword");
	/* 密码为空/不为空 */
	if (pwd.value=="") {
		epwd.innerHTML="密码不为空。"
			return false;
	}
	else {
		epwd.innerHTML="";
	}
	/* 密码长度 */
	if (pwd.value.length<6 || pwd.value.length>16) {
		epwd.innerHTML="长度为6-16。"
			return false;
	}
	else {
		epwd.innerHTML="";
	}
	return true;
}

/**
 * 确认密码输入框失去焦点
 */
function InputRepasswordBlur() {
	var rpwd = document.getElementById("InputRepassword");
	var erpwd = document.getElementById("errorRepassword");
	/* 确认密码不为空 */
	if (rpwd.value=="") {
		erpwd.innerHTML="确认密码不为空。"
			return false;
	}
	else {
		erpwd.innerHTML="";
	}
	/* 确认密码与密码不一致 */
	var pwd = document.getElementById("InputPassword");
	if (pwd.value != rpwd.value) {
		erpwd.innerHTML="密码不一致。"
			return false;
	}
	else {
		erpwd.innerHTML="";
	}
	return true;
}

/**
 * 性别输入框失去焦点
 */
function InputSexBlur() {
	var uname = document.getElementById("InputSex");
	var ename = document.getElementById("errorSex");
	/* 性别为空/不为空 */
	if (uname.value=="") {
		ename.innerHTML="性别不能为空。";
		return false;
	}
	else {
		ename.innerHTML="";
	}
}

/**
 * 号码输入框失去焦点
 */
function InputPhoneBlur() {
	var uphone = document.getElementById("InputPhone");
	var ephone = document.getElementById("errorPhone");
	/* 号码为空/不为空 */
	if (uphone.value=="") {
		ephone.innerHTML="电话号码不能为空。";
		return false;
	}
	else {
		ephone.innerHTML="";
	}
	/* 号码长度 */
	if (uphone.value.length<7 || uphone.value.length>11) {
		ephone.innerHTML="长度为7-11。";
		return false;
	}
	else {
		ephone.innerHTML="";
	}
	return true;
}