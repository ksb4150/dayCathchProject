package com.springboot.member.vo;

import lombok.Data;

@Data
public class KakaoVO{
	private int userType;
	
	public int getUserType() {
		return userType;
	}
	
	public void setUserType(int userType) {
		this.userType = userType;
	}
	
	private String uid;
	
	public String getUid() {
		return uid;
	}
	
	public void setUid(String uid) {
		this.uid = uid;
	}
	
	public String getK_name() {
		return k_name;
	}
	
	public void setK_name(String k_name) {
		this.k_name = k_name;
	}
	
	public String getK_email() {
		return k_email;
	}
	
	public void setK_email(String k_email) {
		this.k_email = k_email;
	}
	private String k_name;
	private String k_email;
}