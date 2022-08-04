package com.fit.domain.coach;


import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import com.fit.domain.user.User;

import lombok.Data;

@Data
public class CoachOrder {

	//	coachorder_id	int
	private String coachOrderId; 

	//	coachorder_coach	int
	//	一个订单只属于一个教练
	private Coach coachOrderCoach;

	//	coachorder_createtime	timestamp
	private Date coachOrderCreatetime;

	//	coachorder_user 
	//	对一，一个订单由一个顾客创建
	private User coachOrderUser;

	//	对多：一个订单有多个订单详情
	private List<COrderDetail> COrderDetailList;

	//	不放在数据库，订单总价格
	private BigDecimal coachOrderPrice;

	public CoachOrder(String coachOrderId, Coach coachOrderCoach, Date coachOrderCreatetime, User coachOrderUser,
			List<COrderDetail> cOrderDetailList, BigDecimal coachOrderPrice) {
		super();
		this.coachOrderId = coachOrderId;
		this.coachOrderCoach = coachOrderCoach;
		this.coachOrderCreatetime = coachOrderCreatetime;
		this.coachOrderUser = coachOrderUser;
		COrderDetailList = cOrderDetailList;
		this.coachOrderPrice = coachOrderPrice;
	}

	public CoachOrder() {
		super();
		// TODO Auto-generated constructor stub
	}


}
