package com.fit.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.fit.domain.admin.TotalOrder;
import com.fit.mapper.admin.TotalOrderMapper;

@Service
public class TotalOrderService {
	
	@Autowired
	private TotalOrderMapper totalOrderMapper;
	
	//查询健身房所有订单
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public List<TotalOrder> findAll(){
		
	    System.out.println("totalOrderMapper.findAll have ran....");
		try {
			return totalOrderMapper.findAll();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	

//	根据订单号查找订单，判断是否有总订单
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public boolean haveTotalOrder(String orderId) {
		try {
			if(this.totalOrderMapper.findByOrderId(orderId)==null) {
				return true;//null
			}else {
				return false;//有结果
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
//	插入总订单
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor= {Exception.class})
	public void insert(TotalOrder totalOrder) {
		try {
			this.totalOrderMapper.insert(totalOrder);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

}
