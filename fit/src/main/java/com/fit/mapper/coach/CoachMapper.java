package com.fit.mapper.coach;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.fit.domain.coach.Coach;

@Mapper
public interface CoachMapper {
//东夏：	
	//教练登录
	Coach findByPhone(@Param("coachPhone") String coachPhone,
			          @Param("coachPsw") String coachPsw);
	
	  //添加教练 
	
	  int insert(@Param("coachPhone") String coachPhone,
	  
	  @Param("coachName") String coachName,
	  
	  @Param("coachPsw") String coachPsw,
	  
	  @Param("coachSex") String coachSex,
	  
	  @Param("coachPower") String coachPower,
	  
	  @Param("coachImg") String coachImg,
	  
	  @Param("coachInfo") String coachInfo,
	  
	  @Param("coachSalt") String coachSalt);
	 
	 
	/*
	 * //添加教练 int insert(Coach coach);
	 */
	
	//通过教练Id删除教练
	boolean deleteCoachById(Integer coachId);
	
	//根据教练Id查找教练
	Coach findByCoachId(Integer coachId);
	
	//查找所有教练
	List<Coach> selectAll();
	
	//根据教练账号查找教练
	Coach findByCoachPhone(String coachPhone);
	
	//根据coachName字段里的任意一个值进行模糊查询整条记录
	List<Coach> findByCoachName(@Param("coachName")String coachName);
	
// 北梅：
	
	  //教练修改个人信息 
	int updateCoach(Coach coach);
	 
	
    int updateCoach(
    		  @Param("coachId") Integer coachId,
    		  @Param("coachPhone") String coachPhone,
			  
			  @Param("coachName") String coachName,
			  
			  @Param("coachPsw") String coachPsw,
			  
			  @Param("coachSex") String coachSex,
			  
			  @Param("coachPower") String coachPower,
			  
			  @Param("coachInfo") String coachInfo);
	
	//教练修改头像
	int updateCoachImg(Coach coach);
	
	//教练修改密码
	int updateCoachPsw(@Param("coach")Coach coach);
	
	//添加教练
	int insert(Coach coach);
}
