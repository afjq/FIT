package com.fit.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fit.domain.user.User;
import com.fit.service.PowerService;
import com.fit.service.user.UserService;
import com.fit.utils.Pbkdf2Sha256;
import com.fit.utils.RandomValidateCode;

@Controller(value="UserController")
@RequestMapping("/user")
public class UserController {

	@Resource
	private UserService userService;
	@Resource
	private PowerService powerService;

	//用户登录
	@RequestMapping("toUserLogin")
	public String toUserLogin(Model model) {
		System.out.println("UserController.toUserLogin() ran...");
		model.addAttribute("msg", "");
		return "user/userLogin";
	}



	
	//	Controller代码：注意的是，当访问登录界面的时候就会自动加载验证码图片，同时把验证码值存入session中，当我们处理登录逻辑的时候是通过前端输入的验证码值和从session中存储的图片中的验证码值来进行比较进行校验的。
	//	登录成功，把用户存在session
	@SuppressWarnings("unlikely-arg-type")
	@RequestMapping("userLogin")
	public String userLogin(
			@RequestParam("uPhone") String uPhone,
			@RequestParam("uPsw") String uPsw,
			@RequestParam("inputStr")String inputStr,
			Model model,
			HttpSession session,
			HttpServletRequest request) {

		System.out.println("UserController.userLogin() ran...");
		
		//从session中获取随机数
		String random = (String) session.getAttribute(RandomValidateCode.RANDOMCODEKEY);
		System.out.println("session中正确的验证码--------》"+random);
//		从前台获取用户输入的随机数
		System.out.println("从页面拿到用户输入的验证码--------》"+inputStr);
		
		User user = userService.findByUphone(uPhone);
		System.out.println("从数据库中通过用户电话号码找到的用户==="+user);

		//		判断数据库有没有这个用户、
		if(user == null || "".trim().equals(user)) {//根据教练账号在数据库中找到的教练coach，判断coach是否为空，来判断是否存在这个教练
			//			没有这个用户
			System.out.println("账号错误！");
			model.addAttribute("msg", "账号或密码不正确！");
			//			继续返回教练登录页面登录
			return"user/userLogin";
		}else {
			//			有这个教练，继续判断密码是否正确
			//			验证密码的处理
			// 获取到该教练注册时生成的盐值
			String uSalt = user.getuSalt();
			System.out.println("数据库中该教练的盐值salt===" + uSalt);
			// 将查到的盐值与前台传来的密码经过加密算法获得密文
			String uPswByPBKDF2 = Pbkdf2Sha256.encode(uPsw, uSalt);
			//从数据库中获取加密后的密码
			//			String uPswByPBKDF2 = user.getuPsw();
			System.out.println("从数据库中获取加密后的密码==="+uPswByPBKDF2);
			//			验证密码是否正确
			boolean count = userService.findByPhone(uPhone, uPswByPBKDF2);
			if(count == true) {//密码正确，登录成功通过
				System.out.println("PBKDF2加密验证成功");
				// session里存放用户的phone（用在登录获取值和个人中心）
				session.setAttribute("user", user);
				session.setAttribute("uId", user.getuId());
				model.addAttribute("user", user);
				session.setAttribute("uPhone", user.getuPhone());
				
				if(random.equals(inputStr)) {
//					验证码验证成功，进入主页
					return "index";
				}else {
//					验证码验证失败，返回登录页，提示
					System.out.println("验证码有误！");
					model.addAttribute("msg", "验证码有误！请重新输入");
					//				继续返回教练登录页面登录
					return"user/userLogin";
				}
				
			}
			else {//密码不正确，重定向到教练登录页面
				System.out.println("密码错误！");
				model.addAttribute("msg", "账号或密码不正确！");
				//				继续返回教练登录页面登录
				return"user/userLogin";
			}
		}
	}

	//注销方法
	@RequestMapping("outUserLogin")
	public String outUserLogin(HttpSession session){
		System.out.println("UserController.outUserLogin have ran.....");
		//通过session.invalidata()方法来注销当前的session
		session.invalidate();
		return "index";
	}


