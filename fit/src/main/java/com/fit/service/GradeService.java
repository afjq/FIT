package com.fit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.fit.domain.Grade;
import com.fit.mapper.GradeMapper;

@Service(value="GradeService")
public class GradeService {
	
	@Autowired
	private GradeMapper gradeMapper;
	
//	查看所有级别
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public List<Grade> findAll(){
		try {
			return this.gradeMapper.findAll();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);

		}
	}
	
	
//	根据Id查找Grade
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public Grade findById(Integer gradeId) {
		try {
			return this.gradeMapper.findById(gradeId);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}	
	}
}
