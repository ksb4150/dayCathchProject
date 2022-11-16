package com.springboot.page.vo;


import java.sql.Date;

import org.springframework.stereotype.Component;
@Component("noticeVO")
public class noticeVO {
	
	private int noticeNO;
	private String uid;
	private String title;
	private String content;
	private Date regDate;
	private String notice_category;
	private String view_cnt;
	private String impt_notice;
	
	
	public noticeVO() {
	}
		
	public int getNoticeNO() {
		return noticeNO;
	}


	public void setNoticeNO(int noticeNO) {
		this.noticeNO = noticeNO;
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


	public Date getRegDate() {
		return regDate;
	}


	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}


	public String getNotice_category() {
		return notice_category;
	}


	public void setNotice_category(String notice_category) {
		this.notice_category = notice_category;
	}


	public String getView_cnt() {
		return view_cnt;
	}


	public void setView_cnt(String view_cnt) {
		this.view_cnt = view_cnt;
	}


	public String getImpt_notice() {
		return impt_notice;
	}


	public void setImpt_notice(String impt_notice) {
		this.impt_notice = impt_notice;
	}


	
}
	
	
	