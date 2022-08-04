package com.fit.domain.user;

import java.util.List;

import lombok.Data;

@Data
public class Muscle {
	private Integer muscleId;

	private String muscleName;
//	muscle_img
	private String muscleImg;
	//   对多：一块肌肉可以由多个不一样的动作锻炼
	private List<Act> actList;
	
	public Muscle(Integer muscleId, String muscleName, String muscleImg, List<Act> actList) {
		super();
		this.muscleId = muscleId;
		this.muscleName = muscleName;
		this.muscleImg = muscleImg;
		this.actList = actList;
	}
	public Muscle() {
		super();
		// TODO Auto-generated constructor stub
	}
	

}