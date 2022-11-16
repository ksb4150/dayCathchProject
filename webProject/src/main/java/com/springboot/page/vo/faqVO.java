package com.springboot.page.vo;



import java.sql.Date;

import org.springframework.stereotype.Component;

	@Component("faqVO")
	public class faqVO {
		private int faq_no; // 글 번호
		private String faq_title; // 제목
		private String faq_content; // 내용
		private Date faq_date; // 작성 날짜
		private String uid;
		
		

		public faqVO() {
			
		}
		
		
		public int getFaq_no() {
			return faq_no;
		}
		public String getFaq_title() {
			return faq_title;
		}
		
		public String getFaq_content() {
			return faq_content;
		}
		public Date getFaq_date() {
			return faq_date;
		}
		
		
		
		public void setFaq_no(int faq_no) {
			this.faq_no = faq_no;
		}
		public void setFaq_title(String faq_title) {
			this.faq_title = faq_title;
		}
		public void setFaq_content(String faq_content) {
			this.faq_content = faq_content;
		}
		public void setFaq_date(Date faq_date) {
			this.faq_date = faq_date;
		}
		
		public String getUid() {
			return uid;
		}
		public void setUid(String uid) {
			this.uid = uid;
		}

		
	}

	

