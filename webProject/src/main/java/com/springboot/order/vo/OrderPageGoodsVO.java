package com.springboot.order.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("orderPageGoodsVO")

	public class OrderPageGoodsVO
	{ 
		/* VIEW에서 받을값 */
		
		private int goodsId;
	    
	    private int goodsQty;
	    
	    private Date cartcheckin;
	    
	    private Date cartcheckout;
	    
	    private String goodsName;
	    
	    private int goodsPrice;
	    
	    private String goodsImageFileName;
	    
	    private int numOfTourist;
	    
	    /*db에서 꺼내올 값 */
	    private String companyName;
	    
	 
	    //private int goodsdiscount;
	    
		/* 만들어 낼 값 */   
	    private int totalPrice;

	    public OrderPageGoodsVO(int goodsId, int goodsQty, String goodsImageFileName, String companyName, Date cartcheckin, Date cartcheckout, int numOfTourist, String goodsName, int goodsPrice, int totalPrice) {
			this.goodsId = goodsId;
			this.goodsQty = goodsQty;
			this.goodsName = goodsName;
			this.companyName = companyName;
			this.goodsImageFileName = goodsImageFileName;
			this.cartcheckin = cartcheckin;
			this.cartcheckout = cartcheckout;
			this.goodsPrice = goodsPrice;
			this.numOfTourist = numOfTourist;
			
			this.totalPrice = totalPrice;
			
			System.out.println("OrderPageGoodsVO에서 세팅함");
		}
	    
		public OrderPageGoodsVO() {
			super();
		}
		
						
			public int getGoodsId() {
				return goodsId;
			}

			public void setGoodsId(int goodsId) {
				this.goodsId = goodsId;
			}

			public int getGoodsQty() {
				return goodsQty;
			}
			
			public void setGoodsQty(int goodsQty) {
				this.goodsQty = goodsQty;
			}

			public String getCompanyName() {
				return companyName;
			}
			
			public void setCompanyName(String companyName) {
				this.companyName = companyName;
			}

			public String getGoodsName() {
				return goodsName;
			}
			
			public void setGoodsName(String goodsName) {
				this.goodsName = goodsName;
			}
			
			public int getGoodsPrice() {
				return goodsPrice;
			}
			
			public void setGoodsPrice(int goodsPrice) {
				this.goodsPrice = goodsPrice;
			}

			public int getTotalPrice() {
				return totalPrice;
			}

			public void setTotalPrice(int totalPrice) {
				this.totalPrice = totalPrice;
			}
						
			public Date getCartcheckin() {
				return cartcheckin;
			}

			public void setCartcheckin(Date cartcheckin) {
				this.cartcheckin = cartcheckin;
			}
			
			public Date getCartcheckout() {
				return cartcheckout;
			}

			public void setCartcheckout(Date cartcheckout) {
				this.cartcheckout = cartcheckout;
			}
			
			public int getNumOfTourist() {
				return numOfTourist;
			}

			public void setNumOfTourist(int numOfTourist) {
				this.numOfTourist = numOfTourist;
			}
			
			public String getGoodsImageFileName( ) {
				return goodsImageFileName;
			}
			
			public void setGoodsImageFileName(String goodsImageFileName ) {
				this.goodsImageFileName = goodsImageFileName;
			}
			
			
			public void initSaleTotal() {
				this.totalPrice = this.goodsPrice*this.goodsQty;
				
			}
			
			@Override
			public String toString() {
				return "OrderGoodsVO [goodsId=" + goodsId + ", goodsQty=" + goodsQty + ", goodsName=" + goodsName + ", companyName=" + companyName +", numOfTourist=" + numOfTourist
						+ ", goodsPrice=" + goodsPrice + ", cartcheckin=" + cartcheckin + ", cartcheckout=" + cartcheckout + ", goodsImageFileName=" + goodsImageFileName + " , totalPrice=" + totalPrice + "]";
			}
			
	    
}

