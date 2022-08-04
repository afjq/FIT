package com.fit.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
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

import com.fit.domain.Train;
import com.fit.domain.coach.Coach;
import com.fit.service.TrainService;
import com.fit.service.coach.CoachService;
import com.fit.utils.Pbkdf2Sha256;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping(value = "/coach")
public class CoachController {

	@Autowired
	private CoachService coachService;

	@Autowired
	private TrainService trainService;

	//东夏

	/* 自己加的index.jsp、videoTest.jsp、showAllCoachshouye.jsp页面 用到的controller */

	@RequestMapping("showAllCoachshouye") public String showAllCoachshouye() {
		return "coach/showAllCoachshouye" ; }

	@RequestMapping("index") public String index() { return "index" ; }

	@RequestMapping("videoTest") public String videoTest() { return "videoTest" ;
	}


	//	为管理员显示所有的教练
	@RequestMapping("showAllCoach")
	public String showAllCoach(@RequestParam(required = false, defaultValue = "1") Integer page,
			HttpServletRequest request, Model model) {

		System.out.println("CoachController.showAllCoach have ran........");
		PageHelper.startPage(page, 6);
		List<Coach> coachList = this.coachService.selectAll();
		System.out.println("在controller输出的教练集合是：");
		for (Coach coach : coachList) {
			System.out.println(coach);
		}
		PageInfo<Coach> pageInfo = new PageInfo<Coach>(coachList);
		for (Coach coach : pageInfo.getList()) {
			System.out.println(coach);
		}
		System.out.println("当前页码:" + pageInfo.getPageNum());
		System.out.println("每页记录数:" + pageInfo.getPageSize());
		System.out.println("总页码数:" + pageInfo.getPages());
		System.out.println("总记录数:" + pageInfo.getTotal());
		System.out.println("上一页:" + pageInfo.getPrePage());
		System.out.println("下一页:" + pageInfo.getNextPage());
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("coachList", coachList);
		return "coach/showAllCoach";
	}

	@RequestMapping("findByCoachName")
	public String findByCoachName(HttpServletRequest request, Map<String, Object> map) {
		System.out.println("CoachController.findByCoachName have ran........");
		String coachName = request.getParameter("search");
		System.out.println(coachName);
		List<Coach> coachList = coachService.findByCoachName(coachName);
		map.put("coachList", coachList);
		return "coach/showAllCoach";

	}

	//	去添加教练页面
	@RequestMapping("toAddCoach")
	public String toAddCoach() {
		return "coach/addCoach";
	}

	/**
	 * 保存图片
	 * @param file
	 * @param coachPhone 
	 * @param product
	 * @param map
	 * @return
	 */
	//添加教练并重定向

	@RequestMapping("addCoach")
	public String addCoach(
			@Param("coachPhone") String coachPhone,
			@Param("coachName") String coachName,
			@Param("coachPsw") String coachPsw,
			@Param("coachSex") String coachSex,
			@Param("coachPower") String coachPower,
			@Param("coachImg") String coachImg,
			@Param("coachInfo") String coachInfo,
			@Param("coachSalt") String coachSalt,
			MultipartFile file,Coach coach,
			Model model) {

		System.out.println("CoachController.addCoach have ran............");
		System.out.println("coachPhone"+coachPhone);
		System.out.println("coachName"+coachName);
		System.out.println("coachPsw"+coachPsw);
		System.out.println("coachSex"+coachSex);
		System.out.println("coachPower"+coachPower);
		System.out.println("coachImg"+coachImg);
		System.out.println("coachInfo"+coachInfo);
		System.out.println("file"+file);
		System.out.println("coach"+coach);

		//PBKDF2算法加密
		//获取盐值
		String salt = Pbkdf2Sha256.encode(coachPsw);
		System.out.println("盐值salt===" + salt);
		// String passwordByPBKDF2 = Pbkdf2Sha256.Pbkdf2Sha256(coachPsw);
		String coachPswByPBKDF2 = Pbkdf2Sha256.encode(coachPsw, salt);
		System.out.println("加密结果==="+coachPswByPBKDF2);
		boolean verification = Pbkdf2Sha256.verification(coachPsw, salt);
		System.out.println("验证加密verification==="+verification);

		// 保存图片的路径，图片上传成功后，将路径保存到数据库
		String filePath = System.getProperty("user.dir")+"\\src\\main\\webapp\\static\\imgs\\coachImg";
		System.out.println("filePath"+filePath);
		// 获取原始图片的扩展名
		String originalFilename = file.getOriginalFilename();
		System.out.println("originalFilename"+originalFilename);
		// 生成文件新的名字
		String newFileName = UUID.randomUUID() + originalFilename;
		System.out.println("newFileName"+newFileName);
		// 封装上传文件位置的全路径
		File targetFile = new File(filePath, newFileName);
		try {
			file.transferTo(targetFile);
			System.out.println("上传了");
		} catch (IllegalStateException e1) {
			e1.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		}	
		// 保存到数据库
		//		coach.setCoachImg(newFileName);

		if(coachService.isCoachPhoneExit(coachPhone)) {
			System.out.println("账号已存在");
			model.addAttribute("msg", "账号已存在!");
			return "coach/addCoach";
		}else {
			//			插入数据库
			coachService.insert(coachPhone, coachName, coachPswByPBKDF2, coachSex, coachPower, newFileName, coachInfo,salt);
			model.addAttribute("msg", "注册成功");
			System.out.println("注册成功");
			return "redirect:/coach/showAllCoach";
		}
	}



