package com.springboot.page.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.springboot.common.vo.Criteria;
import com.springboot.goods.vo.LodgingDetailVO;
import com.springboot.page.vo.csVO;
import com.springboot.page.vo.faqVO;
import com.springboot.page.vo.noticeVO;

public interface PageService {
	public Map selectRowLodgingList() throws Exception;

	public Map selectHotRowLodgingList() throws Exception;

	public Map viewLodgingDetail(String uid) throws Exception;

	public Map viewLodgingDetail1(String uid) throws Exception;

	public Map selectGoodsInfo(int goodsId) throws Exception;

	// 메인페이지 숙소 상품
	public Map selectRowLodgingList1() throws Exception;

	// 서브페이지 티켓 상품
	public Map selectRowLodgingList2() throws Exception;

	public Map selectHotRowLodgingList2() throws Exception;

	public Map selectBoardAsc() throws Exception;

	public Map basicFiltering(String goodsSubCategory) throws Exception;

	public Map basicFiltering1(String goodsSubCategory) throws Exception;

//	public Map filtering(LodgingDetailVO vo, String checkin_date, String checkout_date) throws Exception;
	public Map filtering(LodgingDetailVO detalVO) throws Exception;

	public Map filtering1(LodgingDetailVO detailVO) throws Exception;

	// 1:1문의
	public void addNewQna(csVO cs) throws Exception;

	public List<csVO> getQnaList(String uid) throws Exception;

	public csVO detailQna(int csNO) throws Exception;

	public void removeQna(int csNO) throws Exception;

	public void insertReply(csVO cs) throws Exception;

	public void updateOriginNo(csVO cs) throws Exception;

	public int readGroupLayer(int csNO) throws Exception;

	public int readOriginNo(int csNO) throws Exception;

	public int maxGroupOrd() throws Exception;

	// FAQ
	public List listFaq() throws Exception;

	public faqVO faqMod(int faq_no) throws Exception;

	// 공지사항
	public List listNotice() throws Exception;

	public noticeVO noticeView(int noticeNO) throws Exception;

	public Map<String, Object> selectBoardCnt() throws Exception;

	public List<noticeVO> listPage(Criteria cri) throws Exception;

	public int getTotal(Criteria cri) throws Exception;

	// 포인트
	public int sumSavePoint(String uid) throws Exception;

	public int sumUsePoint(String uid) throws Exception;

	public List communityList1(Criteria cri) throws Exception;

	public int totalcommunityPage1() throws Exception;

	public List communityList2(Criteria cri) throws Exception;

	public int totalcommunityPage2(Criteria cri) throws Exception;

	public List communityList3(Criteria cri) throws Exception;

	public List findArticleList(Criteria cri) throws Exception;

	public int totalcommunityPage3(Criteria cri) throws Exception;

	List<Integer> selectLikeGoods(String uid, String buid) throws Exception;

	// qna 수정
	public void qnaModify(csVO cs) throws Exception;

	// 비지니스 상품 리스트 가져오기
	public List businessReviewListCri(@Param("cri") Criteria cri, @Param("uid") String uid) throws Exception;

	public int TotalbusinessReviewList(@Param("cri") Criteria cri, @Param("uid") String uid) throws Exception;

	public Map selectsWishList(String uid) throws Exception;

	public Map<String, Object> selectHotArticle() throws Exception;
}
