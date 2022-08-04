package com.fit.mapper.coach;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.fit.domain.coach.CoachOrder;

@Mapper
public interface CoachOrderMapper {
//	通过教练Id查找教练的订单集合
	List<CoachOrder> findByCoachId(Integer coachId);

//	支付成功，插入订单到教练订单表
	void insert(@Param("coachOrder")CoachOrder coachOrder);
	
//	根据订单号查找订单
	CoachOrder findByOrderId(String orderId);
}
