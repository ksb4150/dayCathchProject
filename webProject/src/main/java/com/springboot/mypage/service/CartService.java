package com.springboot.mypage.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.springboot.goods.vo.GoodsVO;
import com.springboot.goods.vo.LodgingDetailVO;
import com.springboot.mypage.vo.CartVO;

public interface CartService {

	
	public int addCart(CartVO cartVO) throws DataAccessException;
	
	//회원일때
	public List listCart1(CartVO cartVO) throws DataAccessException;
	
	//비회원일때
	public List listCart2(CartVO cartVO) throws DataAccessException;
	
	public int deleteCart(int cartId) throws DataAccessException ;
	
	/* 카트 수량 수정 */
	public int modifyQty(CartVO cartVO) throws DataAccessException;
	
	/* 결제창 전용 정보 받아오기 */
	public LodgingDetailVO paymentinfo1(int goodsId) throws DataAccessException;
	
	public GoodsVO paymentinfo2(int goodsId) throws DataAccessException;
	//public int removeCart(int cartId) throws DataAccessException;
	
	//public int modifyCartQty(int cartId, int goodsQty) throws DataAccessException;
	
}
