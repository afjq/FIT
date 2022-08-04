package com.fit.service.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.fit.domain.user.CarItem;
import com.fit.mapper.user.CarItemMapper;

@Service
public class CarItemService {
	@Autowired
	private CarItemMapper carItemMapper;
	
//	添加到购物车
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor= {Exception.class})
	public int insert(CarItem carItem) {
		try {
			return this.carItemMapper.insert(carItem);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
//	通过购物车Id，商品名，查询购物车内已有商品
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public CarItem findBytrainNamecarId(String trainName,Integer carId) {
		try {
			return this.carItemMapper.findBytrainNamecarId(trainName, carId);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
//	通过caritemId删除item
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor= {Exception.class})
	public void delItemByCaritemId(Integer caritemId) {
		try {
			this.carItemMapper.delItemByCaritemId(caritemId);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
}
