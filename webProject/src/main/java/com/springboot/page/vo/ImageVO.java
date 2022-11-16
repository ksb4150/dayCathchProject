package com.springboot.page.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("imageVO")
public class ImageVO {
	private int fileNumber;
	private int goodsId;
	private String orginFileName;
	private Date createDate;
	
	public ImageVO() {
		
	}
	
	public ImageVO(int fileNumber, int goodsId, String orginFileName, Date createDate) {
		super();
		this.fileNumber = fileNumber;
		this.goodsId = goodsId;
		this.orginFileName = orginFileName;
		this.createDate = createDate;
	}
	
	public int getFileNumber() {
		return fileNumber;
	}
	public void setFileNumber(int fileNumber) {
		this.fileNumber = fileNumber;
	}
	public int getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}
	public String getOrginFileName() {
		return orginFileName;
	}
	public void setOrginFileName(String orginFileName) {
		this.orginFileName = orginFileName;
	}
	
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

}