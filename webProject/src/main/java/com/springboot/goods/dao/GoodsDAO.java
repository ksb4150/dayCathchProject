
package com.springboot.goods.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.springboot.goods.vo.GoodreviewVO;
import com.springboot.goods.vo.GoodsLikeVO;
import com.springboot.goods.vo.GoodsVO;
import com.springboot.goods.vo.LodgingDetailVO;
import com.springboot.goods.vo.OrderVO;
import com.springboot.goods.vo.TouristVO;

@Mapper
@Repository("goodsDAO")
public interface GoodsDAO {
	public int insertGoods(Map goodsMap) throws DataAccessException;

	public int insertlodgingdetail(LodgingDetailVO lodging) throws DataAccessException;

	public int insertOrder(OrderVO order) throws DataAccessException;

	public int insertTourist(TouristVO tourist) throws DataAccessException;

	public int insertticketdetail(LodgingDetailVO ticket) throws DataAccessException;

	public int insertImageFileList(List imageFileList) throws DataAccessException;

	public int insertReview(GoodreviewVO goodreview) throws DataAccessException;

	public int updateReviewScore1(GoodreviewVO goodreview) throws DataAccessException;

	public int updateReviewUserScore(String buid) throws DataAccessException;

	public String userReviewCheck(String uid) throws DataAccessException;

	public Integer userReviewCheck1(Map reviewmap) throws DataAccessException;
	
	public GoodsVO getGoodsInfo(int goodsId);

	public List selectGoodsList(String uid) throws DataAccessException;

	public List selectGoodsList1(String uid) throws DataAccessException;

	public Integer deleteGoods(int goodId) throws DataAccessException;

	public List selectGoodsModify(int goodId) throws DataAccessException;

	// 상품 수정
	public int updateGoodsModify(GoodsVO goods) throws DataAccessException;

	public int updateLodgingModify(LodgingDetailVO lodging) throws DataAccessException;

	public List selectGoodsImgs(int goodsId) throws DataAccessException;

	public LodgingDetailVO selectlodgingdetail(int goodsId) throws DataAccessException;

	public LodgingDetailVO selectlodgingdetail1(int goodsId) throws DataAccessException;

	//상품 찜
	public void createGoodsLike(GoodsLikeVO liked);
	
	public void deleteGoodsLike(GoodsLikeVO liked);

	public void updateGoodsLike(int goodsId);

	public int selectReview(int goodsId) throws DataAccessException;
	
	public int updateReviewScore2(GoodreviewVO goodreview) throws DataAccessException;
	
//	비지니스 스코어 관련 
	public int selectBuserReview(int goodsId) throws DataAccessException;
	public int updateBuserReviewScore1(GoodreviewVO goodreview) throws DataAccessException;
	public int updateBuserReviewScore2(GoodreviewVO goodreview) throws DataAccessException;
	
	
	public int updatebusinessScore(String buid) throws DataAccessException;
	
	
}
