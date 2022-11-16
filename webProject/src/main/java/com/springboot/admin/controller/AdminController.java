package com.springboot.admin.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.common.vo.Criteria;
import com.springboot.member.vo.MemberVO;
import com.springboot.order.vo.OrderRefundVO;
import com.springboot.page.vo.csVO;
import com.springboot.page.vo.faqVO;
import com.springboot.page.vo.noticeVO;

public interface AdminController {

	public ModelAndView ordersList(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			Criteria cri) throws Exception;

	public ResponseEntity orderRefund1(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			OrderRefundVO orf) throws Exception;

	public ResponseEntity orderRefund2(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			OrderRefundVO orf) throws Exception;

	public ModelAndView userList(HttpServletRequest request, HttpServletResponse response, Criteria cri)
			throws Exception;

	// 관리자 상품 목록페이지
	public ModelAndView admingoodsList(HttpServletRequest request, HttpServletResponse response, Criteria cri)
			throws Exception;

	public ModelAndView adminGoodsListSearch(HttpServletRequest request, HttpServletResponse response, String Search)
			throws Exception;

	public ResponseEntity adminGoodsAllow(HttpServletRequest request, HttpServletResponse response, int goodsId)
			throws Exception;

	public ModelAndView adminCommunityList(HttpServletRequest request, HttpServletResponse response, Criteria cri)
			throws Exception;

	public ModelAndView adminCommunityListSearch(HttpServletRequest request, HttpServletResponse response,
			String search) throws Exception;

	public ModelAndView adminReviewList(HttpServletRequest request, HttpServletResponse response, Criteria cri)
			throws Exception;

	public ModelAndView adminReviewListSearch(HttpServletRequest request, HttpServletResponse response, String search)
			throws Exception;

	// 관리자 상품 삭제
	public ResponseEntity admingoodsDelete(@RequestParam("goodsId") int goodsId, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ResponseEntity adminReviewDelete(String uid, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public ResponseEntity adminremoveArticle(@RequestParam("articleNO") int articleNO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView admingoodsList2(HttpServletRequest request, HttpServletResponse response, Criteria cri)
			throws Exception;

	// 관리자 판매 현황
	public ModelAndView bSalesStatusPage(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public Map aSalesStatus(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			String search, Criteria cri) throws Exception;

	public ModelAndView FindAdminOrdersList(HttpServletRequest request, HttpServletResponse response, String search)
			throws Exception;

	public ModelAndView buserList(HttpServletRequest request, HttpServletResponse response, Criteria cri)
			throws Exception;

	public ModelAndView findbUserList(HttpServletRequest request, HttpServletResponse response, String search)
			throws Exception;

	public ModelAndView buserAdminAllow(HttpServletRequest request, HttpServletResponse response, String uid)
			throws Exception;

	public ModelAndView buserAllowList(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView removeuser(HttpServletRequest request, HttpServletResponse response, String uid)
			throws Exception;

	public ModelAndView removeuser1(HttpServletRequest request, HttpServletResponse response, String uid)
			throws Exception;

	public ModelAndView findUserList(HttpServletRequest request, HttpServletResponse response, String search)
			throws Exception;

	// 1:1
	public ModelAndView getQnaList(HttpServletRequest request, HttpServletResponse response, Model model, csVO cs,
			Criteria cri) throws Exception;

	public ModelAndView detailQna(HttpServletRequest request, HttpServletResponse response, ModelAndView mav, csVO cs)
			throws Exception;

	public ResponseEntity removeQna(@RequestParam("csNO") int csNO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView qnaComment(HttpServletRequest request, HttpServletResponse response, Model model, csVO cs,
			MemberVO member) throws Exception;

	public ModelAndView addComment(HttpServletRequest request, HttpServletResponse response, csVO cs, Model model)
			throws Exception;

	// 공지사항
	public ModelAndView noticeList(HttpServletRequest request, HttpServletResponse response, Model model,
			noticeVO notice, Criteria cri) throws Exception;

	public ModelAndView noticeForm(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView noticeWrite(@ModelAttribute("noticeNO") noticeVO notice, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView noticeView(HttpServletRequest request, HttpServletResponse response, ModelAndView mav,
			noticeVO notice) throws Exception;

	// 공지사항 수정 기능

	public ModelAndView noticeModifyView(int noticeNO, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ResponseEntity noticeRemove(@RequestParam("noticeNO") int noticeNO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public String noticeModify(noticeVO notice, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	// FAQ
	public ModelAndView faqList(HttpServletRequest request, HttpServletResponse response, faqVO faq) throws Exception;

	public ModelAndView faqWriteForm(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView faqWrite(faqVO faq, HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView faqMod(HttpServletRequest request, HttpServletResponse response, ModelAndView mav, faqVO faq)
			throws Exception;

	public ModelAndView faqModify(@ModelAttribute("faq_no") faqVO faq, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ResponseEntity removeFaq(@RequestParam(value = "faq_no") int faq_no, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	// 회원 포인트이력 리스트
	public ModelAndView adminPointHistory(HttpServletRequest request, HttpServletResponse response, Criteria cri)
			throws Exception;

	public ModelAndView findpointHistory(HttpServletRequest request, HttpServletResponse response, String search)
			throws Exception;

	public ModelAndView adminCommentList(HttpServletRequest request, HttpServletResponse response, Criteria cri)
			throws Exception;
}
