package com.fit.mapper.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.fit.domain.admin.TOrderDetail;

@Mapper
public interface TOrderDetailMapper {
	
	//通过订单Id查找订单详情
	List<TOrderDetail> findByTOrderId(Integer totalOrderId);

//	插入总订单详情
	void insert(@Param("tOrderDetail")TOrderDetail tOrderDetail);
}
