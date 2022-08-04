package com.fit.mapper.user;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.fit.domain.user.UODetail;

@Mapper
public interface UODetailMapper {

	int insert(@Param("uODetail")UODetail uODetail);//	用户下单，保存订单明细
	
	List<UODetail> findByOrderId(String orderId);//根据用户订单编号从查找用户的订单
//	用户删除订单详情(根据订单Id)
	void delByOrderId(String userorderId);
}