package com.springboot.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.board.vo.BoardCommentVO;
import com.springboot.board.vo.BoardVO;
import com.springboot.common.vo.Criteria;

public interface BoardController {
	public ModelAndView listArticles(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ResponseEntity write(BoardVO vo, MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception;

	public ResponseEntity selectArticle(@RequestParam("articleNO") int articleNO, HttpServletResponse multipartRequest,
			HttpServletResponse response) throws Exception;

	public String uploadSummernoteImageFile(@RequestParam("articleNO") int articleNO,
			MultipartHttpServletRequest multipartFile, HttpServletRequest request) throws Exception;

	public ModelAndView summernote(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView njtour(HttpServletRequest request, HttpServletResponse response) throws Exception;

//	public JsonObject uploadSummernoteImageFile(@RequestParam("articleNO") int articleNO, MultipartFile multipartFile, 
//			HttpServletRequest request ) throws Exception;
//	public String uploadSummernoteImageFile(@RequestParam("articleNO") int articleNO, MultipartFile multipartFile, 
//			HttpServletRequest request ) throws Exception;
	public ResponseEntity removeArticle(int articleNO, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public ModelAndView boardComment(HttpServletRequest request, HttpServletResponse response,
			BoardCommentVO boardComment) throws Exception;

	public String summernoteDeleteImage(@RequestParam("articleNO") int articleNO,
			@RequestParam("fileName") String fileName, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public ModelAndView viewBoard(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("articleNO") int articleNO, Model model) throws Exception;

	public ResponseEntity modArticle(BoardVO vo, MultipartHttpServletRequest multipartRequest,
			HttpServletResponse response) throws Exception;

	public ModelAndView myArticleList1(HttpServletRequest request, HttpServletResponse response, Criteria cri,
			HttpSession session) throws Exception;

	public ModelAndView myArticleList2(HttpServletRequest request, HttpServletResponse response, Criteria cri,
			HttpSession session) throws Exception;

	public ModelAndView myCommentList(HttpServletRequest request, HttpServletResponse response, Criteria cri,
			HttpSession session) throws Exception;

	public ModelAndView removecomment(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			String uid, int commentNo) throws Exception;
}
