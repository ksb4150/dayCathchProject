package com.springboot.page.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

	@Component("csVO")
	public class csVO {
		
		private int csNO;
		private String uid;
		private String title;
		private String txtContent;
		private Date writeDate;
		private String processingStatus;
		private int userType;
		private String writer;
		private int secret;
		private String goodsMainCategory;
		private String csCategory;
		private String userPhoneNumber;
		private int ordersNO;
		
		//답글쓰기에 필요한 추가 필드
		private int originNo;  //원글번호
		private int groupOrd; //원글에 대한 순서
		private int groupLayer; //답글 계층
		
		public csVO(int csNO, String uid, String title, String txtContent, Date writeDate, String processingStatus,
				int userType, String writer, int secret, String goodsMainCategory, String csCategory,
				String userPhoneNumber, int ordersNO, int originNo, int groupOrd, int groupLayer) {
			
			this.csNO = csNO;
			this.uid = uid;
			this.title = title;
			this.txtContent = txtContent;
			this.writeDate = writeDate;
			this.processingStatus = processingStatus;
			this.userType = userType;
			this.writer = writer;
			this.secret = secret;
			this.goodsMainCategory = goodsMainCategory;
			this.csCategory = csCategory;
			this.userPhoneNumber = userPhoneNumber;
			this.ordersNO = ordersNO;
			this.originNo = originNo;
			this.groupOrd = groupOrd;
			this.groupLayer = groupLayer;
		}


		public csVO() {
			
		}
		
		
		public int getCsNO() {
			return csNO;
		}


		public void setCsNO(int csNO) {
			this.csNO = csNO;
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


		public String getTxtContent() {
			return txtContent;
		}


		public void setTxtContent(String txtContent) {
			this.txtContent = txtContent;
		}


		public Date getWriteDate() {
			return writeDate;
		}


		public void setWriteDate(Date writeDate) {
			this.writeDate = writeDate;
		}


		public String getProcessingStatus() {
			return processingStatus;
		}


		public void setProcessingStatus(String processingStatus) {
			this.processingStatus = processingStatus;
		}


		public int getUserType() {
			return userType;
		}


		public void setUserType(int userType) {
			this.userType = userType;
		}


		public String getWriter() {
			return writer;
		}


		public void setWriter(String writer) {
			this.writer = writer;
		}


		public int getSecret() {
			return secret;
		}


		public void setSecret(int secret) {
			this.secret = secret;
		}


		public String getGoodsMainCategory() {
			return goodsMainCategory;
		}


		public void setGoodsMainCategory(String goodsMainCategory) {
			this.goodsMainCategory = goodsMainCategory;
		}


		public String getCsCategory() {
			return csCategory;
		}


		public void setCsCategory(String csCategory) {
			this.csCategory = csCategory;
		}


		public String getUserPhoneNumber() {
			return userPhoneNumber;
		}


		public void setUserPhoneNumber(String userPhoneNumber) {
			this.userPhoneNumber = userPhoneNumber;
		}


		public int getOrdersNO() {
			return ordersNO;
		}


		public void setOrdersNO(int ordersNO) {
			this.ordersNO = ordersNO;
		}

		public int getOriginNo() {
			return originNo;
		}


		public void setOriginNo(int originNo) {
			this.originNo = originNo;
		}


		public int getGroupOrd() {
			return groupOrd;
		}


		public void setGroupOrd(int groupOrd) {
			this.groupOrd = groupOrd;
		}


		public int getGroupLayer() {
			return groupLayer;
		}


		public void setGroupLayer(int groupLayer) {
			this.groupLayer = groupLayer;
		}


}
