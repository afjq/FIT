package com.fit.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fit.domain.user.Act;
import com.fit.service.user.ActService;

@Controller
@RequestMapping("/act")
public class ActController {
	@Resource
	private ActService actService;

	//	去动作库页面，
	@RequestMapping("toShowAct")
	public String toShowAct(Model model) {
		System.out.println("ActController.toShowAct() ran ...");
		//		查询所有动作，显示所有动作在动作库页面
		List<Act> actList = this.actService.findAll();
		model.addAttribute("actList", actList);
		return "showAct";
	}
}
