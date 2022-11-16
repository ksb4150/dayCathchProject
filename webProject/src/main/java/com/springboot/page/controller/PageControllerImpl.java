package com.springboot.page.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.common.vo.Criteria;
import com.springboot.common.vo.pageVO;
import com.springboot.goods.service.GoodsService;
import com.springboot.goods.vo.GoodsVO;
import com.springboot.goods.vo.LodgingDetailVO;
import com.springboot.member.vo.MemberVO;
import com.springboot.mypage.vo.CartVO;
import com.springboot.page.service.PageService;
import com.springboot.page.vo.AirportVO;
import com.springboot.page.vo.FestivalVO;
import com.springboot.page.vo.ImageVO;
import com.springboot.page.vo.csVO;
import com.springboot.page.vo.faqVO;
import com.springboot.page.vo.noticeVO;

@Controller("pageController")
public class PageControllerImpl implements PageController {
	private static final String ARTICLE_IMAGE_REPO = "C:\\board\\article_image";
	@Autowired
	private PageService pageService;
	@Autowired
	private GoodsService goodsService;
	@Autowired
	private ImageVO imageVO;
	@Autowired
	private GoodsVO goodsVO;
	@Autowired
	private AirportVO airportVO;
	@Autowired
	private csVO cs;
	@Autowired
	private faqVO faq;
	@Autowired
	private MemberVO memberVO;
	@Autowired
	private noticeVO notice;
	@Autowired
	private HttpSession session;

	public PageControllerImpl() {
		System.out.println("PageControolerImpl");
	}

	@Override
	@RequestMapping(value = "/page/mainPage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView mainPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");

		Map<String, Object> goodsMap = pageService.selectRowLodgingList1();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("goodsMap", goodsMap);
		System.out.println(viewName);

		return mav;
	} // end

	// 숙소 서브 페이지
	@Override
	@RequestMapping(value = "/page/goodsPage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView goodsPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");

		Map<String, Object> goodsMap = pageService.selectRowLodgingList();
		Map<String, Object> goodsHotMap = pageService.selectHotRowLodgingList();

		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("goodsMap", goodsMap); // goodsVO, memberVO
		mav.addObject("goodsHotMap", goodsHotMap);

		System.out.println(viewName);

		return mav;
	} // end

	// 투어 & 티켓 서브 페이지
	@Override
	@RequestMapping(value = "/page/goodsPage2.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView goodsPage2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");

		Map<String, Object> goodsMap = pageService.selectRowLodgingList2();
		Map<String, Object> goodsHotMap = pageService.selectHotRowLodgingList2();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("goodsMap", goodsMap); // goodsVO, memberVO
		mav.addObject("goodsHotMap", goodsHotMap);

		System.out.println(viewName);

		return mav;
	} // end

	@Override
	@RequestMapping(value = "/page/goodsDetailPage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView goodsDetailPage(@RequestParam("uid") String uid, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView(viewName);

		// 사업자의 uid
		Map goodsMap = pageService.viewLodgingDetail(uid);

		mav.addObject("goodsMap", goodsMap); // List<goodsVO>, List<ImageVO>, List<loadingDetailVO>
		System.out.println(viewName);

		// 로그인한 사용자의 uid 가져오기 위해
		try {
			MemberVO memberVO = (MemberVO) session.getAttribute("member");
			List<Integer> likedList = pageService.selectLikeGoods(memberVO.getUid(), uid);
			if(likedList.size() > 0) {
				mav.addObject("likedList", likedList);
			} else {
				mav.addObject("likedList", false);
			}
		} catch (Exception e) {
			mav.addObject("likedList", false);
		}

		return mav;
	} // end

	@Override
	@RequestMapping(value = "/page/goodsDetailPage2.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView goodsDetailPage2(@RequestParam("uid") String uid, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");

		Map goodsMap = pageService.viewLodgingDetail1(uid);

		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("goodsMap", goodsMap); // List<goodsVO>, List<ImageVO>, List<loadingDetailVO>
		System.out.println(viewName);
		
		try {
			MemberVO memberVO = (MemberVO) session.getAttribute("member");
			List<Integer> likedList = pageService.selectLikeGoods(memberVO.getUid(), uid);
			if(likedList.size() > 0) {
				mav.addObject("likedList", likedList);
			} else {
				mav.addObject("likedList", false);
			}
		} catch (Exception e) {
			mav.addObject("likedList", false);
		}

		return mav;
	} // end

	// 숙소 필터링 페이지
	@Override
	@RequestMapping(value = "/page/goodsFilterPage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView goodsFilterPage(@RequestParam("goodsSubCategory") String goodsSubCategory,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");

		Map filterMap = pageService.basicFiltering(goodsSubCategory);
		filterMap.put("goodsSubCategory", goodsSubCategory);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("filterMap", filterMap);
		return mav;

	} // end

	// 티켓 필터링 페이지
	@Override
	@RequestMapping(value = "/page/goodsFilterPage1.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView goodsFilterPage1(@RequestParam("goodsSubCategory") String goodsSubCategory,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");

		Map filterMap = pageService.basicFiltering1(goodsSubCategory);
		filterMap.put("goodsSubCategory", goodsSubCategory);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("filterMap", filterMap);
		return mav;

	} // end

