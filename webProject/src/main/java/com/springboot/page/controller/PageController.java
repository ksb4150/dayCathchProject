package com.springboot.page.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.common.vo.Criteria;
import com.springboot.goods.vo.GoodsVO;
import com.springboot.goods.vo.LodgingDetailVO;
import com.springboot.member.vo.MemberVO;
import com.springboot.mypage.vo.CartVO;
import com.springboot.page.vo.csVO;
import com.springboot.page.vo.faqVO;
import com.springboot.page.vo.noticeVO;

public interface PageController {
	public ModelAndView mainPage(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView goodsPage(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView goodsFilterPage(@RequestParam("goodsSubCategory") String goodsSubCategory,
			HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView goodsFilterPage1(@RequestParam("goodsSubCategory") String goodsSubCategory,
			HttpServletRequest request, HttpServletResponse response) throws Exception;

//	public ResponseEntity filtering(HttpServletRequest request, HttpServletResponse response, LodgingDetailVO detalVO) throws Exception;

//	public Map<String, Object>filtering(HttpServletRequest request, HttpServletResponse response, LodgingDetailVO detalVO) throws Exception;

//	public String filtering(HttpServletRequest request, HttpServletResponse response, LodgingDetailVO detalVO, Model model) throws Exception;

//	public String filtering(HttpServletRequest request, HttpServletResponse response, LodgingDetailVO detalVO, Model model,
//			@RequestParam("checkin_date") String checkin_date, @RequestParam("checkout_date") String checkout_date) throws Exception;

	public String filtering(HttpServletRequest request, HttpServletResponse response, LodgingDetailVO detalVO,
			Model model) throws Exception;

	public String filtering1(HttpServletRequest request, HttpServletResponse response, LodgingDetailVO detalVO,
			Model model) throws Exception;

	public ModelAndView goodsDetailPage(@RequestParam("uid") String uid, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView goodsDetailPage2(@RequestParam("uid") String uid, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView community(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView guidlineAirplain(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView guidlinePay(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView guidelinePointcoupone(HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public ModelAndView guidelineReservation(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView goodsPage2(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView paymentPage(HttpServletRequest request, HttpServletResponse response, CartVO cart,
			GoodsVO goods) throws Exception;

	public ModelAndView popup(@RequestParam("goodsId") int goodsId, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView pointCoupon(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public ModelAndView boardManage(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView wishList(HttpServletRequest request, HttpServletResponse response) throws Exception;

	// 1:1문의
	public String qnaForm() throws Exception;

	public ModelAndView addNewQna(csVO cs, HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView getQnaList(HttpServletRequest request, HttpServletResponse response, ModelAndView mav, csVO cs)
			throws Exception;

	public ModelAndView detailQna(HttpServletRequest request, HttpServletResponse response, ModelAndView mav, csVO cs)
			throws Exception;

	public ModelAndView qnaComment(HttpServletRequest request, HttpServletResponse response, Model model, csVO cs,
			MemberVO member) throws Exception;

	public ModelAndView addComment(HttpServletRequest request, HttpServletResponse response, csVO cs, Model model)
			throws Exception;

	// FAQ
	public ModelAndView faqList(HttpServletRequest request, HttpServletResponse response, ModelAndView mav, faqVO faq)
			throws Exception;

	// 공지사항
	public ModelAndView noticeList(HttpServletRequest request, HttpServletResponse response, Model model,
			noticeVO notice, Criteria cri) throws Exception;

	public ModelAndView noticeView(HttpServletRequest request, HttpServletResponse response, ModelAndView mav,
			noticeVO notice) throws Exception;

	public ModelAndView communityList1(HttpServletRequest request, HttpServletResponse response, Criteria cri)
			throws Exception;

	public ModelAndView communityList2(HttpServletRequest request, HttpServletResponse response, Criteria cri)
			throws Exception;

	public ModelAndView findArticleList(HttpServletRequest request, HttpServletResponse response, Criteria cri)
			throws Exception;

	public ModelAndView airport(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "depAirportId", required = false) String depAirportId,
			@RequestParam(value = "arrAirportId", required = false) String arrAirportId,
			@RequestParam(value = "depPlandTime", required = false) String depPlandTime,
			@RequestParam(value = "airlineId", required = false) String airlineId, Criteria cri) throws Exception;

	public ModelAndView festivalPage(HttpServletRequest request, HttpServletResponse response, Criteria cri,
			@RequestParam(value = "startDate", required = false) String startDate,
			@RequestParam(value = "areaCode", required = false) String areaCode) throws Exception;

	// qna 수정
	public String qnaModifyView(int csNO, Model model, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public String qnaModify(csVO cs, HttpServletRequest request, HttpServletResponse response) throws Exception;

	// qna 삭제
	public ResponseEntity removeQna(@RequestParam("csNO") int csNO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	// event
	public String eventView(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public String eventwin(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public String eventDetail(HttpServletRequest request, HttpServletResponse response) throws Exception;

	// 사업자 본인 상품 리뷰 가져오기
	public ModelAndView businessReviewList(HttpServletRequest request, HttpServletResponse response, Criteria cri)
			throws Exception;

	public ModelAndView personalInfoPage(HttpServletRequest request, HttpServletResponse response) throws Exception;
}