package com.fit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.fit.domain.OrderState;
import com.fit.mapper.OrderStateMapper;

@Service
public class OrderStateService {
	@Autowired
	private OrderStateMapper OrderStateService;
	
	//根据主键查号订单状态
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public OrderState selectByPrimaryKey(Integer stateId) {
		try {
			return this.OrderStateService.selectByPrimaryKey(stateId);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	 }
	
//  所有状态
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public List<OrderState> findAll(){
		try {
			return this.OrderStateService.findAll();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
  
}
