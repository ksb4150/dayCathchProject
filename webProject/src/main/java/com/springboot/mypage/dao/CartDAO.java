package com.springboot.mypage.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.springboot.goods.vo.GoodsVO;
import com.springboot.goods.vo.LodgingDetailVO;
import com.springboot.mypage.vo.CartVO;

@Mapper
@Repository("cartDAO")
public interface CartDAO {

public int insertCart(CartVO cartVO) throws DataAccessException;

//회원 장바구니 추가
public List selectAllCartList1(CartVO cartVO) throws DataAccessException;

//비회원 장바구니 추가
public List selectAllCartList2(CartVO cartVO) throws DataAccessException;

public int deleteCart(int cartId) throws DataAccessException;

//수량 변경
public int modifyQty(CartVO cartVO) throws DataAccessException;

public LodgingDetailVO selectpaymentinfo1(int goodsId) throws DataAccessException;

public GoodsVO selectpaymentinfo2(int goodsId) throws DataAccessException;

}
