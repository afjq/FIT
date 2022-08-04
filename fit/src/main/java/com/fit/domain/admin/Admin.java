package com.fit.domain.admin;

import com.fit.domain.Power;

import lombok.Data;

@Data
public class Admin {
	
	//admin_id	int
	private Integer adminId;
	//admin_phone	varchar
	private String adminPhone;
	//admin_psw	varchar
	private String adminPsw;
	//admin_power	int
	private Power adminPower;


}
