package com.springboot.goods.vo;

import org.springframework.stereotype.Component;

@Component("goodsVO")
public class GoodsVO {
	private int goodsId;
	private String uid;
	private String goodsName;
	private int goodsPrice;
	private int eventId;
	private int goodsDiscount;
	private String goodsMainCategory;
	private String goodsState;
	private String goodsInfo;
	private int goodsCount;
	private int adminAllow;
	private String companyName;
	private String imageFileName;
	private String goodsImageFileName;
	private double score;
	private int cnt;

	private LodgingDetailVO lodgingDetailVO;

	// 상품등록할때 사용

	public int getGoodsId() {
		return goodsId;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
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

	public int getGoodsPrice() {
		return goodsPrice;
	}

	public void setGoodsPrice(int goodsPrice) {
		this.goodsPrice = goodsPrice;
	}

	public int getEventId() {
		return eventId;
	}

	public void setEventId(int eventId) {
		this.eventId = eventId;
	}

	public int getGoodsDiscount() {
		return goodsDiscount;
	}

	public void setGoodsDiscount(int goodsDiscount) {
		this.goodsDiscount = goodsDiscount;
	}

	public String getGoodsMainCategory() {
		return goodsMainCategory;
	}

	public void setGoodsMainCategory(String goodsMainCategory) {
		this.goodsMainCategory = goodsMainCategory;
	}

	public String getGoodsState() {
		return goodsState;
	}

	public void setGoodsState(String goodsState) {
		this.goodsState = goodsState;
	}

	public String getGoodsInfo() {
		return goodsInfo;
	}

	public void setGoodsInfo(String goodsInfo) {
		this.goodsInfo = goodsInfo;
	}

	public int getGoodsCount() {
		return goodsCount;
	}

	public void setGoodsCount(int goodsCount) {
		this.goodsCount = goodsCount;
	}

	public int getAdminAllow() {
		return adminAllow;
	}

	public void setAdminAllow(int adminAllow) {
		this.adminAllow = adminAllow;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getGoodsImageFileName() {
		return goodsImageFileName;
	}

	public void setGoodsImageFileName(String goodsImageFileName) {
		this.goodsImageFileName = goodsImageFileName;
	}

	public LodgingDetailVO getLodgingDetailVO() {
		return lodgingDetailVO;
	}

	public void setLodgingDetailVO(LodgingDetailVO lodgingDetailVO) {
		this.lodgingDetailVO = lodgingDetailVO;
	}

	public GoodsVO() {

	}

}
