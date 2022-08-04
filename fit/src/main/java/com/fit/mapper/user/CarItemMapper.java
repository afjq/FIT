package com.fit.mapper.user;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.fit.domain.user.CarItem;

@Mapper
public interface CarItemMapper {
//	添加到购物车
	int insert(@Param("carItem")CarItem carItem);
	
//	通过购物车Id查找Item集合
	List<CarItem> findByCarId(Integer carId);
	
//	通过购物车Id，商品名，查询购物车内已有商品
	CarItem findBytrainNamecarId(@Param("trainName")String trainName,@Param("carId")Integer carId);
	
//	通过caritemId删除item
	void delItemByCaritemId(Integer caritemId);
	
	
}
