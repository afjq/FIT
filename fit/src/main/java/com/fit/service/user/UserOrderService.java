package com.fit.service.user;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.fit.domain.user.UODetail;
import com.fit.domain.user.UserOrder;
import com.fit.mapper.user.UODetailMapper;
import com.fit.mapper.user.UserOrderMapper;

@Service
public class UserOrderService {
	@Autowired
	private UserOrderMapper userOrderMapper;
	@Autowired
	private UODetailMapper uODetailMapper;
	
	//	用户下单，保存订单
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor= {Exception.class})
	public int insert(@Param("uOrder")UserOrder uOrder) {
		try {
			return this.userOrderMapper.insert(uOrder);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
	//根据用户订单编号从查找用户的订单，并且把订单详情装入
	/**
	 * @param userorderId
	 * 根据订单Id查找用户订单，组装了与用户订单详情
	 * @return userOrder 
	 */
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public UserOrder findByUserOrderId(String userorderId) {
		try {
//			订单的详细信息
			List<UODetail> uoDetailList = this.uODetailMapper.findByOrderId(userorderId);
			UserOrder userOrder = this.userOrderMapper.findByUserOrderId(userorderId);
			userOrder.setUserorderDetails(uoDetailList);
			return userOrder;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
	
//	用户删除订单(根据订单Id)
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor= {Exception.class})
	public void delByOrderId(String userorderId) {
		try {
			this.userOrderMapper.delByOrderId(userorderId);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
	//根据用户的Id或者订单状态查找用户的所有订单
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public List<UserOrder> findByUserIdORState(Integer userId,Integer stateId){
		try {
			if(stateId==null) {//没有stateId时，只根据用户Id查询用户的所有订单
				return this.userOrderMapper.findByUserId(userId);
			}
			else {
				return this.userOrderMapper.findByUserIdState(userId, stateId);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
//	修改用户订单状态
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor= {Exception.class})
	public void updateOrderStateByOrderId(@Param("stateId")Integer stateId,@Param("orderId")String orderId) {
		 try {
			this.userOrderMapper.updateOrderStateByOrderId(stateId, orderId);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	 }
}
