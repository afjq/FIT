package com.fit.domain.user;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

import com.fit.domain.OrderState;

public class UserOrder {
	private String userorderId;

	private Timestamp userorderCreatetime;
	//	对一：一个订单属于一个用户
	private User userorderUser;
	//	对一：订单状态
	private OrderState userorderState;

	private BigDecimal userorderPrice;

	private String userorderPhone;

	//	对多：一个订单具有多个详情
	private List<UODetail> userorderDetails;
	
	

	public String getUserorderId() {
		return userorderId;
	}

	public void setUserorderId(String userorderId) {
		this.userorderId = userorderId;
	}

	public Timestamp getUserorderCreatetime() {
		return userorderCreatetime;
	}

	public void setUserorderCreatetime(Timestamp userorderCreatetime) {
		this.userorderCreatetime = userorderCreatetime;
	}

	public User getUserorderUser() {
		return userorderUser;
	}

	public void setUserorderUser(User userorderUser) {
		this.userorderUser = userorderUser;
	}

	public OrderState getUserorderState() {
		return userorderState;
	}

	public void setUserorderState(OrderState userorderState) {
		this.userorderState = userorderState;
	}

	public BigDecimal getUserorderPrice() {
		return userorderPrice;
	}

	public void setUserorderPrice(BigDecimal userorderPrice) {
		this.userorderPrice = userorderPrice;
	}

	public String getUserorderPhone() {
		return userorderPhone;
	}

	public void setUserorderPhone(String userorderPhone) {
		this.userorderPhone = userorderPhone;
	}

	public List<UODetail> getUserorderDetails() {
		return userorderDetails;
	}

	public void setUserorderDetails(List<UODetail> userorderDetails) {
		this.userorderDetails = userorderDetails;
	}

	public UserOrder(String userorderId, Timestamp userorderCreatetime, User userorderUser, OrderState userorderState,
			BigDecimal userorderPrice, String userorderPhone, List<UODetail> userorderDetails) {
		super();
		this.userorderId = userorderId;
		this.userorderCreatetime = userorderCreatetime;
		this.userorderUser = userorderUser;
		this.userorderState = userorderState;
		this.userorderPrice = userorderPrice;
		this.userorderPhone = userorderPhone;
		this.userorderDetails = userorderDetails;
	}

	public UserOrder() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "UserOrder [userorderId=" + userorderId + ", userorderCreatetime=" + userorderCreatetime
				+ ", userorderUser=" + userorderUser + ", userorderState=" + userorderState + ", userorderPrice="
				+ userorderPrice + ", userorderPhone=" + userorderPhone + ", userorderDetails=" + userorderDetails
				+ "]";
	}
	

}