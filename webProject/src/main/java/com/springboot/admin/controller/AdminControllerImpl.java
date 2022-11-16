
package com.springboot.admin.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.springboot.admin.service.AdminService;
import com.springboot.board.service.BoardService;
import com.springboot.common.vo.Criteria;
import com.springboot.common.vo.pageVO;
import com.springboot.goods.service.GoodsService;
import com.springboot.member.service.MemberService;
import com.springboot.member.vo.MemberVO;
import com.springboot.order.service.OrderService;
import com.springboot.order.vo.OrderRefundVO;
import com.springboot.page.vo.csVO;
import com.springboot.page.vo.faqVO;
import com.springboot.page.vo.noticeVO;

@Controller("adminController")
public class AdminControllerImpl implements AdminController {
	private static final String GOODS_THUMBNAIL_FILE_NAME = "C:\\goods\\goods_Images\\thumbnail";
	private static final String GOODS_IMAGES_FILE_NAME = "C:\\goods\\goods_Images";
	private static final String ARTICLE_IMAGE_FILE_NAME = "C:\\board\\article_image\\";
	private static final String ARTICLE_THUMBNAIL_FILE_NAME = "C:\\board\\article_image\\thumbnail";

	@Autowired
	private AdminService adminService;
	@Autowired
	private GoodsService goodsService;
	@Autowired
	private BoardService boardService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private OrderService orderService;

	// 관리자 메인페이지

	@RequestMapping(value = "/admin/adminMain.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView adminMain(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		MemberVO member = (MemberVO) session.getAttribute("member");

		int orderCount = adminService.getOrderCount();
		int orderCancelCount = adminService.getOrderCancelCount();
		int csCount = adminService.getcsCount();
		int csAnswerCount = adminService.getcsAnswerCount();
		int boardCount = adminService.getboardCount();
		int boardcommentCount = adminService.getboardcommentCount();

		mav.addObject("member", member);
		mav.addObject("orderCount", orderCount);
		mav.addObject("orderCancelCount", orderCancelCount);
		mav.addObject("csCount", csCount);
		mav.addObject("csAnswerCount", csAnswerCount);
		mav.addObject("boardCount", boardCount);
		mav.addObject("boardcommentCount", boardcommentCount);

		mav.setViewName("/admin/adminMain");
		return mav;
	} // end

	// 관리자 페이지의 주문 조회

	@RequestMapping(value = "/admin/adminOrderList", method = RequestMethod.GET)
	public ModelAndView ordersList(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			Criteria cri) throws Exception {

		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> ordersInfoMap = new HashMap<String, Object>();

		MemberVO memberVO = (MemberVO) session.getAttribute("member");

		if (memberVO.getUserType() == 0) {
			System.out.println("관리자 주문조회 컨트롤러 통과");

			// 주문상태가 취소대기 상태인 애들 긁어오기

			List orderList = adminService.userOrderList();

			List ordergoodsList = adminService.userordergoodsList(cri);

			int total = adminService.totalAdminOrderGoodsList(cri);

			pageVO pm = new pageVO(cri, total);

			ordersInfoMap.put("orderList", orderList);
			ordersInfoMap.put("ordergoodsList", ordergoodsList);
			ordersInfoMap.put("pm", pm);

			mav.addObject("ordersInfoMap", ordersInfoMap);

			mav.setViewName("/admin/adminOrderList");

			// 관리자가 아닌데 요청을 했으면 메인페이지로 돌려보냄
		} else {
			mav.setViewName("/page/mainPage");
		}
		return mav;
	}

	/* 해당 주문번호에 속한 모든 상품 주문취소(일괄취소) */
	@Override
	@RequestMapping(value = "/admin/orderRefund1", method = RequestMethod.POST)
	public ResponseEntity orderRefund1(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			OrderRefundVO orf) throws Exception {
		JsonObject jsonObject = new JsonObject();

		String accessToken = orderService.getAccessToken();

		System.out.println("accesToken : " + accessToken);

		adminService.paymentCancle1(accessToken);

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		adminService.orderCancel1(orf);

		message = "<script>";
		message += "alert('주문 취소 완료');";
		message += "location.href='" + request.getContextPath() + "/admin/adminOrderList';";
		message += "</script>";

		resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		return resEnt;
	}

