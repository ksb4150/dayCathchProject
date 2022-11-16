package com.springboot.member.vo;

import lombok.Data;

@Data
public class NaverVO {
	
	private String uid;
	private String n_name;
	private String n_email;
	private int userType;
	
	
	public int getUserType() {
		return userType;
	}
	public void setUserType(int userType) {
		this.userType = userType;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getN_name() {
		return n_name;
	}
	public void setN_name(String n_name) {
		this.n_name = n_name;
	}
	public String getN_email() {
		return n_email;
	}
	public void setN_email(String n_email) {
		this.n_email = n_email;
	}
	

}
