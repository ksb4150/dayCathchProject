package com.springboot.mypage.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("cartVO")

public class CartVO {

	private int cartId;
	private int goodsId;
	private String uid;
	private String buid;
	private String cartckid;
	private int goodsQty;
	private String goodsName;
	private String goodsMainCategory;
	private int goodsPrice;
	private String companyName;
	private Date cartcheckin;
	private Date cartcheckout;
	private String goodsImageFileName;
	private int numOfTourist;
	private Date creDate;

	public CartVO() {
		super();
	}

	public CartVO(int cartId, int goodsId, String uid, String buid, String cartckid, int goodsQty, String goodsName,
			int goodsPrice, String companyName, Date cartcheckin, Date cartcheckout, String goodsImageFileName,
			int numOfTourist, Date creDate, String goodsMainCategory) {

		this.cartId = cartId;
		this.goodsId = goodsId;
		this.uid = uid;
		this.buid = buid;
		this.cartckid = cartckid;
		this.goodsQty = goodsQty;
		this.goodsName = goodsName;
		this.goodsPrice = goodsPrice;
		this.companyName = companyName;
		this.cartcheckin = cartcheckin;
		this.cartcheckout = cartcheckout;
		this.goodsImageFileName = goodsImageFileName;
		this.numOfTourist = numOfTourist;
		this.goodsMainCategory = goodsMainCategory;
		this.creDate = creDate;

	}

	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
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

	public String getBuid() {
		return buid;
	}

	public void setBuid(String buid) {
		this.buid = buid;
	}

	public String getCartckid() {
		return cartckid;
	}

	public void setCartckid(String cartckid) {
		this.cartckid = cartckid;
	}

	public int getGoodsQty() {
		return goodsQty;
	}

	public void setGoodsQty(int goodsQty) {
		this.goodsQty = goodsQty;
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

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
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

	public String getGoodsImageFileName() {
		return goodsImageFileName;
	}

	public void setGoodsImageFileName(String goodsImageFileName) {
		this.goodsImageFileName = goodsImageFileName;
	}

	public int getNumOfTourist() {
		return numOfTourist;
	}

	public void setNumOfTourist(int numOfTourist) {
		this.numOfTourist = numOfTourist;
	}

	public Date getCreDate() {
		return creDate;
	}

	public void setCreDate(Date creDate) {
		this.creDate = creDate;
	}

	public String getGoodsMainCategory() {
		return goodsMainCategory;
	}

	public void setGoodsMainCategory(String goodsMainCategory) {
		this.goodsMainCategory = goodsMainCategory;
	}

}
