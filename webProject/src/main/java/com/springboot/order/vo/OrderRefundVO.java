package com.springboot.order.vo;

import org.springframework.stereotype.Component;

@Component("orderRefundVO")

public class OrderRefundVO {

	private String uid;
	
	private int ordersNO;
	
	private String keyword;
	
	private int goodsId;
	
	private int amount;
	
	private int pageNum;
	
	
	public OrderRefundVO() {
		super();

}
	
public OrderRefundVO(String uid, int ordersNO, String keyword, int amount, int pageNum, int goodsId) {
	this.uid = uid;
	this.ordersNO = ordersNO;
	this.keyword = keyword;
	this.amount = amount;
	this.pageNum = pageNum;
	this.goodsId = goodsId;
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


	public int getOrdersNO() {
		return ordersNO;
	}
	

	public void setOrdersNO(int ordersNO) {
		this.ordersNO = ordersNO;
	}


	public String getKeyword() {
		return keyword;
	}


	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}


	public int getAmount() {
		return amount;
	}


	public void setAmount(int amount) {
		this.amount = amount;
	}


	public int getPageNum() {
		return pageNum;
	}


	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	
	
	
}
