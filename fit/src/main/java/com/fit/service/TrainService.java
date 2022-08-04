package com.fit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.fit.domain.Train;
import com.fit.mapper.TrainMapper;

@Service
public class TrainService {
	
	@Autowired
	private TrainMapper trainMapper;

//东夏
	//根据教练Id查找课程
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	public List<Train> findByCoachId(int coachId){
		System.out.println("TrainService.findByCoachId have ran....");
		try {
			return this.trainMapper.findByCoachId(coachId);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
//北梅
//	查看所有的课程计划，呈现给用户购买 
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public List<Train> findAll(){
		try {
			return this.trainMapper.findAll();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e); 
		}
	}
	
//	根据训练等级查看训练
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public List<Train> findByGradeId(Integer gradeId){
		try {
			return this.trainMapper.findByGradeId(gradeId);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e); 
		}
	}
	
//	根据Id查找Train
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public Train findById(Integer trainId){
		try {
			return this.trainMapper.findById(trainId);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e); 
		}
	}
	
	//判断课程名称是否存在
			@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
			public boolean isTrainNameExit(String trainName) {
				System.out.println("TrainService.isTrainNameExit have ran....");
				if(trainMapper.findTrainByTrainName(trainName) == null) {
					return false;
				}else {
					return true;
				}
			}
		
//		添加一门课程
		@Transactional(propagation=Propagation.REQUIRED,rollbackFor= {Exception.class})
		public int insert(Train train) {
			System.out.println("TrainService.insert have ran....");
			try {
				return trainMapper.insert(train);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException(e);
			}
		}
		
//		通过课程Id删除一个教练课程
		@Transactional(propagation=Propagation.REQUIRED,rollbackFor= {Exception.class})
		public boolean deleteTrainById(Integer trainId) {
			System.out.println("TrainService.deleteTrainById have ran....");
			try {
				return trainMapper.deleteTrainById(trainId);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException(e);
			}
		}

		
		//		通过课程名称查找课程
		@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
		public Train findTrainByTrainName(String trainName) {
			try {
				return this.trainMapper.findTrainByTrainName(trainName);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException(e);
			}
		}
}
