package com.fit.service.user;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.fit.domain.user.Act;
import com.fit.mapper.user.ActMapper;

@Service
public class ActService {
	
	@Resource
	private ActMapper actMapper;
	
//	查询所有动作，带出肌肉集合
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public List<Act> findAll(){
		try {
			return this.actMapper.findAll();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e); 
		}
	}
	
//	通过动作id查找某个动作，同时可以看此肌肉锻炼到的肌肉
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public Act findById(Integer actId) {
		try {
			return this.actMapper.findById(actId);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e); 
		}
	}
}
