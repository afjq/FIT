<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我的购物车</title>
<script type="text/javascript"
	src="/webjars/jquery/3.2.1/dist/jquery.min.js"></script>
<!--  <script src="/webjars/angular/1.7.8/angular.min.js"></script>
引用外部自定义AngularJs
<script src="/static/js/myCar.js"></script> -->
<script>
 	
	$(function() {
		
		
		/* 删除确认 */
		$("#carTable #delItem").each(function() {
			$(this).click(function() {
				if (confirm('您确定要删除购物车内的商品吗?') != true) {
					return false;
				}
				
			});
		});

		/* 全选框 */
		$("#checkAll").change(function() {/* 全选框改变事件 */
			var checked = $(this).prop("checked");/* 获取当前是否已被选中 */
			
			if (checked == true) {/* 全选 */
				$("[name='caritemId']").prop("checked", true);//设置下面的全选 
				/* 合计 */
				var price;
				var total = 0;
				/* 遍历所有 */
				$('#carTable tr').each(function() {
					price = $(this).find("#price").text();//获取每一个商品的价格
					total = Number(total) + Number(price);//相加
				});
				$("#count").text(Number(total));
				$("#countPrice").val(Number(total));
			} else {
				$("[name='caritemId']").prop("checked", false);//取消全选
				$("#count").text(Number(0));
				$("#countPrice").val(Number(0));
			}
		});

		/* 批量删除 */
		$("#delItemList").click(function() {
			if (confirm('您确定要删除购物车内的商品吗?') == true) {
				var obj = $("[name='caritemId']"); //选择所有name="'test'"的对象，返回数组 
				//取到对象数组后，我们来循环检测它是不是被选中 
				var s = new Array();
				for (var i = 0; i < obj.length; i++) {
					if (obj[i].checked) {
						s[i] = obj[i].value;
					} //如果选中，将value添加到数组s中 
				}
				//那么现在来检测s的值就知道选中的复选框的值了 
				alert(s == '' ? '你还没有选择任何内容！' : s);
				alert(s);
				$.ajax({
					type : 'POST',
					url : '${pageContext.request.contextPath}/car/delItemList',
					data : {
						'itemList' : s
					},
					traditional : true,
					dataType : 'text',
					success : function(data) {
						alert('删除成功！');
					}
				});
			}
		});

		var price;
		var s = 0;
		$("#count").text(Number(s));//合计首先为0	
		$("#countPrice").val(Number(s));
		/* 点击复选框时，重新合计 */
		$('#carTable tr').each(function() {
			$(this).find("#caritemId").change(function() { /* 当复选框改变时 */
				var isChecked = $(this).prop("checked"); /* 判断复选框的值 */
				if (isChecked == true) { /* 如果勾选了复选框 */
					price = $(this).parents().siblings("[id='price']").text();/* 取到对应的价格 */
					s = Number(s) + Number(price);/* 累计 */
				} else {
					price = $(this).parents().siblings("[id='price']").text();/* 取到值 */
					s = Number(s) - Number(price);/* 减去 */
				}
				$("#count").text(Number(s));/* 合计 */
				$("#countPrice").val(Number(s));
			});
		});

		/* 点击下单 */
		$("#submit").click(
				function() {
					alert("click");
					var name = null;
					var price = null;
					/* var img; */
					/* 遍历每一行 */
					$('#carTable tr').each(
							function() {
								var isChecked = $(this).find("#caritemId")
										.prop("checked"); /* 判断复选框的值 */
								if (isChecked == true) { /* 如果勾选了复选框 */
									var uoDetailTrainName = $(this).find("#caritemId").parents().siblings("[id='itemName']").text();/* 取到对应的价格 */
									/* var uoDetailTrainImg = $(this).parents().siblings("[id='itemImg']").text();/* 取到对应的价格 */
									var uoDetailTrainPrice = $(this).find("#caritemId").parents().siblings("[id='price']").text();/* 取到对应的价格 */
									name = name + "," + uoDetailTrainName;
									price = price + "," + uoDetailTrainPrice;
									/* img = img +","+uoDetailTrainImg; */
								} else {
								}
							});
					alert(name);
					/* alert(img); */
					alert(price);
					$("#uoDetailTrainName").val(name);
					/* $("#uoDetailTrainImg").val(img); */
					$("#uoDetailTrainPrice").val(price);
				});
	});
