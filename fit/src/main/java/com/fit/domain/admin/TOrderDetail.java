package com.fit.domain.admin;

public class TOrderDetail {
	//t_order_detail_name	varchar
	private String tOrderDetailName;
	//t_order_detail_price	double
	private Double tOrderDetailPrice;    
	//t_order	int
	private TotalOrder tOrder;
	public String gettOrderDetailName() {
		return tOrderDetailName;
	}
	public void settOrderDetailName(String tOrderDetailName) {
		this.tOrderDetailName = tOrderDetailName;
	}
	public Double gettOrderDetailPrice() {
		return tOrderDetailPrice;
	}
	public void settOrderDetailPrice(Double tOrderDetailPrice) {
		this.tOrderDetailPrice = tOrderDetailPrice;
	}
	public TotalOrder gettOrder() {
		return tOrder;
	}
	public void settOrder(TotalOrder tOrder) {
		this.tOrder = tOrder;
	}
	public TOrderDetail() {}
	public TOrderDetail(String tOrderDetailName, Double tOrderDetailPrice, TotalOrder tOrder) {
		super();
		this.tOrderDetailName = tOrderDetailName;
		this.tOrderDetailPrice = tOrderDetailPrice;
		this.tOrder = tOrder;
	}
	@Override
	public String toString() {
		return "TOrderDetail [tOrderDetailName=" + tOrderDetailName + ", tOrderDetailPrice=" + tOrderDetailPrice
				+ ", tOrder=" + tOrder + "]";
	}
}
