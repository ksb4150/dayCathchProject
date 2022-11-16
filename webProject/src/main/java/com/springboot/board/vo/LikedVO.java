package com.springboot.board.vo;

import org.springframework.stereotype.Component;

@Component("LikedVO")
public class LikedVO {
	private int likedId;
	private int articleNO;
	private String uid;

	public LikedVO() {
		
	}
	
	public LikedVO(int likedId, int articleNO, String uid) {
		super();
		this.likedId = likedId;
		this.articleNO = articleNO;
		this.uid = uid;
	}
	
	public int getLikedId() {
		return likedId;
	}
	public void setLikedId(int likedId) {
		this.likedId = likedId;
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

}
