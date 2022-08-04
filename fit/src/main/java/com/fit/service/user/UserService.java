package com.fit.service.user;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.fit.domain.user.User;
import com.fit.mapper.user.UserMapper;

@Service("UserService")
public class UserService {
	@Resource
	private UserMapper userMapper;
	
	//用户登录
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
    public User selectByUserPhone(String uPhone) {
		System.out.println("userService.selectByUserPhone have ran....");
		try {
			return this.userMapper.selectByUserPhone(uPhone);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
    }
	
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public boolean findByPhone(@Param("uPhone") String uPhone, @Param("uPsw") String uPsw) {

		if (userMapper.findByPhone(uPhone, uPsw) != null) {
			return true;
		} else {
			return false;
		}

	}
	
	//用户注册
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor= {Exception.class})
	public int insert(User user) {
		System.out.println("userService.insert have ran....");
		try {
			return this.userMapper.insert(user);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = {
			Exception.class }) 
	public int insert(
			@Param("uPhone") String uPhone,
			  
			  @Param("uName") String uName,
			  
			  @Param("uPsw") String uPsw,
			  
			  @Param("uSex") String uSex,
			  
			  @Param("uAge") Integer uAge,
			  
			  @Param("uPower") Integer uPower,
			  
			  @Param("uImg") String uImg,
			  
			  @Param("uSalt") String uSalt) {
		System.out.println("userService.insert have ran...."); 
		try { 
			return userMapper.insert(uPhone, uName, uPsw, uSex, uAge, uPower, uImg, uSalt); 
		} catch (Exception e) { 
			e.printStackTrace();
			throw new RuntimeException(e); 
		} 
	}

	
	  //判断账号是否存在
	  @Transactional(propagation=Propagation.REQUIRED,rollbackFor = {Exception.class}) 
	  public boolean isUPhoneExit(String uPhone) {
	  System.out.println("userService.isUPhoneExit have ran.....");
	  if(userMapper.findByUphone(uPhone) == null){ 
		  return false;
		  }else{ 
			  return true; 
			  } 
	  }
	 
	  
	  //用户查看个人信息
	  @Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	  public User findByUphone(@Param("uPhone") String uPhone){
		  try {
			return this.userMapper.findByUphone(uPhone);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	  }
	
	  //用户修改个人信息
	  @Transactional(propagation=Propagation.REQUIRED,rollbackFor = {Exception.class}) 
	  public int updateUser(User user) {
		  try {
			return this.userMapper.updateUser(user);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	  }
	  
	//修改教练密码
//		controller传来教练Id 教练新密码 教练新密文
			@Transactional(propagation=Propagation.REQUIRED,rollbackFor = {Exception.class})
			public int updateUPsw(Integer uId,String newUPsw,String uSalt) {
				try {
//					组装
					User user =userMapper.findUserById(uId);
					user.setuSalt(uSalt);
					user.setuPsw(newUPsw);
					return this.userMapper.updateUPsw(user);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException(e);
				}
			}
	  
	/*
	 * @Transactional(propagation = Propagation.REQUIRED, rollbackFor = {
	 * Exception.class }) public int updateUser(
	 * 
	 * @Param("uId") Integer uId,
	 * 
	 * @Param("uPhone") String uPhone,
	 * 
	 * @Param("uName") String uName,
	 * 
	 * @Param("uPsw") String uPsw,
	 * 
	 * @Param("uSex") String uSex,
	 * 
	 * @Param("uAge") Integer uAge,
	 * 
	 * @Param("uPower") Power uPower,
	 * 
	 * @Param("uSalt") String uSalt) {
	 * System.out.println("userService.updateUser have ran...."); try { return
	 * userMapper.updateUser(uId, uPhone, uName, uPsw, uSex, uAge, uPower, uSalt); }
	 * catch (Exception e) { e.printStackTrace(); throw new RuntimeException(e); } }
	 */
	  
	  //根据Id查找用户
	  @Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	  public User findUserById(int uId) {
		  try {
			return this.userMapper.findUserById(uId);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	  }
	
	//修改用户头像
	  @Transactional(propagation=Propagation.REQUIRED,rollbackFor = {Exception.class})
	  public int updateUImg(User user) {
		  try {
			return this.userMapper.updateUImg(user);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	  }

	  
		@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	    public User selectByUserPhone(String uPhone, String uPsw) {
			System.out.println("userService.selectByUserPhone have ran....");
			try {
				return this.userMapper.selectByUserPhone(uPhone);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException(e);
			}
	    }
		
		
//		根据用户Id查找用户
		@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
		public User findByUId(Integer uId) {
			try {
				return this.userMapper.findUserById(uId);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException(e);
			}
		}
}
