package com.fit.domain.user;

import lombok.Data;

@Data
//使用器械表
public class Facility {
    private Integer facilityId;

    private String facilityName;

	public Facility(Integer facilityId, String facilityName) {
		super();
		this.facilityId = facilityId;
		this.facilityName = facilityName;
	}

	public Facility() {
		super();
		// TODO Auto-generated constructor stub
	}

}