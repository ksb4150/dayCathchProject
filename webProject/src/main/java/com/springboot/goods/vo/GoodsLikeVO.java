package com.springboot.goods.vo;

import org.springframework.stereotype.Component;

@Component("goodsLikeVO")
public class GoodsLikeVO {
	private int goodsLikedId;	
	private int goodsId;
	private String uid;
	
	public GoodsLikeVO() {
		
	}
	
	public GoodsLikeVO(int goodsLikedId, int goodsId, String uid) {
		super();
		this.goodsLikedId = goodsLikedId;
		this.goodsId = goodsId;
		this.uid = uid;
	}

	public int getGoodsLikedId() {
		return goodsLikedId;
	}
	
	public void setGoodsLikedId(int goodsLikedId) {
		this.goodsLikedId = goodsLikedId;
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
}
