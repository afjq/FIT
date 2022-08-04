package com.fit.mapper.user;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.fit.domain.user.User;
@Mapper
public interface UserMapper {
	//插入一个用户
	int insert(User user);
	
	int insert(@Param("uPhone") String uPhone,
			  
			  @Param("uName") String uName,
			  
			  @Param("uPsw") String uPsw,
			  
			  @Param("uSex") String uSex,
			  
			  @Param("uAge") Integer uAge,
			  
			  @Param("uPower") Integer uPower,
			  
			  @Param("uImg") String uImg,
			  
			  @Param("uSalt") String uSalt);

	//用户查询个人信息
	User findByPhone(
			  @Param("uPhone") String uPhone,
			  
			  @Param("uPsw") String uPsw);
	
	
	//根据用户登录账号查找用户
	User selectByUserPhone(String uPhone);
	
	//用户查询个人信息
	User findByUphone(String uPhone);
	
	//用户修改个人信息
	int updateUser(User user);
	
	//用户修改密码
	int updateUPsw(@Param("user")User user);
	
	User findUserById(int uId);
	
	//用户修改头像
	int updateUImg(User user);
	
}