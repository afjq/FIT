package com.fit.controller;


import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fit.domain.OrderState;
import com.fit.domain.Train;
import com.fit.domain.user.Car;
import com.fit.domain.user.CarItem;
import com.fit.domain.user.ShopOrder;
import com.fit.domain.user.UODetail;
import com.fit.domain.user.User;
import com.fit.domain.user.UserOrder;
import com.fit.service.OrderStateService;
import com.fit.service.TrainService;
import com.fit.service.user.CarItemService;
import com.fit.service.user.CarService;
import com.fit.service.user.ShopOrderService;
import com.fit.service.user.UODetailService;
import com.fit.service.user.UserOrderService;
import com.fit.service.user.UserService;
import com.fit.utils.BigDecimalUtil;

@RequestMapping("/UserOrder")
@Controller
public class UserOrderController {

	@Resource
	private UserService userService;
	@Resource
	private OrderStateService orderStateService;
	@Resource
	private UserOrderService userOrderService;
	@Resource
	private UODetailService uODetailService;
	@Resource
	private ShopOrderService shopOrderService;
	@Resource
	private CarItemService carItemService;
	@Autowired
	private CarService carService;
	@Autowired
	private TrainService trainService;

	/**
	 * @param 
	 * @Description 
	 * 在购物车点击下单：
	 * 先清空暂存表shoporder
	 * 1. 生成订单：订单编号、用户信息、（插入订单）
		2. 生成订单详情：下单的课程、每个课程的价格
		3. 放在一个只会存一个订单的临时订单表shoporder
		4. 放在用户的订单表，状态未付款
		清除购物车项
	 * @return
	 */
	@RequestMapping("createOrder")
	public String createOrder(HttpSession session,HttpServletRequest request) {
		System.out.println("UserOrderController.createOrder() ran...");
		System.out.println(request.getParameter("uoDetailTrainPrice"));
////		定义一个总价格
//		BigDecimal totalPrices = new BigDecimal(0);
//		BigDecimal totalPrice = new BigDecimal(0);
////		价格
//		String price = request.getParameter("uoDetailTrainPrice");
////		价格数组
//		String[] priceList = price.split(",");
////		对每一个Id转类型，删除
//		for (String prices : priceList) {
//			BigDecimal pricess = new BigDecimal(prices);
//			totalPrice = BigDecimalUtil.add(pricess, totalPices);
//		}
		
		//		获得当前用户Id
		Integer uId = (Integer) session.getAttribute("uId");
		//		查找到当前用户
		User user = this.userService.findByUId(uId);
		System.out.println("session中的用户==="+user);
		//		创建订单
		UserOrder userOrder = new UserOrder();
		//创建订单时间为系统当前时间
		userOrder.setUserorderCreatetime(new Timestamp(System.currentTimeMillis()));
		//随机的订单编号
		String randomId =UUID.randomUUID().toString().replace("-", "");
		userOrder.setUserorderId(randomId);
		//设置订单里的用户电话		
		userOrder.setUserorderPhone(user.getuPhone());
		//		设置订单总价格
		BigDecimal totalPrice = new BigDecimal(request.getParameter("countPrice"));
		userOrder.setUserorderPrice(totalPrice);
		//默认订单状态：已下单，未付款
		OrderState s = this.orderStateService.selectByPrimaryKey(3);
		userOrder.setUserorderState(s);
		userOrder.setUserorderUser(user);		//当前用户的订单
		System.out.println("创建好的订单==="+userOrder);
		//调用插入数据库
		this.userOrderService.insert(userOrder);
		System.out.println("userOrder插入成功！！！");

		
		
//		清楚临时订单表中，该用户的已有订单：根据userId清除shopOrder
		this.shopOrderService.delByUId(uId);
		System.out.println("已先清空暂存订单表中的该用户的订单");
		
		//临时的订单表也要插入数据
		ShopOrder shopOrder = new ShopOrder();
		shopOrder.setShoporderId(randomId);
		shopOrder.setShoporderPrice(totalPrice);
		shopOrder.setShoporderUser(user);
		this.shopOrderService.insert(shopOrder);
		System.out.println("shopOrder插入成功！！！");

		//订单详情：
		//		查找购物车的物品
		System.out.println("request,从前端拿到的：uoDetailTrainName==="+request.getParameter("uoDetailTrainName"));
		System.out.println("request,从前端拿到的：uoDetailTrainPrice==="+request.getParameter("uoDetailTrainPrice"));
		//		处理课程名数据：
		String[] trainNames = request.getParameter("uoDetailTrainName").split(",");
		//		处理价格数据：
		String[] trainPrices = request.getParameter("uoDetailTrainPrice").split(",");
		//		使用其中一个作为循环
		for(int i = 0; i < trainNames.length; i++){
			System.out.println(trainNames[i]);
			System.out.println(trainPrices[i]);
			//当两者内容都不为空时，存入UODetailLIst
			if((!"null".equals(trainNames[i]))&&(!"null".equals(trainPrices[i]))) { 
				//				创建新的订单详情
				UODetail uoDetail = new UODetail();
				//				放入每一个详情名称
				uoDetail.setUoDetailTrainName(trainNames[i]);
				//				放入每一个详情价格
				BigDecimal price = new BigDecimal(trainPrices[i]);
				uoDetail.setUoDetailTrainPrice(price);
				//				所属的订单
				uoDetail.setUo(userOrder);
				System.out.println("准备好的UODetail");
				System.out.println(uoDetail);
				//				调用插入数据库
				this.uODetailService.insert(uoDetail);
				System.out.println("用户订单详情插入成功！！！");
			}
		}
		
		//	清空购物车项:获得购物车Id，遍历所有商品名
		Car car = this.carService.findByUserId(uId);
//		拿到购物车Id
		Integer carId = car.getCarId();
//		拿到商品名
		for(int i = 0; i < trainNames.length; i++){
			System.out.println(trainNames[i]);
			//当商品名不为空时，存入UODetailLIst
			if((!"null".equals(trainNames[i]))) { 
//				找到购物车里的购物项
				CarItem carItem = this.carItemService.findBytrainNamecarId(trainNames[i], carId);
//				获得购物项Id 删除购物项
				Integer carItemId = carItem.getCaritemId();
				this.carItemService.delItemByCaritemId(carItemId);
				System.out.println("下单成功，已从将该用户的购物车项清除已下单的课程");
				}
			}
		//		重定向去用户下单确认页面
		return "redirect:/UserOrder/confirmOrder";
	}

