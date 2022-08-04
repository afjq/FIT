package com.fit.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fit.domain.coach.COrderDetail;
import com.fit.service.coach.COrderDetailService;

@Controller
@RequestMapping("/cOrderDetail")
public class COrderDetailController {
	@Autowired
	private COrderDetailService coOrderDetailService;
	
//	根据订单Id查找订单详情
	@RequestMapping("getCOrderDetail")
	public String findDetailByCoDetailOrderId(@Param("coachOrderId")Integer coachOrderId,Model model){
		System.out.println("COrderDetailController.findDetailByCoDetailOrderId() ran ..");
		System.out.println("COrderDetailController拿到的coachOrderId"+coachOrderId);
		List<COrderDetail> coachOrderDetailList = this.coOrderDetailService.findBycoDetailOrderId(coachOrderId);
		System.out.println("查找到的订单详情：");
		for(COrderDetail detail : coachOrderDetailList) {
			System.out.println(detail);
		}
		model.addAttribute("CoachOrderDetailList", coachOrderDetailList);
		return "coach/getCOrderDetail";
	}

}
