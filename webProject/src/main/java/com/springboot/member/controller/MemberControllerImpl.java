package com.springboot.member.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.springboot.common.vo.Criteria;
import com.springboot.member.service.MemberService;
import com.springboot.member.vo.KakaoVO;
import com.springboot.member.vo.MemberVO;

@Controller
public class MemberControllerImpl implements MemberController {
	private static final String USER_IMAGE_FILE_NAME = "C:\\user\\user_image";
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberVO memberVO;
	@Autowired
	private HttpSession session;
	@Autowired
	private PasswordEncoder pwEncoder;

	public MemberControllerImpl() {
		System.out.println("MemberController constructor");
	}

	@RequestMapping(value = { "/", "/main.do" }, method = RequestMethod.GET)
	private ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();

		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value = "/member/login.do", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("member") MemberVO member, RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String rawPw = "";
		String encodePw = "";

		MemberVO login = memberService.login(member);
		if (login != null) {

			rawPw = member.getUserPwd(); // 사용자가 제출한 비밀번호
			encodePw = login.getUserPwd(); // 데이터베이스에 저장한 인코딩 비밀번호
			if (true == pwEncoder.matches(rawPw, encodePw)) { // 비밀번호 일치 여부 판단
				login.setUserPwd(""); // 인코딩된 비밀번호 지움
				session.setAttribute("member", login); // session에 사용자정보 저장
				session.setAttribute("isLogOn", true);
				mav.setViewName("redirect:/page/mainPage.do");
			} else {
				rAttr.addFlashAttribute("result", "loginFailed");
				mav.setViewName("redirect:/member/loginForm.do");
			}
		} else { // 일치하는 아이디가 존재하지 않을 때
			rAttr.addFlashAttribute("result", "loginFailed");
			mav.setViewName("redirect:/member/loginForm.do");
		}

		return mav;
	}

	@Override
	@RequestMapping(value = "/member/businessLogin.do", method = RequestMethod.POST)
	public ModelAndView businessLogin(@ModelAttribute("member") MemberVO membervo, RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		memberVO = memberService.login(membervo);
		if (memberVO != null) {
			HttpSession session = request.getSession();
			session.setAttribute("member", memberVO);
			session.setAttribute("isLogOn", true);
			mav.setViewName("redirect:/page/mainPage.do");
		} else {
			rAttr.addFlashAttribute("result", "loginFailed");
			mav.setViewName("redirect:/member/loginForm.do");
		}
		return mav;
	}

	@Override
	@RequestMapping(value = "/member/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("isLogOn");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/page/mainPage.do");

		return mav;
	}

	@RequestMapping(value = "/member/loginForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView loginForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(viewName);

		return mav;
	} // end

	@RequestMapping(value = "/member/businessLoginForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView businessLoginForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(viewName);

		return mav;
	} // end

	@Override
	@RequestMapping(value = "/member/addMember.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView addMember(MemberVO member, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("utf-8");

		String Uuid = RandomStringUtils.random(6, true, true);
		member.setUid(Uuid);

		String rawPw = "";
		String encodePw = "";

		rawPw = member.getUserPwd();
		encodePw = pwEncoder.encode(rawPw);
		member.setUserPwd(encodePw);

		int result = 0;
		result = memberService.addMember(member);
		ModelAndView mav = new ModelAndView("redirect:/page/mainPage.do");

		return mav;
	}

	@Override
	@RequestMapping(value = "/member/businessAddMember.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ResponseEntity businessAddMember(MemberVO member, MultipartHttpServletRequest multipartRequest,
			HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");

		Map<String, Object> BmemberMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			BmemberMap.put(name, value);
		}

		String uid = RandomStringUtils.random(6, true, true);
		member.setUid(uid);

		String rawPw = "";
		String encodePw = "";

		rawPw = member.getUserPwd();
		encodePw = pwEncoder.encode(rawPw);
		member.setUserPwd(encodePw);

		List<String> userImageFileName = upload(multipartRequest, uid); // 상품의 다중 이미지들 이름이 들어있는 리스트

		HttpSession session = multipartRequest.getSession();

		BmemberMap.put("uid", uid);
		BmemberMap.put("userImageFileName", userImageFileName.get(0));
		BmemberMap.put("businessPic", userImageFileName.get(1)); // 대표 이미지는 goodId로 저장해서

		member.setBusinessPic(userImageFileName.get(1));
		member.setUserImageFileName(userImageFileName.get(0));

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		int result = 0;
		result = memberService.businessAddMember(member);
		int thumFlag = 0;

		if (userImageFileName.get(0) != null && (userImageFileName.size() != 0)) {
			File srcFile = new File(USER_IMAGE_FILE_NAME + "\\" + "temp" + "\\" + userImageFileName.get(0));
			File destDir = new File(USER_IMAGE_FILE_NAME + "\\" + uid);
			FileUtils.moveFileToDirectory(srcFile, destDir, true);
		}
		if (userImageFileName.get(1) != null && (userImageFileName.size() != 0)) {
			File srcFile = new File(USER_IMAGE_FILE_NAME + "\\" + "temp" + "\\" + userImageFileName.get(1));
			File destDir = new File(USER_IMAGE_FILE_NAME + "\\" + uid);
			FileUtils.moveFileToDirectory(srcFile, destDir, true);
		}

		message = "<script>";
		message += "alert('회원가입이 되었습니다.');";
		message += "location.href='" + multipartRequest.getContextPath() + "/page/mainPage.do';";
		message += "</script>";
		resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		return resEnt;
	}

	@RequestMapping(value = "/mypage/mypage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView mypage(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		MemberVO member = (MemberVO) session.getAttribute("member");
		Criteria cri = new Criteria();
		String uid = member.getUid();
		cri.setUid(uid);

		int cartcount = memberService.cartCount(uid);
		int likecount = memberService.likeCount(uid);
		int ordercount = memberService.totalOrderCount(uid);
		int ordercancelcount = memberService.totalOrderCancelCount(uid);
		int cscount = memberService.csCount(uid);
		int articlecount = memberService.articleCount(uid);
		int commentcount = memberService.commentCount(uid);

		mav.addObject("member", member);
		mav.addObject("cartcount", cartcount);
		mav.addObject("likecount", likecount);
		mav.addObject("ordercount", ordercount);
		mav.addObject("ordercancelcount", ordercancelcount);
		mav.addObject("cscount", cscount);
		mav.addObject("articlecount", articlecount);
		mav.addObject("commentcount", commentcount);

		mav.setViewName("/mypage/mypage");
		return mav;
	} // end


