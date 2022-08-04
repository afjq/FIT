package com.fit.service.user;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.fit.domain.user.UODetail;
import com.fit.mapper.user.UODetailMapper;

@Service
public class UODetailService {
	@Autowired
	private UODetailMapper uODetailMapper;

	//	用户下单，保存订单明细
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor= {Exception.class})
	public int insert(@Param("uODetail")UODetail uODetail) {
		try {
			return this.uODetailMapper.insert(uODetail);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	//根据用户订单编号从查找用户的订单详情
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public List<UODetail> findByOrderId(String orderId){
		try {
			return this.uODetailMapper.findByOrderId(orderId);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
//	用户删除订单详情(根据订单Id)
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor= {Exception.class})
	public void delByOrderId(String userorderId) {
		try {
			this.uODetailMapper.delByOrderId(userorderId);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
}
