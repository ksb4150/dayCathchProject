package com.springboot.goods.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.springboot.goods.dao.GoodsDAO;
import com.springboot.goods.vo.GoodreviewVO;
import com.springboot.goods.vo.GoodsLikeVO;
import com.springboot.goods.vo.GoodsVO;
import com.springboot.goods.vo.LodgingDetailVO;
import com.springboot.goods.vo.OrderVO;
import com.springboot.goods.vo.TouristVO;
import com.springboot.page.dao.PageDAO;
import com.springboot.page.vo.ImageVO;

@Service("goodsService")
@Transactional(propagation = Propagation.REQUIRED)
public class GoodsServiceImpl implements GoodsService {
	@Autowired
	GoodsDAO goodsDAO;
	@Autowired
	PageDAO pageDAO;

	public GoodsServiceImpl() {

	}

	// 상품 추가
	@Override
	public int goodsWrite1(Map goodsMap) {
		int result = goodsDAO.insertGoods(goodsMap);

		return 0;
	}

	@Override
	public int goodsImgList(Map goodsMap) {
		List<ImageVO> imageFileList = (List<ImageVO>) goodsMap.get("imageFileList");
		goodsDAO.insertImageFileList(imageFileList);
		return 0;
	}

	public int goodsWrite2(Map goodsMap) {
		return goodsDAO.insertGoods(goodsMap);
	}

	public int lodgingdetail(LodgingDetailVO lodging) {
		return goodsDAO.insertlodgingdetail(lodging);
	}

	public int ticketdetail(LodgingDetailVO ticket) {
		return goodsDAO.insertticketdetail(ticket);
	}

	@Override
	public int addOrderInfo(OrderVO order) {
		return goodsDAO.insertOrder(order);
	}

	public int addTouristInfo(TouristVO tourist) {
		return goodsDAO.insertTourist(tourist);
	}

	// 리뷰 작성
	public int addReview(GoodreviewVO goodreview) {
		return goodsDAO.insertReview(goodreview);
	}

	public int addReviewScore(GoodreviewVO goodreview) {
		int goodsId = goodreview.getGoodsId();
		int result2 = 0;
		
		int result = goodsDAO.selectReview(goodsId);
	
		if(result > 0 ) {
			result2 = goodsDAO.updateReviewScore1(goodreview);
		} else {
			result2 = goodsDAO.updateReviewScore2(goodreview);
		}
		
		return result2;
	}

	@Override
	public int addReviewUserScore(String buid) throws Exception {
		return goodsDAO.updateReviewUserScore(buid);
	}



	@Override
	public String userReviewCheckService(String uid) throws Exception {
		String result = goodsDAO.userReviewCheck(uid);
		if (result == null) {
			return "null";
		}
		return result;
	}

	@Override
	public Integer userReviewCheckService1(Map reviewmap) throws Exception {
		Integer result = goodsDAO.userReviewCheck1(reviewmap);

		return result;

	}

	// 상품 목록
	@Override
	public Map goodsList(String uid) throws Exception {
		Map<String, Object> goodsListsMap = new HashMap<>();

		List<GoodsVO> goodsList = goodsDAO.selectGoodsList(uid);
		List<GoodsVO> goodsList1 = goodsDAO.selectGoodsList1(uid);
		goodsListsMap.put("goodsList", goodsList);
		goodsListsMap.put("goodsList1", goodsList1);

		return goodsListsMap;

	}

	// 상품 수정
	@Override
	public Map selectGoodsModify(int goodsId) {
		Map<String, Object> goodsModifyMap = new HashMap<>();

		List<GoodsVO> goodsModify = goodsDAO.selectGoodsModify(goodsId);
		goodsModifyMap.put("goodsModify", goodsModify);

		return goodsModifyMap;
	}

	@Override
	public Integer deleteGoodsList(int goodsId) {
		return goodsDAO.deleteGoods(goodsId);
	}

	@Override
	public int updateGoodsModify(GoodsVO goods) {
		return goodsDAO.updateGoodsModify(goods);
	}

	@Override
	public int updateLodgingModify(LodgingDetailVO lodging) {
		return goodsDAO.updateLodgingModify(lodging);
	}

	@Override
	public LodgingDetailVO selectlodgingdetail(int goodsId) {
		return goodsDAO.selectlodgingdetail(goodsId);
	}

	@Override
	public LodgingDetailVO selectlodgingdetail1(int goodsId) {
		return goodsDAO.selectlodgingdetail(goodsId);
	}
	
	//상품 찜
	@Override
    public void insertGoodsLike(GoodsLikeVO liked) throws Exception {
        goodsDAO.createGoodsLike(liked);
        goodsDAO.updateGoodsLike(liked.getGoodsId());
    }

    @Override
    public void deleteGoodsLike(GoodsLikeVO liked) throws Exception {
    	goodsDAO.deleteGoodsLike(liked);
    	goodsDAO.updateGoodsLike(liked.getGoodsId());
    }
}