package com.springboot.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.springboot.common.vo.Criteria;
import com.springboot.member.vo.MemberVO;
import com.springboot.order.vo.OrderGoodsVO;
import com.springboot.order.vo.OrderRefundVO;
import com.springboot.order.vo.OrdercartVO;
import com.springboot.page.vo.csVO;
import com.springboot.page.vo.faqVO;
import com.springboot.page.vo.noticeVO;

@Mapper
@Repository("adminDAO")
public interface AdminDAO {

	/* 관리자가 주문조회시 주문정보를 가져다주기 */
	public List selectUserOrderList() throws DataAccessException;

	/* 관리자가 주문조회시 주문상품정보를 가져다주기 */
	public List selectUserOrdergoodsList(Criteria cri) throws DataAccessException;

	/* 주문 취소 */
	public int orderCancle1(int ordersNO);

	public int orderCancle2(int ordersNO);

	public int orderCancle3(OrderRefundVO orf);

	// 취소된 건별 주문취소의 내용을 같은 주문번호로 묶인 주문전체에 반영
	public int modifyOrder(OrdercartVO ocv);

//	public List<GoodsVO> adminGoodsList();

	// 관리자 상품 목록
	public List adminGoodslistCri(Criteria cri) throws DataAccessException;

	// DB 테이블에 있는 모든 글 개수 계산 후 리턴
	public int TotalAdminGoodsList(Criteria cri) throws DataAccessException;

	public List adminGoodsListSearch(String search) throws DataAccessException;

	public int adminGoodsAllow(int goodsId) throws DataAccessException;

	// 관리자 상품 승인대기 목록
	public List adminGoodslistCri2(Criteria cri) throws DataAccessException;

	// DB 테이블에 있는 모든 글 개수 계산 후 리턴
	public int TotalAdminGoodsList2(Criteria cri) throws DataAccessException;

	// 관리자 커뮤니티 목록
	public List adminCommunitylistCri(Criteria cri) throws DataAccessException;

	// DB 테이블에 있는 모든 글 개수 계산 후 리턴
	public int TotalAdminCommunityList(Criteria cri) throws DataAccessException;

	public List adminCommunityListSearch(String search) throws DataAccessException;

	// 관리자 리뷰 목록
	public List adminReviewListCri(Criteria cri) throws DataAccessException;

	// DB 테이블에 있는 모든 글 개수 계산 후 리턴
	public int TotalAdminReviewList(Criteria cri) throws DataAccessException;

	public List adminReviewListSearch(String search) throws DataAccessException;

	// 관리자 판매 현황
	public List<OrdercartVO> atotalSales();

	public List<OrdercartVO> userSales(String uid);

	public List bUserInfo(Criteria cri);

	public List<OrderGoodsVO> searchTotalSales(String search);

	public List<OrderGoodsVO> searchGoodsSales(String search);

	public int aSalesGetTotal(Criteria cri);

	// 주문 상품 정보 총 개수(페이징)
	public int totalAdminOrderGoodsList(Criteria cri);

	// 취소된 주문내용을 주문취소이력 테이블에 추가(건별)
	public int insertOrderRefund(OrderGoodsVO ogv);

	public int updateRefundInfo(OrdercartVO ocv);

	public List userList() throws DataAccessException;

	// 사용자 회원 목록
	public List userListpage(Criteria cri) throws DataAccessException;

	// 사업자 회원 목록
	public List buserListpage(Criteria cri) throws DataAccessException;

	// 이름으로 사용자회원 찾기
	public List findUserList(String search) throws DataAccessException;

	// 이름으로 사업자회원 찾기
	public List findbUserList(String search) throws DataAccessException;

	public List buserAllowList() throws DataAccessException;

	public int totalUserListPage(Criteria cri) throws DataAccessException;

	public int totalbUserListPage(Criteria cri) throws DataAccessException;

	public int getOrderCount() throws DataAccessException;

	public int getOrderCancelCount() throws DataAccessException;

	public int getcsCount() throws DataAccessException;

	public int getcsAnswerCount() throws DataAccessException;

	public int getboardCount() throws DataAccessException;

	public int getboardcommentCount() throws DataAccessException;

	public void buserAdminAllow(String uid);

	public int deleteReview(String uid) throws DataAccessException;

	public void removeuser(String uid);

	public void insertDeleteusertable(MemberVO member);

	/* 검색으로 특정 주문정보를 가져다주기 */
	public List FindAdminOrderList(String search) throws DataAccessException;

	/* 검색으로 특정 주문상품정보를 가져다주기 */
	public List FindAdminOrdergoodsList(String search) throws DataAccessException;

	// qna
	public List<csVO> listPageQna(Criteria cri) throws DataAccessException;

	public csVO detailQna(int csNO) throws DataAccessException;

	public void deleteQna(int csNO) throws DataAccessException;

	public List<csVO> getQnaList(String uid) throws DataAccessException;

	/** 계층 정보 조회 */
	public int readOriginNo(int csNO) throws DataAccessException;

	/** 계층 정보 조회 */
	public int readGroupLayer(int csNO) throws DataAccessException;

	/** 순서번호 Max 조회 */
	public int maxGroupOrd() throws DataAccessException;

	/** 답글 순서 수정 */
	public int updateOriginNo(csVO cs) throws DataAccessException;

	/** 답글 등록 */
	public int insertReply(csVO cs) throws DataAccessException;

	public int qnaTotal(Criteria cri) throws DataAccessException;

	// 공지사항
	public List<noticeVO> selectAllNoticeList() throws DataAccessException;

	public int noticeWrite(noticeVO notice) throws DataAccessException;

	public noticeVO noticeSelect(int noticeNO) throws DataAccessException;

	public int noticeDelete(int noticeNO) throws DataAccessException;

	public void noticeUpdate(noticeVO notice) throws DataAccessException;

	public int updateView(int noticeNO) throws DataAccessException;

	// 페이징 처리하는 동작(Criteria 객체 사용)
	public List<noticeVO> listPage(Criteria cri) throws DataAccessException;

	// DB 테이블에 있는 모든 글 개수 계산 후 리턴
	public int noticeTotal(Criteria cri) throws DataAccessException;

	// FAQ
	public List<faqVO> selectAllFaqList() throws DataAccessException;

	public int faqWrite(faqVO faq) throws DataAccessException;

	public faqVO faqSelect(int faq_no) throws DataAccessException;

	public int faqDelete(int faq_no) throws DataAccessException;

	public int faqUpdate(faqVO faq) throws DataAccessException;

	// 포인트
	public List adminPointHistory(Criteria cri) throws DataAccessException;

	public int totalPointHistory() throws DataAccessException;

	public List findpointHistory(String search) throws DataAccessException;

	public List adminCommentList(Criteria cri) throws DataAccessException;

	public int adminTotalCommentPage(Criteria cri) throws DataAccessException;
}
