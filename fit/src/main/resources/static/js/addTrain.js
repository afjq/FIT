/*$(document).ready(function(){
	$("#addItem").click(function(){
		alert("添加成功");
	});
});*/
$(document).ready(function(){
	$("#cancel").click(function(){
		window.location.href = "http://localhost:8080/coach/showAllTrain";//跳转
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
		if ($(this).is("#trainName")) {


			if (this.value=="") {//为空
				$parent.append("<span class='formtips onError'>课程名称不能为空！</span>")
			}else{
				$parent.append("<span class='formtips onSuccess'>√</span>")
			}
		}
		if ($(this).is("#trainPeriod")) {

			if (this.value=="") {//为空
				$parent.append("<span class='formtips onError'>训练时长不能为空！</span>")
			}else{
				$parent.append("<span class='formtips onSuccess'>√</span>")
			}
		}
		if ($(this).is("#trainPrice")) {

			if (this.value=="") {//为空
				$parent.append("<span class='formtips onError'>价格不能为空！</span>")
			}else{
				$parent.append("<span class='formtips onSuccess'>√</span>")
			}
		}
		if ($(this).is("#trainDesc")) {

			if (this.value=="") {//为空
				$parent.append("<span class='formtips onError'>课程描述不能为空！</span>")
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


	//为表单添加一个submit时间，只要有错误信息 就不能够提交信息 应该return false。需要使用trigger执行自定blur方法
	//trigger和triggerHandler的区别还有trigger是对每个元素的绑定的方法都会执行，而triggerHandler只会执行第一个
	$("form").submit(function(){
		//首先执行需要把blur方法执行一遍，这样显示的错误信息 然后记录错误信息的长度 只要长度大于0就阻止提交
		$("form input").trigger("blur");//执行之后会增加<span>元素
		if($(".onError").length>0) return false;
	});

});