	// 管理员删除教练
	@RequestMapping("deleteCoachById")
	public String deleteCoachById(int coachId) {

		System.out.println("CoachController.deleteCoachById have ran......");
		coachService.deleteCoachById(coachId);
		return "redirect:/coach/showAllCoach";
	}
	
	// 显示该教练的所有课程
		@RequestMapping("showAllTrainCoach")
		public String showAllTrainCoach(int coachId, Model model) {
			System.out.println("CoachController.showAllTrainCoach have ran......");
			// 通过教练Id去train表查找书与该教练的课程计划
			List<Train> trainList = this.trainService.findByCoachId(coachId);
			model.addAttribute("trainList", trainList);
			return "showAllTrainCoach";
		}


	//	去教练登录页面
	@RequestMapping("toCoachLogin")
	public String toCoachLogin() {
		System.out.println("CoachController.toCoachLogin() ran........");
		return "coach/coachLogin";
	}

	// 教练登录
		@SuppressWarnings("unlikely-arg-type")
		@RequestMapping("coachLogin")
		public String coachLogin(
				HttpSession session,
				@RequestParam("coachPhone") String coachPhone,
				@RequestParam("coachPsw") String coachPsw, 
				Model model) {
			System.out.println("CoachController.coachLogin() ran...");
			System.out.println("login（）从页面拿到的数据：");
			System.out.println("coachPhone===" + coachPhone);
			System.out.println("coachPsw===" + coachPsw);

			// 通过教练的账号电话在数据库中找到这个教练
			Coach coach = coachService.findByCoachPhone(coachPhone);
			System.out.println("从数据库中通过教练电话号码找到的教练==="+coach);

			
//			判断数据库有没有这个教练、
			if(coach == null || "".trim().equals(coach)) {//根据教练账号在数据库中找到的教练coach，判断coach是否为空，来判断是否存在这个教练
//				没有这个教练
				System.out.println("账号错误！");
				model.addAttribute("msg", "账号或密码不正确！");
//				继续返回教练登录页面登录
				return"coach/coachLogin";
			}else {
//				有这个教练，继续判断密码是否正确
//				验证密码的处理
				// 获取到该教练注册时生成的盐值
				String coachSalt = coach.getCoachSalt();
				System.out.println("数据库中该教练的盐值salt===" + coachSalt);
				// 将查到的盐值与前台传来的密码经过加密算法获得密文
				String coachPswByPBKDF2 = Pbkdf2Sha256.encode(coachPsw, coachSalt);
				// 将查到的盐值与前台传来的密码经过加密算法获得密文
//				String coachPswByPBKDF2 = coach.getCoachPsw();
				System.out.println("从数据库中获取得到的加密后的教练==="+coachPswByPBKDF2);
//				验证密码是否正确
				boolean count = coachService.findByPhone(coachPhone, coachPswByPBKDF2);
				if(count == true) {//密码正确，登录成功通过
					System.out.println("PBKDF2加密验证成功");
					// 登录成功，将此教练对象存放在session中
					session.setAttribute("coach", coach);
					session.setAttribute("coachId", coach.getCoachId());
					// 重定向到主页
					return "redirect:/coach/showAllCoachTrain";
				}
				else {//密码不正确，重定向到教练登录页面
					System.out.println("密码错误！");
					model.addAttribute("msg", "账号或密码不正确！");
//					继续返回教练登录页面登录
					return"coach/coachLogin";
				}
			}
		}
		
