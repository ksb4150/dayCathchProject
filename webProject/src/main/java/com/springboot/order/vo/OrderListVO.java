package com.springboot.order.vo;

import java.sql.Date;


import org.springframework.stereotype.Component;

//매퍼 join용 VO

@Component("orderListVO")
public class OrderListVO {
	private int ordersNO;
	private int goodsId;
	private int goodsQty;
	private int goodsPrice;
	private String goodsName;
	private int totalPrice;
	private Date cartcheckin;
	private Date cartcheckout;
	private String uid;
	private String ordererName;
	private String ordererPhoneNumber;
	private Date creDate;
	private String couponId;
	private String QA1;
	private String QA2;
	private String QA3;
	private int numOfTourist;
	private String orderState;
	private int finalTotalPrice;
	private int usePoint;
	private int savePoint;
	
	
	public OrderListVO() {
			super();

	}

	public OrderListVO(int ordersNO, int goodsId, int goodsQty, int goodsPrice, String goodsName, int totalPrice,  Date cartcheckin, Date cartcheckout, String uid, String ordererName,
			String ordererPhoneNumber, Date creDate, String couponId, int usePoint,
			String QA1, String QA2, String QA3, int numOfTourist, String orderState,
			 int savePoint, int finalTotalPrice) {
	
		super();
		this.ordersNO = ordersNO;
		this.goodsId = goodsId;
		this.goodsQty = goodsQty;
		this.goodsPrice = goodsPrice;
		this.goodsName = goodsName;
		this.totalPrice = totalPrice;
		this.cartcheckin = cartcheckin;
		this.cartcheckout = cartcheckout;
		this.uid = uid;
		this.ordererName = ordererName;
		this.ordererPhoneNumber = ordererPhoneNumber;
		this.creDate = creDate;
		this.couponId = couponId;
		this.QA1 = QA1;
		this.QA2 = QA2;
		this.QA3 = QA3;
		this.numOfTourist = numOfTourist;
		this.orderState = orderState;
		this.usePoint = usePoint;
		this.finalTotalPrice = finalTotalPrice;
		this.savePoint = savePoint;
		//this.orderSalePrice; 
	}
	
	
	public String getOrderState() {
		return orderState;
	}

	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}

	public int getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}

	public int getGoodsQty() {
		return goodsQty;
	}

	public void setGoodsQty(int goodsQty) {
		this.goodsQty = goodsQty;
	}

	public int getGoodsPrice() {
		return goodsPrice;
	}

	public void setGoodsPrice(int goodsPrice) {
		this.goodsPrice = goodsPrice;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Date getCartcheckin() {
		return cartcheckin;
	}

	public void setCartcheckin(Date cartcheckin) {
		this.cartcheckin = cartcheckin;
	}

	public Date getCartcheckout() {
		return cartcheckout;
	}

	public void setCartcheckout(Date cartcheckout) {
		this.cartcheckout = cartcheckout;
	}

	public int getOrdersNO() {
		return ordersNO;
	}

	public void setOrdersNO(int ordersNO) {
		this.ordersNO = ordersNO;
	}
	
	
	public int getSavePoint() {
		return savePoint;
	}

	public void setSavePoint(int savePoint) {
		this.savePoint = savePoint;
	}
	
	public int getFinalTotalPrice() {
		return finalTotalPrice;
	}

	public void setFinalTotalPrice(int finalTotalPrice) {
		this.finalTotalPrice = finalTotalPrice;
	}

	
	
	/* public int getOrderSalePrice() {
		return orderSalePrice;
	}

	public void setOrderSalePrice(int orderSalePrice) {
		this.orderSalePrice = orderSalePrice;
	}
	
	
	public int getOrderFinalSalePrice() {
		return orderFinalSalePrice;
	}

	public void setOrderFinalSalePrice(int orderFinalSalePrice) {
		this.orderFinalSalePrice = orderFinalSalePrice;
	}
	*/
	

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
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

	public int getUsePoint() {
		return usePoint;
	}

	public void setUsePoint(int usePoint) {
		this.usePoint = usePoint;
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
	
	public int getNumOfTourist() {
		return numOfTourist;
	}

	public void setNumOfTourist(int numOfTourist) {
		this.numOfTourist = numOfTourist;
	}
	
	
	/*
	백엔드쪽에서 총결제가격과 적립포인트를 구하는 방법
	public void getOrderPriceInfo() {
		/* 상품 비용 & 적립포인트 
			for(OrderGoodsVO order : orders) {
				orderSalePrice += order.getTotalPrice();

			}
		
		최종 비용(상품 비용 - 사용 포인트)
	orderFinalSalePrice = orderSalePrice - usePoint;
		*/
	}
	

