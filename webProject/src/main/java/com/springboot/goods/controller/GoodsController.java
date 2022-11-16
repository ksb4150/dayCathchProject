package com.springboot.goods.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.goods.vo.GoodreviewVO;
import com.springboot.goods.vo.GoodsVO;
import com.springboot.goods.vo.LodgingDetailVO;

public interface GoodsController {
	public ModelAndView goodsWrite(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ResponseEntity goodsWrite1(GoodsVO goods, LodgingDetailVO lodging,
			MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;

	public ResponseEntity goodsWrite2(GoodsVO goods, LodgingDetailVO ticket,
			MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;

	public ModelAndView goodsWrite1(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView goodsWrite2(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ResponseEntity addReview(@RequestParam("goodsId") int goodsId, @RequestParam("buid") String buid,
			GoodreviewVO goodreview, HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView goodsList(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ResponseEntity goodsdelete(@RequestParam("goodsId") int goodsId, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView goodsModify(@RequestParam("goodsId") int goodsId, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

//	public ModelAndView modGoods(@RequestParam("goodsImageFileName") String goodsImageFileName, GoodsVO goods,
//			LodgingDetailVO lodging, MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
//			throws Exception;

	public ResponseEntity modGoods(GoodsVO goods, LodgingDetailVO lodging, MultipartHttpServletRequest multipartRequest,
			HttpServletResponse response) throws Exception;

	//상품 찜
	public int heart(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
