package com.fit.service.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.fit.domain.admin.Admin;
import com.fit.mapper.admin.AdminMapper;

@Service
public class AdminService {

	@Autowired
	private AdminMapper adminMapper;

	/*
	 * public Admin findAdminByName(String adminName, String adminPsw) { return
	 * adminMapper.findAdminByName(adminName); }
	 */

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public Admin findByAdminPhone(String adminPhone, String adminPsw) {
        try {
			return adminMapper.findByAdminPhone(adminPhone);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
    }

}