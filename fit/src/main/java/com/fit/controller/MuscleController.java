package com.fit.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fit.domain.user.Muscle;
import com.fit.service.user.MuscleService;

@Controller
@RequestMapping(value="/muscle")
public class MuscleController {
	
	@Resource
	private MuscleService muscleService;
	
//	去肌肉库页面
	@RequestMapping("toShowMuscle")
	public String toShowMuscle(Model model) {
		System.out.println("MuscleController.toShowMuscle() ran ...");
		List<Muscle> muscleList = this.muscleService.findAll();
		model.addAttribute("muscleList", muscleList);
		return "showMuscle";
	}
	
//	点击某块肌肉，显示可以锻炼此肌肉的具体动作
	@RequestMapping("toShowTheMuscle")
	public String toShowTheMuscle(@Param("muscleId")Integer muscleId,Model model) {
		System.out.println("MuscleController.toTheMuscle() ran ...");
		Muscle muscle = this.muscleService.findById(muscleId);
		model.addAttribute("muscle", muscle);
		return "showTheMuscle";
	}
}
