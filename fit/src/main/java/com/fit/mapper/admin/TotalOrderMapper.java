package com.fit.mapper.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.fit.domain.admin.TotalOrder;

@Mapper
public interface TotalOrderMapper {
	//查找总订单
	List<TotalOrder> findAll();


//	根据订单号查找订单
	TotalOrder findByOrderId(String orderId);
	
//	插入总订单
	void insert(@Param("totalOrder")TotalOrder totalOrder);
}
