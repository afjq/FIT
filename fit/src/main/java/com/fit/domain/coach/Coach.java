package com.fit.domain.coach;

import java.util.List;

import com.fit.domain.Train;

import lombok.Data;

@Data
public class Coach {
	//coach_id	int
	private Integer coachId;
	//coach_phone	varchar
	private String coachPhone;
	//coach_name	varchar
	private String coachName;
	//coach_psw	varchar
	private String coachPsw;
	//coach_sex	varchar
	private String coachSex;
	//coach_power	int
	private Integer coachPower;
	//coach_img	varchar
	private String coachImg;
//	coach_info 教练信息
	private String coachInfo;
//	coach_salt
	private String coachSalt;
	
	//一个教练可能有多门课程
	private List<Train> trainList;

	public Coach(Integer coachId, String coachPhone, String coachName, String coachPsw, String coachSex,
			Integer coachPower, String coachImg, String coachInfo, String coachSalt, List<Train> trainList) {
		super();
		this.coachId = coachId;
		this.coachPhone = coachPhone;
		this.coachName = coachName;
		this.coachPsw = coachPsw;
		this.coachSex = coachSex;
		this.coachPower = coachPower;
		this.coachImg = coachImg;
		this.coachInfo = coachInfo;
		this.coachSalt = coachSalt;
		this.trainList = trainList;
	}

	public Coach() {
		super();
		// TODO Auto-generated constructor stub
	}
		


}
