package com.fit.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fit.domain.user.User;
import com.fit.domain.user.UserOrder;
import com.fit.service.user.UODetailService;
import com.fit.service.user.UserOrderService;
import com.fit.service.user.UserService;

@RequestMapping("/uODetail")
@Controller
public class UODetailController {
	@Resource
	private UserService userService;
	@Resource
	private UODetailService uODetailService;
	@Resource
	private UserOrderService userOrderService;
//	进入用户订单详情页
	@RequestMapping("toShowuoDetail")
	public String toShowuoDetail(HttpSession session,Model model,String orderId) {
		System.out.println("UODetailController.toShowuoDetail() ran...");
//		获得当前用户Id
		Integer uId = (Integer) session.getAttribute("uId");
		//		查找到当前用户
		User user = this.userService.findByUId(uId);
//		订单信息
		UserOrder userOrder = this.userOrderService.findByUserOrderId(orderId);
		System.out.println(user);
		model.addAttribute("userOrder", userOrder);
		model.addAttribute("user", user);
		return "user/showuoDetail";
	}
}
