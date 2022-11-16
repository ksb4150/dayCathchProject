package com.springboot.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.springboot.goods.vo.GoodsVO;
import com.springboot.goods.vo.LodgingDetailVO;
import com.springboot.mypage.dao.CartDAO;
import com.springboot.mypage.vo.CartVO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class CartServiceImpl implements CartService {
	@Autowired
	CartDAO cartDAO;
	
	@Override
	public int addCart(CartVO cartVO) throws DataAccessException {
		return cartDAO.insertCart(cartVO);
	}
	
	@Override
	public List listCart1(CartVO cartVO) throws DataAccessException {
		List cartList = null;
		cartList = cartDAO.selectAllCartList1(cartVO);
		
		return cartList;
	}
	
	@Override
	public List listCart2(CartVO cartVO) throws DataAccessException {
		List cartList = null;
		cartList = cartDAO.selectAllCartList2(cartVO);
			
		return cartList;
	}
	
	/*	
	@Override
	public int removeCart(int cartId) throws DataAccessException {
		return cartDAO.deleteCart(cartId);
	}
	*/
	@Override
	public int deleteCart(int cartId) throws DataAccessException {
		return cartDAO.deleteCart(cartId);
	}
	
	
	@Override
	public int modifyQty(CartVO cartVO) {
		return cartDAO.modifyQty(cartVO);
	}
	
	
	/*
	@Override
	public int modifyCartQty(int cartId, int goodsQty) throws DataAccessException {
		return cartDAO.modifyCart(cartId, goodsQty);
	}
	*/
	@Override
	public LodgingDetailVO paymentinfo1(int goodsId) throws DataAccessException {
		LodgingDetailVO detail = null;
		detail = cartDAO.selectpaymentinfo1(goodsId);
		return detail;
	}
	
	@Override
	public GoodsVO paymentinfo2(int goodsId) throws DataAccessException {
		GoodsVO goods = null;
		
		goods = cartDAO.selectpaymentinfo2(goodsId);
		return goods;
	}
	
	
	
	
	
}
