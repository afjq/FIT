package com.fit.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.fit.domain.user.Muscle;
import com.fit.mapper.user.MuscleMapper;

@Service
public class MuscleService {
	
	@Autowired
	private MuscleMapper muscleMapper;
	
//	查询所有肌肉，带出动作集合
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public List<Muscle> findAll(){
		try {
			return this.muscleMapper.findAll();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e); 
		}
	}
	
//	通过肌肉Id查找肌肉以及可以锻炼这块肌肉的动作
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public Muscle findById(Integer muscleId) {
		try {
			return this.muscleMapper.findById(muscleId);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e); 
		}
		
	}
}