		//注销方法
		@RequestMapping("outCoachLogin")
		public String outCoachLogin(HttpSession session){
			System.out.println("CoachController.outCoachLogin have ran.....");
			//通过session.invalidata()方法来注销当前的session
			session.invalidate();
			return "coach/coachLogin";
		}

	//	去教练登录后的主页
	@RequestMapping("showAllCoachTrain")
	public String showAllCoachTrain(HttpSession session, Model model, String coachPhone) {
		System.out.println("CoachController.showAllCoachTrain() ran ..");
		// 封装数据，在session中拿到本教练
		Coach coach = (Coach) session.getAttribute("coach");
		System.out.println("在session中拿到本教练:" + coach);
		List<Train> trainList = this.trainService.findByCoachId(coach.getCoachId());
		System.out.println("CoachController.showAllCoachTrain()拿到的本教练TrainList;");
		System.out.println(trainList);
		model.addAttribute("trainList", trainList);
		model.addAttribute("coach", coach);
		return "coach/showAllCoachTrain";
	}

	//	展示当前教练个人信息
	@RequestMapping("showCoach")
	public String showCoach(Coach coach, @RequestParam("coachId") Integer coachId, Model model) {
		coach.setCoachId(coachId);
		coach = this.coachService.findByCoachId(coachId);
		model.addAttribute("coach", coach);
		return "coach/showCoach";
	}

	//接收教练信息，展示id对应的教练信息
	@RequestMapping("update") 
	public String update(int coachId,Model model) {
		System.out.println("CoachController.update() ran..."); 
		Coach coach = coachService.findByCoachId(coachId); 
		model.addAttribute("coach", coach); 
		return "coach/updateCoach"; 
	}

	//接收客户端修改的数据，在数据库中更新，重定向到userInfo
	@RequestMapping("updateCoach") 
	public String updateCoach(Coach coach,HttpServletRequest request) { 
		System.out.println("CopachController.updateCoach() ran...");
		coachService.updateCoach(coach); 
		System.out.println(coach.getCoachPhone());
		return "redirect:/coach/showCoach?coachId="+coach.getCoachId(); 
	}
	
	@RequestMapping("toUpdatePsw") 
	public String toUpdatePsw(HttpSession session,Model model) {
		System.out.println("CoachController.toUpdatePsw() ran..."); 
		Coach coach = (Coach) session.getAttribute("coach");
		model.addAttribute("coach", coach); 
		return "coach/updateCoachPsw"; 
	}
	
