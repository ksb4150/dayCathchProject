package com.springboot.order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.springboot.common.vo.Criteria;
import com.springboot.common.vo.pageVO;
import com.springboot.goods.service.GoodsService;
import com.springboot.goods.vo.TouristVO;
import com.springboot.member.service.MemberService;
import com.springboot.member.vo.MemberVO;
import com.springboot.order.service.OrderService;
import com.springboot.order.vo.OrderPageVO;
import com.springboot.order.vo.OrderRefundVO;
import com.springboot.order.vo.OrdercartVO;

@Controller("orderController")
public class OrderControllerImpl implements OrderController {

	@Autowired
	private OrderService orderService;

	@Autowired
	private MemberService memberService;

	@Autowired
	private GoodsService goodsService;

	// 주문페이지 이동 컨트롤러
	@RequestMapping(value = "/mypage/order", method = RequestMethod.POST)
	public ModelAndView orderPage(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			OrderPageVO opv, ModelAndView mav) throws Exception {

		System.out.println("order컨트롤러 들렀음");

		if (session.getAttribute("member") != null) {

			// 회원정보 담아옴
			MemberVO memberVO = (MemberVO) session.getAttribute("member");
			String uid = memberVO.getUid();

			System.out.println("회원 주문페이지 이동 uid:" + uid);

			mav.addObject("orderList", orderService.getGoodsInfo(opv.getOrders()));
			// MemberVO mem = memberService.getMemberInfo(uid);
			mav.addObject("memberInfo", memberService.getMemberInfo(uid));

			mav.setViewName("/mypage/order");
			return mav;

		} else {

			System.out.println("비회원 주문페이지로 이동");

			mav.addObject("orderList", orderService.getGoodsInfo(opv.getOrders()));

			mav.setViewName("/mypage/order");
			return mav;
		}
	}

	// 회원 비회원 통합 결제 비회원은 포인트가 안쌓임
	@PostMapping("/mypage/payment")
	public ModelAndView order(OrdercartVO ocv, TouristVO tourist, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		System.out.println(ocv);

		// 여기서 주문db등록, 포인트 사용, 포인트 적립, 재고 갱신, 장바구니삭제 등 여러 메서드를 수행함
		orderService.order(ocv);

		tourist.setOrdersNO(ocv.getOrdersNO());

		int ordersNO = ocv.getOrdersNO();

		int result1 = 0;

		// 일행 정보 등록
		result1 = goodsService.addTouristInfo(tourist);

		orderService.sendOrderSms(ocv);
		System.out.println("문자 보내고 왔음 -> 사실 안보내짐");

		System.out.println("주문db등록, 포인트 사용, 포인트 적립, 재고 갱신, 장바구니삭제 수행하고 왔음");

		// 주문 정보 가져와서 담아보내기
		ModelAndView mav = new ModelAndView();

		mav.addObject("orderResult", orderService.getOrderResultInfo(ordersNO));

		mav.setViewName("/page/orderResult");

		return mav;
	}

	// 회원이나 비회원이 주문 조회시 처음 실행되는 컨트롤러
	@RequestMapping(value = "/mypage/ordersNocheck", method = RequestMethod.GET)
	public ModelAndView orderscheck(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			Criteria cri) throws Exception {

		ModelAndView mav = new ModelAndView();

		HashMap<String, Object> ordersInfoMap = new HashMap<String, Object>();

		// 비회원이 주문조회 클릭시 주문번호 입력폼페이지로 이동후 주문번호 입력시 주문조회창으로 보내줌
		if (session.getAttribute("member") == null) {
			System.out.println("비회원컨트롤러통과");

			mav.setViewName("/mypage/ordersNocheck");

		} else if (session.getAttribute("member") != null) {
			// 회원 주문 조회시 데이터 담아서 주문조회창으로 보내줌
			System.out.println("회원 주문조회 컨트롤러 통과");
			MemberVO memberVO = (MemberVO) session.getAttribute("member");
			String uid = memberVO.getUid();
			cri.setUid(uid);

			List orderList = orderService.userOrderList(uid);

			List ordergoodsList = orderService.userordergoodsList(cri);

			int total = orderService.totalOrderGoodsList(cri);

			pageVO pm = new pageVO(cri, total);

			ordersInfoMap.put("orderList", orderList);
			ordersInfoMap.put("ordergoodsList", ordergoodsList);
			ordersInfoMap.put("pm", pm);

			mav.addObject("ordersInfoMap", ordersInfoMap);
			mav.setViewName("/mypage/orderList");

		}
		return mav;
	}

	// 비회원이 주문번호 입력폼에 주문번호 입력하고 조회했을때 위에 컨트롤러로 다시 보내서 주문조회창으로 다시 보내주는 컨트롤러
	@Override
	@ResponseBody
	@RequestMapping(value = "/mypage/orderList.do", method = RequestMethod.POST)
	public ModelAndView nonuserorderList(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			int ordersNO) throws Exception {

		ModelAndView mav = new ModelAndView();
		Map ordersInfoMap = new HashMap();
		System.out.println("비회원 주문조회 컨트롤러");

		List orderList = orderService.orderList(ordersNO);
		System.out.println("비회원 주문정보 담았음");
		List ordergoodsList = orderService.ordergoodsList(ordersNO);
		System.out.println("비회원 주문상품정보 담았음");
		ordersInfoMap.put("orderList", orderList);
		ordersInfoMap.put("ordergoodsList", ordergoodsList);
		mav.addObject("ordersInfoMap", ordersInfoMap);
		mav.setViewName("/mypage/orderList");

		return mav;
	}

