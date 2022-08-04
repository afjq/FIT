package com.fit.domain.user;

import java.util.List;

import com.fit.domain.Grade;

import lombok.Data;

@Data
public class Act {

	private Integer actId;

	private String actName;

	private String actDesc;
	
	private String actImg;
	
//	对一 ：每个动作只属于一个等级
	private Grade actGrade;
	
//	对一 ：每个动作使用的器械
	private Facility actFacility;
	
	//	对多关系 一个动作对应多块肌肉
	private List<Muscle> muscleList;

	public Act(Integer actId, String actName, String actDesc, String actImg, Grade actGrade, Facility actFacility,
			List<Muscle> muscleList) {
		super();
		this.actId = actId;
		this.actName = actName;
		this.actDesc = actDesc;
		this.actImg = actImg;
		this.actGrade = actGrade;
		this.actFacility = actFacility;
		this.muscleList = muscleList;
	}

	public Act() {
		super();
		// TODO Auto-generated constructor stub
	}


}