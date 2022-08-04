package com.fit.service.coach;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.fit.domain.Train;
import com.fit.domain.coach.Coach;
import com.fit.mapper.TrainMapper;
import com.fit.mapper.coach.CoachMapper;

@Service
public class CoachService {

	@Autowired
	private CoachMapper coachMapper;
	@Autowired 
	private TrainMapper trainMapper;

	//东夏
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public boolean findByPhone(@Param("coachPhone") String coachPhone, @Param("coachPsw") String coachPsw) {

		if (coachMapper.findByPhone(coachPhone, coachPsw) != null) {
			return true;
		} else {
			return false;
		}

	}

	/*
	 * // 添加一个教练
	 * 
	 * @Transactional(propagation=Propagation.REQUIRED,rollbackFor=
	 * {Exception.class}) public int insert( Coach coach) {
	 * System.out.println("CoachService.insert have ran...."); try { return
	 * coachMapper.insert(coach); } catch (Exception e) { e.printStackTrace(); throw
	 * new RuntimeException(e); } }
	 */


	//添加教练

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = {
			Exception.class }) public int insert(
					@Param("coachPhone") String coachPhone, 
					@Param("coachName") String coachName,
					@Param("coachPsw") String coachPsw, 
					@Param("coachSex") String coachSex,
					@Param("coachPower") String coachPower, 
					@Param("coachImg") String coachImg,
					@Param("coachInfo") String coachInfo, 
					@Param("coachSalt") String coachSalt) {
		System.out.println("CoachService.insert have ran...."); 
		try { 
			return coachMapper.insert(coachPhone, coachName, coachPsw, coachSex, coachPower, coachImg, coachInfo, coachSalt); 
		} catch (Exception e) { 
			e.printStackTrace();
			throw new RuntimeException(e); 
		} 
	}

	//通过Id删除教练
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public boolean deleteCoachById(int coachId) {
		System.out.println("CoachService.deleteCoachById have ran....");
		try {
			return coachMapper.deleteCoachById(coachId);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	//查询所有教练
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<Coach> selectAll() {
		System.out.println("CoachService.selectAll have ran....");
		try {
			return coachMapper.selectAll();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	//通过教练名字查找教练
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<Coach> findByCoachName(String coachName) {
		System.out.println("CoachService.selectAll have ran....");
		try {
			return coachMapper.findByCoachName(coachName);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}


	//根据教练账号查找教练
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public Coach findByCoachPhone(String coachPhone) {
		try {
			return this.coachMapper.findByCoachPhone(coachPhone);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	// 判断账号是否存在
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public boolean isCoachPhoneExit(String coachPhone) {
		System.out.println("CoachService.isCoachPhoneExit have ran....");
		if (coachMapper.findByCoachPhone(coachPhone) == null) {
			return false;
		} else {
			return true;
		}
	}

	//北梅
	/*
	 * // 教练修改个人信息
	 * 
	 * @Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class}
	 * ) public int updateCoach(Coach sessionCoach,String coachPsw,String
	 * coachPhone,String coachName,String coachSex,String coachImg) {
	 * System.out.println("CoachService.updateCoach have ran...."); try { Coach
	 * coach = new Coach(); coach.setCoachPsw(coachPsw);
	 * coach.setCoachPhone(coachPhone); coach.setCoachName(coachName);
	 * coach.setCoachSex(coachSex); coach.setCoachImg(coachImg);
	 * coach.setCoachId(sessionCoach.getCoachId()); return
	 * this.coachMapper.updateCoach(coach); } catch (Exception e) {
	 * e.printStackTrace(); throw new RuntimeException(e); } }
	 */

	//	通过Id查找教练
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	public Coach findByCoachId(int coachId){ 
		System.out.println("CoachService.findByCoachId have ran....");
		Coach coach=null; 
		try{ 
			coach = this.coachMapper.findByCoachId(coachId); 
			List<Train> trainList = this.trainMapper.findByCoachId(coachId);
			coach.setTrainList(trainList); 
			return coach; 
		}catch(Exception e){
			e.printStackTrace(); 
			throw new RuntimeException(e); 
		} 
	}

	//教练修改个人信息
	
	  @Transactional(propagation=Propagation.REQUIRED,rollbackFor ={
			  Exception.class}) 
	  public int updateCoach(Coach coach) { 
		  try {
	          System.out.println("执行的"); 
	          return this.coachMapper.updateCoach(coach); 
	      }catch (Exception e) { 
		      e.printStackTrace(); 
		      throw new RuntimeException(e); 
		  } 
	}
	 
	
//	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = {
//			Exception.class }) 
//	public int updateCoach(
//					@Param("coachId") Integer coachId,
//					@Param("coachPhone") String coachPhone, 
//					@Param("coachName") String coachName,
//					@Param("coachPsw") String coachPsw, 
//					@Param("coachSex") String coachSex,
//					@Param("coachPower") String coachPower, 
//					@Param("coachInfo") String coachInfo, 
//					@Param("coachSalt") String coachSalt) {
//		System.out.println("CoachService.updateCoach have ran...."); 
//		try { 
//			return coachMapper.updateCoach(coachId,coachPhone, coachName, coachPsw, coachSex, coachPower, coachInfo, coachSalt); 
//		} catch (Exception e) { 
//			e.printStackTrace();
//			throw new RuntimeException(e); 
//		} 
//	}

	//修改教练头像
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor = {Exception.class})
	public int updateCoachImg(Coach coach) {
		try {
			return this.coachMapper.updateCoachImg(coach);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
	//修改教练密码
//	controller传来教练Id 教练新密码 教练新密文
		@Transactional(propagation=Propagation.REQUIRED,rollbackFor = {Exception.class})
		public int updateCoachPsw(Integer coachId,String newCoachPsw,String coachSalt) {
			try {
//				组装
				Coach coach =coachMapper.findByCoachId(coachId);
				coach.setCoachSalt(coachSalt);
				coach.setCoachPsw(newCoachPsw);
				return this.coachMapper.updateCoachPsw(coach);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException(e);
			}
		}
		
		@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
		public String getPswByPhone(String coachPhone) {
			try {
				return this.findByCoachPhone(coachPhone).getCoachPsw();
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException(e);
			}
		}
	
//	插入一个教练
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor= {Exception.class})
	public int insert( Coach coach) {
		System.out.println("CoachService.insert have ran....");
		try {
			return coachMapper.insert(coach);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
	
	//通过电话查找教练
			@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
			public Coach findCoachByCoachPhone(String coachPhone) {
				System.out.println("CoachService.findCoachByCoachPhone have ran....");
				try {
					return coachMapper.findByCoachPhone(coachPhone);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException(e);
				}
			}
////			教练修改个人信息
//			@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
//			public int updateCoach(Coach sessionCoach,String coachPsw,String coachPhone,String coachName,String coachSex,String coachImg) {
//				System.out.println("CoachService.updateCoach have ran....");
//				try {
//					Coach coach = new Coach();
//					coach.setCoachPsw(coachPsw);
//					coach.setCoachPhone(coachPhone);
//					coach.setCoachName(coachName);
//					coach.setCoachSex(coachSex);
//					coach.setCoachId(sessionCoach.getCoachId());
//					return this.coachMapper.updateCoach(coach);
//				} catch (Exception e) {
//					e.printStackTrace();
//					throw new RuntimeException(e);
//				}
//			}

}
