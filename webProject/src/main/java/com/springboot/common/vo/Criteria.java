package com.springboot.common.vo;

public class Criteria {

	private int pageNum; // 현재 페이지
	private int amount; // 한 페이지당 보여질 게시물 개수
	private int skip; // 스킵할 게시물 수
	private String uid;
	private String search;
	/* 기본 세팅 : pageNum = 1, amount = 10 */
	public Criteria() {
		this.pageNum = 1;
		this.amount = 10;
		this.skip = 0;
	}

	/* 생성자 => 원하는 pageNum, 원하는 amount */
	public Criteria(int pageNum, int amount, String uid, String search) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.skip = (pageNum - 1) * amount;
		this.uid = uid;
		this.search = search;
		
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.skip = (pageNum - 1) * this.amount;
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.skip = (this.pageNum - 1) * amount;
		this.amount = amount;
	}

	public int getSkip() {
		return skip;
	}

	public void setSkip(int skip) {
		this.skip = skip;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", skip=" + skip + "]";
	}

}
