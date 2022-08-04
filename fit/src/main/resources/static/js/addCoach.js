/*$(document).ready(function(){
	$("#addItem").click(function(){
		alert("添加成功")
	});
});*/
$(document).ready(function(){
	$("#cancel").click(function(){
		window.location.href = "http://localhost:8080/coach/showAllCoach";//跳转
	});
});

$(document).ready(function(){

	//1.页面加载之后把必须填的字段添加到文本框后面
	$("input.required").each(function(){    //中间不能够有空格 input .required是不对的
		$(this).parent().append("<span class='high'>*</span>");
	});

	//2.给所有的文本框添加blur事件。
	$("input").blur(function(){

		var $parent = $(this).parent();
		$parent.find(".formtips").remove();   //需要先清除样式为formtips的内容 用到find方法

		//2.1判断点击的是哪个文本框 不同的文本框处理的内容也是不同的
		/*if ($(this).is("#coachPhone")) {

			//用户名不能为空，如果用户名为空的话，增加一个提示信息
			if (this.value=="") {//为空
				$parent.append("<span class='formtips onError'>账号不能为空！</span>")
			}else{
				$parent.append("<span class='formtips onSuccess'>√</span>")
			}
		}*/
		if ($(this).is("#coachPhone")) {
			if (this.value=="") {//为空
				$parent.append("<span class='formtips onError'>账号不能为空！</span>")
			}else{
//				alert(this.value);
				if(this.value.length != 11){
					$parent.append("<span class='formtips onError'>请输入正确的账号！</span>")
				}else
				{
					$parent.append("<span class='formtips onSuccess'>√</span>")
				}
			}
		}
		if ($(this).is("#coachName")) {
			//用户名不能为空，如果用户名为空的话，增加一个提示信息
			if (this.value=="") {//为空
				$parent.append("<span class='formtips onError'>教练名不能为空！</span>")
			}else{
				$parent.append("<span class='formtips onSuccess'>√</span>")
			}
		}
		if ($(this).is("#coachPsw")) {
			if (this.value=="") {//为空
				$parent.append("<span class='formtips onError'>密码不能为空！</span>")
			}else{
//				alert(this.value);
				if(this.value.length != 6){
					$parent.append("<span class='formtips onError'>密码长度必须六位！</span>")
				}else
				{
					$parent.append("<span class='formtips onSuccess'>√</span>")
				}
			}
		}
		if ($(this).is("#confirm_coachPsw")) {
			if (this.value=="") {//为空
				$parent.append("<span class='formtips onError'>密码不能为空！</span>")
			}else{
//				alert(this.value);
				if(this.value.length != 6){
					$parent.append("<span class='formtips onError'>密码长度必须六位！</span>")
				}else
				{
					$parent.append("<span class='formtips onSuccess'>√</span>")
				}
			}
		}
		if ($(this).is("#coachInfo")) {
			//教练信息不能为空，如果教练信息为空的话，增加一个提示信息
			if (this.value=="") {//为空
				$parent.append("<span class='formtips onError'>教练信息不能为空！</span>")
			}else{
				$parent.append("<span class='formtips onSuccess'>√</span>")
			}
		}
		if ($(this).is("#file")) {
			if (this.value=="") {//为空
				$parent.append("<span class='formtips onError'>照片不能为空！</span>")
			}else{
				$parent.append("<span class='formtips onSuccess'>√</span>")
			}
		}
	});


//	为表单添加一个submit时间，只要有错误信息 就不能够提交信息 应该return false。需要使用trigger执行自定blur方法
//	trigger和triggerHandler的区别还有trigger是对每个元素的绑定的方法都会执行，而triggerHandler只会执行第一个
	$("form").submit(function(){
		//首先执行需要把blur方法执行一遍，这样显示的错误信息 然后记录错误信息的长度 只要长度大于0就阻止提交
		$("form input").trigger("blur");//执行之后会增加<span>元素
		if($(".onError").length>0) return false;
	});

});

function validate() {
	var pwd1 = document.getElementById("coachPsw").value;
	var pwd2 = document.getElementById("confirm_coachPsw").value;
	/*对比两次输入的密码 */
	if(pwd1 == pwd2) {
		document.getElementById("tishi").innerHTML="<font color='green'>两次密码相同</font>";
		document.getElementById("submit").disabled = false;
	}
	else {
		  document.getElementById("tishi").innerHTML="<font color='red'>两次密码不相同</font>";
		  document.getElementById("submit").disabled = true;
		  }
}

function clear(){
	$("#file").remove();
	$('#myform').prepend("<input type=\"file\" id=\"file\" name=\"file\"/>");
	$.imageFileVisible({ wrapSelector: "#image-wrap1",
		fileSelector: "#file",
		width: 100,
		height: 100
	});
}
//图片显示插件
(function ($) {
	$.imageFileVisible = function (options) {
		// 默认选项
		var defaults = {
				//包裹图片的元素
				wrapSelector: null,
				//<input type=file />元素
				fileSelector: null,
				width: '100%',
				height: 'auto',
				errorMessage: "不是图片"
		};
		// Extend our default options with those provided.
		var opts = $.extend(defaults, options);
		$(opts.fileSelector).on("change", function () {
			$("#image-wrap1").empty();
			var file = this.files[0];
			var imageType = /image.*/;
			if(file.size>1024*500){
				alert("请上传小于512k的图片");
				clear();
				return;
			}
			if (file.type.match(imageType)) {
				var reader = new FileReader();
				reader.onload = function () {
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
$(document).ready(
		function(e){
			//图片显示插件
			if (typeof FileReader == 'undefined')
				$("#destination").css({'background': 'none'}).
				html('亲,您的浏览器还不支持HTML5的FileReader接口,无法使用图片本地预览,请更新浏览器获得最好体验');
			$.imageFileVisible({ wrapSelector: "#image-wrap1",
				fileSelector: "#file",
				width: 100,
				height: 100
			});

			//获取展示的user信息
			$.ajax({
				//访问地址
				url: "/coach/addCoach",
				//访问方式，一般有GET或POST两种
				type: 'GET',
				//返回的数据格式，这个是可选参数，jquery回默认判断返回参数的类型
				dataType: 'json'
			})
			//成功后的处理函数,res为服务器返回的数据
			.done(function(coach) {
				//如果返回结果不为空
				if(coach!=null){
					$("#coachPhone").text(coach.coachPhone);
					$("#coachName").text(coach.coachName);
					$("#coachPsw").text(coach.coachPsw);
					$("#coachSex").text(coach.coachSex);
					$("#coachInfo").text(coach.coachInfo);
					$("#icon").attr('src',coach.coachImg);
				}
			})
		}) 