package com.springboot.admin.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("adminPointHistoryVO")
public class AdminPointHistoryVO {
	
	private int ordersNO;
	private String uid;
	private String userId;
	private String userName;
	private int usePoint;
	private int savePoint;
	private int userPoint;
	private Date creDate;
	
	public AdminPointHistoryVO() {
		super();
	}
	
	
	public AdminPointHistoryVO(int ordersNO, String uid, String userId, String userName, int usePoint, int savePoint, int userPoint, Date creDate)
	{
		
		this.ordersNO = ordersNO;
		this.uid = uid;
		this.userId = userId;
		this.userName = userName;
		this.usePoint= usePoint;
		this.savePoint = savePoint;
		this.userPoint = userPoint;
		this.creDate = creDate;
	}


	public int getOrdersNO() {
		return ordersNO;
	}


	public void setOrdersNO(int ordersNO) {
		this.ordersNO = ordersNO;
	}


	public String getUid() {
		return uid;
	}


	public void setUid(String uid) {
		this.uid = uid;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public int getUsePoint() {
		return usePoint;
	}


	public void setUsePoint(int usePoint) {
		this.usePoint = usePoint;
	}


	public int getSavePoint() {
		return savePoint;
	}


	public void setSavePoint(int savePoint) {
		this.savePoint = savePoint;
	}


	public int getUserPoint() {
		return userPoint;
	}


	public void setUserPoint(int userPoint) {
		this.userPoint = userPoint;
	}


	public Date getCreDate() {
		return creDate;
	}


	public void setCreDate(Date creDate) {
		this.creDate = creDate;
	}
}
