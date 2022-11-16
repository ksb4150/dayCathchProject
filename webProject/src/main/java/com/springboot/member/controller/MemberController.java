package com.springboot.member.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.springboot.member.vo.MemberVO;

public interface MemberController {
	public HashMap<String, String> userIdOverlapCheck(@RequestParam("id") String id, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView login(@ModelAttribute("member") MemberVO member, RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView loginForm(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView addMember(MemberVO member, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public ModelAndView mypage(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception;

	public ModelAndView findIdView(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public String findingId(MemberVO member, Model model) throws Exception;

	public void findingPwd(@ModelAttribute MemberVO member, HttpServletResponse response) throws Exception;

	public ModelAndView findPwdView(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public String memberModifyView() throws Exception;

	public String memberModify(MemberVO memberVO, HttpSession session) throws Exception;

	public ModelAndView addMemberForm(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView kakaoLogin(@RequestParam(value = "code", required = false) String code, Model model,
			RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception;

	public String callBack();

	public @ResponseBody String naverSave(@RequestParam("n_name") String n_name,
			@RequestParam("n_email") String n_email, Model model, RedirectAttributes rAttr, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public String sendSMS(@RequestParam("phone") String userPhoneNumber) throws Exception;

	public ModelAndView businessAddMemberForm(MemberVO member, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public ModelAndView businessPage(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception;

	public ResponseEntity businessAddMember(MemberVO member, MultipartHttpServletRequest multipartRequest,
			HttpServletResponse response) throws Exception;

	public ModelAndView businessLoginForm(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView businessLogin(@ModelAttribute("member") MemberVO membervo, RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView businessModMemberPage(HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public ResponseEntity businessModMember(MemberVO member, MultipartHttpServletRequest multipartRequest,
			HttpServletResponse response) throws Exception;

	public ModelAndView memberDeleteView(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public String memberDelete(MemberVO memberVO, HttpSession session, RedirectAttributes rttr) throws Exception;

	public boolean passChk(MemberVO memberVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public String modifyPwView(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public String modifyPw(MemberVO member, HttpSession session, String userPwd1) throws Exception;

}
