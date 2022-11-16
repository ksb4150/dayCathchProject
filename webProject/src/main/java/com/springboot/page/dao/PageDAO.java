package com.springboot.page.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.springboot.board.vo.BoardVO;
import com.springboot.common.vo.Criteria;
import com.springboot.goods.vo.GoodreviewVO;
import com.springboot.goods.vo.GoodsVO;
import com.springboot.goods.vo.LodgingDetailVO;
import com.springboot.member.vo.MemberVO;
import com.springboot.page.vo.ImageVO;
import com.springboot.page.vo.csVO;
import com.springboot.page.vo.faqVO;
import com.springboot.page.vo.noticeVO;

@Mapper
@Repository("pageDAO")
public interface PageDAO {
	// 최저가 상품 4개 불러오기
	public List selectLowLodgingList() throws DataAccessException;

	// 인기 상품 4개 불러오기
	public List selectHotRowLodgingList() throws DataAccessException;

	// 상품의 멤버 정보 가져오기
	public MemberVO selectMemberList(String uid) throws DataAccessException;

	// 한 숙소 상품의 전체 정보 가져오기
	public List<GoodsVO> selectGoods(String uid) throws DataAccessException;

	// 한 티켓 상품의 전체 정보 가져오기
	public List<GoodsVO> selectGoods1(String uid) throws DataAccessException;

	// 한 상품의 전체 상세 정보 가져오기
	public LodgingDetailVO selectlodgingDetail(int goodsId) throws DataAccessException;

	// 한 상품의 전체 이미지 가져오기
	public List<ImageVO> selectlodgingImgs(int goodsId) throws DataAccessException;

	// 멤버의 정보 가져오기 uid로
	public MemberVO selectMemInfo(String uid) throws DataAccessException;

	// 특정 상품의 정보 가져오기
	public GoodsVO selectGood(int goodsId) throws DataAccessException;

	// 특정 상품의 디테일 정보 가져오기
	public LodgingDetailVO selectLodgingDetailInfo(int goodsId) throws DataAccessException;

	// 상품 리뷰 리스트 가져오기
	public List<GoodreviewVO> selectReviewList(String uid) throws DataAccessException;

	// 리뷰 리스트 가져오기
	public List selectReviewList() throws DataAccessException;

	// 메인페이지 인기 숙소 상품 가져오기
	public List selectLowLodgingList1() throws DataAccessException;

	// 메인페이지 인기 티켓 상품 가져오기
	public List selectLowLodgingList3() throws DataAccessException;

	// 메인 페이지 게시글 가져오기
	public List<BoardVO> selectboardList() throws DataAccessException;

	// 서브 티켓 페이지 최저가 상품 가져오기
	public List selectLowLodgingList2() throws DataAccessException;

	// 서브 티켓 페이지 인기 상품 가져오기
	public List selectHotRowLodgingList2() throws DataAccessException;

	public List<BoardVO> selectBoardAsc() throws DataAccessException;

	// public List<LodgingDetailVO> filtering(LodgingDetailVO vo, String sDate,
	// String eDate, String subCate) throws DataAccessException;

	public List<GoodsVO> basicFiltering(String goodsSubCategory) throws DataAccessException;

	public List<GoodsVO> basicFiltering1(String goodsSubCategory) throws DataAccessException;

	public List<GoodsVO> filtering(LodgingDetailVO detailVO);

	public List<GoodsVO> filtering1(LodgingDetailVO detailVO);

	// 1:1 문의
	public void addNewQna(csVO cs) throws DataAccessException;

	public List<csVO> getQnaList(String uid) throws DataAccessException;

	public csVO detailQna(int csNO) throws DataAccessException;

	/** 계층 정보 조회 */
	public int readOriginNo(int csNO) throws DataAccessException;

	/** 계층 정보 조회 */
	public int readGroupLayer(int csNO) throws DataAccessException;

	/** 순서번호 Max 조회 */
	public int maxGroupOrd() throws DataAccessException;

	/** 답글 순서 수정 */
	public int updateOriginNo(csVO cs) throws DataAccessException;

	/** 글번호 */
	public int maxCsNO() throws DataAccessException;

	/** 답글 등록 */
	public int insertReply(csVO cs) throws DataAccessException;

	// FAQ
	public List<faqVO> selectAllFaqList() throws DataAccessException;

	public faqVO faqSelect(int faq_no) throws DataAccessException;

	public void deleteQna(int csNO) throws DataAccessException;

	// 공지사항
	public List<noticeVO> selectAllNoticeList() throws DataAccessException;

	public noticeVO noticeSelect(int noticeNO) throws DataAccessException;

	public int updateView(int noticeNO) throws DataAccessException;

	// 특정 페이지에 있는 글정보를 확인
	public List<noticeVO> listPage(int page) throws DataAccessException;

	// 페이징 처리하는 동작(Criteria 객체 사용)
	public List<noticeVO> listPage(Criteria cri) throws DataAccessException;

	// DB 테이블에 있는 모든 글 개수 계산 후 리턴
	public int getTotal(Criteria cri) throws DataAccessException;

	public List<BoardVO> selectBoardCnt() throws DataAccessException;

	// 커뮤니티 전체글 최신순
	public List communityList1(Criteria cri) throws DataAccessException;

	public int totalcommunityPage1() throws DataAccessException;

	public List communityList2(Criteria cri) throws DataAccessException;

	public int totalcommunityPage2(Criteria cri) throws DataAccessException;

	public List communityList3(Criteria cri) throws DataAccessException;

	public int totalcommunityPage3(Criteria cri) throws DataAccessException;

	public List findArticleList(Criteria cri) throws DataAccessException;
	// 커뮤니티 끝

	public List<Integer> selectLikeGoods(@Param("uid") String uid, @Param("buid") String buid);

	// qna 수정
	// cs 수정
	public void csUpdate(csVO cs) throws DataAccessException;

	// 비지니스 상품 리스트 가져오기
	public List businessReviewListCri(@Param("cri") Criteria cri, @Param("uid") String uid) throws DataAccessException;

	// DB 테이블에 있는 모든 글 개수 계산 후 리턴
	public int TotalbusinessReviewList(@Param("cri") Criteria cri, @Param("uid") String uid) throws DataAccessException;

	public List<GoodsVO> selectsWishList(String uid) throws DataAccessException;

	public List<BoardVO> selectsLikeList(String uid) throws DataAccessException;

	public BoardVO selectHotArticle()  throws DataAccessException;

	public LodgingDetailVO selectTicketDetail(int goodsId) throws DataAccessException;
}