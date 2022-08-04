<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<title>科师健身</title>
<script type="text/javascript"
	src="/webjars/jquery/3.2.1/dist/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/webjars/bootstrap/4.1.3/css/bootstrap.min.css" />
<script src="/webjars/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/index.css" />
<script src="/js/index.js" type="text/javascript" charset="utf-8"></script>

<script>
	var i = 0; //声明次数变量
	//调用windows的加载页面事件驱动函数
	window.onload = function() {
		//声明定时器，3秒后执行一次pho方法
		window.setTimeout(pho, 5000);
	}
	//编写pho方法
	function pho() {
		i++; //次数加1
		//通过id获取图片并改变样式为显示block
		$(".SonlineBox").show(5000);
		//调用定时器方法，周期 重复。
		setInterval(hiddpic, 5000);
	}
	//编写隐藏方法
	function hiddpic() {
		//通过id获取图片并改变样式为隐藏none
		$(".SonlineBox").hide(5000);
		//展示3次，清除定时器
		if (i <= 4) {
			setInterval(pho, 5000);
		} else {
			clearInterval("time");
		}
	}

	$(function() {
		$('img').click(function() {
			$(".SonlineBox").hide();

		});
	});
	
</script>
</head>

<body>
	<div class="o-hiyd">
		
		<!-- 头部导航栏模块 -->
		<div class="o-header2">
			<div class="o-header2_inner">
				<a href="index" class="o-header_logo"> <img src="/imgs/logo.png">
				</a>
				<div class="o-header2_nav">
					<div data-hicms-tmpl="hiyd-nav">
						<div>
							<a href="/act/toShowAct" target="_self" class="item">健身动作库</a> <a href="/train/toShowTrain"
								target="_self" class="item">训练计划</a> <a href="/muscle/toShowMuscle" target="_self"
								class="item">健身肌肉库</a> <a href="#" target="_self" class="item">饮食查询</a>
							<a href="#" target="_self" class="item">健身知识</a> <a href="#"
								target="_self" class="item">健身视频</a> <a href="#" target="_self"
								class="item">健身工具</a> <a href="#" target="_self" class="item">下载APP</a>
						</div>
					</div>
					
					<!-- 用户登录按钮 -->
					<div class="left-login">
						<% String name=(String)session.getAttribute("uPhone");
						    if(name!=null){%>
						    <div class="title">
								<ul>
									<li><img
										style="width: 30px; height: 30px; border-radius: 50%; overflow: hidden;"
										src="/static/imgs/userImg/${user.uImg }">${user.uPhone }
										<ul class="home_ul">
											<li><a
												href="/user/userInfo?uPhone=${user.uPhone}">个人中心</a></li>
											<li><a href="/car/toShowCar">我的购物车</a></li>
											<li><a href="/user/outUserLogin" id="loginout">退出登录</a></li>
										</ul></li>
								</ul>
							</div>
						        <%}else{ %>
						        <div class="login">
									<a href="/user/toUserLogin" >登录</a>&nbsp;|&nbsp;<a href="/user/toUserRegist">注册</a>
								</div>
						 <%} %>
					</div>
					
					
				</div>
			</div>
		</div>
		<script>
			seajs.use(['ouj_sdk'],function(sdk){
				sdk.init();
			});
		</script>

		<!-- 主体部分 -->
		<div class="o-index2 page">

			<!-- 顶部图片展示模块 -->
			<div class="section-top">
				<div class="topPlan-wrap"></div>
			</div>

			<!--第一模块 热点、推荐 模块   -->
			<div class="section section-mix">
				<div class="section-main">
					<div class="section-bd">
						<!-- 热点 -->
						<div class="box box-common1">
							<div class="box-hd">
								<h2>热点</h2>
								<a class="btn-more" href="#">更多 &nbsp;+</a>
							</div>
							<div class="box-bd">
								<ul>
									<li class="first"><a href="#"> <img
											alt="被赌王之子求婚的超模奚梦瑶，身材有多好" src="/imgs/index/news01.PNG">
									</a></li>
									<li class="li2"><a href="#"> <img alt="上吊治疗法"
											src="/imgs/index/news02.PNG">
									</a></li>
									<li class="li3"><a href="#"> <img alt="日跑3小时至流血"
											src="/imgs/index/news03.PNG">
									</a></li>
								</ul>
							</div>
						</div>
						<!-- 推荐 -->
						<div class="box box-common2">
							<div class="box-hd">
								<h2>推荐</h2>
								<a class="btn-more" href="#">更多 &nbsp;+</a>
							</div>
							<div class="box-bd">
								<ul>
									<li class="pic-right"><a href="#" title="我跨过山和大海，却磨坏了膝盖！">
											<div class="img-wrap">
												<img alt="我跨过山和大海，却磨坏了膝盖！" src="/imgs/index/tj01.PNG">
											</div>
											<h3>我跨过山和大海，却磨坏了膝盖！</h3>
											<p>运动有益身心健康，尤其是上了年纪的民众为了预防三高等问题，除了饮食的控制外就......</p>
									</a></li>
									<li><a href="#" title="真臀假臀？整形医生来为这个翘臀验明正身">
											<h3>真臀假臀？整形医生来为这个翘臀验明正身</h3> <span>05-21</span>
									</a></li>
									<li><a href="#" title="双胞胎姐妹想当名模瘦成“干尸”住院">
											<h3>双胞胎姐妹想当名模瘦成“干尸”住院</h3> <span>05-20</span>
									</a></li>
									<li><a href="#" title="减肥永远都不晚！身患糖尿病的86岁老婆婆坚持十多年减重近60公斤">
											<h3>减肥永远都不晚！身患糖尿病的86岁老婆婆坚持十多年减重近60公斤</h3> <span>05-19</span>
									</a></li>
								</ul>
								<br>
								<ul>
									<li class="pic-right"><a href="#"
										title="三个年代的完美身材，哪种才是你心目中最心仪的身材？">
											<div class="img-wrap">
												<img alt="三个年代的完美身材，哪种才是你心目中最心仪的身材？"
													src="/imgs/index/tj02.PNG">
											</div>
											<h3>三个年代的完美身材，哪种才是你心目中最心仪的身材？</h3>
											<p>做女生真的太难了。哪怕你是一个心地善良、奉公守法、对自己负责的人，对未来抱有....</p>
									</a></li>
									<li><a href="#" title="如此减肥，你敢相信？">
											<h3>如此减肥，你敢相信？</h3> <span>05-17</span>
									</a></li>
									<li><a href="#" title="委内瑞拉模特的“傲人”身材，性感还是恐怖！">
											<h3>委内瑞拉模特的“傲人”身材！</h3> <span>05-15</span>
									</a></li>
									<li><a href="#" title="全民健身，你今天健身了吗？">
											<h3>全民健身，你今天健身了吗？</h3> <span>05-14</span>
									</a></li>
								</ul>
							</div>
						</div>
						<!-- 资讯 -->
						<div class="box box-common2">
							<div class="box-hd">
								<h2>资讯</h2>
								<a class="btn-more" href="#">更多 &nbsp;+</a>
							</div>
							<div class="box-bd">
								<ul>
									<li class="pic-right"><a href="#" title="邓文迪小27岁男友也是健身咖">
											<div class="img-wrap">
												<img alt="邓文迪小27岁男友也是健身咖" src="/imgs/index/zx01.PNG">
											</div>
											<h3>邓文迪小27岁男友也是健身咖</h3>
											<p>邓姐能撩到如此鲜肉，也是服气…… 邓文迪小27岁男友也是健身咖。为模特的他，真正让他走上人生的巅峰的还是今年五月在Naomi Campbell生日派对上与邓姐的相识。</p>
									</a></li>
									<li class="pic-right"><a href="#"
										title="76斤骨感女苦练1年晋升＂中国第一臀神＂">
											<div class="img-wrap">
												<img alt="76斤骨感女苦练1年晋升＂中国第一臀神＂"
													src="/imgs/index/zx02.PNG">
											</div>
											<h3>76斤骨感女苦练1年晋升＂中国第一臀神＂</h3>
											<p>76斤骨感女苦练2年晋升中国第一臀神.面对臃肿的自己,她发现,"吃"不出好身材.想要前凸后翘的女神身材,必须健身才能达到,从此,她一发不可收拾,并爱上了健身.</p>
									</a></li>
									<li class="pic-right"><a href="#" title="如何选择哑铃全攻略">
											<div class="img-wrap">
												<img alt="如何选择哑铃全攻略" src="/imgs/index/zx03.PNG">
											</div>
											<h3>如何选择哑铃全攻略</h3>
											<p>如何选择哑铃全攻略,电镀哑铃价格相对于包胶哑铃高些。电镀哑铃颜色鲜艳，永不退色，无刺激性气味，一般家庭健身使用。</p>
									</a></li>
									<li class="pic-right"><a href="#" title="恐怖至极的世界级肌肉野兽，史泰龙在他们面前瞬间被秒成渣渣！">
											<div class="img-wrap">
												<img alt="恐怖至极的世界级肌肉野兽，史泰龙在他们面前瞬间被秒成渣渣！" src="/imgs/index/zx04.PNG">
											</div>
											<h3>恐怖至极的世界级肌肉野兽，史泰龙在他们面前瞬间被秒成渣渣！</h3>
											<p>这就是世界级肌肉野兽的身材！看着是不是恐怖至极？反正你信不信，他就在那里！</p>
									</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 热点、推荐、资讯模块到此结束 -->
			
			<!-- 第二模块 课程模块 -->
			<div class="section section-course">
				<div class="section-main">
					
					<!-- 课程信息二级导航栏 -->
					<div class="section-hd">
						<h2 class="nav1">课程</h2>
						<div data-hicms-tmpl="course-nav">
							<ul>
								<li>
									<a href="#">八分钟锻炼</a>
								</li>
								<li>
									<a href="#">疯狂奔跑</a>
								</li>
								<li>
									<a href="#">FocusT25</a>
								</li>
								<li>
									<a href="#">莱美搏击操</a>
								</li>
								<li>
									<a href="#">巴西翘臀健身</a>
								</li>
								<li>
									<a href="#">腹肌撕裂者</a>
								</li>
								<li>
									<a href="#">囚徒健身</a>
								</li>
								<li>
									<a href="#">更多 &nbsp;+</a>
								</li>
							</ul>
						</div>
					</div>
					
					<!-- 第二模块主体内容 -->
					<div class="section-bd">
						<!-- 第一部分 -->
						<div class="section-row1">
							<!-- 名人课程 -->
							<div data-hicms-tmpl="index3_course_famous">
								<div class="box box1">
										<div class="box-hd">
											<h2>名人课程</h2>
											<a class="btn-more" href="#">更多 &nbsp;+</a>
										</div>
										<div class="box-bd">
											<ul>
												<li>
													<a href="#"><img src="/imgs/index/mrkc01.PNG"></a>
												</li>
												<li>
													<a href="#"><img src="/imgs/index/mrkc02.PNG"></a>
												</li>
											</ul>
										</div>
								</div>
							</div>
							<!-- 家庭健身计划 -->
							<div data-hicms-tmpl="train_plan:home">
								<div class="box box-common3">
										<div class="box-hd">
											<h2>家庭健身计划</h2>
											<a class="btn-more" href="#">更多 &nbsp;+</a>
										</div>
										<div class="box-bd">
											<ul>
												<li>
													<a target="_blank" href="#">
														<div class="img-wrap">
															<img src="/imgs/index/jtjh01.PNG">
														</div>
														<h2>4分钟Tabata全身燃动-零基础</h2>
														<p class="row row1">
															<span class="col1">课时：1周</span>
															<span>天/周：1天</span>
														</p>
													</a>
												</li>
												<li>
													<a target="_blank" href="#">
														<div class="img-wrap">
															<img src="/imgs/index/jtjh02.PNG">
														</div>
														<h2>办公室五分钟拉伸</h2>
														<p class="row row1">
															<span class="col1">课时：1周</span>
															<span>天/周：1天</span>
														</p>
													</a>
												</li>
												<li>
													<a target="_blank" href="#">
														<div class="img-wrap">
															<img src="/imgs/index/jtjh03.PNG">
														</div>
														<h2>睡前放松拉伸</h2>
														<p class="row row1">
															<span class="col1">课时：1周</span>
															<span>天/周：1天</span>
														</p>
													</a>
												</li>
												<li>
													<a target="_blank" href="#">
														<div class="img-wrap">
															<img src="/imgs/index/jtjh04.PNG">
														</div>
														<h2>游戏达人进阶训练</h2>
														<p class="row row1">
															<span class="col1">课时：1周</span>
															<span>天/周：1天</span>
														</p>
													</a>
												</li>
												<li>
													<a target="_blank" href="#">
														<div class="img-wrap">
															<img src="/imgs/index/jtjh05.jpg">
														</div>
														<h2>平板支撑大挑战</h2>
														<p class="row row1">
															<span class="col1">课时：1周</span>
															<span>天/周：1天</span>
														</p>
													</a>
												</li>
											</ul>
										</div>
								</div>
							</div>
							<!-- 锻炼动作 -->
							<div class="box box3">
								<div class="box-hd">
									<h2>锻炼动作</h2>
									<a class="btn-more" href="#">更多 &nbsp;+</a>
								</div>
								<div class="box-bd">
									<span class="plan-hot"></span>
									<p>
										 "共"
										 <em>1265</em>
										 "/健身房器械"
									</p>
									<div data-hicms-tmpl="index3_course_action">
										<ul>
											<li>
												<a href="#">
													<div class="img-wrap">
														<img alt="" src="/imgs/index/xlbw01.PNG">
													</div>
												</a>
											</li>
											<li>
												<a href="#">
													<div class="img-wrap">
														<img alt="" src="/imgs/index/xlbw02.PNG">
													</div>
												</a>
											</li>
											<li>
												<a href="#">
													<div class="img-wrap">
														<img alt="" src="/imgs/index/xlbw03.PNG">
													</div>
												</a>
											</li>
											<li>
												<a href="#">
													<div class="img-wrap">
														<img alt="" src="/imgs/index/xlbw04.PNG">
													</div>
												</a>
											</li>
											<li>
												<a href="#">
													<div class="img-wrap">
														<img alt="" src="/imgs/index/xlbw05.PNG">
													</div>
												</a>
											</li>
											<li>
												<a href="#">
													<div class="img-wrap">
														<img alt="" src="/imgs/index/xlbw06.PNG">
													</div>
												</a>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						
						<!-- 第二部分 -->
						<div class="section-row2">
							<!-- 热门课程 -->
							<div data-hicms-tmpl="index3_course_hot2">
								<div class="box box4">
									<div class="box-hd">
										<h2>热门课程</h2>
										<a class="btn-more" href="#">更多 &nbsp;+</a>
									</div>
									<div class="box-bd">
										<ul>
											<li>
												<a href="#">
													<h3>完美胸背打造</h3>
													<p>家里 - 无器械</p>
													<p>初级 - 四天胸背</p>
												</a>
											</li>
											<li>
												<a href="#">
													<h3>腹肌撕裂者</h3>
													<p>家里 - 无器械</p>
													<p>初级 - 一天腹肌</p>
												</a>
											</li>
											<li>
												<a href="#">
													<h3>HIIT全身脂肪燃动</h3>
													<p>家里 - 无器械</p>
													<p>初级 - 七天全身</p>
												</a>
											</li>
											<li>
												<a href="#">
													<h3>臀线塑造</h3>
													<p>家里 - 无器械</p>
													<p>初级 - 六天全身</p>
												</a>
											</li>
										</ul>
										<div class="recommend-course">
											<p>
												<span>
													<a href="#">Slim in 6</a>
												</span>
												<span>
													<a href="#">30天家庭减脂</a>
												</span>
												<span>
													<a href="#">翘臀圣经</a>
												</span>
												<span>
													<a href="#">10分钟健身</a>
												</span>
											</p>
											<p>
												<span>
													<a href="#">P4P腹肌</a>
												</span>
												<span>
													<a href="#">郑多燕瘦身操</a>
												</span>
												<span>
													<a class="active" href="#">腹肌撕裂者</a>
												</span>
												<span>
													<a href="#">囚徒健身</a>
												</span>
											</p>
											<p>
												<span>
													<a class="active" href="#">FocusT25</a>
												</span>
												<span>
													<a href="#">P90X</a>
												</span>
												<span>
													<a href="#">P90-2014</a>
												</span>
												<span>
													<a href="#">P90X2</a>
												</span>
												<span>
													<a href="#">P90X3</a>
												</span>
											</p>
											<p>
												<span>
													<a href="#">Insanity 63</a>
												</span>
												<span>
													<a href="#">莱美搏击操</a>
												</span>
												<span>
													<a href="#">尊巴健身</a>
												</span>
												<span>
													<a href="#">Insanity 30</a>
												</span>
											</p>
											<p>
												<span>
													<a href="#">Power 90</a>
												</span>
												<span>
													<a href="#">Rev Abs</a>
												</span>
												<span>
													<a href="#">Rockin Body</a>
												</span>
												<span>
													<a href="#">Hip-Hop Abs</a>
												</span>
											</p>
										</div>
									</div>
								</div>
							</div>
							<!-- 热门课程结束 -->
							<!-- 健身房训练计划 -->
							<div data-hicms-tmpl="train_plan:gym">
								<div class="box box5 box-common3">
									<div class="box-hd">
										<h2>健身房训练计划</h2>
										<a class="btn-more" href="#">更多 &nbsp;+</a>
									</div>
									<div class="box-bd">
										<ul>
											<li>
													<a target="_blank" href="#">
														<div class="img-wrap">
															<img src="/imgs/index/xljh01.PNG">
														</div>
														<h2>12周重返好身材计划</h2>
														<p class="row row1">
															<span class="col1">课时：12周</span>
															<span>天/周：5天</span>
														</p>
													</a>
												</li>
												<li>
													<a target="_blank" href="#">
														<div class="img-wrap">
															<img src="/imgs/index/jtjh02.PNG">
														</div>
														<h2>拉不拉达12周瘦身计划</h2>
														<p class="row row1">
															<span class="col1">课时：12周</span>
															<span>天/周：5天</span>
														</p>
													</a>
												</li>
												<li>
													<a target="_blank" href="#">
														<div class="img-wrap">
															<img src="/imgs/index/jtjh03.PNG">
														</div>
														<h2>终极30天初学者健身指南</h2>
														<p class="row row1">
															<span class="col1">课时：5周</span>
															<span>天/周：4天</span>
														</p>
													</a>
												</li>
												<li>
													<a target="_blank" href="#">
														<div class="img-wrap">
															<img src="/imgs/index/jtjh04.PNG">
														</div>
														<h2>8周雕刻完美身躯计划</h2>
														<p class="row row1">
															<span class="col1">课时：8周</span>
															<span>天/周：5天</span>
														</p>
													</a>
												</li>
										</ul>
									</div>
								</div>
							</div>
							<!-- 健身房训练计划结束 -->
							<!-- 按器械分类 -->
							<div data-hicms-tmpl="index3_course_equip">
								<div class="box box6">
									<div class="box-hd">
										<h2>按器械分类</h2>
										<a class="btn-more" href="#">更多 &nbsp;+</a>
									</div>
									<div class="box-bd">
										<ul>
											<li>
												<a href="#">
													<div class="img-wrap">
														<img alt="" src="/imgs/index/jxfl01.PNG">
													</div>
													<p>杠铃</p>
												</a>
											</li>
											<li>
												<a href="#">
													<div class="img-wrap">
														<img alt="" src="/imgs/index/jxfl02.PNG">
													</div>
													<p>壶铃</p>
												</a>
											</li>
											<li>
												<a href="#">
													<div class="img-wrap">
														<img alt="" src="/imgs/index/jxfl03.PNG">
													</div>
													<p>划船机</p>
												</a>
											</li>
											<li>
												<a href="#">
													<div class="img-wrap">
														<img alt="" src="/imgs/index/jxfl04.PNG">
													</div>
													<p>夹胸器</p>
												</a>
											</li>
											<li>
												<a href="#">
													<div class="img-wrap">
														<img alt="" src="/imgs/index/jxfl05.PNG">
													</div>
													<p>罗马椅</p>
												</a>
											</li>
											<li>
												<a href="#">
													<div class="img-wrap">
														<img alt="" src="/imgs/index/jxfl06.PNG">
													</div>
													<p>牧师凳</p>
												</a>
											</li>
											<li>
												<a href="#">
													<div class="img-wrap">
														<img alt="" src="/imgs/index/jxfl07.PNG">
													</div>
													<p>弹力带</p>
												</a>
											</li>
											<li>
												<a href="#">
													<div class="img-wrap">
														<img alt="" src="/imgs/index/jxfl08.PNG">
													</div>
													<p>史密斯机</p>
												</a>
											</li>
											<li>
												<a href="#">
													<div class="img-wrap">
														<img alt="" src="/imgs/index/jxfl09.PNG">
													</div>
													<p>哑铃</p>
												</a>
											</li>
										</ul>
									</div>
								</div>
							</div>
							<!-- 按器械分类结束-->
						</div>
					</div><!-- 第二模块主体内容结束 -->
				</div>
			</div><!-- 第二模块结束 -->
		</div><!-- 页面主体部分结束 -->
		<!-- 页尾信息模块 -->
		<div class="o-hiyd-footer">
			<div class="o-footer-row">
				<a class="footer-nav-link" href="#" targer="_blank">关于我们</a>| <a
					class="footer-nav-link" href="#" targer="_blank">友情链接</a>| <a
					class="footer-nav-link" href="#" targer="_blank">网站地图</a>| <a
					class="footer-nav-link" href="#" targer="_blank">欢迎加盟</a>| <a
					class="footer-nav-link" href="#" targer="_blank">手机版本</a>| <span>
					KeShiFit (C) 2019 www.keshifit.com 版权所有 广西科技师范学院 软件开发162 科师健身组</span>
			</div>
			<div class="o-footer-row">
				<span>中文网 （2019）8888-666号</span>| <span>科ICP备163012200号</span>
			</div>
		</div>
		<!-- 页尾信息模块 -->
	</div><!-- 页面全部结束 -->
	
	<script type="text/javascript" src="/js/list.js"></script>
</body>
</html>