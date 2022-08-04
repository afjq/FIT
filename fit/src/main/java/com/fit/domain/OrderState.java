package com.fit.domain;

import lombok.Data;

@Data
public class OrderState {
    private Integer stateId;

    private String stateName;

    public Integer getStateId() {
        return stateId;
    }

    public void setStateId(Integer stateId) {
        this.stateId = stateId;
    }

    public String getStateName() {
        return stateName;
    }

    public void setStateName(String stateName) {
        this.stateName = stateName == null ? null : stateName.trim();
    }

	public OrderState(Integer stateId, String stateName) {
		super();
		this.stateId = stateId;
		this.stateName = stateName;
	}

	public OrderState() {
		super();
		// TODO Auto-generated constructor stub
	}
    
    
}