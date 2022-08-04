package com.fit.domain.user;

import java.math.BigDecimal;
import java.util.List;

import lombok.Data;

@Data
public class Car {
	private Integer carId;

	private User carUser;
	//    car_totalprice
	private BigDecimal carTotalPrice;
	//  对多 一个购物车有多个购物项
	private List<CarItem> carItem;
//	car_allchecked
	private Boolean allChecked;//是否已经都勾选

	public Car(Integer carId, List<CarItem> carItem, User carUser, BigDecimal carTotalPrice) {
		super();
		this.carId = carId;
		this.carItem = carItem;
		this.carUser = carUser;
		this.carTotalPrice = carTotalPrice;
	}
	public Car() {
		super();
		// TODO Auto-generated constructor stub
	}


}