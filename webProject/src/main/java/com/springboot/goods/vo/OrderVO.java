package com.springboot.goods.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("orderVO")
public class OrderVO {
	private int orderSeqNum;
	private int goodsId;
	private String uid;
	private String goodsName;
	private int goodsQty;
	private String ordererName;
	private String ordererPhoneNumber;
	private String payment;
	private int totalPrice;
	private Date creDate;
	private String couponId;
	private String userpoint;
	private String QA1;
	private String QA2;
	private String QA3;
	private Date orderStart;
	private Date orderEnd;
	private int numOfTourist;

	public OrderVO() {

	}

	// 예약자 주문 정보

	// 테스트
	public OrderVO(String uid, int goodsId, int orderSeqNum, String ordererPhoneNumber, String ordererName, String QA1,
			String QA2, String QA3) {
		this.goodsId = goodsId;
		this.uid = uid;
		this.orderSeqNum = orderSeqNum;
		this.ordererName = ordererName;
		this.ordererPhoneNumber = ordererPhoneNumber;
		this.QA1 = QA1;
		this.QA2 = QA2;
		this.QA3 = QA3;

	}

	public OrderVO(int orderSeqNum, int goodsId, String uid, String goodsName, int goodsQty, String ordererName,
			String ordererPhoneNumber, String payment, int totalPrice, Date creDate, String couponId, String userpoint,
			String qA1, String qA2, String qA3, Date orderStart, Date orderEnd, int numOfTourist) {
		super();
		this.orderSeqNum = orderSeqNum;
		this.goodsId = goodsId;
		this.uid = uid;
		this.goodsName = goodsName;
		this.goodsQty = goodsQty;
		this.ordererName = ordererName;
		this.ordererPhoneNumber = ordererPhoneNumber;
		this.payment = payment;
		this.totalPrice = totalPrice;
		this.creDate = creDate;
		this.couponId = couponId;
		this.userpoint = userpoint;
		QA1 = qA1;
		QA2 = qA2;
		QA3 = qA3;
		this.orderStart = orderStart;
		this.orderEnd = orderEnd;
		this.numOfTourist = numOfTourist;
	}

	public int getOrderSeqNum() {
		return orderSeqNum;
	}

	public void setOrderSeqNum(int orderSeqNum) {
		this.orderSeqNum = orderSeqNum;
	}

	public int getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public int getGoodsQty() {
		return goodsQty;
	}

	public void setGoodsQty(int goodsQty) {
		this.goodsQty = goodsQty;
	}

	public String getOrdererName() {
		return ordererName;
	}

	public void setOrdererName(String ordererName) {
		this.ordererName = ordererName;
	}

	public String getOrdererPhoneNumber() {
		return ordererPhoneNumber;
	}

	public void setOrdererPhoneNumber(String ordererPhoneNumber) {
		this.ordererPhoneNumber = ordererPhoneNumber;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Date getCreDate() {
		return creDate;
	}

	public void setCreDate(Date creDate) {
		this.creDate = creDate;
	}

	public String getCouponId() {
		return couponId;
	}

	public void setCouponId(String couponId) {
		this.couponId = couponId;
	}

	public String getUserpoint() {
		return userpoint;
	}

	public void setUserpoint(String userpoint) {
		this.userpoint = userpoint;
	}

	public String getQA1() {
		return QA1;
	}

	public void setQA1(String qA1) {
		QA1 = qA1;
	}

	public String getQA2() {
		return QA2;
	}

	public void setQA2(String qA2) {
		QA2 = qA2;
	}

	public String getQA3() {
		return QA3;
	}

	public void setQA3(String qA3) {
		QA3 = qA3;
	}

	public Date getOrderStart() {
		return orderStart;
	}

	public void setOrderStart(Date orderStart) {
		this.orderStart = orderStart;
	}

	public Date getOrderEnd() {
		return orderEnd;
	}

	public void setOrderEnd(Date orderEnd) {
		this.orderEnd = orderEnd;
	}
	
	public int getNumOfTourist() {
		return numOfTourist;
	}

	public void setNumOfTourist(int numOfTourist) {
		this.numOfTourist = numOfTourist;
	}

}
