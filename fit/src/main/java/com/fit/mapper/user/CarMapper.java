package com.fit.mapper.user;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.fit.domain.user.Car;

@Mapper
public interface CarMapper {
//	创建某用户的购物车
	int insert(@Param("car")Car car);
	
//	根据用户Id查找用户的购物车
	Car findByUserId(Integer userId);
}