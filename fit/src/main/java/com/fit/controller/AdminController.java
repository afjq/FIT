package com.fit.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fit.domain.admin.Admin;
import com.fit.service.admin.AdminService;

@Controller
@RequestMapping(value="/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@RequestMapping("toLogin")
	public String toLogin(Model model){
		System.out.println("AdminContrlller.toLogin have ran .....");
		model.addAttribute("msg", "");
		return "admin/aLogin";
	}
	
	@SuppressWarnings("unlikely-arg-type")
	@RequestMapping("aLogin")
    public String aLogin(@RequestParam("adminPhone") String adminPhone,
    		@RequestParam("adminPsw") String adminPsw,
    		Model model,
    		HttpSession session) {
		
		System.out.println("AdminContrlller.aLogin have ran .....");
		
        Admin admin = adminService.findByAdminPhone(adminPhone, adminPsw);
        
        if(adminPhone==null||"".equals(adminPhone)){  //没有输入账号
        	System.out.println("进入判断账号是否为空！！！");
            model.addAttribute("msg","请输入账号");
        }else if(admin==null||"".trim().equals(admin)){ //输入账号但是账号错误
        	System.out.println("判断账号是否正确！");
            model.addAttribute("msg","账户不存在，请重新登录");
            return "admin/aLogin";
        }else if(admin!=null &(adminPsw==null||"".equals(adminPsw))){ //账号正确，但没有输入密码
        	System.out.println("判断密码是否为空！！！");
            model.addAttribute("msg","请输入密码");
        }else if(admin!=null &!(admin.getAdminPsw().equals(adminPsw))) { //账号正确，输入密码，但是密码错误
        	System.out.println("密码错误！");
            model.addAttribute("msg","密码错误");

        }else if (admin!=null &admin.getAdminPsw().equals(adminPsw)){ //账号密码均正确
        	System.out.println("登录成功！");
        	// session里存放用户的phone（用在登录获取值和个人中心）
        	model.addAttribute("admin", admin);
        	session.setAttribute("adminPhone", adminPhone);
            return "redirect:/coach/showAllCoach";
        }
        return "admin/aLogin";
    }
	
	//注销方法
		@RequestMapping("outAdminLogin")
		public String outAdminLogin(HttpSession session){
			System.out.println("AdminController.outAdminLogin have ran.....");
			//通过session.invalidata()方法来注销当前的session
			session.invalidate();
			return "admin/aLogin";
		}
	

}