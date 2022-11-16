package com.springboot.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.goods.vo.GoodsVO;
import com.springboot.goods.vo.LodgingDetailVO;
import com.springboot.goods.vo.OrderVO;
import com.springboot.mypage.vo.CartVO;

public interface CartController {

	
	public String listCart(HttpSession session, HttpServletRequest request, HttpServletResponse response, CartVO cartVO, Model model)
			throws Exception;
	
	public ModelAndView addCart(HttpSession session, HttpServletRequest request, HttpServletResponse response, CartVO cartVO) throws Exception;
	
	public ModelAndView deleteCart(HttpSession session, HttpServletRequest request, HttpServletResponse response, CartVO cartVO) 
			throws Exception;
	
	public ModelAndView updateQty(HttpSession session, HttpServletRequest request, HttpServletResponse response, CartVO cartVO)
			throws Exception;
	
	/*
	public String updateQty(CartVO cartVO) throws Exception;
	*/
	
	
	/*
	public ModelAndView modifyCartQty(@RequestParam("cartId") int cartId, @RequestParam("goodsQty") int goodsQty,  HttpServletRequest request, HttpServletResponse response)
			throws Exception;
	*/
	
	public ModelAndView paymentPage(HttpServletRequest request, HttpServletResponse response, 
			CartVO cart) throws Exception;
	
}
