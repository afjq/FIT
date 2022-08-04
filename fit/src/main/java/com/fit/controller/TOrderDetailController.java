package com.fit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fit.domain.admin.TOrderDetail;
import com.fit.service.admin.TOrderDetailService;

@Controller
@RequestMapping("/torderdetail")
public class TOrderDetailController {
	
	@Autowired
	private TOrderDetailService tOrderDetailService;
	
//	获取订单详情
	@RequestMapping("getTOrderDetail")
	public String getTOrderDetail(@RequestParam("totalOrderId") Integer totalOrderId,Model model) {
		System.out.println("TOrderDetailController.getTOrderDetail have ran...");
		List<TOrderDetail> detailList = this.tOrderDetailService.findByTOrderId(totalOrderId);
		for (TOrderDetail detail : detailList) {
			System.out.println(detail);
		}
		model.addAttribute("detailList", detailList);
		return "admin/getTOrderDetail";
	}

}
