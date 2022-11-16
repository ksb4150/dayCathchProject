package com.springboot.goods.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("goodreviewVO")
public class GoodreviewVO {
	private int reviewId;
	private String uid;//
	private int goodsId;//
	private String content;//
	private int score;//
	private Date regDate;
	private String userName;
	private String goodsName;//
	private double sscore;
	//
	// 테스트

	public GoodreviewVO() {

	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	// 리뷰 작성
	public GoodreviewVO(int reviewId, String uid, int goodsId, String content, int score, Date regDate) {
		super();
		this.reviewId = reviewId;
		this.uid = uid;
		this.goodsId = goodsId;
		this.content = content;
		this.score = score;
		this.regDate = regDate;
	}

	// 테스트
	public GoodreviewVO(int reviewId, String uid, int goodsId, String content, int score, Date regDate, String userName,
			String goodsName, double sscore) {
		super();
		this.reviewId = reviewId;
		this.uid = uid;
		this.goodsId = goodsId;
		this.content = content;
		this.score = score;
		this.regDate = regDate;
		this.userName = userName;
		this.goodsName = goodsName;
		this.sscore = sscore;

	}

	public int getReviewId() {
		return reviewId;
	}

	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}

	public double getSscore() {
		return sscore;
	}

	public void setSscore(double sscore) {
		this.sscore = sscore;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public int getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

}
