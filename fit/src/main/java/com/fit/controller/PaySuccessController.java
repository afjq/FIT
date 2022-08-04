package com.fit.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fit.domain.OrderState;
import com.fit.domain.Train;
import com.fit.domain.admin.TOrderDetail;
import com.fit.domain.admin.TotalOrder;
import com.fit.domain.coach.COrderDetail;
import com.fit.domain.coach.Coach;
import com.fit.domain.coach.CoachOrder;
import com.fit.domain.user.UODetail;
import com.fit.domain.user.User;
import com.fit.domain.user.UserOrder;
import com.fit.service.OrderStateService;
import com.fit.service.TrainService;
import com.fit.service.admin.TOrderDetailService;
import com.fit.service.admin.TotalOrderService;
import com.fit.service.coach.COrderDetailService;
import com.fit.service.coach.CoachOrderService;
import com.fit.service.user.ShopOrderService;
import com.fit.service.user.UODetailService;
import com.fit.service.user.UserOrderService;
import com.fit.service.user.UserService;

@Controller
@RequestMapping("/paySuccess")
public class PaySuccessController {

	@Autowired
	private ShopOrderService shopOrderService;
	@Autowired
	private UserOrderService userOrderService;
	@Autowired
	private OrderStateService orderStateService;
	@Autowired
	private UODetailService uODetailService;
	@Autowired
	private TrainService trainService;
	@Autowired
	private CoachOrderService coachOrderService;
	@Autowired
	private COrderDetailService cOrderDetailService;
	@Resource
	private UserService userService;
	@Resource
	private TotalOrderService totalOrderService;
	@Resource
	private TOrderDetailService tOrderDetailService;

	/**
	 * @Title orderSolve
	 * @Description 用户支付成功后,关于订单的处理
	 * 1. 将订单插入到本健身房的总订单中
	 * 2. 将订单插入到订单详情课程对应教练的教练订单中
	 * @Param: orderId
	 * @Return toShowUserTrain,显示用户的已购课程
	 * @author 李峥滢
	 * @CreateDate: ${date} ${time}</p> 
	 * @update: [序号][日期YYYY-MM-DD] [更改人姓名][变更描述]     
	 */
	@RequestMapping("orderSolve")
	public String orderSolve(HttpSession session,String orderId) {
		System.out.println("PaySuccessController.orderSolve() ran ");

		//		支付成功，根据orderId清除shopOrder表中的记录
		System.out.println("支付成功返回订单Id==="+orderId);
		this.shopOrderService.delShopOrder(orderId);
		System.out.println("已清除shopOrder记录");

		//		先根据订单Id从用户订单表UserOrder中找出订单，以及订单的详情
		UserOrder userOrder = this.userOrderService.findByUserOrderId(orderId);
		System.out.println("找到的UserOrder");
		System.out.println(userOrder);
//		获取用户Id
		Integer uId = (Integer) session.getAttribute("uId");
		System.out.println("session中拿到的userId :"+uId);
//		根据用户Id找到用户
		User user = this.userService.findByUId(uId);
		System.out.println("下单顾客是==="+user);
		//		找到已支付的订单状态,数据库中2对应的是“已支付”状态
		OrderState orderState= this.orderStateService.selectByPrimaryKey(2);
		System.out.println("订单状态改变修改为==="+orderState);
		//		设置订单状态为已支付
		this.userOrderService.updateOrderStateByOrderId(2, orderId);
		userOrder.setUserorderState(orderState);
		System.out.println("已经设置订单状态后的userOrder===");
		System.out.println(userOrder);

		//		找到用户订单详情
		List<UODetail> uoDetailList = this.uODetailService.findByOrderId(orderId);
		//		创建教练订单详情
		COrderDetail cOrderDetail = new COrderDetail();
		//		创建教练订单
		CoachOrder coachOrder = new CoachOrder();
		//		创建总订单详情
		TOrderDetail tOrderDetail = new TOrderDetail();
		//		创建总订单
		TotalOrder totalOrder = new TotalOrder();
		//		遍历每一个订单详情,准备数据
		for (UODetail uoDetail : uoDetailList) {
			//			课程名
			String uoDetaiName = uoDetail.getUoDetailTrainName();
			//			根据课程名查找课程
			Train train = this.trainService.findTrainByTrainName(uoDetaiName);
			System.out.println("订单的详情课程："+train);
			//			获得开设课程的教练
			Coach trainCoach = train.getTrainCoach();
			System.out.println("开设此课程的教练："+trainCoach);
			
//			先判断有没有这个订单，没有就组装，插入数据库
			if(this.coachOrderService.haveCoachOrder(orderId)) {//true:结果为空，false：有结果
//				组装每一个教练订单
				coachOrder.setCoachOrderCoach(trainCoach);
				coachOrder.setCoachOrderCreatetime(userOrder.getUserorderCreatetime());
				coachOrder.setCoachOrderId(orderId);
				coachOrder.setCoachOrderUser(user);
				System.out.println("准备好的coachOrder==="+coachOrder);
				this.coachOrderService.insert(coachOrder);
				System.out.println("插入教练订单");
			}else {}//否则有订单了就不用再插入一次了
			
			//			组装教练订单详情
			cOrderDetail.setCoDetailOrder(coachOrder);
			cOrderDetail.setCoDetailTrainName(train.getTrainName());
			cOrderDetail.setCoDetailTrainPrice(train.getTrainPrice());
			System.out.println("准备好的cOrderDetail==="+cOrderDetail);
			this.cOrderDetailService.insert(cOrderDetail);
			System.out.println("插入教练订单详情");
			
//			判断是否已经有总订单
			if(this.totalOrderService.haveTotalOrder(orderId)) {
//				组装总订单
				totalOrder.setTotalOrderCoach(trainCoach);
				totalOrder.setTotalOrderCreatetime(userOrder.getUserorderCreatetime());
				totalOrder.setTotalOrderId(orderId);
				System.out.println("准备好的totalOrder==="+totalOrder);
				this.totalOrderService.insert(totalOrder);
				System.out.println("插入总订单");
//				插入
			}else {}
			
			//			组装总订单详情
			tOrderDetail.settOrder(totalOrder);
			tOrderDetail.settOrderDetailName(train.getTrainName());
			tOrderDetail.settOrderDetailPrice(train.getTrainPrice());
			System.out.println("准备好的tOrderDetail==="+tOrderDetail);
			this.tOrderDetailService.insert(tOrderDetail);
			System.out.println("插入总订单详情");
		}

		return "redirect:/UserOrder/toShowMyTrain";
	}
}
