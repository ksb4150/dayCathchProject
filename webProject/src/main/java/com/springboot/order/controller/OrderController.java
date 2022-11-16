package com.springboot.order.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.common.vo.Criteria;
import com.springboot.goods.vo.TouristVO;
import com.springboot.order.vo.OrderPageVO;
import com.springboot.order.vo.OrderRefundVO;
import com.springboot.order.vo.OrdercartVO;

public interface OrderController {

	public ModelAndView orderPage(HttpSession session, HttpServletRequest request, HttpServletResponse response, OrderPageVO opv, ModelAndView mav) 
			throws Exception;
	
	public ModelAndView order(OrdercartVO ocv, TouristVO tourist, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//public ModelAndView orderResult(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView orderscheck(HttpSession session, HttpServletRequest request, HttpServletResponse response, Criteria cri)
			throws Exception;
	
	//비회원이 주문번호 입력폼에 주문번호 입력하고 조회했을때 주문조회창으로 다시 보내주는 컨트롤러
	public ModelAndView nonuserorderList(HttpSession session, HttpServletRequest request, HttpServletResponse response, int ordersNO)
			throws Exception;
	
	public ResponseEntity orderRefund1(HttpSession session, HttpServletRequest request, HttpServletResponse response, OrderRefundVO orf) 
			throws Exception;
	
	public ResponseEntity orderRefund2(HttpSession session, HttpServletRequest request, HttpServletResponse response, OrderRefundVO orf) 
			throws Exception;

	//사업자 주문 조회
	public ModelAndView businessOrderCheck(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//사업자 판매 현황
	public ModelAndView bSalesStatusPage(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception;

	public Map bSalesStatus(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception;

	//검색어로 회원의 주문목록중 특정 주문들 조회
	public ModelAndView FindOrdersList(HttpSession session, HttpServletRequest request, HttpServletResponse response, String search) throws Exception;
}
