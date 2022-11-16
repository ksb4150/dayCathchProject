package com.springboot.page.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component("festivalVO")
public class FestivalVO {
	private String title;
	private String addr;
	private String tel;
	private String areacode;
	private String mapx;
	private String mapy;
	private String img1;
	private String img2;
	private String eventStartDate;
	private String eventEndDate;
	
	public FestivalVO() {
		
	}

	public FestivalVO(String addr, String title, String tel, String areacode, String mapx, String mapy, String img1,
			String img2, String eventStartDate, String eventEndDate) {
		super();
		this.addr = addr;
		this.title = title;
		this.tel = tel;
		this.areacode = areacode;
		this.mapx = mapx;
		this.mapy = mapy;
		this.img1 = img1;
		this.img2 = img2;
		this.eventStartDate = eventStartDate;
		this.eventEndDate = eventEndDate;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAreacode() {
		return areacode;
	}

	public void setAreacode(String areacode) {
		this.areacode = areacode;
	}

	public String getMapx() {
		return mapx;
	}

	public void setMapx(String mapx) {
		this.mapx = mapx;
	}

	public String getMapy() {
		return mapy;
	}

	public void setMapy(String mapy) {
		this.mapy = mapy;
	}

	public String getImg1() {
		return img1;
	}

	public void setImg1(String img1) {
		this.img1 = img1;
	}

	public String getImg2() {
		return img2;
	}

	public void setImg2(String img2) {
		this.img2 = img2;
	}

	public String getEventStartDate() {
		return eventStartDate;
	}

	public void setEventStartDate(String eventStartDate) {
		this.eventStartDate = eventStartDate;
	}

	public String getEventEndDate() {
		return eventEndDate;
	}

	public void setEventEndDate(String eventEndDate) {
		this.eventEndDate = eventEndDate;
	}
}
