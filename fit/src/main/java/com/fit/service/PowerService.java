package com.fit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.fit.domain.Power;
import com.fit.mapper.PowerMapper;

@Service
public class PowerService {
	@Autowired
	private PowerMapper powerMapper;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	public Power findById(Integer powerId) {
		try {
			return this.powerMapper.findById(powerId);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

}
