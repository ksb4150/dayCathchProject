package com.springboot.order.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.springboot.common.vo.Criteria;
import com.springboot.goods.dao.GoodsDAO;
import com.springboot.goods.vo.GoodsVO;
import com.springboot.goods.vo.TouristVO;
import com.springboot.member.dao.MemberDAO;
import com.springboot.member.vo.MemberVO;
import com.springboot.mypage.dao.CartDAO;
import com.springboot.mypage.vo.CartVO;
import com.springboot.order.dao.OrderDAO;
import com.springboot.order.vo.OrderGoodsVO;
import com.springboot.order.vo.OrderPageGoodsVO;
import com.springboot.order.vo.OrderRefundVO;
import com.springboot.order.vo.OrdercartVO;

import lombok.Getter;
import lombok.ToString;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class OrderServiceImpl implements OrderService {
	@Autowired
	OrderDAO orderDAO;
	@Autowired
	MemberDAO memberDAO;
	@Autowired
	CartDAO cartDAO;
	@Autowired
	GoodsDAO goodsDAO;
	
	@Value("${imp_key}")
	private String impKey;
	@Value("${imp_secret}")
	private String impSecret;
	
	@ToString
	@Getter
	private class Response {
		private PaymentInfo response;

	}
	
	@ToString
	@Getter
	private class PaymentInfo {
		private int amount;
	}
	
	/* 주문 정보 */
	@Override
	public List<OrderPageGoodsVO> getGoodsInfo(List<OrderPageGoodsVO> orders) {

		List<OrderPageGoodsVO> result = new ArrayList<OrderPageGoodsVO>();

		for (OrderPageGoodsVO orv : orders) {

			OrderPageGoodsVO goodsInfo = orderDAO.getGoodsInfo(orv.getGoodsId());

			//

			// 가격 * 수량 값 만들어주는 메서드 호출

			goodsInfo.setCartcheckin(orv.getCartcheckin());

			goodsInfo.setCartcheckout(orv.getCartcheckout());

			goodsInfo.setGoodsQty(orv.getGoodsQty());

			goodsInfo.setNumOfTourist(orv.getNumOfTourist());

			goodsInfo.setGoodsPrice(orv.getGoodsPrice());

			goodsInfo.initSaleTotal();

			result.add(goodsInfo);
		}

		return result;

	}

	// 주문시
	@Override
	public void order(OrdercartVO ocv) {
		System.out.println("주문시 서비스 들어옴");

//회원일때
		if (ocv.getUid() != "") {

			/* 사용할 데이터가져오기 */
			/* 회원 정보 */
			MemberVO member = memberDAO.getMemberInfo(ocv.getUid());

			/* 주문 정보 */
			List<OrderGoodsVO> logv = new ArrayList<>();
			for (OrderGoodsVO ogv : ocv.getOrders()) {
				// 주문 상품의 정보들을 불러오는 orderDAO의 getOrderInfo매서드를 ogv.getGoodsId()로 가져온goodsId
				// 매개변수로 실행해 ordergoodsVO에 넣음
				OrderGoodsVO orderGoods = orderDAO.getOrderInfo(ogv.getGoodsId());

				orderGoods.setOrdersNO(ocv.getOrdersNO());

				// 주문 수량 셋팅
				orderGoods.setGoodsQty(ogv.getGoodsQty());
				// 가격*수량 구하고 세팅해주는 메서드 호출
				orderGoods.initSaleTotal();

				// 여행 날짜 다시 세팅
				orderGoods.setCartcheckin(ogv.getCartcheckin());

				orderGoods.setCartcheckout(ogv.getCartcheckout());

				orderGoods.setNumOfTourist(ogv.getNumOfTourist());

				// List에 객체 추가
				logv.add(orderGoods);
			}
			/* OrdercartVO에 셋팅 */
			ocv.setOrders(logv);

			/*
			 * 테스트 ocv.getFinalTotalPrice(); ocv.getUsePoint(); ocv.getSavePoint();
			 */

			/* DB 주문,주문상품, 기타정보 넣기 */

			/* orderSeqNum만들기 및 OrdercartVO객체 orderSeqNum에 저장 */
			Date date = new Date();

			System.out.println(date);

			SimpleDateFormat format = new SimpleDateFormat("_yyyyMMddmm");
			String orderSeqNum = member.getUid() + format.format(date);
			ocv.setOrderSeqNum(orderSeqNum);

			/*
			 * ordersNO에 난수 넣어줌 int ordersNO = (int)(Math.random()*10000000);
			 * ocv.setOrdersNO(ordersNO);
			 * 
			 * System.out.println("주문번호 생성 확인:" + ordersNO);
			 */

			/* db에 넣기 */
			orderDAO.enrollOrder(ocv); // orders테이블에 등록

			System.out.println("주문 테이블에 db 들어갔음");

			for (OrderGoodsVO ogv : ocv.getOrders()) {

				ogv.setOrdersNO(ocv.getOrdersNO());

				orderDAO.enrollOrderGoods(ogv);

				System.out.println("db ordergoods 테이블에 잘들어갔음");

			}

			/* 비용 포인트 변동 적용 */

			/* 비용 차감 & 변동 돈(money) Member객체 적용 */

			/* 포인트 차감, 포인트 증가 & 변동 포인트(point) Member객체 적용 */
			int calPoint = member.getUserPoint();
			calPoint = calPoint - ocv.getUsePoint() + ocv.getSavePoint(); // 기존 포인트 - 사용 포인트 + 획득 포인트
			member.setUserPoint(calPoint);

			/* 변동 돈, 포인트 DB 적용 */
			orderDAO.deductPoint(member);

			/* pointhis테이블에 포인트이력 추가 */
			orderDAO.insertPointhis1(ocv);

			orderDAO.insertuserPoint(member.getUserPoint(), ocv.getOrdersNO());
			System.out.println("db pointhis 업데이트 완료");

			/* 재고 변동 적용 for문으로 배열에 있는 상품id를 통해 정보를 불러와 주문수량을 변경 */
			for (OrderGoodsVO ogv : ocv.getOrders()) {// 주문 배열 호출
				/* 변동 재고 값 구하기 */
				GoodsVO goods = goodsDAO.getGoodsInfo(ogv.getGoodsId());
				goods.setGoodsCount(goods.getGoodsCount() - ogv.getGoodsQty());
				/* 변동 값 DB 적용 */
				orderDAO.deductStock(goods);

				System.out.println("db ordergoods 재고갱신함");

			}

			/* 주문했을때 그 항목을 장바구니 크트 */
			for (OrderGoodsVO ogv : ocv.getOrders()) {// 주문 배열 호출
				CartVO cart = new CartVO();

				// 주문vo에 있는 주문자 uid와 goodsId를 불러와 새 cart에 세팅
				cart.setUid(ocv.getUid());
				cart.setGoodsId(ogv.getGoodsId());

				orderDAO.deleteOrderCart(cart);
				System.out.println("장바구니에서 결제한 항목 삭제함");
			}

//비회원일때			
		} else {

			/* 사용할 데이터가져오기 */

			/* 주문 정보 */
			List<OrderGoodsVO> logv = new ArrayList<>();
			for (OrderGoodsVO ogv : ocv.getOrders()) {
				// 주문 상품의 정보들을 불러오는 orderDAO의 getOrderInfo매서드를 ogv.getGoodsId()로 가져온goodsId
				// 매개변수로 실행해 ordergoodsVO에 넣음
				OrderGoodsVO orderGoods = orderDAO.getOrderInfo(ogv.getGoodsId());
				// 주문 수량 셋팅
				orderGoods.setGoodsQty(ogv.getGoodsQty());
				// 가격*수량 구하고 세팅해주는 메서드 호출
				orderGoods.initSaleTotal();

				// 여행 날짜 다시 세팅
				orderGoods.setCartcheckin(ogv.getCartcheckin());
				orderGoods.setCartcheckout(ogv.getCartcheckout());
				orderGoods.setOrdersNO(ocv.getOrdersNO());

				// List에 객체 추가
				logv.add(orderGoods);
			}
			/* OrdercartVO에 셋팅 */
			ocv.setOrders(logv);

			/* DB 주문,주문상품, 기타정보 넣기 */

			/* ordersNO ,orderSeqNum만들기 및 OrdercartVO객체 orderSeqNum에 저장 */
			Date date = new Date();

			System.out.println(date);

			SimpleDateFormat format = new SimpleDateFormat("_yyyyMMddhh");
			String orderSeqNum = "non-user" + format.format(date);
			ocv.setOrderSeqNum(orderSeqNum);

			// 비회원 주문시 필요한 세팅
			int savePoint = 0;
			ocv.setSavePoint(savePoint);
			String uid = null;
			ocv.setUid(uid);

			/* db에 넣기 */
			orderDAO.enrollOrder(ocv); // orders테이블에 등록

			System.out.println("주문 테이블에 db 들어갔음");

			for (OrderGoodsVO ogv : ocv.getOrders()) {
				// ordergoods 테이블에 등록

				ogv.setOrdersNO(ocv.getOrdersNO());

				orderDAO.enrollOrderGoods(ogv);

			}

			/* 재고 변동 적용 for문으로 배열에 있는 상품id를 통해 정보를 불러와 주문수량을 변경 */
			for (OrderGoodsVO ogv : ocv.getOrders()) {// 주문 배열 호출
				/* 변동 재고 값 구하기 */
				GoodsVO goods = goodsDAO.getGoodsInfo(ogv.getGoodsId());
				goods.setGoodsCount(goods.getGoodsCount() - ogv.getGoodsQty());
				/* 변동 값 DB 적용 */
				orderDAO.deductStock(goods);
			}

			/* 비회원은 쿠키시간 끝나면 알아서 장바구니 목록이 사라짐 */

		}
	}

	@Override
	public OrdercartVO getOrderResultInfo(int ordersNO) {

		return orderDAO.getOrderResultInfo(ordersNO);

	}

	// 휴대폰번호 인증문자 보내기
	@Override
	public void sendOrderSms(OrdercartVO ocv) throws Exception {
		String api_key = "NCS7CQYVKCXNQCFF";
		String api_secret = "7DRLVUBML3B2MICQ6ICJERW5JGSFBZVY";
		Message coolsms = new Message(api_key, api_secret);
		String ordererName = ocv.getOrdererName();
		String ordererPhoneNumber = ocv.getOrdererPhoneNumber();
		int ordersNO = ocv.getOrdersNO();
		int finalTotalPrice = ocv.getFinalTotalPrice();

		System.out.println(" 주문 결과 문자 보낼 정보들 세팅중");

		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", ordererPhoneNumber); // 수신전화번호
		params.put("from", "01048899570"); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
		params.put("type", "SMS");
		params.put("text", "[날잡아]" + "[" + ordererName + "]" + "님 주문 번호" + "[" + ordersNO + "]"
				+ "의 결제가 완료되었습니다람쥐. 결제 금액" + "[" + finalTotalPrice + "]" + "원"); // 문자 내용 입력
		params.put("app_version", "test app 1.2"); // application name and version

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}

	}

	// 결제후 주문결과창에 필요한 정보를 가져다주는 서비스
	@Override
	public List orderList(int ordersNO) throws DataAccessException {
		List orderList = null;
		orderList = orderDAO.selectOrderList(ordersNO);

		return orderList;
	}

	// 회원이 주문조회시 호출되는 서비스
	@Override
	public List userOrderList(String uid) throws DataAccessException {
		List orderList = null;
		orderList = orderDAO.selectUserOrderList(uid);
		return orderList;
	}

	@Override
	public List userordergoodsList(Criteria cri) throws DataAccessException {
		List ordergoodsList = null;
		ordergoodsList = orderDAO.selectUserOrdergoodsList(cri);
		return ordergoodsList;
	}

	// 비회원 주문 조회시 상품정보 불러오는 서비스
	@Override
	public List ordergoodsList(int ordersNO) throws DataAccessException {
		List ordergoodsList = null;
		ordergoodsList = orderDAO.selectOrdergoodsList(ordersNO);
		return ordergoodsList;
	}

	/* 일괄 주문취소 요청 서비스 */
	@Override
	@Transactional
	public int orderCancel1(OrderRefundVO orf) {

		int result = 0;
		// uid를 가지고 있을때
		if (orf.getUid() != "") {

			/* 주문, 주문상품 객체 */

			/* 회원정보 가져옴 */
			MemberVO member = memberDAO.getMemberInfo(orf.getUid());

			/* 해당 주문정보 VO에 세팅 */
			OrdercartVO ocv = orderDAO.getOrder(orf.getOrdersNO());

			/* 사용포인트, 쌓인포인트, 재고 반환 if문으로 포인트 있나 없나부터 검증 */

			int calPoint = member.getUserPoint();
			// 해당 주문시 쌓인 포인트
			int savePoint = ocv.getSavePoint();

			// 해당 주문에 사용한 포인트를 반환 할 수 없으면 alert 값만 가지고 되돌아감
			if (calPoint < savePoint) {
				result = 1;

				// 해당 주문시 사용한 포인트를 반환할 수 있을때
			} else {

				/* 다되면 주문상태를 취소대기으로 변경하고 결과값 0으로 세팅 */
				orderDAO.orderCancle1(orf.getOrdersNO());

				orderDAO.orderCancle2(orf.getOrdersNO());

				result = 0;
			}

			// 비회원일때의 로직(getUid == "") 비회원은 구매시 포인트가 쌓이지않기 때문에 환원 과정을 거치지 않음
		} else {

			/* 다되면 주문 상태 취소대기로 변경하고 결과값 0으로 세팅 */
			orderDAO.orderCancle1(orf.getOrdersNO());

			orderDAO.orderCancle2(orf.getOrdersNO());

			result = 0;

		} // 비회원일때 else 끝
			// 반환할 포인트가 모자라면 result=1값을 가지고 리턴
		return result;

	}

	/* 건별 주문취소 요청 */
	@Override
	@Transactional
	public int orderCancel2(OrderRefundVO orf) {

		int result = 0;

		OrdercartVO ocv = orderDAO.getOrder(orf.getOrdersNO());

		List<OrderGoodsVO> orvs = orderDAO.getOrderGoodsInfo(orf.getOrdersNO());

		orf.setUid(ocv.getUid());

		// 주문테이블의 정보를 통해 회원인지 비회원인지 판별

		// 회원일경우
		if (orf.getUid() != "") {

			/* 주문, 주문상품 객체 */

			/* 회원정보 가져옴 */
			MemberVO member = memberDAO.getMemberInfo(orf.getUid());

			/* 사용포인트, 쌓인포인트, 재고 반환 if문으로 포인트 있나 없나부터 검증 */

			int finalTotalPrice = ocv.getFinalTotalPrice();

			int usePoint = ocv.getUsePoint();

			int unfinalTotalPrice = finalTotalPrice + usePoint;

			System.out.println("주문총액: " + unfinalTotalPrice);

			int totalPrice = orvs.get(0).getTotalPrice();

			System.out.println("개별 상품 총액: " + totalPrice);

			double pointcal = (totalPrice * 1.0) / (unfinalTotalPrice * 1.0);

			System.out.println("해당 취소 상품의 사용포인트 점유율: " + pointcal);

			int goodsPoint = (int) Math.round(usePoint * pointcal);

			System.out.println("개별 상품 포인트: " + goodsPoint);

			int calPoint = member.getUserPoint();

			// 해당 주문시 쌓인 포인트

			int savePoint = ocv.getSavePoint();

			// 건별 상품의 환불반환에 필요한 건별 포인트 구하는 로직

			// 해당 주문에 사용한 포인트를 반환 할 수 없으면 alert 값만 가지고 되돌아감
			if (calPoint < goodsPoint) {

				result = 1;

				// 해당 주문시 사용한 포인트를 반환할 수 있을때
			} else {

				int listsize = orvs.size();

				System.out.println(listsize);

				// 1주문에 1상품인경우 상품을 건별 취소할때
				if (listsize == 1) {

					/* 다되면 주문상태를 취소대기으로 변경하고 결과값 0으로 세팅 */
					orderDAO.orderCancle1(orf.getOrdersNO());
					orderDAO.orderCancle3(orf);

				} else {

					orderDAO.orderCancle3(orf);

				}
				result = 0;

			}

			// 비회원일때의 로직(getUid == "") 비회원은 구매시 포인트가 쌓이지않기 때문에 환원 과정을 거치지 않음
		} else {

			int listsize = orvs.size();

			System.out.println(listsize);

			// 1주문에 1상품인경우 상품을 건별 취소할때
			if (listsize == 1) {

				/* 다되면 주문상태를 취소대기으로 변경하고 결과값 0으로 세팅 */
				orderDAO.orderCancle1(orf.getOrdersNO());
				orderDAO.orderCancle3(orf);

			} else {

				orderDAO.orderCancle3(orf);

			}
			result = 0;

		} // 비회원일때 else 끝
			// 반환할 포인트가 모자라면 result=1값을 가지고 리턴
		return result;

	}

	// 사업자 예약 현황
	public Map orderCheck(String buid) throws Exception {
		Map orderInfoListsMap = new HashMap<>();

		List<OrderGoodsVO> orderInfo = orderDAO.selectsbUserToOrder(buid); // 사업자의 goods 상품들의 정보를 가져옴
		List<TouristVO> touristInfo = new ArrayList<>();

		for (OrderGoodsVO orderVo : orderInfo) {
			int orderNo = orderVo.getOrdersNO();
			touristInfo.add(orderDAO.selectOrderToTouristInfo(orderNo));
		}

		orderInfoListsMap.put("orderInfo", orderInfo);
		orderInfoListsMap.put("touristInfo", touristInfo);

		return orderInfoListsMap;
	}

	// 사업자 매출 현황
	public Map bSalesStatus(String buid) throws Exception {
		Map<String, Object> resultMap = new HashMap();

		List<OrderGoodsVO> totalSalesList = orderDAO.totalSales(buid);
		List<OrderGoodsVO> goodsSalesList = orderDAO.goodsSales(buid);
		Date nowDate = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("MM");

		List<Integer> totalData = null;
		for (OrderGoodsVO vo : totalSalesList) {
			String sMon = sdf.format(vo.getCreDate());
			int mon = Integer.parseInt(sMon); // vo에 들어있는 월

			if (!resultMap.containsKey("total")) {
				totalData = new ArrayList<>();
				for (byte i = 1; i <= 12; i++) {
					if (mon > i) {
						if (totalData.size() < i) {
							totalData.add(0);
						} else if (totalData.get(i - 1) <= 0) {
							totalData.set(i - 1, 0);
						}
					} else if (mon == i) {
						totalData.add(vo.getTotalPrice());
					} else {
						totalData.add(0);
					}
				}
				resultMap.put("total", totalData);
			} else {
				totalData = (List<Integer>) resultMap.get("total");
				for (int i = mon; i <= mon; i++) {
					totalData.set(i - 1, vo.getTotalPrice());
				}
				resultMap.put("total", totalData);
			}
		}

		List<Integer> goodsData = null;
		for (OrderGoodsVO vo : goodsSalesList) {
			String goodsId = String.valueOf(vo.getGoodsId());
			String sMon = sdf.format(vo.getCreDate());
			int mon = Integer.parseInt(sMon);

			if (!resultMap.containsKey(goodsId)) { // map에 키가 있으면 true
				goodsData = new ArrayList<>();
				for (byte i = 1; i <= 12; i++) {
					if (mon > i) {
						if (goodsData.size() < i) {
							goodsData.add(0);
						} else if (goodsData.get(i - 1) <= 0) {
							goodsData.set(i - 1, 0);
						}
					} else if (mon == i) {
						goodsData.add(vo.getTotalPrice());
					} else {
						goodsData.add(0);
					}
				}
				resultMap.put(goodsId, goodsData);

			} else { // 있으면 goodsId가 일치하는 배열 가져오기
				goodsData = (List<Integer>) resultMap.get(goodsId);
				for (int i = mon; i <= mon; i++) {
					goodsData.set(i - 1, vo.getTotalPrice());
				}
				resultMap.put(goodsId, goodsData); // 동일한 key 값 있으면 대체됨
			}
		}

		Map<Integer, String> goodsName = new HashMap();
		for (int i = 0; i < goodsSalesList.size(); i++) {
			goodsName.put(goodsSalesList.get(i).getGoodsId(), goodsSalesList.get(i).getGoodsName());
		}

		resultMap.put("goodsName", goodsName);
		return resultMap;
	}

	// 회원의 주문목록중 특정 주문 검색하기
	@Override
	public List FindUserOrderList(String uid, String search) throws DataAccessException {
		List orderList = null;
		orderList = orderDAO.FindUserOrderList(uid, search);
		return orderList;
	}

	@Override
	public List FindUserOrdergoodsList(String uid, String search) throws DataAccessException {
		List ordergoodsList = null;
		ordergoodsList = orderDAO.FindUserOrdergoodsList(uid, search);
		return ordergoodsList;
	}

	// 회원 주문조회 주문 상품 목록 총 개수 가져오기
	@Override
	public int totalOrderGoodsList(Criteria cri) throws Exception {
		return orderDAO.totalOrderGoodsList(cri);

	}
	
	public String getAccessToken() throws Exception {	
		HttpsURLConnection conn = null;
		 
		URL url = new URL("https://api.iamport.kr/users/getToken");
			conn = (HttpsURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-type", "application/json");
			conn.setRequestProperty("Accept", "application/json");
			conn.setDoOutput(true);
			JsonObject json = new JsonObject();
			
			json.addProperty("imp_key", impKey);
			json.addProperty("imp_secret", impSecret);
			
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			
			bw.write(json.toString());
			bw.flush();
			bw.close();
 
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
 
			Gson gson = new Gson();
 
			String response = gson.fromJson(br.readLine(), Map.class).get("response").toString();
			
			System.out.println(response);
 
			String token = gson.fromJson(response, Map.class).get("access_token").toString();
 
			br.close();
			conn.disconnect();
 
			return token;
	}
	
	public int paymentInfo(String imp_uid, String accessToken) throws Exception {
		HttpsURLConnection conn = null;
		 
	    URL url = new URL("https://api.iamport.kr/payments/" + imp_uid);
	 
		    conn = (HttpsURLConnection) url.openConnection();
		 
		    conn.setRequestMethod("GET");
		    conn.setRequestProperty("Authorization", accessToken);
		    conn.setDoOutput(true);
		 
		    BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
		    String line = "";
		    String result = "";
		    
		    while ((line = rd.readLine()) != null) {
				result = result.concat(line);
			}
		    
		    JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject) parser.parse(result);
			// Top레벨 단계인 response 키를 가지고 데이터를 파싱
			JSONObject parse_response = (JSONObject) obj.get("response");
			// response 로 부터 body 파싱
			long amountL = (long)parse_response.get("amount");
			int amount = Long.valueOf(amountL).intValue();
			rd.close();
			conn.disconnect();
			
	    return amount;
	}
}
