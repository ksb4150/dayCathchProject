package com.springboot.goods.vo;

import org.springframework.stereotype.Component;

@Component("touristVO")
public class TouristVO {
	private int touristNum;
	private int ordersNO;
	private String touristName;
	private String touristGender;
	private String touristPhoneNumber;
	private String touristBirth;

	public TouristVO() {

	}

//상품 이용자 주문 정보
	public TouristVO(int touristNum, int ordersNO, String touristName, String touristGender,
			String touristPhoneNumber, String touristBirth) {
		super();
		this.touristNum = touristNum;
		this.ordersNO = ordersNO;
		this.touristName = touristName;
		this.touristGender = touristGender;
		this.touristPhoneNumber = touristPhoneNumber;
		this.touristBirth = touristBirth;
	}

	public int getTouristNum() {
		return touristNum;
	}

	public void setTouristNum(int touristNum) {
		this.touristNum = touristNum;
	}

	public int getOrdersNO() {
		return ordersNO;
	}

	public void setOrdersNO(int ordersNO) {
		this.ordersNO = ordersNO;
	}

	public String getTouristName() {
		return touristName;
	}

	public void setTouristName(String touristName) {
		this.touristName = touristName;
	}

	public String getTouristGender() {
		return touristGender;
	}

	public void setTouristGender(String touristGender) {
		this.touristGender = touristGender;
	}

	public String getTouristPhoneNumber() {
		return touristPhoneNumber;
	}

	public void setTouristPhoneNumber(String touristPhoneNumber) {
		this.touristPhoneNumber = touristPhoneNumber;
	}

	public String getTouristBirth() {
		return touristBirth;
	}

	public void setTouristBirth(String touristBirth) {
		this.touristBirth = touristBirth;
	}

}