	/**
	 * 登录页面生成验证码
	 */
	@RequestMapping("getVerify")
	public void getVerify(HttpServletRequest request, HttpServletResponse response){
		response.setContentType("image/jpeg");//设置相应类型,告诉浏览器输出的内容为图片
		response.setHeader("Pragma", "No-cache");//设置响应头信息，告诉浏览器不要缓存此内容
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expire", 0);
		RandomValidateCode randomValidateCode = new RandomValidateCode();
		try {
			randomValidateCode.getRandcode(request, response);//输出验证码图片方法
		} catch (Exception e) {
			e.printStackTrace();
		}
	}



	//用户注册	
	@RequestMapping("toUserRegist")
	public String toUserRegist() {
		System.out.println("UserController.toUserRegist() ran...");
		return "user/userRegist";
	}

	@RequestMapping("userRegist")
	public String userRegist(
			@Param("uPhone") String uPhone,

			@Param("uName") String uName,

			@Param("uPsw") String uPsw,

			@Param("uSex") String uSex,

			@Param("uAge") Integer uAge,

			@Param("uPower") Integer uPower,

			@Param("uImg") String uImg,

			@Param("uSalt") String uSalt,
			MultipartFile file,
			User user,
			Model model) {

		System.out.println("UserController.userRegist have ran............");
		System.out.println("uPhone"+uPhone);
		System.out.println("uName"+uName);
		System.out.println("uPsw"+uPsw);
		System.out.println("uSex"+uSex);
		System.out.println("uAge"+uAge);
		System.out.println("uPower"+uPower);
		System.out.println("uImg"+uImg);
		System.out.println("uSalt"+uSalt);
		System.out.println("file"+file);
		System.out.println("user"+user);

		//PBKDF2算法加密
		//获取盐值
		String salt = Pbkdf2Sha256.encode(uPsw);
		System.out.println("盐值salt===" + salt);
		// String passwordByPBKDF2 = Pbkdf2Sha256.Pbkdf2Sha256(coachPsw);
		String uPswByPBKDF2 = Pbkdf2Sha256.encode(uPsw, salt);
		System.out.println("加密结果==="+uPswByPBKDF2);
		boolean verification = Pbkdf2Sha256.verification(uPsw, salt);
		System.out.println("验证加密verification==="+verification);

		System.out.println("UserController.userRegist() ran...");
		// 保存图片的路径，图片上传成功后，将路径保存到数据库
		String filePath = System.getProperty("user.dir")+"\\src\\main\\webapp\\static\\imgs\\userImg";
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
		user.setuImg(newFileName);

		if(userService.isUPhoneExit(uPhone)) {
			System.out.println("账号已存在！");
			model.addAttribute("msg", "*账号已存在!");
			return "user/userRegist";
		}else {
			userService.insert(uPhone, uName, uPswByPBKDF2, uSex, uAge, uPower, newFileName, salt);
			model.addAttribute("msg", "注册成功");
			System.out.println("注册成功！");
			return "redirect:/user/userInfo?uPhone="+user.getuPhone();
		}

	}

	//	@RequestMapping("userRegist")
	//	public String userRegist(@RequestParam("uPhone") String uPhone,MultipartFile file,User user,Model model) {
	//		System.out.println("UserController.userRegist() ran...");
	//		// 保存图片的路径，图片上传成功后，将路径保存到数据库
	//		String filePath = System.getProperty("user.dir")+"\\src\\main\\webapp\\static\\imgs";
	//		// 获取原始图片的扩展名
	//		String originalFilename = file.getOriginalFilename();
	//		// 生成文件新的名字
	//		String newFileName = UUID.randomUUID() + originalFilename;
	//		// 封装上传文件位置的全路径
	//		File targetFile = new File(filePath, newFileName);
	//		try {
	//			file.transferTo(targetFile);
	//		} catch (IllegalStateException e) {
	//			e.printStackTrace();
	//		} catch (IOException e) {
	//			e.printStackTrace();
	//		}	
	//		// 保存到数据库
	//		user.setuImg(newFileName);
	//
	//
	//		if(userService.isUPhoneExit(uPhone)) {
	//			model.addAttribute("msg", "*账号已存在!");
	//			return "user/userRegist";
	//		}else {
	//			userService.insert(user);
	//			model.addAttribute("msg", "注册成功");
	//			return "redirect:/user/userInfo?uPhone="+user.getuPhone();
	//		}
	//	}

