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
	
	/* ?????? ?????? */
	@Override
	public List<OrderPageGoodsVO> getGoodsInfo(List<OrderPageGoodsVO> orders) {

		List<OrderPageGoodsVO> result = new ArrayList<OrderPageGoodsVO>();

		for (OrderPageGoodsVO orv : orders) {

			OrderPageGoodsVO goodsInfo = orderDAO.getGoodsInfo(orv.getGoodsId());

			//

			// ?????? * ?????? ??? ??????????????? ????????? ??????

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

	// ?????????
	@Override
	public void order(OrdercartVO ocv) {
		System.out.println("????????? ????????? ?????????");

//????????????
		if (ocv.getUid() != "") {

			/* ????????? ????????????????????? */
			/* ?????? ?????? */
			MemberVO member = memberDAO.getMemberInfo(ocv.getUid());

			/* ?????? ?????? */
			List<OrderGoodsVO> logv = new ArrayList<>();
			for (OrderGoodsVO ogv : ocv.getOrders()) {
				// ?????? ????????? ???????????? ???????????? orderDAO??? getOrderInfo???????????? ogv.getGoodsId()??? ?????????goodsId
				// ??????????????? ????????? ordergoodsVO??? ??????
				OrderGoodsVO orderGoods = orderDAO.getOrderInfo(ogv.getGoodsId());

				orderGoods.setOrdersNO(ocv.getOrdersNO());

				// ?????? ?????? ??????
				orderGoods.setGoodsQty(ogv.getGoodsQty());
				// ??????*?????? ????????? ??????????????? ????????? ??????
				orderGoods.initSaleTotal();

				// ?????? ?????? ?????? ??????
				orderGoods.setCartcheckin(ogv.getCartcheckin());

				orderGoods.setCartcheckout(ogv.getCartcheckout());

				orderGoods.setNumOfTourist(ogv.getNumOfTourist());

				// List??? ?????? ??????
				logv.add(orderGoods);
			}
			/* OrdercartVO??? ?????? */
			ocv.setOrders(logv);

			/*
			 * ????????? ocv.getFinalTotalPrice(); ocv.getUsePoint(); ocv.getSavePoint();
			 */

			/* DB ??????,????????????, ???????????? ?????? */

			/* orderSeqNum????????? ??? OrdercartVO?????? orderSeqNum??? ?????? */
			Date date = new Date();

			System.out.println(date);

			SimpleDateFormat format = new SimpleDateFormat("_yyyyMMddmm");
			String orderSeqNum = member.getUid() + format.format(date);
			ocv.setOrderSeqNum(orderSeqNum);

			/*
			 * ordersNO??? ?????? ????????? int ordersNO = (int)(Math.random()*10000000);
			 * ocv.setOrdersNO(ordersNO);
			 * 
			 * System.out.println("???????????? ?????? ??????:" + ordersNO);
			 */

			/* db??? ?????? */
			orderDAO.enrollOrder(ocv); // orders???????????? ??????

			System.out.println("?????? ???????????? db ????????????");

			for (OrderGoodsVO ogv : ocv.getOrders()) {

				ogv.setOrdersNO(ocv.getOrdersNO());

				orderDAO.enrollOrderGoods(ogv);

				System.out.println("db ordergoods ???????????? ???????????????");

			}

			/* ?????? ????????? ?????? ?????? */

			/* ?????? ?????? & ?????? ???(money) Member?????? ?????? */

			/* ????????? ??????, ????????? ?????? & ?????? ?????????(point) Member?????? ?????? */
			int calPoint = member.getUserPoint();
			calPoint = calPoint - ocv.getUsePoint() + ocv.getSavePoint(); // ?????? ????????? - ?????? ????????? + ?????? ?????????
			member.setUserPoint(calPoint);

			/* ?????? ???, ????????? DB ?????? */
			orderDAO.deductPoint(member);

			/* pointhis???????????? ??????????????? ?????? */
			orderDAO.insertPointhis1(ocv);

			orderDAO.insertuserPoint(member.getUserPoint(), ocv.getOrdersNO());
			System.out.println("db pointhis ???????????? ??????");

			/* ?????? ?????? ?????? for????????? ????????? ?????? ??????id??? ?????? ????????? ????????? ??????????????? ?????? */
			for (OrderGoodsVO ogv : ocv.getOrders()) {// ?????? ?????? ??????
				/* ?????? ?????? ??? ????????? */
				GoodsVO goods = goodsDAO.getGoodsInfo(ogv.getGoodsId());
				goods.setGoodsCount(goods.getGoodsCount() - ogv.getGoodsQty());
				/* ?????? ??? DB ?????? */
				orderDAO.deductStock(goods);

				System.out.println("db ordergoods ???????????????");

			}

			/* ??????????????? ??? ????????? ???????????? ?????? */
			for (OrderGoodsVO ogv : ocv.getOrders()) {// ?????? ?????? ??????
				CartVO cart = new CartVO();

				// ??????vo??? ?????? ????????? uid??? goodsId??? ????????? ??? cart??? ??????
				cart.setUid(ocv.getUid());
				cart.setGoodsId(ogv.getGoodsId());

				orderDAO.deleteOrderCart(cart);
				System.out.println("?????????????????? ????????? ?????? ?????????");
			}

//???????????????			
		} else {

			/* ????????? ????????????????????? */

			/* ?????? ?????? */
			List<OrderGoodsVO> logv = new ArrayList<>();
			for (OrderGoodsVO ogv : ocv.getOrders()) {
				// ?????? ????????? ???????????? ???????????? orderDAO??? getOrderInfo???????????? ogv.getGoodsId()??? ?????????goodsId
				// ??????????????? ????????? ordergoodsVO??? ??????
				OrderGoodsVO orderGoods = orderDAO.getOrderInfo(ogv.getGoodsId());
				// ?????? ?????? ??????
				orderGoods.setGoodsQty(ogv.getGoodsQty());
				// ??????*?????? ????????? ??????????????? ????????? ??????
				orderGoods.initSaleTotal();

				// ?????? ?????? ?????? ??????
				orderGoods.setCartcheckin(ogv.getCartcheckin());
				orderGoods.setCartcheckout(ogv.getCartcheckout());
				orderGoods.setOrdersNO(ocv.getOrdersNO());

				// List??? ?????? ??????
				logv.add(orderGoods);
			}
			/* OrdercartVO??? ?????? */
			ocv.setOrders(logv);

			/* DB ??????,????????????, ???????????? ?????? */

			/* ordersNO ,orderSeqNum????????? ??? OrdercartVO?????? orderSeqNum??? ?????? */
			Date date = new Date();

			System.out.println(date);

			SimpleDateFormat format = new SimpleDateFormat("_yyyyMMddhh");
			String orderSeqNum = "non-user" + format.format(date);
			ocv.setOrderSeqNum(orderSeqNum);

			// ????????? ????????? ????????? ??????
			int savePoint = 0;
			ocv.setSavePoint(savePoint);
			String uid = null;
			ocv.setUid(uid);

			/* db??? ?????? */
			orderDAO.enrollOrder(ocv); // orders???????????? ??????

			System.out.println("?????? ???????????? db ????????????");

			for (OrderGoodsVO ogv : ocv.getOrders()) {
				// ordergoods ???????????? ??????

				ogv.setOrdersNO(ocv.getOrdersNO());

				orderDAO.enrollOrderGoods(ogv);

			}

			/* ?????? ?????? ?????? for????????? ????????? ?????? ??????id??? ?????? ????????? ????????? ??????????????? ?????? */
			for (OrderGoodsVO ogv : ocv.getOrders()) {// ?????? ?????? ??????
				/* ?????? ?????? ??? ????????? */
				GoodsVO goods = goodsDAO.getGoodsInfo(ogv.getGoodsId());
				goods.setGoodsCount(goods.getGoodsCount() - ogv.getGoodsQty());
				/* ?????? ??? DB ?????? */
				orderDAO.deductStock(goods);
			}

			/* ???????????? ???????????? ????????? ????????? ???????????? ????????? ????????? */

		}
	}

	@Override
	public OrdercartVO getOrderResultInfo(int ordersNO) {

		return orderDAO.getOrderResultInfo(ordersNO);

	}

	// ??????????????? ???????????? ?????????
	@Override
	public void sendOrderSms(OrdercartVO ocv) throws Exception {
		String api_key = "NCS7CQYVKCXNQCFF";
		String api_secret = "7DRLVUBML3B2MICQ6ICJERW5JGSFBZVY";
		Message coolsms = new Message(api_key, api_secret);
		String ordererName = ocv.getOrdererName();
		String ordererPhoneNumber = ocv.getOrdererPhoneNumber();
		int ordersNO = ocv.getOrdersNO();
		int finalTotalPrice = ocv.getFinalTotalPrice();

		System.out.println(" ?????? ?????? ?????? ?????? ????????? ?????????");

		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", ordererPhoneNumber); // ??????????????????
		params.put("from", "01048899570"); // ??????????????????. ?????????????????? ??????,?????? ?????? ?????? ????????? ?????? ???
		params.put("type", "SMS");
		params.put("text", "[?????????]" + "[" + ordererName + "]" + "??? ?????? ??????" + "[" + ordersNO + "]"
				+ "??? ????????? ???????????????????????????. ?????? ??????" + "[" + finalTotalPrice + "]" + "???"); // ?????? ?????? ??????
		params.put("app_version", "test app 1.2"); // application name and version

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}

	}

	// ????????? ?????????????????? ????????? ????????? ??????????????? ?????????
	@Override
	public List orderList(int ordersNO) throws DataAccessException {
		List orderList = null;
		orderList = orderDAO.selectOrderList(ordersNO);

		return orderList;
	}

	// ????????? ??????????????? ???????????? ?????????
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

	// ????????? ?????? ????????? ???????????? ???????????? ?????????
	@Override
	public List ordergoodsList(int ordersNO) throws DataAccessException {
		List ordergoodsList = null;
		ordergoodsList = orderDAO.selectOrdergoodsList(ordersNO);
		return ordergoodsList;
	}

	/* ?????? ???????????? ?????? ????????? */
	@Override
	@Transactional
	public int orderCancel1(OrderRefundVO orf) {

		int result = 0;
		// uid??? ????????? ?????????
		if (orf.getUid() != "") {

			/* ??????, ???????????? ?????? */

			/* ???????????? ????????? */
			MemberVO member = memberDAO.getMemberInfo(orf.getUid());

			/* ?????? ???????????? VO??? ?????? */
			OrdercartVO ocv = orderDAO.getOrder(orf.getOrdersNO());

			/* ???????????????, ???????????????, ?????? ?????? if????????? ????????? ?????? ???????????? ?????? */

			int calPoint = member.getUserPoint();
			// ?????? ????????? ?????? ?????????
			int savePoint = ocv.getSavePoint();

			// ?????? ????????? ????????? ???????????? ?????? ??? ??? ????????? alert ?????? ????????? ????????????
			if (calPoint < savePoint) {
				result = 1;

				// ?????? ????????? ????????? ???????????? ????????? ??? ?????????
			} else {

				/* ????????? ??????????????? ?????????????????? ???????????? ????????? 0?????? ?????? */
				orderDAO.orderCancle1(orf.getOrdersNO());

				orderDAO.orderCancle2(orf.getOrdersNO());

				result = 0;
			}

			// ?????????????????? ??????(getUid == "") ???????????? ????????? ???????????? ??????????????? ????????? ?????? ????????? ????????? ??????
		} else {

			/* ????????? ?????? ?????? ??????????????? ???????????? ????????? 0?????? ?????? */
			orderDAO.orderCancle1(orf.getOrdersNO());

			orderDAO.orderCancle2(orf.getOrdersNO());

			result = 0;

		} // ??????????????? else ???
			// ????????? ???????????? ???????????? result=1?????? ????????? ??????
		return result;

	}

	/* ?????? ???????????? ?????? */
	@Override
	@Transactional
	public int orderCancel2(OrderRefundVO orf) {

		int result = 0;

		OrdercartVO ocv = orderDAO.getOrder(orf.getOrdersNO());

		List<OrderGoodsVO> orvs = orderDAO.getOrderGoodsInfo(orf.getOrdersNO());

		orf.setUid(ocv.getUid());

		// ?????????????????? ????????? ?????? ???????????? ??????????????? ??????

		// ???????????????
		if (orf.getUid() != "") {

			/* ??????, ???????????? ?????? */

			/* ???????????? ????????? */
			MemberVO member = memberDAO.getMemberInfo(orf.getUid());

			/* ???????????????, ???????????????, ?????? ?????? if????????? ????????? ?????? ???????????? ?????? */

			int finalTotalPrice = ocv.getFinalTotalPrice();

			int usePoint = ocv.getUsePoint();

			int unfinalTotalPrice = finalTotalPrice + usePoint;

			System.out.println("????????????: " + unfinalTotalPrice);

			int totalPrice = orvs.get(0).getTotalPrice();

			System.out.println("?????? ?????? ??????: " + totalPrice);

			double pointcal = (totalPrice * 1.0) / (unfinalTotalPrice * 1.0);

			System.out.println("?????? ?????? ????????? ??????????????? ?????????: " + pointcal);

			int goodsPoint = (int) Math.round(usePoint * pointcal);

			System.out.println("?????? ?????? ?????????: " + goodsPoint);

			int calPoint = member.getUserPoint();

			// ?????? ????????? ?????? ?????????

			int savePoint = ocv.getSavePoint();

			// ?????? ????????? ??????????????? ????????? ?????? ????????? ????????? ??????

			// ?????? ????????? ????????? ???????????? ?????? ??? ??? ????????? alert ?????? ????????? ????????????
			if (calPoint < goodsPoint) {

				result = 1;

				// ?????? ????????? ????????? ???????????? ????????? ??? ?????????
			} else {

				int listsize = orvs.size();

				System.out.println(listsize);

				// 1????????? 1??????????????? ????????? ?????? ????????????
				if (listsize == 1) {

					/* ????????? ??????????????? ?????????????????? ???????????? ????????? 0?????? ?????? */
					orderDAO.orderCancle1(orf.getOrdersNO());
					orderDAO.orderCancle3(orf);

				} else {

					orderDAO.orderCancle3(orf);

				}
				result = 0;

			}

			// ?????????????????? ??????(getUid == "") ???????????? ????????? ???????????? ??????????????? ????????? ?????? ????????? ????????? ??????
		} else {

			int listsize = orvs.size();

			System.out.println(listsize);

			// 1????????? 1??????????????? ????????? ?????? ????????????
			if (listsize == 1) {

				/* ????????? ??????????????? ?????????????????? ???????????? ????????? 0?????? ?????? */
				orderDAO.orderCancle1(orf.getOrdersNO());
				orderDAO.orderCancle3(orf);

			} else {

				orderDAO.orderCancle3(orf);

			}
			result = 0;

		} // ??????????????? else ???
			// ????????? ???????????? ???????????? result=1?????? ????????? ??????
		return result;

	}

	// ????????? ?????? ??????
	public Map orderCheck(String buid) throws Exception {
		Map orderInfoListsMap = new HashMap<>();

		List<OrderGoodsVO> orderInfo = orderDAO.selectsbUserToOrder(buid); // ???????????? goods ???????????? ????????? ?????????
		List<TouristVO> touristInfo = new ArrayList<>();

		for (OrderGoodsVO orderVo : orderInfo) {
			int orderNo = orderVo.getOrdersNO();
			touristInfo.add(orderDAO.selectOrderToTouristInfo(orderNo));
		}

		orderInfoListsMap.put("orderInfo", orderInfo);
		orderInfoListsMap.put("touristInfo", touristInfo);

		return orderInfoListsMap;
	}

	// ????????? ?????? ??????
	public Map bSalesStatus(String buid) throws Exception {
		Map<String, Object> resultMap = new HashMap();

		List<OrderGoodsVO> totalSalesList = orderDAO.totalSales(buid);
		List<OrderGoodsVO> goodsSalesList = orderDAO.goodsSales(buid);
		Date nowDate = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("MM");

		List<Integer> totalData = null;
		for (OrderGoodsVO vo : totalSalesList) {
			String sMon = sdf.format(vo.getCreDate());
			int mon = Integer.parseInt(sMon); // vo??? ???????????? ???

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

			if (!resultMap.containsKey(goodsId)) { // map??? ?????? ????????? true
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

			} else { // ????????? goodsId??? ???????????? ?????? ????????????
				goodsData = (List<Integer>) resultMap.get(goodsId);
				for (int i = mon; i <= mon; i++) {
					goodsData.set(i - 1, vo.getTotalPrice());
				}
				resultMap.put(goodsId, goodsData); // ????????? key ??? ????????? ?????????
			}
		}

		Map<Integer, String> goodsName = new HashMap();
		for (int i = 0; i < goodsSalesList.size(); i++) {
			goodsName.put(goodsSalesList.get(i).getGoodsId(), goodsSalesList.get(i).getGoodsName());
		}

		resultMap.put("goodsName", goodsName);
		return resultMap;
	}

	// ????????? ??????????????? ?????? ?????? ????????????
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

	// ?????? ???????????? ?????? ?????? ?????? ??? ?????? ????????????
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
			// Top?????? ????????? response ?????? ????????? ???????????? ??????
			JSONObject parse_response = (JSONObject) obj.get("response");
			// response ??? ?????? body ??????
			long amountL = (long)parse_response.get("amount");
			int amount = Long.valueOf(amountL).intValue();
			rd.close();
			conn.disconnect();
			
	    return amount;
	}
}
