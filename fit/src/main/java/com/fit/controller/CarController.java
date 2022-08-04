package com.fit.controller;

import java.math.BigDecimal;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fit.domain.user.Car;
import com.fit.domain.user.CarItem;
import com.fit.domain.user.User;
import com.fit.service.user.CarItemService;
import com.fit.service.user.CarService;
import com.fit.service.user.UserService;

@RequestMapping("/car")
@Controller
public class CarController {	
	
	@Autowired
	private CarService carService;
	
	@Autowired
	private CarItemService carItemService;
	
	@Resource
	private UserService userService;
	
//	去我的购物车页面,查询数据，页面跳转
	@RequestMapping("toShowCar")
	public String toShowCar(HttpSession session,Model model) {
		System.out.println("CarController.toShowCar() ran...");
		Integer uId = (Integer) session.getAttribute("uId");
		User user = (User) session.getAttribute("user");
		System.out.println("session中拿到的userId :"+uId);
		System.out.println("session中拿到的user :"+user);
//		如果此用户没有购物车，则创建用户的购物车
		Car car = null;
		List<CarItem> carItemList = null;
		if(this.carService.isNull(uId)){//		此用户没有购物车	
			System.out.println("判断到：用户没有购物车，重新创建");
			car = new Car();
//			组装Car与用户user
			car.setCarUser(user);
//			给没有有购物车的用户一个购物车
			this.carService.insert(car);
			System.out.println("创建购物车");
		}
		else {
			System.out.println("判断到：用户有购物车");
//			有购物车的用户：
			car = this.carService.findByUserId(uId);
			carItemList = car.getCarItem();
			for (CarItem carItem : carItemList) {
				System.out.println("找到的购物车项==="+carItem);
			}
		}
		System.out.println("找到用户的购物车：");
		System.out.println(car);
		model.addAttribute("carItemList", carItemList);
		return "user/myCar";
	}
	
	
//	删除购物车项，重定向到购物车
	@RequestMapping("delItem")
	public String delItem(@Param("caritemId")String caritemId) {
		System.out.println("CarController.delItem() ran...");
		System.out.println("从myCar.jsp拿到的itemI："+caritemId);
		Integer itemId = Integer.parseInt(caritemId);
		this.carItemService.delItemByCaritemId(itemId);
		System.out.println("已从数据库删除");
		return "redirect:/car/toShowCar";
	}
	
//	批量删除购物车
	@RequestMapping("delItemList")
	public String delItemList(@Param("itemList")String itemList) {
		System.out.println("CarController.delItemList() ran...");
		System.out.println("从myCar.jsp拿到的itemList：");
		System.out.println(itemList);
//		拆分
		String[] itemIdList = itemList.split(",");
//		对每一个Id转类型，删除
		for (String itemId : itemIdList) {
			Integer caritemId = Integer.parseInt(itemId);
			this.carItemService.delItemByCaritemId(caritemId);
		}
		System.out.println("删除成功！");
		return "redirect:/car/toShowCar";
	}
	
//	用户添加商品到购物车，页面跳转到购物车
//	1.添加物品到购物车，（如果没有购物车就为用户创建购物车）
//	2.当购物车里还没有此项课程时，添加此课程到购物车项内
	@RequestMapping("addIntoCar")
	public String addIntoCar(HttpSession session,
			@Param("trainPrice")BigDecimal trainPrice,
			@Param("trainImg")String trainImg,
			@Param("trainName")String trainName,
			Model model) {
		System.out.println("CarController.addIntoCar() ran...");
		System.out.println("前端拿到的trainPrice，trainImg，trainName：");
		System.out.println(trainPrice);
		System.out.println(trainImg);
		System.out.println(trainName);
		
//		获取用户Id
		Integer uId = (Integer) session.getAttribute("uId");
		System.out.println("session中拿到的userId :"+uId);
//		根据用户Id找到用户
		User user = this.userService.findByUId(uId);
		
//		如果此用户没有购物车，则创建用户的购物车
		Car car = null;
		if(this.carService.isNull(uId)){//		此用户没有购物车	
			System.out.println("判断到：用户没有购物车，重新创建");
			car = new Car();
//			组装Car与用户user
			car.setCarUser(user);
//			给没有有购物车的用户一个购物车
			this.carService.insert(car);
			System.out.println("创建购物车");
		}
		else {
//			有购物车的用户：
			car = this.carService.findByUserId(uId);
		}
//		获得购物车Id
		Integer carId = car.getCarId();
//		查询是否购物车里已经有这个商品
		CarItem carItem = this.carItemService.findBytrainNamecarId(trainName, carId);
//		如果购物车里没有此项：添加购物项
		if(carItem == null) {
			carItem = new CarItem();
			carItem.setCaritemCar(car);
			carItem.setCaritemTrainPrice(trainPrice);
			carItem.setCaritemTrainImg(trainImg);
			carItem.setCaritemTrainName(trainName);
			System.out.println("创建好的car"+car);
			System.out.println("创建好的carItem"+carItem);
			
//			插入到数据库
			this.carItemService.insert(carItem);
		}else {
			String msg = "这个课程您已经加入购物车啦！";
			model.addAttribute("msg", msg);
		}
		return "redirect:/car/toShowCar";
	}
	
	
}
