package com.fit.service.user;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.fit.domain.user.ShopOrder;
import com.fit.mapper.user.ShopOrderMapper;

@Service("ShopOrderService")
public class ShopOrderService {
	@Autowired
	private ShopOrderMapper shopOrderMapper;
	
//	用户下单，生成订单
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor= {Exception.class})
	public int insert(@Param("shopOrder")ShopOrder shopOrder) {
		try {
			return this.shopOrderMapper.insert(shopOrder);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
//	根据当前用户查询订单
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public ShopOrder findByUId(Integer uID) {
		try {
			return this.shopOrderMapper.findByUId(uID);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
//	支付成功后，根据订单Id清除记录
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor= {Exception.class})
	public void delShopOrder(String orderId) {
		try {
			this.shopOrderMapper.delShopOrder(orderId);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
	
//	清空用户Id清空该用户的临时单
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor= {Exception.class})
	public void delByUId(Integer uId) {
		try {
			this.shopOrderMapper.delByUId(uId);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
}