@RequestMapping(value = "/mypage/businessPage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView businessPage(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		MemberVO member = (MemberVO) session.getAttribute("member");
		String uid = member.getUid();
		int orderCount = memberService.businessorderCount(uid);
		int orderCancelCount = memberService.businessorderCancelCount(uid);
		int enrollGoods = memberService.enrollGoods(uid);
		int waitingGoods = memberService.waitingGoods(uid);
		Integer businessEarning = memberService.businessEarning(uid);
		if(businessEarning == null) {
			businessEarning = 0;
		}
		
		mav.addObject("member", member);
		mav.addObject("orderCount", orderCount);
		mav.addObject("orderCancelCount", orderCancelCount);
		mav.addObject("enrollGoods", enrollGoods);
		mav.addObject("waitingGoods", waitingGoods);
		mav.addObject("businessEarning", businessEarning);
		
		mav.setViewName("/mypage/businessPage");
		
		return mav;
	} // end

	@Override
	@RequestMapping(value = "/member/overlapCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, String> userIdOverlapCheck(@RequestParam("id") String id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String result = memberService.userIdOverlapCheckService(id);

		HashMap<String, String> resEnt = new HashMap<String, String>();

		if (result.equals(id)) { // 사용 불가능
			resEnt.put("re", "false");

			return resEnt;
		} else { // 사용 가능
			resEnt.put("userId", result);
			resEnt.put("re", "true");

			return resEnt;
		}
	} // end

	@Override
	@RequestMapping(value = "/member/addMemberForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView addMemberForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");

		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(viewName);

		return mav;
	} // end

	@Override
	@RequestMapping(value = "/member/businessAddMemberForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView businessAddMemberForm(MemberVO member, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");

		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(viewName);

		return mav;
	}

	// 아이디 찾기 페이지 이동
	@Override
	@RequestMapping(value = "/member/findId.do", method = RequestMethod.GET)
	public ModelAndView findIdView(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");

		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(viewName);

		return mav;
	}

	// 아이디 찾기 실행
	@Override
	@RequestMapping(value = "/member/findingId", method = RequestMethod.POST)
	public String findingId(MemberVO member, Model model) throws Exception {
		MemberVO members = memberService.findId(member);

		if (members == null) {
			model.addAttribute("check", 1);
		} else {
			model.addAttribute("check", 0);
			model.addAttribute("id", members.getUserId());
		}

		return "member/findId";
	}

	// 비밀번호 찾기 페이지로 이동
	@Override
	@RequestMapping(value = "/member/findPw.do", method = RequestMethod.GET)
	public ModelAndView findPwdView(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");

		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(viewName);

		return mav;
	}

	// 비밀번호 찾기 실행
	@Override
	@RequestMapping(value = "/member/findingPwd", method = RequestMethod.POST)
	public void findingPwd(@ModelAttribute MemberVO vo, HttpServletResponse response) throws Exception {

		memberService.findPw(response, vo);
	}

	@Override
	@RequestMapping(value = "/member/memberModify.do", method = RequestMethod.GET)
	public String memberModifyView() throws Exception {
		return "/member/memberModify";
	} // end

	@Override
	@RequestMapping(value = "/member/memberModify", method = RequestMethod.POST)
	public String memberModify(MemberVO memberVO, HttpSession session) throws Exception {

		memberService.memberModify(memberVO);
		session.invalidate();

		return "redirect:/member/loginForm.do";
	}

	// 카카오 로그인 토큰 받기
		@Override
		@RequestMapping(value = "/oauth/kakao", method = RequestMethod.GET)
		public ModelAndView kakaoLogin(@RequestParam(value = "code", required = false) String code, Model model,
				RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception {
			System.out.println("#########" + code);
			ModelAndView mav = new ModelAndView();

			KakaoVO kakao = new KakaoVO();
			String access_Token = memberService.getAccessToken(code);
			MemberVO userInfo = memberService.getUserInfo(access_Token); // 로그인, 회원가입까지 하고 db에 저장한 후
			
			if (userInfo != null) {
				session.setAttribute("member", userInfo);
				session.setAttribute("isLogOn", true);
				mav.setViewName("redirect:/page/mainPage.do");
			} else {
				rAttr.addFlashAttribute("result", "loginFailed");
				mav.setViewName("redirect:/member/loginForm.do");
			}

			return mav;
		}

		//네이버 로그인 callback
			@Override
			@RequestMapping(value = "/member/callback", method = RequestMethod.GET)
			public String callBack() {
				return "/member/callback";
			}

			//네이버 로그인 정보 저장
			@Override
			@RequestMapping(value = "/member/naverSave", method = { RequestMethod.GET, RequestMethod.POST })
			public @ResponseBody String naverSave(@RequestParam("n_name") String n_name,
					@RequestParam("n_email") String n_email, Model model, RedirectAttributes rAttr, HttpServletRequest request,
					HttpServletResponse response) throws Exception {
				System.out.println(n_name);
				System.out.println(n_email);
				
				ModelAndView mav = new ModelAndView();
				System.out.println("naver controller");
				String result = null;
				
				String Uuid = RandomStringUtils.random(6, true, true);

				MemberVO memberInfo = new MemberVO();
					memberInfo.setUid(Uuid);
					memberInfo.setUserName(n_name);
					memberInfo.setUserId(n_email);
					memberInfo.setUserType(1);
				
				MemberVO memberInfo1 = memberService.naverSave(memberInfo);
								
				if (memberInfo1 != null) {
					session.setAttribute("member", memberInfo1);
					session.setAttribute("isLogOn", true);
					mav.setViewName("redirect:/page/mainPage.do");
					result = "ok";

				} else {
					rAttr.addFlashAttribute("result", "loginFailed");
					mav.setViewName("redirect:/member/loginForm.do");
					result = "off";
				}

				return result;
			}

	// 문자 인증
	@RequestMapping(value = "/member/phoneCheck", method = RequestMethod.GET)
	@ResponseBody
	public String sendSMS(@RequestParam("phone") String userPhoneNumber) throws Exception { // 휴대폰 문자보내기
		int randomNumber = (int) ((Math.random() * (9999 - 1000 + 1)) + 1000);// 난수 생성

		memberService.phoneCheck(userPhoneNumber, randomNumber);

		return Integer.toString(randomNumber);
	}

	// 다중 이미지 업로드
	private List<String> upload(MultipartHttpServletRequest multipartRequest, String uid) throws Exception {
		List<String> fileList = new ArrayList<String>();
		Iterator<String> fileNames = multipartRequest.getFileNames(); // jsp에서 file[cnt]들이 들어감

		while (fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName = mFile.getOriginalFilename();

			File file = new File(USER_IMAGE_FILE_NAME + "\\" + "temp" + "\\" + fileName);
			if (mFile.getSize() != 0) {// File Null Check
				if (!file.exists()) {
					file.getParentFile().mkdirs();
					mFile.transferTo(new File(USER_IMAGE_FILE_NAME + "\\" + "temp" + "\\" + originalFileName));
					fileList.add(originalFileName);
				}
			}

		}

		return fileList;
	}

	// 비지니스 회원정보 수정
	@Override
	@RequestMapping(value = "/mypage/businessModMemberPage.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ModelAndView businessModMemberPage(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");

		String uid = memberVO.getUid();

		Map businessMemberMap = memberService.selectBusinessMember(uid);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("businessMemberMap", businessMemberMap);
		System.out.println(viewName);
		return mav;

	} // end

	// 비지니스 회원정보 수정
	@Override
	@RequestMapping(value = "/mypage/businessModMember.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ResponseEntity businessModMember(MemberVO member, MultipartHttpServletRequest multipartRequest,
			HttpServletResponse response) throws Exception {
		String viewName = (String) multipartRequest.getAttribute("viewName");

		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");

		String uid = memberVO.getUid();
		int result = 0;

		Map<String, Object> businessMemberMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			businessMemberMap.put(name, value);
		}

		businessMemberMap.put("uid", uid);
		String imageFileName = upload1(multipartRequest, uid);
		businessMemberMap.put("userImageFileName", imageFileName);

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			result = memberService.updateMemberModify(businessMemberMap);
			if (imageFileName != null && imageFileName.length() != 0) {

				String originalFileName = (String) businessMemberMap.get("originalFileName");
				File oldFile = new File(USER_IMAGE_FILE_NAME + "\\" + originalFileName);
				File odestDir = new File(USER_IMAGE_FILE_NAME + "\\" + uid);
				FileUtils.deleteDirectory(odestDir);

				File srcFile = new File(USER_IMAGE_FILE_NAME + "\\" + "temp" + "\\" + imageFileName);
				File destDir = new File(USER_IMAGE_FILE_NAME + "\\" + uid + "\\");
				FileUtils.moveFileToDirectory(srcFile, destDir, true);

			}
			message = "<script>";
			message += "alert('수정되었습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/page/mainPage.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			message = "<script>";
			message += " alert('오류.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/mypage/businessModMemberPage.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}
		return resEnt;
	}

	private String upload1(MultipartHttpServletRequest multipartRequest, String uid) throws Exception {
		String imageFileName = null;
		Iterator<String> fileNames = multipartRequest.getFileNames();

		while (fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);

			if (mFile.getSize() != 0) {
				imageFileName = uid + ".jpg";
				File file = new File(USER_IMAGE_FILE_NAME + "\\" + "temp" + "\\" + fileName);
				if (!file.exists()) {
					file.getParentFile().mkdirs();
					mFile.transferTo(new File(USER_IMAGE_FILE_NAME + "\\" + "temp" + "\\" + uid + ".jpg"));

				}
			}
		}
		return imageFileName;
	}

	// 회원탈퇴

	@Override
	@RequestMapping(value = "/member/memberDelete.do", method = RequestMethod.GET)
	public ModelAndView memberDeleteView(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		MemberVO member = (MemberVO) session.getAttribute("member");
		member.getUid();

		return mav;
	}

	@Override
	@RequestMapping(value = "/member/memberDelete", method = RequestMethod.POST)
	public String memberDelete(MemberVO memberVO, HttpSession session, RedirectAttributes rttr) throws Exception {

		memberService.memberDelete(memberVO);
		session.invalidate();
		return "redirect:/page/mainPage.do";
	}

	@Override
	@ResponseBody
	@RequestMapping(value = "/member/passChk", method = RequestMethod.POST)
	public boolean passChk(MemberVO memberVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		MemberVO login = memberService.login(memberVO);
		boolean pwdChk = pwEncoder.matches(memberVO.getUserPwd(), login.getUserPwd());
		return pwdChk;
	}

	// 암호화 비밀번호 변경

	@Override
	@RequestMapping(value = "/member/modifyPw.do", method = RequestMethod.GET)
	public String modifyPwView(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(viewName);
		return "/member/modifyPw";
	} // end

	@Override
	@RequestMapping(value = "/member/modifyPw", method = RequestMethod.POST)
	public String modifyPw(MemberVO member, HttpSession session, String userPwd1) throws Exception {
		if (member.getUserPwd() != null) {
			member.setUserPwd(pwEncoder.encode(userPwd1));
		}
		memberService.pwUpdate(member);

		return "redirect:/member/loginForm.do";
	}

}