	@RequestMapping("confirmOrder")
	public String confirmOrder(HttpSession session,Model model) {
		System.out.println("UserOrderController.confirmOrder() ran...");
		//		获得当前用户Id
		Integer uId = (Integer) session.getAttribute("uId");
		ShopOrder shopOrder = this.shopOrderService.findByUId(uId);
		System.out.println("找到的shopOrder===="+shopOrder);
		String orderId = shopOrder.getShoporderId();
		List<UODetail> uODetailList = this.uODetailService.findByOrderId(orderId);
		System.out.println("uoDetail===");
		for (UODetail uoDetail : uODetailList) {
			System.out.println(uoDetail);
		}
		model.addAttribute("shopOrder", shopOrder);
		model.addAttribute("uODetailList", uODetailList);
		return "user/confirmOrder";
	}

	@RequestMapping("toOrderPay")
	public String toOrderPay(
			@RequestParam(value="orderId")String orderId,
			@RequestParam(value="price")String price,
			Model model
			) {
		System.out.println("UserOrderController.toOrderPay() ran...");
		System.out.println("orderId==="+orderId);
		System.out.println("price==="+price);
		BigDecimal prices = new BigDecimal(price);
		model.addAttribute("prices", prices);
		model.addAttribute("orderId", orderId);
		return "user/orderpay";
	}
	
//	去显示用户订单页面
	@RequestMapping("toShowUserOrder")
	public String toShowUserOrder(
			String stateId,
			HttpSession session,
			Model model
			) {
		System.out.println("UserOrderController.toShowUserOrder() ran...");
//		获得当前用户Id
		Integer uId = (Integer) session.getAttribute("uId");
		Integer sId=null;
		if(stateId!=null) {//当状态值不为空时
			 sId = Integer.parseInt(stateId);//转型
		}
		else {}//否则不做处理，还是null
//		根据订单状态用户的所有订单
		List<UserOrder> userOrderList = this.userOrderService.findByUserIdORState(uId, sId);
//		查找订单状态表所有内容
		List<OrderState> orderStateList = this.orderStateService.findAll();
		model.addAttribute("userOrderList",userOrderList);
		model.addAttribute("orderStateList",orderStateList);
		return "user/showUserOrder";
	}
	
	
//	用户删除自己的订单
	@RequestMapping("del")
	public String del(@RequestParam(value="orderId")String orderId) {
		System.out.println("UserOrderController.del() ran...");
		this.uODetailService.delByOrderId(orderId);
		System.out.println("先删除了用户订单的详情");
		this.userOrderService.delByOrderId(orderId);
		System.out.println("再删除了用户订单");
		return "redirect:/UserOrder/toShowUserOrder";
	}
	
//	支付成功，查看我的课程
	@RequestMapping("toShowMyTrain")
	public String toShowMyTrain(
			HttpSession session,
			Model model
			) {
		System.out.println("UserOrderController.toShowMyTrain() ran...");
//		trainList 用于给页面显示
		List<Train> trainList = new ArrayList<Train>();
//		获得当前用户Id
		Integer uId = (Integer) session.getAttribute("uId");
		System.out.println("session===="+uId);
//		已付款的订单集合，
		
		List<UserOrder> UserOrderList = this.userOrderService.findByUserIdORState(uId,2);
		System.out.println("遍历我的订单集合==="+UserOrderList);
//		遍历每一个订单拿到订单详情
		for (UserOrder userOrder : UserOrderList) {
			System.out.print("进入遍历每一个订单：");
			System.out.println("userOrder:"+userOrder);
//			获得订单Id
			String userorderId = userOrder.getUserorderId();
//			招到本订单的详情
			List<UODetail> uoDetailList = this.uODetailService.findByOrderId(userorderId);
			for (UODetail uoDetail : uoDetailList) {
				System.out.println("订单详情==="+uoDetail);
//				使用trainName查找train
				String trainName = uoDetail.getUoDetailTrainName();
				Train train = this.trainService.findTrainByTrainName(trainName);
//				装入trainList
				trainList.add(train);
			}
			System.out.println("======================一个订单结束分界线===========================");
		}
		System.out.println("封装好的trainList：");
		for (Train train : trainList) {
			System.out.println(train);
		}
		model.addAttribute("trainList", trainList);
		return "user/myTrain";
	}

}
