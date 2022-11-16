package com.springboot.order.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.springboot.common.vo.Criteria;
import com.springboot.goods.vo.GoodsVO;
import com.springboot.goods.vo.TouristVO;
import com.springboot.member.vo.MemberVO;
import com.springboot.mypage.vo.CartVO;
import com.springboot.order.vo.OrderGoodsVO;
import com.springboot.order.vo.OrderPageGoodsVO;
import com.springboot.order.vo.OrderRefundVO;
import com.springboot.order.vo.OrdercartVO;

@Mapper
@Repository("orderDAO")
public interface OrderDAO {

	/* 주문 상품 정보 불러옴(주문 페이지 이동시) */
	public OrderPageGoodsVO getGoodsInfo(int goodsId);

	/* 주문 상품 정보 불러옴(주문하기 눌렀을때) */
	public OrderGoodsVO getOrderInfo(int goodsId);

	/* 주문 DB에 등록 */
	public int enrollOrder(OrdercartVO ocv);

	/* 주문 상품들 DB 등록 */
	public int enrollOrderGoods(OrderGoodsVO ogd);

	/* 주문 재고 차감 */
	public int deductStock(GoodsVO goodsvo);

	/* 주문상품 카트에서 제거 */
	public int deleteOrderCart(CartVO cartvo);

	public int deductPoint(MemberVO member);

	/* pointhis테이블에 포인트 변동 이력 추가 */
	public int insertPointhis1(OrdercartVO ocv);

	// 관리자용 회원 포인트 마이너스 변동 이력 추가(일괄 주문취소시)
	public int insertPointhis2(OrdercartVO ocv);

	// 관리자용 회원 포인트 마이너스 변동 이력 갱신(건별 주문취소시)
	public int insertPointhis3(OrdercartVO ocv2);

	public int insertuserPoint(@Param("userPoint") int userPoint, @Param("ordersNO") int ordersNO);

	/* 주문결과페이지에 주문정보 가져다주기 임시 */
	public OrdercartVO getOrderResultInfo(int ordersNO);

	/* 회원이 주문조회시 주문정보를 가져다주기 */
	public List selectUserOrderList(String uid) throws DataAccessException;

	/* 회원이 주문조회시 주문상품정보를 가져다주기 */
	public List selectUserOrdergoodsList(Criteria cri) throws DataAccessException;

	// 회원의 주문조회에서 주문 상품 목록 총 개수
	public int totalOrderGoodsList(Criteria cri);

	/* 회원이 특정 주문조회시 주문정보를 가져다주기 */
	public List FindUserOrderList(@Param("uid") String uid, @Param("search") String search) throws DataAccessException;

	/* 회원이 특정 주문조회시 주문상품정보를 가져다주기 */
	public List FindUserOrdergoodsList(@Param("uid") String uid, @Param("search") String search)
			throws DataAccessException;

	/* 비회원 주문 조회페이지에 주문정보 가져다주기 */
	public List selectOrderList(int ordersNO) throws DataAccessException;

	/* 비회원 주문 조회페이지에 주문상품정보 가져다주기 */
	public List selectOrdergoodsList(int ordersNO) throws DataAccessException;

	/* 일괄 주문 취소 요청 */
	public int orderCancle1(int ordersNO);

	/* 일괄 주문 취소 요청 */
	public int orderCancle2(int ordersNO);

	/* 건별 주문 취소 요청 */
	public int orderCancle3(OrderRefundVO orf);

	/* 주문 상품 정보 가져오기(주문취소 관련) */
	public List<OrderGoodsVO> getOrderGoodsInfo(int ordersNO);

	public OrderGoodsVO getOrderGoodsInfo2(OrderRefundVO orf);

	/* 주문 정보(주문취소 관련) */
	public OrdercartVO getOrder(int ordersNO);

	// 사업자의 상품 중 주문 목록이 있는 상품만 가져오기
	public List selectsbUserToOrder(String buid) throws DataAccessException;

	public List<OrderGoodsVO> totalSales(String buid);

	public List<OrderGoodsVO> goodsSales(String buid);

	// 사업자의 상품을 주문한 예약자의 정보
	public TouristVO selectOrderToTouristInfo(int orderNo);

	/*
	 * 주문 상품 리스트 검색 조건(현 페이지, 검색 키워드 등)에 맞는 쿼리가 생산되어야 하기 때문에 조건이 될 데이터로서 Criteria를
	 * 파라미터로 부여함.
	 */
	// public List<OrdercartVO> getOrderList(Criteria cri);

	/* 주문 총 갯수 */
	// public int getOrderTotal(Criteria cri);

}
