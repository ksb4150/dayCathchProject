package com.springboot.goods.service;

import java.util.Map;

import com.springboot.goods.vo.GoodreviewVO;
import com.springboot.goods.vo.GoodsLikeVO;
import com.springboot.goods.vo.GoodsVO;
import com.springboot.goods.vo.LodgingDetailVO;
import com.springboot.goods.vo.OrderVO;
import com.springboot.goods.vo.TouristVO;

public interface GoodsService {
	public int goodsWrite1(Map goodsMap);

	public int goodsWrite2(Map goodsMap);

	public int lodgingdetail(LodgingDetailVO lodging);

	public int addOrderInfo(OrderVO order);

	public int addTouristInfo(TouristVO tourist);

	public int ticketdetail(LodgingDetailVO ticket);
//
//	public void updateGoods(GoodsVO vo);
//
//	public void deleteGoods(int goodId);

	public int goodsImgList(Map<String, Object> goodsMap);

	public int addReview(GoodreviewVO goodreview);

	public int addReviewScore(GoodreviewVO goodreview);

	public int addReviewUserScore(String buid) throws Exception;

	public String userReviewCheckService(String uid) throws Exception;

	public Integer userReviewCheckService1(Map reviewmap) throws Exception;

	public Map goodsList(String uid) throws Exception;

	public Integer deleteGoodsList(int goodsId);

	public Map selectGoodsModify(int goodsId);

	// 상품 수정
	public int updateLodgingModify(LodgingDetailVO lodging);

	// 상품 수정
	public int updateGoodsModify(GoodsVO goods);

	public LodgingDetailVO selectlodgingdetail(int goodsId);

	public LodgingDetailVO selectlodgingdetail1(int goodsId);

	//찜
	public void insertGoodsLike(GoodsLikeVO liked) throws Exception;
	public void deleteGoodsLike(GoodsLikeVO liked) throws Exception;
	
}
