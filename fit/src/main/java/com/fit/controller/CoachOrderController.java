package com.fit.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fit.domain.coach.Coach;
import com.fit.domain.coach.CoachOrder;
import com.fit.service.coach.CoachOrderService;

@Controller
@RequestMapping("/coachOrder")
public class CoachOrderController {
	@Autowired
	private CoachOrderService coachOrderService;
	
//	获得本教练成交的订单
	@RequestMapping("getCoachOrder")
	public String getCoachOrder(HttpSession session,Model model) {
		System.out.println("CoachOrderController.getCoachOrder() have ran");
//		从session中拿到本教练的coachId
		Coach coach = (Coach)session.getAttribute("coach");
		System.out.println("从session中拿到的coach::::::::："+coach);
		Integer coachId = coach.getCoachId();
		
//		调用service层 拿到教练订单集合
		List<CoachOrder> coachOrderList =  this.coachOrderService.findByCoachId(coachId);
		System.out.println("controller拿到的本教练coachOrderList:::");
		for (CoachOrder coachOrder : coachOrderList) {
			System.out.println(coachOrder);
		}
//		拿到的教练订单集合放在model容器中，给前端
		model.addAttribute("coachOrderList", coachOrderList);
//		或redirect： 重定向到另一个controller   
		return "coach/getCoachOrder";
	
	}
}
