package com.fit.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.fit.domain.user.Car;
import com.fit.domain.user.CarItem;
import com.fit.mapper.user.CarItemMapper;
import com.fit.mapper.user.CarMapper;

@Service
public class CarService {
	
	@Autowired
	private CarMapper carMapper;
	@Autowired
	private CarItemMapper carItemMapper;
	
//	创建购物车
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor= {Exception.class})
	public int insert(Car car) {
		try {
			return this.carMapper.insert(car);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
//	根据用户Id查找用户的购物车，带购物购物车项，带用户
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public Car findByUserId(Integer userId) {
		try {
//			找购物车
			Car car =  this.carMapper.findByUserId(userId);
			Integer carId = car.getCarId();
//			找购物车Item
			List<CarItem> carItemList = this.carItemMapper.findByCarId(carId);
//			组装
			car.setCarItem(carItemList);
			return car;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
//	根据用户Id查找用户的购物车，带购物购物车项，带用户
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public boolean isNull(Integer userId) {
		try {
//			找购物车
			Car car =  this.carMapper.findByUserId(userId);
			if(car==null) { //没有购物车
				return true;
			}else {
				return false;//有购物车
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
}