//	@RequestMapping(value = "/page/goodsFilter.do", method = { RequestMethod.GET, RequestMethod.POST })
//	public ModelAndView filtering(HttpServletRequest request, HttpServletResponse response, LodgingDetailVO detalVO, 
//							@RequestParam("startDate") String sDate, @RequestParam("endDate") String eDate, @RequestParam("goodsSubCategory") String subCate) throws Exception {
//		List<LodgingDetailVO> filterList = pageService.filtering(detalVO, sDate, eDate, subCate);
//		
//		ModelAndView mav = new ModelAndView("/page/goodsFilterPage");
//			mav.addObject("filterList", filterList);
//		
//		return mav;
//	}

//	@ResponseBody
//	@RequestMapping(value = "/page/goodsFilter.do", method = {RequestMethod.GET, RequestMethod.POST })
//	public ResponseEntity filtering(HttpServletRequest request, HttpServletResponse response, LodgingDetailVO detalVO) throws Exception {
//		request.setCharacterEncoding("utf-8");
//		ResponseEntity resEnt = null;
//		
//		Map filterMap = pageService.filtering(detalVO);
//		
//		resEnt = new ResponseEntity(filterMap,HttpStatus.INTERNAL_SERVER_ERROR);
//		
//		return resEnt;
//	}

