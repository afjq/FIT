package com.fit.domain.user;

import java.math.BigDecimal;

import lombok.Data;
@Data
public class UODetail {
	private Integer uoDetailId;

	private String uoDetailTrainName;

	private BigDecimal uoDetailTrainPrice;
	//  对一： 每个订单详情属于一个订单
	private UserOrder uo;
	public UODetail(Integer uoDetailId, String uoDetailTrainName, BigDecimal uoDetailTrainPrice, UserOrder uo) {
		super();
		this.uoDetailId = uoDetailId;
		this.uoDetailTrainName = uoDetailTrainName;
		this.uoDetailTrainPrice = uoDetailTrainPrice;
		this.uo = uo;
	}
	public UODetail() {
		super();
		// TODO Auto-generated constructor stub
	}



}