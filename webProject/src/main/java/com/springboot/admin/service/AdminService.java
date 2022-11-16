package com.springboot.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.springboot.common.vo.Criteria;
import com.springboot.member.vo.MemberVO;
import com.springboot.order.vo.OrderRefundVO;
import com.springboot.page.vo.csVO;
import com.springboot.page.vo.faqVO;
import com.springboot.page.vo.noticeVO;

public interface AdminService {

	public List userOrderList() throws DataAccessException;

	public List userordergoodsList(Criteria cri) throws DataAccessException;

	public void orderCancel1(OrderRefundVO orf);

	public void orderCancel2(OrderRefundVO orf);

	// 관리자 상품 목록 가져오기
//	public Map adminGoodsList() throws Exception;

	public List adminGoodslistCri(Criteria cri) throws Exception;

	public int TotalAdminGoodsList(Criteria cri) throws Exception;

	public List adminGoodsListSearch(String search) throws Exception;

	public List adminGoodslistCri2(Criteria cri) throws Exception;

	public int TotalAdminGoodsList2(Criteria cri) throws Exception;

	public int adminGoodsAllow(int goodsId) throws Exception;

	public int deleteReviewList(String uid) throws Exception;

	// 관리자 커뮤니티 목록
	public List adminCommunitylistCri(Criteria cri) throws Exception;

	public int TotalAdminCommunityList(Criteria cri) throws Exception;

	public List adminCommunityListSearch(String search) throws Exception;

	public List adminReviewListCri(Criteria cri) throws Exception;

	public int TotalAdminReviewList(Criteria cri) throws Exception;

	public List adminReviewListSearch(String search) throws Exception;

	// 관리자 판매 현황
	public Map aSalesStatus(Criteria cri) throws Exception;

	public Map aSearchSalesStatus(String search) throws Exception;

	public int getSalesTotal(Criteria cri) throws Exception;

	public List userList() throws Exception;

	public List userListpage(Criteria cri) throws Exception;

	public int totalUserListPage(Criteria cri) throws Exception;

	public int totalbUserListPage(Criteria cri) throws Exception;

	public int getOrderCount() throws Exception;

	public int getOrderCancelCount() throws Exception;

	public int getcsCount() throws Exception;

	public int getcsAnswerCount() throws Exception;

	public int getboardCount() throws Exception;

	public int getboardcommentCount() throws Exception;

	// 사용자 회원 이름으로 회원 찾기
	public List findUserList(String search) throws Exception;

	// 사업자 회원 이름으로 회원 찾기
	public List buserListpage(Criteria cri) throws Exception;

	public List findbUserList(String search) throws Exception;

	public List buserAllowList() throws Exception;

	public void buserAdminAllow(String uid) throws Exception;

	public void removeuser(String uid) throws Exception;

	public void insertDeleteusertable(MemberVO memberVO) throws Exception;

	public int totalAdminOrderGoodsList(Criteria cri) throws Exception;

	public List FindAdminOrderList(String search) throws DataAccessException;

	public List FindAdminOrdergoodsList(String search) throws DataAccessException;

	// 1:1
	public List<csVO> listPageQna(Criteria cri) throws Exception;

	public List<csVO> getQnaList(String uid) throws Exception;

	public csVO detailQna(int csNO) throws Exception;

	public void removeQna(int csNO) throws Exception;

	public void insertReply(csVO cs) throws Exception;

	public void updateOriginNo(csVO cs) throws Exception;

	public int readGroupLayer(int csNO) throws Exception;

	public int readOriginNo(int csNO) throws Exception;

	public int qnaTotal(Criteria cri) throws Exception;

	// 공지사항
	public List listNotice() throws Exception;

	public int noticeWrite(noticeVO notice) throws Exception;

	public int noticeRemove(int noticeNO) throws Exception;

	public noticeVO noticeView(int noticeNO) throws Exception;

	public void noticeModify(noticeVO notice) throws Exception;

	public List<noticeVO> listPage(Criteria cri) throws Exception;

	public int noticeTotal(Criteria cri) throws Exception;

	// FAQ
	public List listFaq() throws Exception;

	public int faqWrite(faqVO faq) throws Exception;

	public int faqRemove(int faq_no) throws Exception;

	public faqVO faqMod(int faq_no) throws Exception;

	public int faqModify(faqVO faq) throws Exception;

	public List adminPointHistory(Criteria cri) throws Exception;

	// 포인트
	public int totalPointHistory() throws Exception;

	public List findpointHistory(String search) throws DataAccessException;

	public void paymentCancle1(String accessToken) throws Exception;

	public List adminCommentList(Criteria cri) throws Exception;

	public int adminTotalCommentPage(Criteria cri) throws Exception;
}