//	@ResponseBody
//	@RequestMapping(value = "/page/goodsFilter.do", method = {RequestMethod.GET, RequestMethod.POST })
//	public Map<String, Object> filtering(HttpServletRequest request, HttpServletResponse response, LodgingDetailVO detalVO) throws Exception {
//		request.setCharacterEncoding("utf-8");
//		
//		Map filterMap = pageService.filtering(detalVO); // filterList, memInfoList
//		
//		return filterMap;
//	}

	@Override
	@RequestMapping(value = "/page/goodsFilter.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String filtering(HttpServletRequest request, HttpServletResponse response, LodgingDetailVO detalVO,
			Model model) throws Exception {
		request.setCharacterEncoding("utf-8");

		Map filterMap = pageService.filtering(detalVO); // filterList, memInfoList
		model.addAttribute("filterMap", filterMap);
		return "/page/filterResultPage";
	}

	@Override
	@RequestMapping(value = "/page/goodsFilter1.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String filtering1(HttpServletRequest request, HttpServletResponse response, LodgingDetailVO detalVO,
			Model model) throws Exception {
		request.setCharacterEncoding("utf-8");

		Map filterMap = pageService.filtering1(detalVO); // filterList, memInfoList
		model.addAttribute("filterMap", filterMap);
		return "/page/filterResultPage";
	}

	@Override
	@RequestMapping(value = "/page/paymentPage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView paymentPage(HttpServletRequest request, HttpServletResponse response, CartVO cart,
			GoodsVO goods) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String viewName = (String) request.getAttribute("viewName");
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		int goodsId = goods.getGoodsId();

		LodgingDetailVO detail = goodsService.selectlodgingdetail(goodsId);
		Map<String, Object> paymentMap = new HashMap<String, Object>();
		paymentMap.put("memberVO", memberVO);
		paymentMap.put("goods", goods);
		paymentMap.put("detail", detail);
		paymentMap.put("cart", cart);

		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("paymentMap", paymentMap);

		System.out.println(viewName);

		return mav;

	} // end

	@Override
	@RequestMapping(value = "/page/community.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView community(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");

		Map<String, Object> boardAscMap = pageService.selectBoardAsc();
		Map<String, Object> boardCntMap = pageService.selectBoardCnt();
		Map<String, Object> boardHotMap = pageService.selectHotArticle();

		ModelAndView mav = new ModelAndView(viewName);
			mav.addObject("boardAscMap", boardAscMap);
			mav.addObject("boardCntMap", boardCntMap);
			mav.addObject("hotArticle", boardHotMap);
		System.out.println(viewName);

		return mav;
	} // end

	@Override
	@RequestMapping(value = "/mypage/guidelineAirplain.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView guidlineAirplain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");

		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(viewName);

		return mav;
	} // end
	
	@Override
	@RequestMapping(value = "/mypage/personalInfoPage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView personalInfoPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");

		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(viewName);

		return mav;
	} // end

	@Override
	@RequestMapping(value = "/mypage/guidelinePay.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView guidlinePay(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");

		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(viewName);

		return mav;
	} // end

	@Override
	@RequestMapping(value = "/mypage/guidelinePointcoupon.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView guidelinePointcoupone(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");

		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(viewName);

		return mav;
	} // end

	@Override
	@RequestMapping(value = "/mypage/guidelineReservation.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView guidelineReservation(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");

		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(viewName);

		return mav;
	} // end

	@Override
	@RequestMapping(value = "/mypage/pointCoupon.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView pointCoupon(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		MemberVO member = (MemberVO) session.getAttribute("member");
		String uid = member.getUid();
		int sumSavePoint = pageService.sumSavePoint(uid);
		int sumUsePoint = pageService.sumUsePoint(uid);

		mav.addObject("member", member);
		mav.addObject("sumSavePoint", sumSavePoint);
		mav.addObject("sumUsePoint", sumUsePoint);

		mav.setViewName("/mypage/pointCoupon");
		return mav;
	} // end

	@Override
	@RequestMapping(value = "/mypage/boardManage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView boardManage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");

		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(viewName);

		return mav;
	} // end

	@Override
	@RequestMapping(value = "/mypage/wishList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView wishList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String uid = memberVO.getUid();

		Map wishList = pageService.selectsWishList(uid);

		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("resultMap", wishList);
		System.out.println(viewName);

		return mav;
	} // end

	@Override
	@RequestMapping(value = "/page/popUpPage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView popup(@RequestParam("goodsId") int goodsId, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");

		Map goodsMap = pageService.selectGoodsInfo(goodsId);

		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(viewName);
		mav.addObject("goodsMap", goodsMap);

		return mav;
	} // end

	@RequestMapping(value = "/page/maptest.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView meptest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");

		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(viewName);

		return mav;
	} // end

	@Override
	@RequestMapping(value = "/mypage/qna.do", method = RequestMethod.GET)
	public String qnaForm() throws Exception {
		return "/mypage/qna";

	} // end

	@Override
	@RequestMapping(value = "/mypage/qna", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView addNewQna(csVO cs, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String uid = memberVO.getUid();
		cs.setUid(uid);
		pageService.addNewQna(cs);

		mav.setViewName("redirect:/mypage/qnaboard.do");
		return mav;
	}

	@Override
	@RequestMapping(value = "/mypage/qnaboard.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView getQnaList(HttpServletRequest request, HttpServletResponse response, ModelAndView mav, csVO cs)
			throws Exception {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String uid = memberVO.getUid();
		List<csVO> qnaboard = pageService.getQnaList(uid);

		// 1:1문의 내가쓴 글 목록 보여주기
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		mav.addObject("qnaboard", qnaboard);

		return mav;
	} // end

	@Override
	@RequestMapping(value = "/mypage/viewqna.do", method = { RequestMethod.GET })
	public ModelAndView detailQna(HttpServletRequest request, HttpServletResponse response, ModelAndView mav, csVO cs)
			throws Exception {
		HttpSession session = request.getSession();
		int csNO = cs.getCsNO();
		csVO viewqna = pageService.detailQna(csNO);

		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		mav.addObject("viewqna", viewqna);
		return mav;
	} // end

	@Override
	@RequestMapping(value = "/mypage/qnaComment.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView qnaComment(HttpServletRequest request, HttpServletResponse response, Model model, csVO cs,
			MemberVO member) throws Exception {
		HttpSession session = request.getSession();
		String uid = "";
		if (member != null) {
			uid = member.getUid();
			model.addAttribute("uid", uid);
		}

		int csNO = Integer.parseInt(request.getParameter("csNO"));
		cs = pageService.detailQna(csNO);
		model.addAttribute("cs", cs);
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		mav.setViewName(viewName);

		return mav;
	} // end

	@Override
	@RequestMapping(value = "/mypage/addComment.do", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView addComment(HttpServletRequest request, HttpServletResponse response, csVO cs, Model model)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String uid = memberVO.getUid();
		cs.setUid(uid);
		pageService.insertReply(cs);

		mav.setViewName("redirect:/mypage/qnaboard.do");

		return mav;
	}

	// FAQ List 조회
	@Override
	@RequestMapping(value = "/mypage/faqList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView faqList(HttpServletRequest request, HttpServletResponse response, ModelAndView mav, faqVO faq)
			throws Exception {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		int manager;
		if (memberVO != null) {
			manager = memberVO.getUserType();
		} else {
			manager = 1234;
		}
		List<faqVO> faqList = pageService.listFaq();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		mav.addObject("faqList", faqList);
		mav.addObject("manager", manager);
		return mav;
	}

	// 공지사항 글 목록 조회
	@Override
	@RequestMapping(value = "/mypage/notice.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView noticeList(HttpServletRequest request, HttpServletResponse response, Model model,
			noticeVO notice, Criteria cri) throws Exception {
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");

		int manager;
		if (memberVO != null) {
			manager = memberVO.getUserType();
		} else {
			manager = 1234;
		}
		mav.addObject("manager", manager);

		model.addAttribute("noticeList", pageService.listPage(cri));
		int total = pageService.getTotal(cri);
		pageVO pm = new pageVO(cri, total);
		model.addAttribute("pm", pm);

		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}

	// 공지사항 조회
	@Override
	@RequestMapping(value = "/mypage/noticeView.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView noticeView(HttpServletRequest request, HttpServletResponse response, ModelAndView mav,
			noticeVO notice) throws Exception {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		int manager;
		if (memberVO != null) {
			manager = memberVO.getUserType();
		} else {
			manager = 1234;
		}

		int noticeNO = notice.getNoticeNO();
		noticeVO viewNotice = pageService.noticeView(noticeNO);
		String viewName = (String) request.getAttribute("viewName");

		mav.addObject("viewNotice", viewNotice);
		mav.setViewName(viewName);

		return mav;
	}

	// 기본값인 최신순 조회
	@Override
	@RequestMapping(value = "/page/communityList1.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView communityList1(HttpServletRequest request, HttpServletResponse response, Criteria cri)
			throws Exception {
		ModelAndView mav = new ModelAndView();

		String category = cri.getSearch();
		// 인기순
		if (category != null) {
			mav.addObject("communityList", pageService.communityList2(cri));
		} else {
			// 최신순
			mav.addObject("communityList", pageService.communityList1(cri));
		}
		int total = pageService.totalcommunityPage1();
		pageVO pm = new pageVO(cri, total);
		mav.addObject("pm", pm);
		mav.addObject("category", category);

		mav.setViewName("/page/communityList1");

		return mav;
	} // end

	// 카테고리별 조회
	@Override
	@RequestMapping(value = "/page/communityList2.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView communityList2(HttpServletRequest request, HttpServletResponse response, Criteria cri)
			throws Exception {
		ModelAndView mav = new ModelAndView();

		String category = cri.getSearch();

		mav.addObject("communityList", pageService.communityList3(cri));
		int total = pageService.totalcommunityPage2(cri);
		pageVO pm = new pageVO(cri, total);

		mav.addObject("pm", pm);

		mav.addObject("category", category);

		mav.setViewName("/page/communityList1");

		return mav;
	} // end

	// 특정 게시글 찾기
	@Override
	@RequestMapping(value = "/page/findArticleList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView findArticleList(HttpServletRequest request, HttpServletResponse response, Criteria cri)
			throws Exception {
		ModelAndView mav = new ModelAndView();

		String category = cri.getSearch();

		mav.addObject("communityList", pageService.findArticleList(cri));
		int total = pageService.totalcommunityPage3(cri);
		pageVO pm = new pageVO(cri, total);
		mav.addObject("pm", pm);
		mav.addObject("category", category);
		mav.setViewName("/page/communityList1");
		return mav;
	}

	@Override
	@RequestMapping(value = "/page/airport.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView airport(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "depAirportId", required = false) String depAirportId,
			@RequestParam(value = "arrAirportId", required = false) String arrAirportId,
			@RequestParam(value = "depPlandTime", required = false) String depPlandTime,
			@RequestParam(value = "airlineId", required = false) String airlineId, Criteria cri) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		List<AirportVO> airportList = new ArrayList<>();
		Map<String, String> userInput = new HashMap<String, String>();

		StringBuilder urlBuilder = new StringBuilder(
				"http://apis.data.go.kr/1613000/DmstcFlightNvgInfoService/getFlightOpratInfoList"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8")
				+ "=kOQ4MO141XJDWYprHjz%2BAfbLnemutxC9airWqYNKBmleImuqh%2FUZXEU8T75ARf7ANWngiKM6gkzLkFnaq58g7Q%3D%3D"); /*
																														 * Service
																														 * Key
																														 */

		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="
				+ URLEncoder.encode("10", "UTF-8")); /* 한 페이지 결과 수 */
		urlBuilder.append("&" + URLEncoder.encode("_type", "UTF-8") + "="
				+ URLEncoder.encode("json", "UTF-8")); /* 데이터 타입(xml, json) */

		if (depAirportId != null) {
			urlBuilder.append("&" + URLEncoder.encode("depAirportId", "UTF-8") + "="
					+ URLEncoder.encode(depAirportId, "UTF-8")); /* 출발공항ID */
			userInput.put("depAirportId", depAirportId);
		} else {
			urlBuilder.append("&" + URLEncoder.encode("depAirportId", "UTF-8") + "="
					+ URLEncoder.encode("NAARKSS", "UTF-8")); /* 출발공항ID */
			userInput.put("depAirportId", "NAARKSS");
		}

		if (arrAirportId != null) {
			urlBuilder.append("&" + URLEncoder.encode("arrAirportId", "UTF-8") + "="
					+ URLEncoder.encode(arrAirportId, "UTF-8")); /* 도착공항ID */
			userInput.put("arrAirportId", arrAirportId);
		} else {
			urlBuilder.append("&" + URLEncoder.encode("arrAirportId", "UTF-8") + "="
					+ URLEncoder.encode("NAARKPC", "UTF-8")); /* 도착공항ID */
			userInput.put("arrAirportId", "NAARKPC");
		}

		if (airlineId != null) {
			if (airlineId.length() > 0) {
				urlBuilder.append("&" + URLEncoder.encode("airlineId", "UTF-8") + "="
						+ URLEncoder.encode(airlineId, "UTF-8")); /* 항공사ID */
				userInput.put("airlineId", airlineId);
			} else {
				userInput.put("airlineId", "all");
			}

		} else {
			userInput.put("airlineId", "all");
		}

		if (depPlandTime != null) {
			userInput.put("depPlandTime1", depPlandTime);
			String depPlandTime1 = depPlandTime.replace("-", "");

			urlBuilder.append("&" + URLEncoder.encode("depPlandTime", "UTF-8") + "="
					+ URLEncoder.encode(depPlandTime1, "UTF-8")); /* 출발일(YYYYMMDD) */
		} else {

			LocalDate now = LocalDate.now();
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			depPlandTime = now.format(formatter);
			userInput.put("depPlandTime1", depPlandTime);
			depPlandTime = depPlandTime.replace("-", "");

			urlBuilder.append("&" + URLEncoder.encode("depPlandTime", "UTF-8") + "="
					+ URLEncoder.encode(depPlandTime, "UTF-8")); /* 도착공항ID */
		}

		String sPageNum = String.valueOf(cri.getPageNum());
		urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(sPageNum, "UTF-8"));

		URL url = new URL(urlBuilder.toString());

		BufferedReader rd;
		String line = "";
		String result = "";

		rd = new BufferedReader(new InputStreamReader(url.openStream()));

		while ((line = rd.readLine()) != null) {
			result = result.concat(line);
		}

		System.out.println(result);
		
		JSONParser parser = new JSONParser();
		JSONObject obj = (JSONObject) parser.parse(result);
		// Top레벨 단계인 response 키를 가지고 데이터를 파싱
		JSONObject parse_response = (JSONObject) obj.get("response");
		// response 로 부터 body 파싱
		JSONObject parse_body = (JSONObject) parse_response.get("body");
		// 검색 총 결과 개수
		long total = (long) parse_body.get("totalCount");

		if (total > 0) {
			// body 로 부터 items 파싱
			JSONObject parse_items = (JSONObject) parse_body.get("items");
			// items로 부터 itemlist 를 파싱
			JSONArray parse_item = (JSONArray) parse_items.get("item");

			JSONObject obj2;

			for (int i = 0; i < parse_item.size(); i++) {
				AirportVO airport = new AirportVO();
				obj2 = (JSONObject) parse_item.get(i);
				airport.setAirlineNm((String) obj2.get("airlineNm"));
				airport.setArrAirportNm((String) obj2.get("arrAirportNm"));
				airport.setArrPlandTime((long) obj2.get("arrPlandTime"));
				airport.setDepAirportNm((String) obj2.get("depAirportNm"));
				airport.setDepPlandTime((long) obj2.get("depPlandTime"));
				if (obj2.get("economyCharge") == null) {
					airport.setEconomyCharge(0);
				} else {
					airport.setEconomyCharge((long) obj2.get("economyCharge"));
				}

//				airport.setPrestigeCharge((long) obj2.get("prestigeCharge"));
				airport.setVihicleId((String) obj2.get("vihicleId"));
				airportList.add(airport);

			}

			pageVO pm = new pageVO(cri, (int) total);
			mav.addObject("pm", pm);

			rd.close();

			mav.addObject("airportList", airportList);
			mav.addObject("userInput", userInput);
		} else {
			mav.addObject("result", "false");
		}

		System.out.println(viewName);

		return mav;
	}

	@Override
	@RequestMapping(value = "/page/festivalPage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView festivalPage(HttpServletRequest request, HttpServletResponse response, Criteria cri,
			@RequestParam(value = "startDate", required = false) String startDate,
			@RequestParam(value = "areaCode", required = false) String areaCode) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		List<FestivalVO> festivalList = new ArrayList<>();
		Map<String, String> userInput = new HashMap<String, String>();

		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B551011/KorService/searchFestival");
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + URLEncoder.encode(
				"/DjlB6+kSPrVoHAHjTQmqtmhHs3gThjzfIHwwCnqLpylias7NFXzmHdqcLL4mKbk19SszwAdj3Vtm3qpFE04Yg==", "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("9", "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("MobileOS", "UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("MobileApp", "UTF-8") + "=" + URLEncoder.encode("NJTour", "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("_type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("listYN", "UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("arrange", "UTF-8") + "=" + URLEncoder.encode("C", "UTF-8"));

		if (startDate == null) {
			LocalDate now = LocalDate.now();
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			startDate = now.format(formatter);
			userInput.put("startDate", startDate);
			startDate = startDate.replace("-", "");
			urlBuilder.append(
					"&" + URLEncoder.encode("eventStartDate", "UTF-8") + "=" + URLEncoder.encode(startDate, "UTF-8"));
			urlBuilder.append(
					"&" + URLEncoder.encode("eventEndDate", "UTF-8") + "=" + URLEncoder.encode(startDate, "UTF-8"));
		} else {
			if (startDate.length() > 0) {
				userInput.put("startDate", startDate);
				startDate = startDate.replace("-", "");
				urlBuilder.append("&" + URLEncoder.encode("eventStartDate", "UTF-8") + "="
						+ URLEncoder.encode(startDate, "UTF-8"));
				urlBuilder.append(
						"&" + URLEncoder.encode("eventEndDate", "UTF-8") + "=" + URLEncoder.encode(startDate, "UTF-8"));
			} else {
				LocalDate now = LocalDate.now();
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
				startDate = now.format(formatter);
				userInput.put("startDate", startDate);
				startDate = startDate.replace("-", "");
				urlBuilder.append("&" + URLEncoder.encode("eventStartDate", "UTF-8") + "="
						+ URLEncoder.encode(startDate, "UTF-8"));
				urlBuilder.append(
						"&" + URLEncoder.encode("eventEndDate", "UTF-8") + "=" + URLEncoder.encode(startDate, "UTF-8"));
			}
		}

		if (areaCode != null) {
			if (areaCode.length() > 0) {
				urlBuilder.append(
						"&" + URLEncoder.encode("areaCode", "UTF-8") + "=" + URLEncoder.encode(areaCode, "UTF-8"));
				userInput.put("areaCode", areaCode);
			} else {
				userInput.put("areaCode", "all");
			}
		} else {
			userInput.put("areaCode", "all");
		}

		String sPageNum = String.valueOf(cri.getPageNum());
		urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(sPageNum, "UTF-8"));

		URL url = new URL(urlBuilder.toString());
		BufferedReader rd;
		String line = "";
		String result = "";

		rd = new BufferedReader(new InputStreamReader(url.openStream()));

		while ((line = rd.readLine()) != null) {
			result = result.concat(line);
		}

		JSONParser parser = new JSONParser();
		JSONObject obj = (JSONObject) parser.parse(result);
		// Top레벨 단계인 response 키를 가지고 데이터를 파싱
		JSONObject parse_response = (JSONObject) obj.get("response");
		// response 로 부터 body 파싱
		JSONObject parse_body = (JSONObject) parse_response.get("body");
		// 검색 총 결과 개수
		long total = (long) parse_body.get("totalCount");
		if (total > 0) {
			// body 로 부터 items 파싱
			JSONObject parse_items = (JSONObject) parse_body.get("items");

			// items로 부터 itemlist 를 파싱
			JSONArray parse_item = (JSONArray) parse_items.get("item");

			JSONObject obj2;

			for (int i = 0; i < parse_item.size(); i++) {
				FestivalVO festival = new FestivalVO();
				obj2 = (JSONObject) parse_item.get(i);
				festival.setTitle((String) obj2.get("title"));
				festival.setAddr((String) obj2.get("addr1"));
				festival.setEventStartDate((String) obj2.get("eventstartdate"));
				festival.setEventEndDate((String) obj2.get("eventenddate"));
				festival.setImg1((String) obj2.get("firstimage"));
				festival.setImg2((String) obj2.get("firstimage2"));
				festival.setMapx((String) obj2.get("mapx"));
				festival.setMapy((String) obj2.get("mapy"));
				festival.setAreacode((String) obj2.get("areacode"));
				festival.setTel((String) obj2.get("tel"));
				festivalList.add(festival);
			}

			pageVO pm = new pageVO(cri, (int) total);
			mav.addObject("pm", pm);

			rd.close();

			mav.addObject("festivalList", festivalList);
			mav.addObject("userInput", userInput);
		} else {
			mav.addObject("result", "false");
		}

		System.out.println(viewName);

		return mav;
	}

	// qna 수정 기능
	@Override
	@RequestMapping(value = "/mypage/modqna.do", method = RequestMethod.GET)
	public String qnaModifyView(int csNO, Model model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		csVO viewqna = pageService.detailQna(csNO);
		model.addAttribute("viewqna", viewqna);

		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return "mypage/modifyqna";
	}

	@Override
	@RequestMapping(value = "/mypage/modqna", method = RequestMethod.POST)
	public String qnaModify(csVO cs, HttpServletRequest request, HttpServletResponse response) throws Exception {

		pageService.qnaModify(cs);

		return "redirect:/mypage/qnaboard.do";
	}

	@Override
	@RequestMapping(value = "/mypage/removeQna.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity removeQna(@RequestParam("csNO") int csNO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			pageService.removeQna(csNO);

			message = "<script>";
			message += " alert('글을 삭제했습니다.');";
			message += " location.href='" + request.getContextPath() + "/mypage/qnaboard.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			message = "<script>";
			message += " alert('작업중 오류가 발생했습니다. 다시 시도해 주세요');";
			message += " location.href='" + request.getContextPath() + "/mypage/qnaboard.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;

	}

	// 이벤트 페이지

	@Override
	@RequestMapping(value = "/page/eventList.do", method = RequestMethod.GET)
	public String eventView(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();

		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);

		return "page/eventList";
	}

	@Override
	@RequestMapping(value = "/page/eventWin.do", method = RequestMethod.GET)
	public String eventwin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();

		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);

		return "page/eventWin";
	}

	@Override
	@RequestMapping(value = "/page/eventView.do", method = RequestMethod.GET)
	public String eventDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();

		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);

		return "page/eventView";
	}

	@Override
	@RequestMapping(value = "/mypage/businessReviewList.do", method = RequestMethod.GET)
	public ModelAndView businessReviewList(HttpServletRequest request, HttpServletResponse response, Criteria cri)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String uid = memberVO.getUid();

		mav.addObject("businessReviewList", pageService.businessReviewListCri(cri, uid));
		int total = pageService.TotalbusinessReviewList(cri, uid);
		pageVO pm = new pageVO(cri, total);

		mav.addObject("pm", pm);

		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;

	}

}
