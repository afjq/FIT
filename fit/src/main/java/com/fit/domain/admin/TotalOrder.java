package com.fit.domain.admin;

import java.util.Date;
import java.util.List;

import com.fit.domain.coach.Coach;

import lombok.Data;

@Data
public class TotalOrder {
	private String totalOrderId;

	//	对一：订单所属教练
	private Coach totalOrderCoach;

	private Date totalOrderCreatetime;

	//	对多：一个订单有多个订单详情
	private List<TOrderDetail> tOrderDetailList;

	public TotalOrder(String totalOrderId, Coach totalOrderCoach, Date totalOrderCreatetime,
			List<com.fit.domain.admin.TOrderDetail> tOrderDetailList) {
		super();
		this.totalOrderId = totalOrderId;
		this.totalOrderCoach = totalOrderCoach;
		this.totalOrderCreatetime = totalOrderCreatetime;
		this.tOrderDetailList = tOrderDetailList;
	}

	public TotalOrder() {
		super();
		// TODO Auto-generated constructor stub
	}




}
