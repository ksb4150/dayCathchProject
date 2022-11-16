package com.springboot.member.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("memberVO")
public class MemberVO {
	private String uid;
	private String userId;
	private String userPwd;
	private String userName;
	private String userBirth;
	private String userGender;
	private int userType;
	private int userLevel;
	private int userPoint;
	private String userPhoneNumber;
	private String info_a;
	private String info_b;
	private String businessNumber;
	private String salt;
	private String companyName;
	private int adminAllow;
	private String businessPic;
	private Date joinDate;
	private String userImageFileName;
	private String roadAddress;
	private String jibunAddress;
	private String extraAddress;
	private String zipcode;
	private String companyNotice;
	private String companyInfo;
	private String facilities;
	private String companyNum;
	private double score;

	public String getUserImageFileName() {
		return userImageFileName;
	}

	public void setUserImageFileName(String userImageFileName) {
		this.userImageFileName = userImageFileName;
	}

	public MemberVO() {

	}

	// 사용자 로그인 때 사용
	public MemberVO(String userId, String userPwd, int userType) {
		this.userId = userId;
		this.userPwd = userPwd;
		this.userType = userType;
	}

	// 사용자 회원가입 때 사용
	public MemberVO(String uid, String userId, String userPwd, String userName, String userBirth, String userGender,
			int userType, String userPhoneNumber, String info_a, String info_b) {
		this.uid = uid;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userBirth = userBirth;
		this.userGender = userGender;
		this.userType = userType;
		this.userPhoneNumber = userPhoneNumber;
		this.info_a = info_a;
		this.info_b = info_b;
	}

	public String getInfo_a() {
		return info_a;
	}

	public void setInfo_a(String info_a) {
		this.info_a = info_a;
	}

	public String getInfo_b() {
		return info_b;
	}

	public void setInfo_b(String info_b) {
		this.info_b = info_b;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserBirth() {
		return userBirth;
	}

	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}

	public String getUserGender() {
		return userGender;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	public int getUserType() {
		return userType;
	}

	public void setUserType(int userType) {
		this.userType = userType;
	}

	public int getUserLevel() {
		return userLevel;
	}

	public void setUserLevel(int userLevel) {
		this.userLevel = userLevel;
	}

	public int getUserPoint() {
		return userPoint;
	}

	public void setUserPoint(int userPoint) {
		this.userPoint = userPoint;
	}

	public String getUserPhoneNumber() {
		return userPhoneNumber;
	}

	public void setUserPhoneNumber(String userPhoneNumber) {
		this.userPhoneNumber = userPhoneNumber;
	}

	public String getBusinessNumber() {
		return businessNumber;
	}

	public void setBusinessNumber(String businessNumber) {
		this.businessNumber = businessNumber;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public int getAdminAllow() {
		return adminAllow;
	}

	public void setAdminAllow(int adminAllow) {
		this.adminAllow = adminAllow;
	}

	public String getBusinessPic() {
		return businessPic;
	}

	public void setBusinessPic(String businessPic) {
		this.businessPic = businessPic;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public String getRoadAddress() {
		return roadAddress;
	}

	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}

	public String getJibunAddress() {
		return jibunAddress;
	}

	public void setJibunAddress(String jibunAddress) {
		this.jibunAddress = jibunAddress;
	}

	public String getExtraAddress() {
		return extraAddress;
	}

	public void setExtraAddress(String extraAddress) {
		this.extraAddress = extraAddress;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getCompanyNotice() {
		return companyNotice;
	}

	public void setCompanyNotice(String companyNotice) {
		this.companyNotice = companyNotice;
	}

	public String getCompanyInfo() {
		return companyInfo;
	}

	public void setCompanyInfo(String companyInfo) {
		this.companyInfo = companyInfo;
	}

	public String getFacilities() {
		return facilities;
	}

	public void setFacilities(String facilities) {
		this.facilities = facilities;
	}

	public String getCompanyNum() {
		return companyNum;
	}

	public void setCompanyNum(String companyNum) {
		this.companyNum = companyNum;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

}