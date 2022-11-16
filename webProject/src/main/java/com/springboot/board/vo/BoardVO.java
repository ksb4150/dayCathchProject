package com.springboot.board.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("boardVO")
public class BoardVO {
	private int articleNO;
	private String uid;
	private String title;
	private String content;
	private String userName;
	private int viewCnt;
	private int commentCnt;
	private String articleCategory;
	private Date writeDate;
	private String addressList;
	private String mainImageFileName;
	private int likecount;
	
	public BoardVO() {
		super();
	}

	public BoardVO(int articleNO, String uid, String title, String content, String userName, int viewCnt,
			int commentCnt, String articleCategory, Date writeDate, String addressList, String mainImageFileName,
			int likecount) {
		super();
		this.articleNO = articleNO;
		this.uid = uid;
		this.title = title;
		this.content = content;
		this.userName = userName;
		this.viewCnt = viewCnt;
		this.commentCnt = commentCnt;
		this.articleCategory = articleCategory;
		this.writeDate = writeDate;
		this.addressList = addressList;
		this.mainImageFileName = mainImageFileName;
		this.likecount = likecount;
	}

	public int getLikecount() {
		return likecount;
	}

	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}

	public String getMainImageFileName() {
		return mainImageFileName;
	}

	public void setMainImageFileName(String mainImageFileName) {
		this.mainImageFileName = mainImageFileName;
	}

	public String getAddressList() {
		return addressList;
	}

	public void setAddressList(String addressList) {
		this.addressList = addressList;
	}

	public int getArticleNO() {
		return articleNO;
	}
	public void setArticleNO(int articleNO) {
		this.articleNO = articleNO;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public int getCommentCnt() {
		return commentCnt;
	}
	public void setCommentCnt(int commentCnt) {
		this.commentCnt = commentCnt;
	}
	public String getArticleCategory() {
		return articleCategory;
	}
	public void setArticleCategory(String articleCategory) {
		this.articleCategory = articleCategory;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
}
