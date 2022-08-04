package com.fit.domain;

import lombok.Data;

@Data 
public class Grade {
    private Integer gradeId;

    private String gradeName;

	public Grade(Integer gradeId, String gradeName) {
		super();
		this.gradeId = gradeId;
		this.gradeName = gradeName;
	}

	public Grade() {
		super();
		// TODO Auto-generated constructor stub
	}

}