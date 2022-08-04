package com.fit.mapper.user;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.fit.domain.user.ShopOrder;
@Mapper
public interface ShopOrderMapper {
//	用户下单，生成订单
	int insert(@Param("shopOrder")ShopOrder shopOrder);
//	根据当前用户查询订单
	ShopOrder findByUId(@Param("uId")Integer uId);
//	支付成功后，根据订单Id清除记录
	void delShopOrder(String orderId);
//	清空用户Id清空该用户的临时单
	void delByUId(Integer uId);
}