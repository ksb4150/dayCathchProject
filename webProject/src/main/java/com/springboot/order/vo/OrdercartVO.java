package com.springboot.order.vo;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Component;

@Component("ordercartVO")
public class OrdercartVO {
	private int ordersNO;
	private String orderSeqNum;
	private String uid;
	private String ordererName;
	private String ordererPhoneNumber;
	private Date creDate;
	private String couponId;
	private String QA1;
	private String QA2;
	private String QA3;
	
	private List<OrderGoodsVO> orders;	
	
	private int finalTotalPrice;
	private int usePoint;
	private int savePoint;
	private String orderState;
	//private int orderSalePrice; // finalTotalPrice를 백에서 만드는방법 += 거쳐서 모인담에 -usePoint하면 오더파이널세일프라이스
	//private int orderFinalSalePrice; 
	
	public OrdercartVO() {
			super();

	}

	public OrdercartVO(int ordersNO, String orderSeqNum, String uid, String ordererName,
			String ordererPhoneNumber, Date creDate, String couponId, int usePoint,
			String QA1, String QA2, String QA3, List<OrderGoodsVO> orders, 
			 int savePoint, int finalTotalPrice, String orderState) {
	
		this.ordersNO = ordersNO;
		this.orderSeqNum = orderSeqNum;
		this.uid = uid;
		this.ordererName = ordererName;
		this.ordererPhoneNumber = ordererPhoneNumber;
		this.creDate = creDate;
		this.couponId = couponId;
		this.QA1 = QA1;
		this.QA2 = QA2;
		this.QA3 = QA3;
		this.orders = orders;
		this.usePoint = usePoint;
		this.finalTotalPrice = finalTotalPrice;
		this.savePoint = savePoint;
		this.orderState = orderState;
		//this.orderSalePrice; 
	}
	
	
	public String getOrderState() {
		return orderState;
	}

	public void setOrderState(String orderState) {
		this.orderState = orderState;
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
	
	public String getOrderSeqNum() {
		return orderSeqNum;
	}

	public void setOrderSeqNum(String orderSeqNum) {
		this.orderSeqNum = orderSeqNum;
	}


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
	
	
	public List<OrderGoodsVO> getOrders() {
		return orders;
	}

	public void setOrders(List<OrderGoodsVO> orders) {
		this.orders = orders;
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
	

