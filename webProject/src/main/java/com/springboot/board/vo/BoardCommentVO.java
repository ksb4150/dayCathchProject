package com.springboot.board.vo;

import java.sql.Date;

public class BoardCommentVO {
	int articleNO;
	int commentNo;
	String uid;
	String userName;
	String commentContent;
	Date regDate;

	public BoardCommentVO() {
		
	}
	
	public BoardCommentVO(int articleNO, int commentNo, String uid, String userName, String commentContent,
			Date regDate) {
		super();
		this.articleNO = articleNO;
		this.commentNo = commentNo;
		this.uid = uid;
		this.userName = userName;
		this.commentContent = commentContent;
		this.regDate = regDate;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public int getArticleNO() {
		return articleNO;
	}
	public void setArticleNO(int articleNO) {
		this.articleNO = articleNO;
	}
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
}