	@RequestMapping("updateCoachPsw")
	public String updateCoachPsw(
			@Param("coachPsw") String coachPsw,
			@Param("newcoachPsw") String newcoachPsw,
			Model model,
			HttpSession session) {
		 System.out.println("CopachController.updateCoachPsw() ran...");
		 System.out.println(coachPsw);
		 System.out.println(newcoachPsw);
//		 先从前台拿到用户输入的旧密码，和要更改的新密码
		 
//		 session中的教练
		 Integer coachId = (Integer) session.getAttribute("coachId");
		 Coach coach = this.coachService.findByCoachId(coachId);
		 System.out.println("session教练：：：：："+coach);
		 
//		 判断1：先判断旧密码与数据库的旧密码是否一致：
		// 获取到该教练注册时生成的盐值
			String coachSalt = coach.getCoachSalt();
			System.out.println("数据库中该教练的盐值salt===" + coachSalt);
			// 获取到该教练注册时生成的盐值
			String coachPswByPBKDF1 = coach.getCoachPsw();
			System.out.println("数据库中该教练的密码密文===" + coachSalt);
			// 将查到的盐值与前台传来的密码经过加密算法获得密文
			String coachPswByPBKDF2 = Pbkdf2Sha256.encode(coachPsw, coachSalt);
			System.out.println("前台旧密码加密的密文==="+coachPswByPBKDF2);
//			判断密文是否相等
			if(coachPswByPBKDF1.equals(coachPswByPBKDF2)) {
//				密文相等,可以修改密码
				System.out.println("密文相等,可以修改密码");
//				拿到新密码》》》生成盐》》》生成密文》》》update
				//生成盐值
				String newSalt = Pbkdf2Sha256.encode(newcoachPsw);
				System.out.println("新盐值salt===" + newSalt);
				// 生成新密文
				String newCoachPswByPBKDF2 = Pbkdf2Sha256.encode(newcoachPsw, newSalt);
				System.out.println("新密文==="+newCoachPswByPBKDF2);
				this.coachService.updateCoachPsw(coach.getCoachId(), newCoachPswByPBKDF2, newSalt);
				System.out.println("更新密码成功");
				return "coach/updatePswSuccess";
			}else {
//				密文不想等
				model.addAttribute("msg", "您的旧密码输入有误！请从新输入！");
				return "coach/updateCoachPsw"; 
			}
		
		 
		 
	}


//	@RequestMapping("updateCoach")
//	public String updateCoach(
//			@Param("coachId") Integer coachId,
//			@Param("coachPhone") String coachPhone,
//			@Param("coachName") String coachName,
//			@Param("coachPsw") String coachPsw,
//			@Param("coachSex") String coachSex,
//			@Param("coachPower") String coachPower,
//			@Param("coachInfo") String coachInfo,
//			@Param("coachSalt") String coachSalt,
//			Coach coach,
//			HttpServletRequest request,
//			Model model) {
//
//		System.out.println("CoachController.updateCoach have ran............");
//		System.out.println("coachPhone"+coachPhone);
//		System.out.println("coachName"+coachName);
//		System.out.println("coachPsw"+coachPsw);
//		System.out.println("coachSex"+coachSex);
//		System.out.println("coachPower"+coachPower);
//		System.out.println("coachInfo"+coachInfo);
//		System.out.println("coachSalt"+coachSalt);
//		System.out.println("coach"+coach);
//
//		//PBKDF2算法加密
//		//获取盐值
//		String salt = Pbkdf2Sha256.encode(coachPsw);
//		System.out.println("盐值salt===" + salt);
//		String coachPswByPBKDF2 = Pbkdf2Sha256.encode(coachPsw, salt);
//		System.out.println("加密结果==="+coachPswByPBKDF2);
//		boolean verification = Pbkdf2Sha256.verification(coachPsw, salt);
//		System.out.println("验证加密verification==="+verification);
//		//			更新数据库
//		coachService.updateCoach(coachId,coachPhone, coachName, coachPswByPBKDF2, coachSex, coachPower, coachInfo, salt);
//		System.out.println("修改成功");
//		System.out.println(coach.getCoachPhone());
//		return "redirect:/coach/showCoach?coachId="+coach.getCoachId();
//	}


