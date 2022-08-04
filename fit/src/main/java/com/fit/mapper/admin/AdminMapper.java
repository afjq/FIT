package com.fit.mapper.admin;

import org.apache.ibatis.annotations.Mapper;

import com.fit.domain.admin.Admin;

@Mapper
public interface AdminMapper {
	
	//public  Admin findAdminByAdminPhone(String adminPhone);
	public  Admin findByAdminPhone(String adminPhone);

}