	/* 해당 주문번호에 속한 모든 상품중 한개를 주문취소시(건별취소) */
	@Override
	@RequestMapping(value = "/admin/orderRefund2", method = RequestMethod.POST)
	public ResponseEntity orderRefund2(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			OrderRefundVO orf) throws Exception {
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		adminService.orderCancel2(orf);

		message = "<script>";
		message += "alert('주문 취소 완료');";
		message += "location.href='" + request.getContextPath() + "/admin/adminOrderList';";
		message += "</script>";

		resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		return resEnt;
	}

	@Override
	@RequestMapping(value = "/admin/userList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView userList(HttpServletRequest request, HttpServletResponse response, Criteria cri)
			throws Exception {
		ModelAndView mav = new ModelAndView();

		mav.addObject("userList", adminService.userListpage(cri));
		int total = adminService.totalUserListPage(cri);

		pageVO pm = new pageVO(cri, total);

		mav.addObject("pm", pm);

		mav.setViewName("/admin/userList");
		return mav;
	}

	// 특정 사용자 회원 찾기
	@Override
	@RequestMapping(value = "/admin/findUserList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView findUserList(HttpServletRequest request, HttpServletResponse response, String search)
			throws Exception {
		ModelAndView mav = new ModelAndView();

		mav.addObject("userList", adminService.findUserList(search));

		mav.setViewName("/admin/userList");
		return mav;
	}

	// 검색어로 회원의 취소대기중인 주문목록중 특정 주문들 조회
	@Override
	@RequestMapping(value = "/admin/FindAdminOrdersList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView FindAdminOrdersList(HttpServletRequest request, HttpServletResponse response, String search)
			throws Exception {
		ModelAndView mav = new ModelAndView();

		HashMap<String, Object> ordersInfoMap = new HashMap<String, Object>();

		List orderList = adminService.FindAdminOrderList(search);

		List ordergoodsList = adminService.FindAdminOrdergoodsList(search);

		ordersInfoMap.put("orderList", orderList);
		ordersInfoMap.put("ordergoodsList", ordergoodsList);
		mav.addObject("ordersInfoMap", ordersInfoMap);

		mav.setViewName("/admin/adminOrderList");
		return mav;
	}

	// 사업자 회원 목록 띄우기
	@Override
	@RequestMapping(value = "/admin/buserList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView buserList(HttpServletRequest request, HttpServletResponse response, Criteria cri)
			throws Exception {
		ModelAndView mav = new ModelAndView();

		mav.addObject("userList", adminService.buserListpage(cri));
		int total = adminService.totalbUserListPage(cri);

		pageVO pm = new pageVO(cri, total);

		mav.addObject("pm", pm);

		mav.setViewName("/admin/buserList");
		return mav;
	}

	// 특정 사업자 회원 찾기
	@Override
	@RequestMapping(value = "/admin/findbUserList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView findbUserList(HttpServletRequest request, HttpServletResponse response, String search)
			throws Exception {
		ModelAndView mav = new ModelAndView();

		mav.addObject("userList", adminService.findbUserList(search));

		mav.setViewName("/admin/buserList");
		return mav;
	}

	// 사업자 승인요청 승인하기
	@Override
	@RequestMapping(value = "/admin/buserAdminAllow.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView buserAdminAllow(HttpServletRequest request, HttpServletResponse response, String uid)
			throws Exception {
		ModelAndView mav = new ModelAndView();

		adminService.buserAdminAllow(uid);

		mav.setViewName("redirect:/admin/buserList.do");
		return mav;
	}

	// 승인 대기중인 사업자 목록
	@Override
	@RequestMapping(value = "/admin/buserAllowList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView buserAllowList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();

		mav.addObject("userList", adminService.buserAllowList());

		mav.setViewName("/admin/buserList");
		return mav;
	}

	// 사용자 회원 삭제하기
	@Override
	@RequestMapping(value = "/admin/removeuser.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView removeuser(HttpServletRequest request, HttpServletResponse response, String uid)
			throws Exception {
		ModelAndView mav = new ModelAndView();

		adminService.removeuser(uid);

		mav.setViewName("redirect:/admin/userList.do");
		return mav;
	}

	// 사업자 회원 삭제하기
	@Override
	@RequestMapping(value = "/admin/removeuser1.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView removeuser1(HttpServletRequest request, HttpServletResponse response, String uid)
			throws Exception {
		ModelAndView mav = new ModelAndView();

		MemberVO member = memberService.getMemberInfo(uid);

		adminService.insertDeleteusertable(member);

		adminService.removeuser(uid);

		mav.setViewName("redirect:/admin/buserList.do");
		return mav;
	}

	// 관리자 상품 관리 페이지
	@Override
	@RequestMapping(value = "/admin/adminGoodsList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView admingoodsList(HttpServletRequest request, HttpServletResponse response, Criteria cri)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");

		ModelAndView mav = new ModelAndView(viewName);

		mav.addObject("adminGoodslist", adminService.adminGoodslistCri(cri));
		int total = adminService.TotalAdminGoodsList(cri);
		pageVO pm = new pageVO(cri, total);

		mav.addObject("pm", pm);

		System.out.println(viewName);
		return mav;
	} // end

	// 관리자 상품 관리 페이지
	@Override
	@RequestMapping(value = "/admin/adminGoodsList2.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView admingoodsList2(HttpServletRequest request, HttpServletResponse response, Criteria cri)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");

		ModelAndView mav = new ModelAndView(viewName);

		mav.addObject("adminGoodslist", adminService.adminGoodslistCri2(cri));
		int total = adminService.TotalAdminGoodsList2(cri);
		pageVO pm = new pageVO(cri, total);

		mav.addObject("pm", pm);

		System.out.println(viewName);
		return mav;
	} // end

	@Override
	@RequestMapping(value = "/admin/adminGoodsListSearch.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView adminGoodsListSearch(HttpServletRequest request, HttpServletResponse response, String search)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");

		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("adminGoodslist", adminService.adminGoodsListSearch(search));
		System.out.println(viewName);
		mav.setViewName("/admin/adminGoodsList");
		return mav;
	} // end

	// 관리자 상품 승인
	@Override
	@RequestMapping(value = "/admin/adminGoodsAllow.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ResponseEntity adminGoodsAllow(HttpServletRequest request, HttpServletResponse response, int goodsId)
			throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		String message;

		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		try {
			adminService.adminGoodsAllow(goodsId);

			message = "<script>";
			message += "alert('상품이 승인되었습니다.');";
			message += "location.href='" + request.getContextPath() + "/admin/adminGoodsList2.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			message = "<script>";
			message += "alert('오류');+";
			message += "location.href='" + request.getContextPath() + "/admin/adminGoodsList2.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	} // end

	// 관리자 상품 삭제
	@Override
	@RequestMapping(value = "/admin/admingoodsDelete.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ResponseEntity admingoodsDelete(@RequestParam("goodsId") int goodsId, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		String message;

		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		// 상품 이미지 정보
		try {
			goodsService.deleteGoodsList(goodsId);
			File srcFile = new File(GOODS_THUMBNAIL_FILE_NAME + "\\" + goodsId + ".jpg");
			File destDir = new File(GOODS_IMAGES_FILE_NAME + "\\" + goodsId);
			FileUtils.deleteDirectory(destDir);
			srcFile.delete();

			message = "<script>";
			message += "alert('상품이 삭제 되었습니다.');";
			message += "location.href='" + request.getContextPath() + "/admin/adminGoodsList.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			message = "<script>";
			message += "alert('오류');";
			message += "location.href='" + request.getContextPath() + "/admin/adminGoodsList.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;

	}

	// 관리자 커뮤니티 글 관리
	@Override
	@RequestMapping(value = "/admin/adminCommunityList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView adminCommunityList(HttpServletRequest request, HttpServletResponse response, Criteria cri)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");

		ModelAndView mav = new ModelAndView(viewName);

		mav.addObject("adminCommunitylist", adminService.adminCommunitylistCri(cri));
		int total = adminService.TotalAdminCommunityList(cri);
		pageVO pm = new pageVO(cri, total);

		mav.addObject("pm", pm);

		System.out.println(viewName);
		return mav;
	} // end

	@Override
	@RequestMapping(value = "/admin/adminCommunityListSearch.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView adminCommunityListSearch(HttpServletRequest request, HttpServletResponse response,
			String search) throws Exception {
		String viewName = (String) request.getAttribute("viewName");

		ModelAndView mav = new ModelAndView(viewName);

		mav.addObject("adminCommunitylist", adminService.adminCommunityListSearch(search));

		System.out.println(viewName);
		mav.setViewName("/admin/adminCommunityList");
		return mav;
	} // end

	@Override
	@RequestMapping(value = "/admin/adminremoveArticle.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity adminremoveArticle(@RequestParam("articleNO") int articleNO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=utf-8");
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		try {
			boardService.removeArticle(articleNO);
			File destTDir = new File(ARTICLE_THUMBNAIL_FILE_NAME + "\\" + articleNO);
			FileUtils.deleteDirectory(destTDir);
			File destIDir = new File(ARTICLE_IMAGE_FILE_NAME + "\\" + articleNO);
			FileUtils.deleteDirectory(destIDir);

			message = "<script>";
			message += "alert('글을 삭제했습니다.');";
			message += "location.href='" + request.getContextPath() + "/admin/adminCommunityList.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			message = "<script>";
			message += "alert('작업중 오류가 발생했습니다. 다시 시도해주세요.');";
			message += "loaction.href='" + request.getContextPath() + "/admin/adminCommunityList.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

			e.printStackTrace();
		}

		return resEnt;
	} // end removeArticle

	// 관리자 리뷰 관리
	@Override
	@RequestMapping(value = "/admin/adminReviewList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView adminReviewList(HttpServletRequest request, HttpServletResponse response, Criteria cri)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");

		ModelAndView mav = new ModelAndView(viewName);

		mav.addObject("adminReviewList", adminService.adminReviewListCri(cri));
		int total = adminService.TotalAdminReviewList(cri);
		pageVO pm = new pageVO(cri, total);

		mav.addObject("pm", pm);

		System.out.println(viewName);
		return mav;
	} // end

	// 관리자 리뷰 검색
	@Override
	@RequestMapping(value = "/admin/adminReviewListSearch.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView adminReviewListSearch(HttpServletRequest request, HttpServletResponse response, String search)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");

		ModelAndView mav = new ModelAndView(viewName);

		mav.addObject("adminReviewList", adminService.adminReviewListSearch(search));

		System.out.println(viewName);
		mav.setViewName("/admin/adminReviewList");
		return mav;
	} // end

	// 관리자 리뷰 삭제
	@Override
	@RequestMapping(value = "/admin/adminReviewDelete.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ResponseEntity adminReviewDelete(@RequestParam("uid") String uid, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		String message;

		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		// 상품 이미지 정보
		try {
			adminService.deleteReviewList(uid);

			message = "<script>";
			message += "alert('리뷰가 삭제 되었습니다.');";
			message += "location.href='" + request.getContextPath() + "/admin/adminReviewList.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			message = "<script>";
			message += "alert('오류');";
			message += "location.href='" + request.getContextPath() + "/admin/adminReviewList.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;

	}

	@RequestMapping(value = "/admin/aSalesStatusPage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView bSalesStatusPage(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView(viewName);

		return mav;
	}

	@Override
	@ResponseBody
	@RequestMapping(value = "/admin/aSalesStatus.do", method = { RequestMethod.GET, RequestMethod.POST })
	public Map aSalesStatus(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			String search, Criteria cri) throws Exception {
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

		if (search.length() < 1) { // 전체 보기
			Map resultMap = adminService.aSalesStatus(cri);
			int total = adminService.getSalesTotal(cri);
			pageVO pm = new pageVO(cri, total);

			if (!resultMap.containsKey("total")) {
				resEnt = new HashMap<String, String>();
				resEnt.put("re", "notSales");
				return resEnt;
			}

			resultMap.put("re", "allUserSales");
			resultMap.put("pm", pm);

			return resultMap;
		} else { // 검색 하기
			Map resultMap = adminService.aSearchSalesStatus(search);

			if (!resultMap.containsKey("total")) {
				resEnt = new HashMap<String, String>();
				resEnt.put("re", "notSartchSales");
				return resEnt;
			}

			resultMap.put("re", "selectUserSales");
			resultMap.put("pm", "null");
			return resultMap;
		}

	}

	// QNA
	@Override
	@RequestMapping(value = "/admin/adQnaboard.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView getQnaList(HttpServletRequest request, HttpServletResponse response, Model model, csVO cs,
			Criteria cri) throws Exception {
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		ModelAndView mav = new ModelAndView();
		String uid = member.getUid();
		int userType = member.getUserType();
		model.addAttribute("qnaboard", adminService.getQnaList(uid));
		model.addAttribute("qnaboard", adminService.listPageQna(cri));

		int total = adminService.qnaTotal(cri);
		pageVO pm = new pageVO(cri, total);
		model.addAttribute("pm", pm);

		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}

	@Override
	@RequestMapping(value = "/admin/adViewqna.do", method = { RequestMethod.GET })
	public ModelAndView detailQna(HttpServletRequest request, HttpServletResponse response, ModelAndView mav, csVO cs)
			throws Exception {
		HttpSession session = request.getSession();
		int csNO = cs.getCsNO();
		csVO viewqna = adminService.detailQna(csNO);

		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		mav.addObject("viewqna", viewqna);
		return mav;
	} // end

	@Override
	@RequestMapping(value = "/admin/removeQna.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity removeQna(@RequestParam("csNO") int csNO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			adminService.removeQna(csNO);

			message = "<script>";
			message += " alert('글을 삭제했습니다.');";
			message += " location.href='" + request.getContextPath() + "/admin/adQnaboard.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			message = "<script>";
			message += " alert('작업중 오류가 발생했습니다. 다시 시도해 주세요');";
			message += " location.href='" + request.getContextPath() + "/admin/adQnaboard.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;

	}

	@Override
	@RequestMapping(value = "/admin/qnaComment.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView qnaComment(HttpServletRequest request, HttpServletResponse response, Model model, csVO cs,
			MemberVO member) throws Exception {
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		String uid = "";
		if (member != null) {
			uid = member.getUid();
			model.addAttribute("uid", uid);
		}

		int csNO = Integer.parseInt(request.getParameter("csNO"));
		cs = adminService.detailQna(csNO);
		model.addAttribute("cs", cs);

		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	} // end

	@Override
	@RequestMapping(value = "/admin/addComment.do", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView addComment(HttpServletRequest request, HttpServletResponse response, csVO cs, Model model)
			throws Exception {
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String uid = memberVO.getUid();
		cs.setUid(uid);
		adminService.insertReply(cs);
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName("redirect:/admin/adQnaboard.do");

		return mav;
	}

	// 공지사항 글 목록 조회
	@Override
	@RequestMapping(value = "/admin/adNotice.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView noticeList(HttpServletRequest request, HttpServletResponse response, Model model,
			noticeVO notice, Criteria cri) throws Exception {
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		model.addAttribute("noticeList", adminService.listPage(cri));

		int total = adminService.noticeTotal(cri);
		pageVO pm = new pageVO(cri, total);
		model.addAttribute("pm", pm);

		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	// 공지사항 작성 폼
	@Override
	@RequestMapping(value = "/admin/noticeForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView noticeForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");

		ModelAndView mav = new ModelAndView(viewName);
		mav.setViewName(viewName);
		System.out.println(viewName);

		return mav;
	} // end

	// 공지사항 작성 기능
	@Override
	@RequestMapping(value = "/admin/noticeWrite.do", method = RequestMethod.POST)
	public ModelAndView noticeWrite(noticeVO notice, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String uid = memberVO.getUid();
		notice.setUid(uid);
		adminService.noticeWrite(notice);
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName("redirect:/admin/adNotice.do");
		return mav;
	}

	// 공지사항 조회
	@Override
	@RequestMapping(value = "/admin/adNoticeView.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView noticeView(HttpServletRequest request, HttpServletResponse response, ModelAndView mav,
			noticeVO notice) throws Exception {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");

		int noticeNO = notice.getNoticeNO();
		noticeVO viewNotice = adminService.noticeView(noticeNO);
		String viewName = (String) request.getAttribute("viewName");

		mav.addObject("viewNotice", viewNotice);
		mav.setViewName(viewName);

		return mav;
	}

	// 공지사항 수정 기능
	@Override
	@RequestMapping(value = "/admin/modNotice.do", method = RequestMethod.GET)
	public ModelAndView noticeModifyView(int noticeNO, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		noticeVO viewNotice = adminService.noticeView(noticeNO);
		model.addAttribute("viewNotice", viewNotice);
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}

	@Override
	@RequestMapping(value = "/admin/modNotice", method = RequestMethod.POST)
	public String noticeModify(noticeVO notice, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		adminService.noticeModify(notice);

		return "redirect:/admin/adNotice.do";
	}

	// 공지사항 삭제 기능
	@Override
	@RequestMapping(value = "/admin/noticeRemove.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity noticeRemove(@RequestParam("noticeNO") int noticeNO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			adminService.noticeRemove(noticeNO);
			message = "<script>";
			message += " alert('글을 삭제했습니다.');";
			message += " location.href='" + request.getContextPath() + "/admin/adNotice.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			message = "<script>";
			message += " alert('작업중 오류가 발생했습니다. 다시 시도해 주세요');";
			message += " location.href='" + request.getContextPath() + "/admin/adNotice.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;

	}

	// FAQ List 조회
	@Override
	@RequestMapping(value = "/admin/adFaqList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView faqList(HttpServletRequest request, HttpServletResponse response, faqVO faq) throws Exception {
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		List<faqVO> faqList = adminService.listFaq();
		mav.addObject("faqList", faqList);
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}

	// FAQ 작성 폼
	@RequestMapping(value = "/admin/faqWriteForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView faqWriteForm(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		mav.setViewName(viewName);
		System.out.println(viewName);

		return mav;
	} // end

	// FAQ 작성 기능
	@Override
	@RequestMapping(value = "/admin/faqWrite.do", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView faqWrite(faqVO faq, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String uid = memberVO.getUid();
		faq.setUid(uid);
		adminService.faqWrite(faq);
		mav.setViewName("redirect:/admin/adFaqList.do");
		return mav;
	}

	// FAQ 수정 (기존 값 불러오기)
	@Override
	@RequestMapping(value = "/admin/faqMod.do", method = RequestMethod.POST)
	public ModelAndView faqMod(HttpServletRequest request, HttpServletResponse response, ModelAndView mav, faqVO faq)
			throws Exception {
		HttpSession session = request.getSession();
		int faq_no = faq.getFaq_no();
		faqVO viewfaq = adminService.faqMod(faq_no);
		mav.addObject("viewfaq", viewfaq);
		return mav;
	}

	// FAQ 수정 기능
	@Override
	@RequestMapping(value = "/faqMod.do", method = RequestMethod.POST)
	public ModelAndView faqModify(@ModelAttribute("faq_no") faqVO faq, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int result = 0;
		result = adminService.faqModify(faq);

		ModelAndView mav = new ModelAndView("redirect:/admin/adFaqList.do");

		return mav;
	}

	// FAQ 삭제 기능
	@Override
	@RequestMapping(value = "/admin/removeFaq.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity removeFaq(@RequestParam(value = "faq_no") int faq_no, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			adminService.faqRemove(faq_no);

			message = "<script>";
			message += " alert('글을 삭제했습니다.');";
			message += " location.href='" + request.getContextPath() + "/admin/adFaqList.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			message = "<script>";
			message += " alert('작업중 오류가 발생했습니다. 다시 시도해 주세요');";
			message += " location.href='" + request.getContextPath() + "/admin/adFaqList.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;

	}

	// 회원 포인트이력 리스트
	@Override
	@RequestMapping(value = "/admin/adminPointHistory.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView adminPointHistory(HttpServletRequest request, HttpServletResponse response, Criteria cri)
			throws Exception {
		ModelAndView mav = new ModelAndView();

		List pointHistory = adminService.adminPointHistory(cri);

		mav.addObject("pointHistory", pointHistory);

		int total = adminService.totalPointHistory();

		pageVO pm = new pageVO(cri, total);

		mav.addObject("pm", pm);

		mav.setViewName("/admin/adminPointHistory");
		return mav;
	}

	// 특정 회원 포인트 이력 찾기
	@Override
	@RequestMapping(value = "/admin/findpointHistory.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView findpointHistory(HttpServletRequest request, HttpServletResponse response, String search)
			throws Exception {
		ModelAndView mav = new ModelAndView();

		List pointHistory = adminService.findpointHistory(search);

		mav.addObject("pointHistory", pointHistory);

		mav.setViewName("/admin/adminPointHistory");
		return mav;
	}

	// 내 댓글 조회
	@Override
	@RequestMapping(value = "/admin/adminCommentList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView adminCommentList(HttpServletRequest request, HttpServletResponse response, Criteria cri)
			throws Exception {
		ModelAndView mav = new ModelAndView();

		mav.addObject("myCommentList", adminService.adminCommentList(cri));
		int total = adminService.adminTotalCommentPage(cri);
		pageVO pm = new pageVO(cri, total);
		mav.addObject("pm", pm);

		mav.setViewName("/admin/adminCommentList");

		return mav;
	} // end

}
