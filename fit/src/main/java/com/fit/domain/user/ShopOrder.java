package com.fit.domain.user;

import java.math.BigDecimal;

import lombok.Data;
@Data
public class ShopOrder {

	private String shoporderId;

	private User shoporderUser;
	//  订单总价格
	private BigDecimal shoporderPrice;
	
	
	public ShopOrder(String shoporderId, User shoporderUser, BigDecimal shoporderPrice) {
		super();
		this.shoporderId = shoporderId;
		this.shoporderUser = shoporderUser;
		this.shoporderPrice = shoporderPrice;
	}
	public ShopOrder() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	


}