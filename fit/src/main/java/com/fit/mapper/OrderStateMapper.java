package com.fit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fit.domain.OrderState;
@Mapper
public interface OrderStateMapper {
	
    OrderState selectByPrimaryKey(Integer stateId);//根据主键查号订单状态
    
//    所有状态
    List<OrderState> findAll();

}