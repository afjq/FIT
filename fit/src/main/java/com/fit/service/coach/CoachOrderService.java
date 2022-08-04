package com.fit.service.coach;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.fit.domain.coach.CoachOrder;
import com.fit.mapper.coach.CoachMapper;
import com.fit.mapper.coach.CoachOrderMapper;

@Service
public class CoachOrderService {
	@Autowired
	private CoachOrderMapper coachOrderMapper;
	@Resource
	private CoachMapper coachMapper;
//	通过教练Id查找教练的订单集合
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	public List<CoachOrder> findByCoachId(Integer coachId){
		try {
			return this.coachOrderMapper.findByCoachId(coachId);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
//	支付成功，插入订单到教练订单表,插入信息至教练订单详情表
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor= {Exception.class})
	public void insert(@Param("coachOrder")CoachOrder coachOrder) {
		try {
			this.coachOrderMapper.insert(coachOrder);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
//	根据订单号查找订单,判断是否存在订单
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	public boolean haveCoachOrder(String orderId) {
		try {
			if(this.coachOrderMapper.findByOrderId(orderId)==null) {
				return true;//true 不存在
			}
			else {
				return false;//false 存在
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
}
