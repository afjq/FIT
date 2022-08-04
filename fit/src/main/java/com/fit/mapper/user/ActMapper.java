package com.fit.mapper.user;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fit.domain.user.Act;
@Mapper
public interface ActMapper {
//	查询所有动作，带出肌肉集合
	List<Act> findAll();
	
//	通过动作id查找某个动作，同时可以看此肌肉锻炼到的肌肉
	Act findById(Integer actId);
}