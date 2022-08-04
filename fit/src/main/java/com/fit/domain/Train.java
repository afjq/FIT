package com.fit.domain;

import com.fit.domain.Grade;
import com.fit.domain.coach.Coach;

import lombok.Data;

@Data
public class Train {
	//train_id	int
	private Integer trainId;
	//train_name	varchar
	private String trainName;
	//train_period	int
	private Integer trainPeriod;
	//train_price	int
	private Double trainPrice;
	//train_desc	varchar
	private String trainDesc;
	//train_img	varchar
	private String trainImg;

	//	对一：每个训练属于一个级别
	private Grade trainGrade;

	//	对一：每个课程属于一个教练
	private Coach trainCoach;

	public Train(Integer trainId, String trainName, Integer trainPeriod, Double trainPrice, String trainDesc,
			String trainImg, Grade trainGrade, Coach trainCoach) {
		super();
		this.trainId = trainId;
		this.trainName = trainName;
		this.trainPeriod = trainPeriod;
		this.trainPrice = trainPrice;
		this.trainDesc = trainDesc;
		this.trainImg = trainImg;
		this.trainGrade = trainGrade;
		this.trainCoach = trainCoach;
	}

	public Train() {
		super();
		// TODO Auto-generated constructor stub
	}



}
