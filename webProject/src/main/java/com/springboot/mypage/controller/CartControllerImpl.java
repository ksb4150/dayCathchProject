package com.springboot.mypage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.springboot.goods.vo.GoodsVO;
import com.springboot.goods.vo.LodgingDetailVO;
import com.springboot.member.vo.MemberVO;
import com.springboot.mypage.service.CartService;
import com.springboot.mypage.vo.CartVO;

@Controller("cartController")
public class CartControllerImpl implements CartController {

	@Autowired
	private CartService cartService;

	@RequestMapping(value = "/mypage/listCart.do", method = RequestMethod.GET)
	public String listCart(HttpSession session, HttpServletRequest request, HttpServletResponse response, CartVO cartVO,
			Model model) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		// 일단 쿠키 조회함
		Cookie cookie = WebUtils.getCookie(request, "cartCookie");
		// 비회원 장바구니 조회시
		if (cookie != null && session.getAttribute("member") == null) {
			System.out.println("비회원컨트롤러통과");
			String cartCookie = cookie.getValue();
			cartVO.setCartckid(cartCookie);

			List cartList = cartService.listCart2(cartVO);
			System.out.println("비회원용listCart2(cartVO) 다녀옴");
			model.addAttribute("cartList", cartList);
			// model.addAttribute("cart", (List) cartService.listCart2(cartVO)); 위아래에 있는거
			// 잠깐뺌 cookie != null &&, cookie == null &&
		} else if (session.getAttribute("member") != null) {
			// 회원 장바구니 조회시
			System.out.println("회원컨트롤러통과");
			MemberVO memberVO = (MemberVO) session.getAttribute("member");
			cartVO.setUid(memberVO.getUid());
			List cartList = cartService.listCart1(cartVO);

			/*
			 * List goodsList = pageService.viewLodgingDetail(uid);
			 * 
			 * Map cartInfoMap = new HashMap();
			 * 
			 * cartInfoMap.put("cartList", cartList); cartInfoMap.put("goodsList",
			 * goodsList); model.addAttribute("cartInfoMap", cartInfoMap);
			 */

			System.out.println("회원용listCart1(cartVO) 다녀옴");

			model.addAttribute("cartList", cartList);

		}
		return "/mypage/listCart";
	}

	// 장바구니 추가
	/*
	 * @Override
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "/mypage/addCart.do", method = RequestMethod.POST)
	 * public ModelAndView addCart(HttpSession session, HttpServletRequest request,
	 * HttpServletResponse response, CartVO cartVO) throws Exception {
	 * 
	 * Cookie cookie = WebUtils.getCookie(request, "cartCookie");
	 * 
	 * //비회원이 처음 장바구니에 넣었을때 쿠키 생성
	 * 
	 * if (cookie == null && session.getAttribute("member") == null) { String ckid =
	 * RandomStringUtils.random(6, true, true); Cookie cartCookie = new
	 * Cookie("cartCookie", ckid); cartCookie.setPath("/"); cartCookie.setMaxAge(60
	 * * 60 * 24 * 1); response.addCookie(cartCookie);
	 * System.out.println("비회원쿠키난수: " + ckid); cartVO.setCartckid(ckid);
	 * 
	 * cartService.addCart(cartVO); System.out.println("비회원 장바구니 매서드 실행"); // 비회원
	 * 장바구니 쿠키생성후 상품추가
	 * 
	 * }else if (cookie != null && session.getAttribute("member") == null) { String
	 * ckValue = cookie.getValue(); cartVO.setCartckid(ckValue); //쿠키 유지시간 리셋
	 * cookie.setPath("/"); cookie.setMaxAge(60 * 60 * 24 * 1);
	 * System.out.println("비회원이 장바구니에 또 담았을시 쿠키시간 갱신"); response.addCookie(cookie);
	 * cartService.addCart(cartVO);
	 * 
	 * } //회원이 장바구니에 물건 넣었을때 else if(session.getAttribute("member") != null ) {
	 * MemberVO memberVO = (MemberVO) session.getAttribute("member");
	 * cartVO.setUid(memberVO.getUid()); cartService.addCart(cartVO);
	 * System.out.println("회원 장바구니 매서드 실행"); } ModelAndView mav = new
	 * ModelAndView("redirect:/mypage/listCart.do"); return mav; }
	 */

	@Override
	@ResponseBody
	@RequestMapping(value = "/mypage/addCart.do", method = RequestMethod.POST)
	public ModelAndView addCart(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			CartVO cartVO) throws Exception {

		Cookie cookie = WebUtils.getCookie(request, "cartCookie");

		// 비회원이 처음 장바구니에 넣었을때 쿠키 생성

		if (cookie == null && session.getAttribute("member") == null) {
			String ckid = RandomStringUtils.random(6, true, true);
			Cookie cartCookie = new Cookie("cartCookie", ckid);
			cartCookie.setPath("/");
			cartCookie.setMaxAge(60 * 60 * 24 * 1);
			response.addCookie(cartCookie);
			System.out.println("비회원쿠키난수: " + ckid);
			cartVO.setCartckid(ckid);

			cartService.addCart(cartVO);
			System.out.println("비회원 장바구니 매서드 실행");
			// 비회원 장바구니 쿠키생성후 상품추가

		} else if (cookie != null && session.getAttribute("member") == null) {
			String ckValue = cookie.getValue();
			cartVO.setCartckid(ckValue);
			// 쿠키 유지시간 리셋
			cookie.setPath("/");
			cookie.setMaxAge(60 * 60 * 24 * 1);
			System.out.println("비회원이 장바구니에 또 담았을시 쿠키시간 갱신");
			response.addCookie(cookie);
			cartService.addCart(cartVO);

		}
		// 회원이 장바구니에 물건 넣었을때
		else if (session.getAttribute("member") != null) {
			MemberVO memberVO = (MemberVO) session.getAttribute("member");
			cartVO.setUid(memberVO.getUid());
			cartService.addCart(cartVO);
			System.out.println("회원 장바구니 매서드 실행");

		}
		String buid = cartVO.getBuid();

		cartVO.getBuid();

		ModelAndView mav = new ModelAndView("redirect:/page/goodsDetailPage.do?uid=" + buid);
		return mav;
	}

	/*
	 * GET방식 장바구니 삭제
	 * 
	 * @Override
	 * 
	 * @RequestMapping(value = "/mypage/removeCart.do", method = RequestMethod.GET)
	 * public ModelAndView removeCart(@RequestParam("cartId") int cartId,
	 * HttpServletRequest request, HttpServletResponse response) throws Exception {
	 * request.setCharacterEncoding("utf-8"); cartService.removeCart(cartId);
	 * ModelAndView mav = new ModelAndView("redirect:/mypage/listCart.do"); return
	 * mav; }
	 * 
	 */

	/* POST방식 장바구니 삭제 */
	/*
	 * @PostMapping("/mypage/deleteCart") public String deleteCart(CartVO cartVO)
	 * throws Exception {
	 * 
	 * cartService.deleteCart(cartVO.getCartId());
	 * 
	 * 
	 * return "/mypage/listCart";
	 * 
	 * }
	 */

	@PostMapping("/mypage/deleteCart")
	public ModelAndView deleteCart(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			CartVO cartVO) throws Exception {

		cartService.deleteCart(cartVO.getCartId());
		System.out.println("장바구니 물품 삭제 완료");

		ModelAndView mav = new ModelAndView("redirect:/mypage/listCart.do");
		return mav;
	}

	/*
	 * post방식 장바구니 수량 수정
	 * 
	 * @PostMapping("/mypage/updateQty") public String updateQty(CartVO cartVO)
	 * throws Exception {
	 * 
	 * cartService.modifyQty(cartVO);
	 * 
	 * return "/mypage/listCart";
	 * 
	 * }
	 */

	@PostMapping("/mypage/updateQty")
	public ModelAndView updateQty(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			CartVO cartVO) throws Exception {

		cartService.modifyQty(cartVO);

		System.out.println("장바구니 물품 수량 변경 완료");

		ModelAndView mav = new ModelAndView("redirect:/mypage/listCart.do");
		return mav;

	}

	/*
	 * @Override
	 * 
	 * @RequestMapping(value = "/mypage/modifyCartQty", method = RequestMethod.GET)
	 * public ModelAndView modifyCartQty(@RequestParam("cartId") int
	 * cartId, @RequestParam("goodsQty") int goodsQty, HttpServletRequest request,
	 * HttpServletResponse response) throws Exception {
	 * request.setCharacterEncoding("utf-8"); cartService.modifyCartQty(cartId,
	 * goodsQty); ModelAndView mav = new
	 * ModelAndView("redirect:/mypage/listCart.do"); return mav;
	 * 
	 * }
	 */
	/*
	 * @Override
	 * 
	 * @RequestMapping(value = "/mypage/paymentPage.do", method = {
	 * RequestMethod.GET, RequestMethod.POST }) public ModelAndView
	 * paymentPage(HttpServletRequest request, HttpServletResponse response, CartVO
	 * cart , OrderVO order, GoodsVO goods, LodgingDetailVO detail) throws Exception
	 * { request.setCharacterEncoding("utf-8"); HttpSession session =
	 * request.getSession(); String viewName = (String)
	 * request.getAttribute("viewName"); MemberVO memberVO = (MemberVO)
	 * session.getAttribute("member");
	 * 
	 * Map<String, Object> paymentMap = new HashMap<String, Object>();
	 * paymentMap.put("memberVO", memberVO); paymentMap.put("goods", goods);
	 * paymentMap.put("detail", detail); paymentMap.put("order", order);
	 * paymentMap.put("cart", cart);
	 * 
	 * ModelAndView mav = new ModelAndView(viewName); mav.addObject("paymentMap",
	 * paymentMap);
	 * 
	 * System.out.println(viewName);
	 * 
	 * return mav; }
	 */

	@Override
	@RequestMapping(value = "/mypage/paymentPage.do", method = { RequestMethod.POST })
	public ModelAndView paymentPage(HttpServletRequest request, HttpServletResponse response, CartVO cartVO)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String viewName = (String) request.getAttribute("viewName");
		MemberVO memberVO = (MemberVO) session.getAttribute("member");

		int goodsId = cartVO.getGoodsId();

		LodgingDetailVO detail = cartService.paymentinfo1(goodsId);
		GoodsVO goods = cartService.paymentinfo2(goodsId);

		Map<String, Object> paymentMap = new HashMap<String, Object>();
		paymentMap.put("member", memberVO);
		paymentMap.put("cart", cartVO);
		paymentMap.put("detail", detail);
		paymentMap.put("goods", goods);

		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("paymentMap", paymentMap);

		System.out.println(viewName);

		return mav;
	}

}