	//接收客户端修改的数据，在数据库中更新，重定向到showCoach
	@RequestMapping("updateCoachImg") 
	public String updateCoachImg(MultipartFile file, Coach coach) { 
		System.out.println("CoachController.updateUImg() ran...");

		// 保存图片的路径，图片上传成功后，将路径保存到数据库
		String filePath = System.getProperty("user.dir")+"\\src\\main\\webapp\\static\\imgs\\coachImg";
		// 获取原始图片的扩展名
		String originalFilename = file.getOriginalFilename();
		// 生成文件新的名字
		String newFileName = UUID.randomUUID() + originalFilename;
		// 封装上传文件位置的全路径
		File targetFile = new File(filePath, newFileName);
		try {
			file.transferTo(targetFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}	
		// 保存到数据库
		coach.setCoachImg(newFileName);	

		coachService.updateCoachImg(coach); 
		System.out.println(coach.getCoachId());
		return "redirect:/coach/update?coachId="+coach.getCoachId(); 
	}

	//	显示所有的课程
	@RequestMapping("showAllTrain")
	public String showAllTrain(Model model) {
		System.out.println("CoachController.showAllTrain() have ran........");
		List<Coach> coachList = this.coachService.selectAll();
		System.out.println("在controller输出的教练集合是：");
		for(Coach coach : coachList) {
			System.out.println(coach);
		}
		model.addAttribute("coachList", coachList);
		return "coach/showAllTrain";
	}

//	去教练登录后的主页
	@RequestMapping("toCoachHeme")
	public String toCoachHeme(HttpSession session,Model model) {
		System.out.println("CoachController.toCoachHeme() ran ..");
		//		封装数据，在session中拿到本教练
		Coach coach = (Coach)session.getAttribute("coach");
		System.out.println("在session中拿到本教练:"+coach);
		List<Train> trainList= this.trainService.findByCoachId(coach. getCoachId());
		System.out.println("CoachController.toCoachHeme()拿到的本教练TrainList;");
		System.out.println(trainList);
		model.addAttribute("trainList", trainList);
		return "coach/showAllCoachTrain";
	}


	//	教练登录
	@SuppressWarnings("unlikely-arg-type")
	@RequestMapping("Login")
	public String login(
			HttpSession session,
			@RequestParam("coachPhone") String coachPhone,
			@RequestParam("coachPsw") String coachPsw,
			Model model
			) {
		System.out.println("CoachController.Login() ran...");
		System.out.println("login（）从页面拿到的数据：");
		System.out.println("coachPhone==="+coachPhone);
		System.out.println("coachPsw==="+coachPsw);
		
		//		通过教练的账号电话在数据库中找到这个教练
		Coach coach = coachService.findCoachByCoachPhone(coachPhone);
		//		从数据库拿到的密码
		String psw =  coach.getCoachPsw();

		if(coachPhone==null||"".equals(coachPhone)){  //没有输入账号
			System.out.println("进入判断账号是否为空！！！");
			model.addAttribute("msg","请输入账号");
		}else if(coach==null||"".trim().equals(coach)){ //输入账号但是账号错误
			System.out.println("判断账号是否正确！");
			model.addAttribute("msg","账户不存在，请重新登录");
			return "coach/Login";
		}else if(coach!=null &(coachPsw==null||"".equals(coachPsw))){ //没有输入密码
			System.out.println("判断密码是否为空！！！");
			model.addAttribute("msg","请输入密码");
		}else if(coach!=null &!(psw.equals(coachPsw))) { //输入密码，但是密码错误
			System.out.println("密码错误！");
			model.addAttribute("msg","密码错误");

		}else if (coach!=null &psw.equals(coachPsw)){ //输入密码均正确
			System.out.println("登录成功！");

			//			登录成功，将此教练对象存放在session中
			session.setAttribute("coach",coach);

			//重定向到主页
			return "redirect:/coach/toCoachHeme"; 			
		}
		return "coach/Login";        
	}


	//	为用户显示所有的教练
	@RequestMapping("toShowAllCoachForUser")
	public String toShowAllCoachForUser(Model model) {
		System.out.println("CoachController.showAllCoachForUser() have ran........");
		List<Coach> coachList = this.coachService.selectAll();
		for (Coach coach : coachList) {
			System.out.println(coach);
		}
		model.addAttribute("coachList", coachList);
		return "user/showAllCoachForUser";
	}

	//	（为用户）去显示教练详细信息
	@RequestMapping("showCoachDetail")
	public String showCoachDetail(@Param("coachId")Integer coachId,Model model) {
		System.out.println("CoachController.showCoachDetail() ran...");
		//		通过教练Id去train表查找属于该教练的课程计划
		List<Train> trainList = this.trainService.findByCoachId(coachId);
		model.addAttribute("trainList", trainList);
		Coach coach = this.coachService.findByCoachId(coachId);
		model.addAttribute("coach", coach);
		System.out.println(coach.getCoachName()+"开设的课程：");
		for (Train train : trainList) {
			System.out.println(train);
		}
		return "user/coachDetail";
	}



	//	显示教练的所有课程
	@RequestMapping("showCoachTrain")
	public String showCoachTrain(int coachId,Model model){
		System.out.println("CoachController.showAllCoachTrain() ran...");
		//		通过教练Id去train表查找属于该教练的课程计划
		List<Train> trainList = this.trainService.findByCoachId(coachId);
		model.addAttribute("trainList", trainList);
		return "showAllCoachTrain";
	}


	//	去教练修改个人信息
	@RequestMapping("toUpdateCoach")
	public String toUpdateCoach(HttpSession session){
		System.out.println("CoachController.toUpdateCoach() ran ..");
		Coach coach = (Coach)session.getAttribute("coach");
		System.out.println("拿到session中的coach：");
		System.out.println(coach);
		return "coach/updateCoach";
	}


}
