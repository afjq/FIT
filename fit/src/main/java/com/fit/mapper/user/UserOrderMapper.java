package com.fit.mapper.user;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.fit.domain.user.UserOrder;
@Mapper
public interface UserOrderMapper {

	int insert(@Param("uOrder")UserOrder uOrder);//	用户下单，保存订单
	
	//根据用户订单编号从查找用户的订单
	UserOrder findByUserOrderId(String userorderId);
	
	//根据用户的Id查找用户的所有订单
	List<UserOrder> findByUserId(Integer userId);
	
//	用户删除订单(根据订单Id)
	void delByOrderId(String userorderId);
	
	//根据用户的Id和订单状态查找用户的所有订单
	List<UserOrder> findByUserIdState(@Param("userId")Integer userId,@Param("stateId")Integer stateId);
	
//	修改用户订单状态
	 void updateOrderStateByOrderId(@Param("stateId")Integer stateId,@Param("orderId")String orderId);
}