	//用户查看个人信息
	@RequestMapping("userInfo")
	public String userInfo(@Param("uPhone") String uPhone, Model model) {
		System.out.println("UserController.userInfo() ran...");
		System.out.println("uPhone==="+uPhone);
		User user = this.userService.findByUphone(uPhone);
		System.out.println("-----------");
		System.out.println(user);
		model.addAttribute("user", user);
		return "user/userInfo";
	}

	//接收用户信息，展示id对应的用户信息
	@RequestMapping("update") 
	public String update(int uId,Model model) {
		System.out.println("UserController.update() ran..."); 
		System.out.println("uId==="+uId);
		User user = userService.findUserById(uId); 
		model.addAttribute("user", user); 
		return "user/updateUser"; 
	}

	//接收客户端修改的数据，在数据库中更新，重定向到userInfo
		@RequestMapping("updateUser") 
		public String updateUser(User user,HttpServletRequest request) { 
			System.out.println("UserController.updateUser() ran...");
	
			userService.updateUser(user); 
			System.out.println(user.getuPhone());
			return "redirect:/user/userInfo?uPhone="+user.getuPhone(); 
		}

		@RequestMapping("toUpdateUPsw") 
		public String toUpdateUPsw(HttpSession session,Model model) {
			System.out.println("UserController.toUPsw() ran..."); 
			User user = (User) session.getAttribute("user");
			model.addAttribute("user", user); 
			return "user/updateUPsw"; 
		}
		
		@RequestMapping("updateUPsw")
		public String updateUPsw(
				@Param("uPsw") String uPsw,
				@Param("newUPsw") String newUPsw,
				Model model,
				HttpSession session) {
			 System.out.println("UserController.updateUPsw() ran...");
			 System.out.println(uPsw);
			 System.out.println(newUPsw);
//			 先从前台拿到用户输入的旧密码，和要更改的新密码
			 
//			 session中的教练
			 Integer uId = (Integer) session.getAttribute("uId");
			 User user = this.userService.findUserById(uId);
			 System.out.println("session用户：：：：："+user);
			 
//			 判断1：先判断旧密码与数据库的旧密码是否一致：
			// 获取到该教练注册时生成的盐值
				String uSalt = user.getuSalt();
				System.out.println("数据库中该教练的盐值salt===" + uSalt);
				// 获取到该教练注册时生成的盐值
				String uPswByPBKDF1 = user.getuPsw();
				System.out.println("数据库中该教练的密码密文===" + uPswByPBKDF1);
				// 将查到的盐值与前台传来的密码经过加密算法获得密文
				String uPswByPBKDF2 = Pbkdf2Sha256.encode(uPsw, uSalt);
				System.out.println("前台旧密码加密的密文==="+uPswByPBKDF2);
//				判断密文是否相等
				if(uPswByPBKDF1.equals(uPswByPBKDF2)) {
//					密文相等,可以修改密码
					System.out.println("密文相等,可以修改密码");
//					拿到新密码》》》生成盐》》》生成密文》》》update
					//生成盐值
					String newSalt = Pbkdf2Sha256.encode(newUPsw);
					System.out.println("新盐值salt===" + newSalt);
					// 生成新密文
					String newUPswByPBKDF2 = Pbkdf2Sha256.encode(newUPsw, newSalt);
					System.out.println("新密文==="+newUPswByPBKDF2);
					this.userService.updateUPsw(uId, newUPswByPBKDF2, newSalt);
					System.out.println("更新密码成功");
					return "user/updatePswSuccess";
				}else {
//					密文不想等
					model.addAttribute("msg", "您的旧密码输入有误！请从新输入！");
					return "user/updateUPsw"; 
				}
			
			 
			 
		}

	//接收客户端修改的数据，在数据库中更新，重定向到userInfo
	@RequestMapping("updateUImg") 
	public String updateUImg(MultipartFile file, User user) { 
		System.out.println("UserController.updateUImg() ran...");

		// 保存图片的路径，图片上传成功后，将路径保存到数据库
		String filePath = System.getProperty("user.dir")+"\\src\\main\\webapp\\static\\imgs\\userImg";
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
		user.setuImg(newFileName);	

		userService.updateUImg(user); 
		System.out.println(user.getuPhone());
		return "redirect:/user/update?uId="+user.getuId(); 
	}

	@RequestMapping("index")
	public String index(HttpSession session, Model model) {

		// 封装数据，在session中拿到该用户
		User user = (User) session.getAttribute("user");
		model.addAttribute("user", user);
		return "index";
	}

}