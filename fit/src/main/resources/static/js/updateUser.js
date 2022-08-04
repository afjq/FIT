	function clear() {
		$("#file").remove();
		$('#myform')
				.prepend("<input type=\"file\" id=\"file\" name=\"file\"/>");
		$.imageFileVisible({
			wrapSelector : "#image-wrap1",
			fileSelector : "#file",
			width : 300,
			height : 300
		});
	}
	//图片显示插件
	(function($) {
		$.imageFileVisible = function(options) {
			// 默认选项
			var defaults = {
				//包裹图片的元素
				wrapSelector : null,
				//<input type=file />元素
				fileSelector : null,
				width : '100%',
				height : 'auto',
				errorMessage : "不是图片"
			};
			// Extend our default options with those provided.
			var opts = $.extend(defaults, options);
			$(opts.fileSelector).on("change", function() {
				$("#image-wrap1").empty();
				var file = this.files[0];
				var imageType = /image.*/;
				if (file.size > 1024 * 500) {
					alert("请上传小于512k的图片");
					clear();
					return;
				}
				if (file.type.match(imageType)) {
					var reader = new FileReader();
					reader.onload = function() {
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
	$(document).ready(function(e) {
		//图片显示插件
		if (typeof FileReader == 'undefined')
			$("#destination").css({
				'background' : 'none'
			}).html('亲,您的浏览器还不支持HTML5的FileReader接口,无法使用图片本地预览,请更新浏览器获得最好体验');
		$.imageFileVisible({
			wrapSelector : "#image-wrap1",
			fileSelector : "#file",
			width : 300,
			height : 300
		});

		//获取展示的user信息
		$.ajax({
			//访问地址
			url : "/coach/updateCoach?uId=" + coach.getCoachId(),
			//访问方式，一般有GET或POST两种
			type : 'GET',
			//返回的数据格式，这个是可选参数，jquery回默认判断返回参数的类型
			dataType : 'json'
		})
		//成功后的处理函数,res为服务器返回的数据
		.done(function(user) {
			//如果返回结果不为空
			if (user != null) {
				$("#icon").attr('src', coach.coachImg);
			}
		});
		
		
	});
	
