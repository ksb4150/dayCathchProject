package com.springboot.goods.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("lodgingdetailVO")
public class LodgingDetailVO {
	private int goodsId;
	private int numOfTourist;
	private String TV;
	private String wifi;
	private String refrigerator;
	private String airConditioner;
	private String swimmingPool;
	private String breakfast;
	private String spar;
	private String hairAppliance;
	private String petsAllowed;
	private String store;
	private String disabledAccessibility;
	private String parking;
	private String restaurant;
	private String hotSpring;
	private String checkIn;
	private String checkOut;
	private String goodsSubCategory;
	private Date goodsStart;
	private Date goodsEnd;

	private int bedAmount;
	private int lodgingType;

	private String singleBed;
	private String doubleBed;
	private String twinBed;
	private String ondol;

	// ticketdetail
	private String guide;

	public int getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}

	public int getNumOfTourist() {
		return numOfTourist;
	}

	public void setNumOfTourist(int numOfTourist) {
		this.numOfTourist = numOfTourist;
	}

	public String getTV() {
		return TV;
	}

	public void setTV(String tV) {
		TV = tV;
	}

	public String getWifi() {
		return wifi;
	}

	public void setWifi(String wifi) {
		this.wifi = wifi;
	}

	public String getRefrigerator() {
		return refrigerator;
	}

	public void setRefrigerator(String refrigerator) {
		this.refrigerator = refrigerator;
	}

	public String getAirConditioner() {
		return airConditioner;
	}

	public void setAirConditioner(String airConditioner) {
		this.airConditioner = airConditioner;
	}

	public String getSwimmingPool() {
		return swimmingPool;
	}

	public void setSwimmingPool(String swimmingPool) {
		this.swimmingPool = swimmingPool;
	}

	public String getBreakfast() {
		return breakfast;
	}

	public void setBreakfast(String breakfast) {
		this.breakfast = breakfast;
	}

	public String getSpar() {
		return spar;
	}

	public void setSpar(String spar) {
		this.spar = spar;
	}

	public String getHairAppliance() {
		return hairAppliance;
	}

	public void setHairAppliance(String hairAppliance) {
		this.hairAppliance = hairAppliance;
	}

	public String getPetsAllowed() {
		return petsAllowed;
	}

	public void setPetsAllowed(String petsAllowed) {
		this.petsAllowed = petsAllowed;
	}

	public String getStore() {
		return store;
	}

	public void setStore(String store) {
		this.store = store;
	}

	public String getDisabledAccessibility() {
		return disabledAccessibility;
	}

	public void setDisabledAccessibility(String disabledAccessibility) {
		this.disabledAccessibility = disabledAccessibility;
	}

	public String getParking() {
		return parking;
	}

	public void setParking(String parking) {
		this.parking = parking;
	}

	public String getRestaurant() {
		return restaurant;
	}

	public void setRestaurant(String restaurant) {
		this.restaurant = restaurant;
	}

	public String getHotSpring() {
		return hotSpring;
	}

	public void setHotSpring(String hotSpring) {
		this.hotSpring = hotSpring;
	}

	public String getCheckIn() {
		return checkIn;
	}

	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}

	public String getCheckOut() {
		return checkOut;
	}

	public void setCheckOut(String checkOut) {
		this.checkOut = checkOut;
	}

	public String getGoodsSubCategory() {
		return goodsSubCategory;
	}

	public void setGoodsSubCategory(String goodsSubCategory) {
		this.goodsSubCategory = goodsSubCategory;
	}

	public Date getGoodsStart() {
		return goodsStart;
	}

	public void setGoodsStart(Date goodsStart) {
		this.goodsStart = goodsStart;
	}

	public Date getGoodsEnd() {
		return goodsEnd;
	}

	public void setGoodsEnd(Date goodsEnd) {
		this.goodsEnd = goodsEnd;
	}

	public int getBedAmount() {
		return bedAmount;
	}

	public void setBedAmount(int bedAmount) {
		this.bedAmount = bedAmount;
	}

	public int getLodgingType() {
		return lodgingType;
	}

	public void setLodgingType(int lodgingType) {
		this.lodgingType = lodgingType;
	}

	public String getSingleBed() {
		return singleBed;
	}

	public void setSingleBed(String singleBed) {
		this.singleBed = singleBed;
	}

	public String getDoubleBed() {
		return doubleBed;
	}

	public void setDoubleBed(String doubleBed) {
		this.doubleBed = doubleBed;
	}

	public String getTwinBed() {
		return twinBed;
	}

	public void setTwinBed(String twinBed) {
		this.twinBed = twinBed;
	}

	public String getOndol() {
		return ondol;
	}

	public void setOndol(String ondol) {
		this.ondol = ondol;
	}

	public String getGuide() {
		return guide;
	}

	public void setGuide(String guide) {
		this.guide = guide;
	}

}
