package com.springboot.order.vo;

//주문상품정보를 가져오는 VO

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("orderGoodsVO")
public class OrderGoodsVO {
	private int ordersNO;
	
	private int orderGoodsId;
	
	private int goodsId;
	
	private String goodsName;
	
	private int goodsQty;
	
	private int goodsPrice;
	
	private int totalPrice;
	
	private Date cartcheckin;
	
    private Date cartcheckout;
    
    private int numOfTourist;
    
	private Date creDate;
	
	private String orderState;
	
	private OrdercartVO ordercartVO; 
	
	

	public OrderGoodsVO() {
		super();
	}

	// 예약자 주문 정보



	public OrderGoodsVO(int ordersNO, int orderGoodsId,  int goodsId, String goodsName, int goodsQty, int goodsPrice, int totalPrice,
			Date cartcheckin, Date cartcheckout, int numOfTourist, Date creDate, String orderState, OrdercartVO ordercartVO) {
		super();
		this.orderGoodsId = orderGoodsId;
		this.ordersNO = ordersNO;
		this.goodsId = goodsId;
		this.goodsName = goodsName;
		this.goodsQty = goodsQty;
		this.goodsPrice = goodsPrice;
		this.totalPrice = totalPrice;
		this.cartcheckin = cartcheckin;
		this.cartcheckout = cartcheckout;
		this.totalPrice = totalPrice;
		this.numOfTourist = numOfTourist;
		this.creDate = creDate;
		this.orderState = orderState;
		this.setOrdercartVO(ordercartVO);
	}
	

	
	
	public int getOrdersNO() {
		return ordersNO;
	}
	
	public void setOrdersNO(int ordersNO) {
		this.ordersNO = ordersNO;
	}

	
	public int getOrderGoodsId() {
		return orderGoodsId;
	}

	public void setOrderGoodsId(int orderGoodsId) {
		this.orderGoodsId = orderGoodsId;
	}
	
	
	public int getGoodsId() {
		return goodsId;
	}
	
	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
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

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Date getCreDate() {
		return creDate;
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
	
	public int getNumOfTourist() {
		return numOfTourist;
	}
	
	public void setNumOfTourist(int numOfTourist) {
		this.numOfTourist = numOfTourist;
	}
	

	public void setCreDate(Date creDate) {
		this.creDate = creDate;
	}

	public void initSaleTotal() {
		this.totalPrice = this.goodsPrice*this.goodsQty;

	}

	public OrdercartVO getOrdercartVO() {
		return ordercartVO;
	}

	public void setOrdercartVO(OrdercartVO ordercartVO) {
		this.ordercartVO = ordercartVO;
	}

	public int getGoodsPrice() {
		return goodsPrice;
	}

	public void setGoodsPrice(int goodsPrice) {
		this.goodsPrice = goodsPrice;
	}

	public String getOrderState() {
		return orderState;
	}

	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}
	
	
}