	/* 일괄 주문 삭제 요청 */
	@Override
	@RequestMapping(value = "/mypage/orderRefund1", method = RequestMethod.POST)
	public ResponseEntity orderRefund1(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			OrderRefundVO orf) throws Exception {

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		// 환불시 반환할 포인트 부족 여부 판단에 사용될 값 1이면 포인트부족으로 주문취소실패

		int result = 0;

		result = orderService.orderCancel1(orf);

		if (result == 1) {
			message = "<script>";
			message += "alert('주문 취소 요청 실패: 반환될 포인트가 부족합니다.');";
			message += "location.href='" + request.getContextPath() + "/mypage/ordersNocheck';";
			message += "</script>";
			// refundresult = "mypage/ordersNocheck";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} else {
			message = "<script>";
			message += "alert('주문 취소 요청 완료');";
			message += "location.href='" + request.getContextPath() + "/mypage/ordersNocheck';";
			message += "</script>";
			// refundresult = "mypage/ordersNocheck";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		}

		return resEnt;
	}

	/* 건별 주문삭제 요청 */
	@Override
	@RequestMapping(value = "/mypage/orderRefund2", method = RequestMethod.POST)
	public ResponseEntity orderRefund2(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			OrderRefundVO orf) throws Exception {

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		// 환불시 반환할 포인트 부족 여부 판단에 사용될 값 1이면 포인트부족으로 주문취소실패

		int result = 0;

		result = orderService.orderCancel2(orf);

		if (result == 1) {
			message = "<script>";
			message += "alert('주문 취소 요청 실패: 반환될 포인트가 부족합니다.');";
			message += "location.href='" + request.getContextPath() + "/mypage/ordersNocheck';";
			message += "</script>";
			// refundresult = "mypage/ordersNocheck";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} else {
			message = "<script>";
			message += "alert('주문 취소 요청 완료');";
			message += "location.href='" + request.getContextPath() + "/mypage/ordersNocheck';";
			message += "</script>";
			// refundresult = "mypage/ordersNocheck";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		}

		return resEnt;
	}

	@RequestMapping(value = "/order/bOrderCheck.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView businessOrderCheck(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(viewName);

		HttpSession session = request.getSession();
		MemberVO bUserInfo = (MemberVO) session.getAttribute("member");
		String buid = bUserInfo.getUid();

		Map orderCheckInfo = orderService.orderCheck(buid);

		mav.addObject("orderCheckInfo", orderCheckInfo);
		return mav;
	} // end

	// 사업자 매출현황 페이지로 이동
	@Override
	@RequestMapping(value = "/order/bSalesStatusPage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView bSalesStatusPage(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}

	// 사업자 매출현황 정보 가져옴
	@Override
	@ResponseBody
	@RequestMapping(value = "/order/bSalesStatus.do", method = { RequestMethod.GET, RequestMethod.POST })
	public Map bSalesStatus(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		HashMap resEnt = null;
		String buid = null;

		try {
			MemberVO memberVO = (MemberVO) session.getAttribute("member");
			buid = memberVO.getUid();

		} catch (Exception e) {
			resEnt = new HashMap<String, String>();
			resEnt.put("re", "loginPlese");
			return resEnt;
		}

		try {
			Map resultMap = orderService.bSalesStatus(buid);

			if (!resultMap.containsKey("total")) {
				resEnt = new HashMap<String, String>();
				resEnt.put("re", "notSales");
				return resEnt;
			}
			return resultMap;

		} catch (Exception e) {
			resEnt = new HashMap<String, String>();
			resEnt.put("re", "notSales");
			return resEnt;
		}
	}

	// 검색어로 회원의 주문목록중 특정 주문들 조회
	@Override
	@RequestMapping(value = "/order/FindOrdersList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView FindOrdersList(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			String search) throws Exception {
		ModelAndView mav = new ModelAndView();

		HashMap<String, Object> ordersInfoMap = new HashMap<String, Object>();

		MemberVO memberVO = (MemberVO) session.getAttribute("member");

		String uid = memberVO.getUid();

		List orderList = orderService.FindUserOrderList(uid, search);

		List ordergoodsList = orderService.FindUserOrdergoodsList(uid, search);

		ordersInfoMap.put("orderList", orderList);
		ordersInfoMap.put("ordergoodsList", ordergoodsList);
		mav.addObject("ordersInfoMap", ordersInfoMap);

		mav.setViewName("/mypage/orderList");
		return mav;
	}
	
	@RequestMapping(value = "/order/confirmPay.do", method = {RequestMethod.POST })
	@ResponseBody
	public String confirmPay(@RequestParam("impNum") String impNum) throws Exception {
		JsonObject jsonObject = new JsonObject();
		
		String accessToken = orderService.getAccessToken();
		
		System.out.println("accesToken : " + accessToken);
		
		int payment = orderService.paymentInfo(impNum, accessToken); //결제 완료된 금액
			jsonObject.addProperty("verifyAmount", payment);
		
		return jsonObject.toString();
	}
}