</script>
<link rel="stylesheet" type="text/css" href="/css/user/myCar.css" />
</head>
<body>
	<!-- 头部导航栏模块 -->
	<div class="o-header2">
		<div class="o-header2_inner">
			<a href="/user/index" class="o-header_logo"> <img src="/imgs/logo.png">
			</a>
			<div class="o-header2_nav">
				<div data-hicms-tmpl="hiyd-nav">
					<div>
						<a href="/act/toShowAct" target="_self" class="item">健身动作库</a> <a
							href="/train/toShowTrain" target="_self" class="item">训练计划</a> <a
							href="/muscle/toShowMuscle" target="_self" class="item">健身肌肉库</a>
						<a href="#" target="_self" class="item">饮食查询</a> <a href="#"
							target="_self" class="item">健身知识</a> <a href="#" target="_self"
							class="item">健身视频</a> <a href="#" target="_self" class="item">健身工具</a>
						<a href="#" target="_self" class="item">下载APP</a>
					</div>
				</div>
				<!-- 用户登录按钮 -->
				<div class="left-login">
					<%
						String name = (String) session.getAttribute("uPhone");
						if (name != null) {
					%>
					<div class="title">
						<ul>
							<li><img
								style="width: 30px; height: 30px; border-radius: 50%; overflow: hidden;"
								src="/static/imgs/userImg/${user.uImg }">${user.uPhone }
								<ul class="home_ul">
									<li><a
										href="/user/userInfo?uPhone=${user.uPhone}">个人中心</a></li>
									<li><a href="/car/toShowCar">我的购物车</a></li>
									<li><a href="/UserOrder/toShowMyTrain">我的课程</a></li>
									<li><a href="/UserOrder/toShowUserOrder">我的订单</a></li>
									<li><a href="/user/outUserLogin" id="loginout">退出登录</a></li>
								</ul></li>
						</ul>
					</div>
					<%
						} else {
					%>
					<div class="login">
						<a href="/user/toUserLogin">登录</a>&nbsp;|&nbsp;<a
							href="/user/toUserRegist">注册</a>
					</div>
					<%
						}
					%>
				</div>

			</div>
		</div>
	</div>

	<!-- 购物车主体内容 -->
	<div class="segmenting-line">
		<hr>
		<div>
			<span>查看购物车</span>
		</div>
	</div>



	<div class="page">

		<div class="middle">
			         
			<div class="m1">
				            <img src="/imgs/d.jpg">            
				<div class="search">
					                <input class="txt" type="text" />                
					<input class="button" type="submit" value="搜索" />             
				</div>
				           
			</div>
		</div>

		<div class="m2">
			            
			<ul>
				                
				<li><a href="#" style="color: #F00">全部课程</a></li>                
				<li><a href="#">科师健身房</a></li>            
			</ul>
			<table>
				           
				<tr>
					                
					<td>配送至:</td>                
					<td>                    <select name="address">
							                   
							<option value="">广西区</option>                    
							<option value="A">南宁市</option>                    
							<option value="B">来宾市</option>                    
							<option value="C">贵港市</option>                    
							<option value="D">柳州市</option>                 </td>            
				</tr>
				           
			</table>
			                   
		</div>

		<div class="panel panel-info">
			<button id="delItemList">批量删除</button>
			<form action="/UserOrder/createOrder" method="post">
				<div class="panel panel-info">
					<table border="0" id="carTable">
						<tr>
							<th><input type="checkbox" id="checkAll" />全选</th>
							<th>序号</th>
							<th>课程名</th>
							<th>图片</th>
							<th>价格</th>
							<th>删除</th>
						</tr>
						<c:forEach items="${requestScope.carItemList }" var="carItem"
							varStatus="status">
							<tr>
								<td><input type="checkbox" name="caritemId" id="caritemId"
									value="${carItem.caritemId}" /></td>
								<td>${status.count}</td>
								<td id="itemName">${carItem.caritemTrainName}</td>
								<td id="itemImg"><img alt="图片丢失"
									src="/static/imgs/trainImg/${carItem.caritemTrainImg}"></td>
								<td id="price">${carItem.caritemTrainPrice}</td>
								<td><a id="delItem" onclick="delItem"
									href="/car/delItem?caritemId=${carItem.caritemId}">删除</a></td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="carFoot">
					合计：￥<span id="count" name="count"></span> 
					<input name="countPrice" id="countPrice">
					<!-- 封装订单详情的信息 -->
					<input name="uoDetailTrainName" id="uoDetailTrainName"> <input
						name="uoDetailTrainPrice" id="uoDetailTrainPrice">
					<!-- <input type="hidden" name="uoDetailTrainImg" id="uoDetailTrainImg"> -->
					<input type="submit" value="下单" id="submit">
				</div>
			</form>
		</div>
	</div>

	<!-- 	<div class="m3"> -->
	<!--             <div class="c1"> -->
	<!--                 <ul> -->
	<!--                     <li>全选</li> -->
	<!--                     <li><a href="#">删除选中的商品</a></li> -->
	<!--                     <li><a href="#">移到我的关注</a></li> -->
	<!--                     <li><a href="#" style="color:#000">清理购物车</a></li> -->
	<!--                 </ul> -->
	<!--             </div> -->
	<!--     </div>    -->

 	<!-- 页尾信息模块 -->
<!-- 	<div class="o-hiyd-footer"> -->
<!-- 		<div class="o-footer-row"> -->
<!-- 			<a class="footer-nav-link" href="#" targer="_blank">关于我们</a>| <a -->
<!-- 				class="footer-nav-link" href="#" targer="_blank">友情链接</a>| <a -->
<!-- 				class="footer-nav-link" href="#" targer="_blank">网站地图</a>| <a -->
<!-- 				class="footer-nav-link" href="#" targer="_blank">欢迎加盟</a>| <a -->
<!-- 				class="footer-nav-link" href="#" targer="_blank">手机版本</a>| <span> -->
<!-- 				KeShiFit (C) 2019 www.keshifit.com 版权所有 广西科技师范学院 软件开发162 科师健身组</span> -->
<!-- 		</div> -->
<!-- 		<div class="o-footer-row"> -->
<!-- 			<span>中文网 （2019）8888-666号</span>| <span>科ICP备163012200号</span> -->
<!-- 		</div> -->
<!-- 	</div> -->
	<!-- 页尾信息模块 --> 
<!-- 	</div> -->
	<!-- 页面全部结束 --> 

</body>
</html>