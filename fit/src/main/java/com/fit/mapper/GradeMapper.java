package com.fit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fit.domain.Grade;
@Mapper
public interface GradeMapper {
//	查看所有级别
	List<Grade> findAll();
	
//	根据Id查找Grade
	Grade findById(Integer gradeId);
	
}