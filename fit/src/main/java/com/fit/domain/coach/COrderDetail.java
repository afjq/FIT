package com.fit.domain.coach;

public class COrderDetail {
	//	co_detail_id	int
	private Integer coDetailId;
	//	co_detail_train_name	varchar
	private String coDetailTrainName;
	//	co_detail_train_price	double
	private Double coDetailTrainPrice;
	//	co_detail_order	int
	private CoachOrder coDetailOrder;

	public Integer getCoDetailId() {
		return coDetailId;
	}
	public void setCoDetailId(Integer coDetailId) {
		this.coDetailId = coDetailId;
	}
	public String getCoDetailTrainName() {
		return coDetailTrainName;
	}
	public void setCoDetailTrainName(String coDetailTrainName) {
		this.coDetailTrainName = coDetailTrainName;
	}
	public Double getCoDetailTrainPrice() {
		return coDetailTrainPrice;
	}
	public void setCoDetailTrainPrice(Double coDetailTrainPrice) {
		this.coDetailTrainPrice = coDetailTrainPrice;
	}
	public CoachOrder getCoDetailOrder() {
		return coDetailOrder;
	}
	public void setCoDetailOrder(CoachOrder coDetailOrder) {
		this.coDetailOrder = coDetailOrder;
	}
	public COrderDetail(Integer coDetailId, String coDetailTrainName, Double coDetailTrainPrice, CoachOrder coDetailOrder) {
		super();
		this.coDetailId = coDetailId;
		this.coDetailTrainName = coDetailTrainName;
		this.coDetailTrainPrice = coDetailTrainPrice;
		this.coDetailOrder = coDetailOrder;
	}
	public COrderDetail() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "COrderDetail [coDetailId=" + coDetailId + ", coDetailTrainName=" + coDetailTrainName
				+ ", coDetailTrainPrice=" + coDetailTrainPrice + ", coDetailOrder=" + coDetailOrder + "]";
	}


}
