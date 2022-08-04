package com.fit.domain.user;

import java.math.BigDecimal;

import lombok.Data;

@Data
public class CarItem {
//	caritem_id	int
//	caritem_train_name	varchar
//	caritem_train_price	double
//	caritem_train_img	varchar
//	caritem_car	int
    private Integer caritemId;
//	名称
    private String caritemTrainName;
//	价格
    private BigDecimal caritemTrainPrice;
//  图
    private String caritemTrainImg;
    
//  对一 属于某个购物车的项
    private Car caritemCar;
//    caritem_checked
    private Integer caritemChecked;//此商品是否勾选

	public CarItem(Integer caritemId, String caritemTrainName, BigDecimal caritemTrainPrice, String caritemTrainImg) {
		super();
		this.caritemId = caritemId;
		this.caritemTrainName = caritemTrainName;
		this.caritemTrainPrice = caritemTrainPrice;
		this.caritemTrainImg = caritemTrainImg;
	}

	public CarItem() {
		super();
		// TODO Auto-generated constructor stub
	}

}