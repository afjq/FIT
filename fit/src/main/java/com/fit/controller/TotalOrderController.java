package com.fit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fit.domain.admin.TotalOrder;
import com.fit.service.admin.TotalOrderService;

@Controller
@RequestMapping("/totalorder")
public class TotalOrderController {
	
	@Autowired
	private TotalOrderService totalOrderService;
	
	@RequestMapping("getTotalOrder")
	public String getTotalOrder(Model model) {
		
		System.out.println("TotalOrderController.getTotalOrder have ran............");
		List<TotalOrder> totalOrderList = totalOrderService.findAll();
		model.addAttribute("totalOrderList", totalOrderList);
		System.out.println("在controller层:拿到的订单集合是:");
		for(TotalOrder totalOrder : totalOrderList) {
			System.out.println(totalOrder);
		}
		return "admin/getTotalOrder";
	}

}
