package com.fit.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fit.domain.coach.Coach;
import com.fit.domain.Grade;
import com.fit.domain.Train;
import com.fit.service.GradeService;
import com.fit.service.TrainService;

@Controller
@RequestMapping("/train")
public class TrainController {

	@Autowired
	private TrainService trainService;
	@Autowired
	private GradeService gradeService;

	//北梅
	//	去显示训练计划界面
	@RequestMapping("toShowTrain")
	public String toShowTrain(@RequestParam(value = "gradeId", defaultValue = "1") Integer gradeId, Model model) {
		System.out.println("TrainController.showTrainByGrade() ran...");
		//		默认显示初级训练计划
		List<Train> trainList = this.trainService.findByGradeId(gradeId);
		model.addAttribute("trainList", trainList);

		//		显示在侧边的等级导航栏
		List<Grade> gradeList = this.gradeService.findAll();
		model.addAttribute("gradeList", gradeList);
		return "showTrain";
	}

	//	去每个 train的详情页面
	@RequestMapping("toShowTrainDetail")
	public String toShowTrainDetail(@Param("trainId") Integer trainId, Model model) {
		Train train = this.trainService.findById(trainId);
		System.out.println(train);
		model.addAttribute("train", train);
		return "showTrainDetail";
	}

	// 去添加课程页面
	@RequestMapping("toAddTrain")
	public String toAddTrain(Model model) {
		System.out.println("去addTrain页面");
		model.addAttribute("msg", "");
		return "addTrain";
	}

	// 添加课程并重定向
	@RequestMapping("addTrain")
	public String addTrain(

			HttpSession session, 
			MultipartFile file, 
			Train train, 
			@RequestParam("gradeId")Integer gradeId, 
			Model model,
			HttpServletRequest request,
			String trainName

			) {

		System.out.println("TrainController.addTrain have ran............");
		System.out.println("添加教练方法，从前端拿到的train：" + train);
		System.out.println("添加教练方法，从前端拿到的trainName：" + trainName);
		System.out.println("从前端拿到的gradeId："+gradeId); 
		System.out.println("====================");

		// 保存图片的路径，图片上传成功后，将路径保存到数据库
		String filePath = System.getProperty("user.dir")+"\\src\\main\\webapp\\static\\imgs\\trainImg";
		// 获取原始图片的扩展名
		String originalFilename = file.getOriginalFilename();
		// 生成文件新的名字
		String newFileName = UUID.randomUUID() + originalFilename;
		// 封装上传文件位置的全路径
		File targetFile = new File(filePath, newFileName);
		try {
			file.transferTo(targetFile);
		} catch (IllegalStateException e1) {
			e1.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		}


		// 设置trainIImg（准备数据）
		train.setTrainImg(newFileName);
		//		准备Grade
		Grade grade = this.gradeService.findById(gradeId);
		//		组合Grade和train
		train.setTrainGrade(grade);

		if (trainService.isTrainNameExit(trainName)) {
			model.addAttribute("msg", "已有此课程");
			return "addTrain";
		} else {
			//判断到：目前数据库没有此课程
			train.setTrainCoach((Coach) session.getAttribute("coach"));
			System.out.println("准备好的数据train：");
			System.out.println(train);
			
			//		插入数据库
			trainService.insert(train);
			System.out.println("已经添加课程到数据库");
			// 从session中拿到本教练的coachId
			Coach coach = (Coach) session.getAttribute("coach");
			System.out.println("从session中拿到的coach：" + coach);
			List<Train> trainList = this.trainService.findByCoachId(coach.getCoachId());
			model.addAttribute("trainList", trainList);
			//		去教练页面首页显示所有课程
			model.addAttribute("msg", "添加成功");
			return "redirect:/coach/showAllCoachTrain";
		}
	}

	// 通过课程Id删除教练课程
	@RequestMapping("deleteTrainById")
	public String deleteTrainById(HttpSession session, Integer trainId, Model model) {
		System.out.println("TrainController.deleteTrainById have ran......");
		trainService.deleteTrainById(trainId);
		Coach coach = (Coach) session.getAttribute("coach");
		System.out.println("从session中拿到的coach：" + coach);
		session.setAttribute("coach", coach);
		Integer coachId = coach.getCoachId();
		List<Train> trainList = this.trainService.findByCoachId(coachId);
		System.out.println("controller拿到的本教练TrainList;");
		System.out.println(trainList);
		model.addAttribute("trainList", trainList);
		//		去教练页面首页显示所有课程
		return "redirect:/coach/showAllCoachTrain";
	}
}
