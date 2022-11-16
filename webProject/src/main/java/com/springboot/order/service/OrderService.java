package com.springboot.order.service;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.dao.DataAccessException;

import com.springboot.common.vo.Criteria;
import com.springboot.order.vo.OrderPageGoodsVO;
import com.springboot.order.vo.OrderRefundVO;
import com.springboot.order.vo.OrdercartVO;

public interface OrderService {

	/* 주문 정보 */
	public List<OrderPageGoodsVO> getGoodsInfo(List<OrderPageGoodsVO> orders);
	
	//주문시
	public void order(OrdercartVO ocv);
		
	//주문결과페이지에 같이 보내줄 데이터를 가져옴
	public OrdercartVO getOrderResultInfo(int ordersNO);
	
	public void sendOrderSms(OrdercartVO ocv) throws Exception;
	
	
	public List userOrderList(String uid) throws DataAccessException;
	
	public List userordergoodsList(Criteria cri) throws DataAccessException;
	
	public List orderList(int ordersNO) throws DataAccessException;
	
	public List ordergoodsList(int ordersNO) throws DataAccessException;
	
	public Map<String, Object> orderCheck(String buid) throws Exception;

	public Map bSalesStatus(String buid) throws Exception;
	
	/* 주문 취소 요청들 */
	
	/* 일괄 주문취소 요청 */
	public int orderCancel1(OrderRefundVO orf);
	/* 건별 주문취소 요청*/
	public int orderCancel2(OrderRefundVO orf);
	
	//회원의 주문목록중 특정 주문 검색하기 
	public List FindUserOrderList(String uid, String search) throws DataAccessException;
	
	public List FindUserOrdergoodsList(String uid, String search) throws DataAccessException;
	
	//회원 주문조회 주문 상품 목록 총 개수 가져오기
	public int totalOrderGoodsList(Criteria cri) throws Exception;

	public String getAccessToken() throws Exception;

	public int paymentInfo(String imp_uid, String accessToken) throws Exception;

}
