package com.fit.mapper.user;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fit.domain.user.Muscle;

@Mapper
public interface MuscleMapper {
//	查询所有肌肉
	List<Muscle> findAll();
	
//	通过肌肉Id查找肌肉以及可以锻炼这块肌肉的动作
	Muscle findById(Integer muscleId);
}