package com.fit.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.fit.domain.Power;

@Mapper
public interface PowerMapper {
	
//	通过powerId查找power
	Power findById(Integer powerId);
 
}
