package com.fit.domain.user;

import com.fit.domain.Power;

public class User {
    private Integer uId;

    private String uPhone;

    private String uName;

    private String uPsw;

    private String uSex;

    private Integer uAge;

    private Power uPower;

    private String uImg;
    
    private String uSalt;

	public Integer getuId() {
		return uId;
	}

	public void setuId(Integer uId) {
		this.uId = uId;
	}

	public String getuPhone() {
		return uPhone;
	}

	public void setuPhone(String uPhone) {
		this.uPhone = uPhone;
	}

	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	public String getuPsw() {
		return uPsw;
	}

	public void setuPsw(String uPsw) {
		this.uPsw = uPsw;
	}

	public String getuSex() {
		return uSex;
	}

	public void setuSex(String uSex) {
		this.uSex = uSex;
	}

	public Integer getuAge() {
		return uAge;
	}

	public void setuAge(Integer uAge) {
		this.uAge = uAge;
	}

	public Power getuPower() {
		return uPower;
	}

	public void setuPower(Power uPower) {
		this.uPower = uPower;
	}

	public String getuImg() {
		return uImg;
	}

	public void setuImg(String uImg) {
		this.uImg = uImg;
	}

	public String getuSalt() {
		return uSalt;
	}

	public void setuSalt(String uSalt) {
		this.uSalt = uSalt;
	}

	@Override
	public String toString() {
		return "User [uId=" + uId + ", uPhone=" + uPhone + ", uName=" + uName + ", uPsw=" + uPsw + ", uSex=" + uSex
				+ ", uAge=" + uAge + ", uPower=" + uPower + ", uImg=" + uImg + ", uSalt=" + uSalt + "]";
	}

	public User(Integer uId, String uPhone, String uName, String uPsw, String uSex, Integer uAge, Power uPower,
			String uImg, String uSalt) {
		super();
		this.uId = uId;
		this.uPhone = uPhone;
		this.uName = uName;
		this.uPsw = uPsw;
		this.uSex = uSex;
		this.uAge = uAge;
		this.uPower = uPower;
		this.uImg = uImg;
		this.uSalt = uSalt;
	}

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}



	
	
}