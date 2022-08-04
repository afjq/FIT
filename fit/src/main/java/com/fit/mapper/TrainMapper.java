package com.fit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fit.domain.Train;

@Mapper
public interface TrainMapper {
	
//东夏
	//根据教练Id查询该教练课程
	List<Train> findByCoachId(int coachId);
//	峥滢：用户
	
//	查看所有的课程计划，呈现给用户购买
	List<Train> findAll();
	
//	根据训练等级查看训练
	List<Train> findByGradeId(Integer gradeId); 
	
//	根据Id查找Train
	Train findById(Integer trainId);
	
	
//	北梅：教练
//	通过课程名称查找课程
	Train findTrainByTrainName(String trainName);
	
//	通过课程Id删除教练课程
	boolean deleteTrainById(Integer trainId);
	
//	添加课程
	int insert(Train train);
}
