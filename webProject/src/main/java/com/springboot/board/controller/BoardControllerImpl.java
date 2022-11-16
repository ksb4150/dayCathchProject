package com.springboot.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.springboot.board.service.BoardService;
import com.springboot.board.vo.BoardCommentVO;
import com.springboot.board.vo.BoardVO;
import com.springboot.board.vo.LikedVO;
import com.springboot.common.vo.Criteria;
import com.springboot.common.vo.pageVO;
import com.springboot.member.vo.MemberVO;

@Controller("boardController")

public class BoardControllerImpl implements BoardController {
	private static final String ARTICLE_IMAGE_FILE_NAME = "C:\\board\\article_image\\";
	private static final String ARTICLE_THUMNAIL_FILE_NAME = "C:\\board\\article_image\\thumbnail";

	@Autowired
	private BoardService boardService;
	@Autowired
	private BoardVO boardVO;

	@Override
	@RequestMapping(value = "/board/listArticles.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listArticles(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List<BoardVO> articlesList = boardService.listArticles();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("articlesList", articlesList);
		return mav;
	}

	@Override
	@RequestMapping(value = "/board/summernote.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView summernote(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		HttpSession session = request.getSession();

		MemberVO user = (MemberVO) session.getAttribute("member");
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("user", user);

		System.out.println(viewName);

		return mav;
	}

	@Override
	@RequestMapping("/board/write.do")
	public ResponseEntity write(BoardVO vo, MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		int flag = 0;
		int articleNO = vo.getArticleNO();

		String orginFileName = upload(multipartRequest, articleNO, flag);
		vo.setMainImageFileName(orginFileName);

		File srcFile = new File(ARTICLE_THUMNAIL_FILE_NAME + "\\" + "temp" + "\\" + articleNO);

		try {

			if (orginFileName != null && (orginFileName.length() != 0)) {
				File destDir = new File(ARTICLE_THUMNAIL_FILE_NAME + "\\" + articleNO);
				FileUtils.moveDirectory(srcFile, destDir);
			}

			boardService.insertBoard(vo);

			message = "<script>";
			message += "alert('글이 추가되었습니다.');";
			message += "location.href='" + multipartRequest.getContextPath() + "/page/community.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {

			FileUtils.deleteQuietly(srcFile);

			message = "<script>";
			message += "alert('오류가 발생했습니다. 다시 시도해주세요.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/page/community.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

			e.printStackTrace();

		}

		return resEnt;
	}

	@Override
	@RequestMapping("/board/modArticle.do")
	public ResponseEntity modArticle(BoardVO vo, MultipartHttpServletRequest multipartRequest,
			HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		int flag = 0;
		int articleNO = vo.getArticleNO();
		HttpSession session = multipartRequest.getSession();

		MemberVO user = (MemberVO) session.getAttribute("member");
		vo.setUid(user.getUid());

		String orginFileName = upload(multipartRequest, articleNO, flag);

		if (orginFileName != null && (orginFileName.length() != 0)) { // 사용자가 게시글 메인 사진을 바꿈
			vo.setMainImageFileName(orginFileName);
			File srcFile = new File(ARTICLE_THUMNAIL_FILE_NAME + "\\" + "temp" + "\\" + articleNO);

			try {

				File destDir = new File(ARTICLE_THUMNAIL_FILE_NAME + "\\" + articleNO);
				if (destDir.exists()) { // 전에 있던 메인 사진 있으면
					FileUtils.deleteDirectory(destDir); // 지우기
					if (!destDir.exists()) { // 삭제 됐다면
						FileUtils.moveDirectory(srcFile, destDir);
						System.out.println("파일 옮기기");
					} else {
						System.out.println("파일 옮기기 실패");
					}
				} else {
					System.out.println("파일이 없습니다. 이럴리가 없는데..");
				}

				boardService.updateBoard(vo);

				message = "<script>";
				message += "alert('글이 수정되었습니다.');";
				message += "location.href='" + multipartRequest.getContextPath() + "/page/community.do';";
				message += "</script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

			} catch (IOException ie) {

				FileUtils.deleteQuietly(srcFile);

				message = "<script>";
				message += "alert('파일 업로드 중 오류가 발생했습니다. 다시 시도해주세요.');";
				message += " location.href='" + multipartRequest.getContextPath() + "/page/community.do';";
				message += "</script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

				ie.printStackTrace();

			} catch (Exception e) {
				message = "<script>";
				message += "alert('오류가 발생했습니다. 다시 시도해주세요.');";
				message += " location.href='" + multipartRequest.getContextPath() + "/page/community.do';";
				message += "</script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

				e.printStackTrace();
			}
		} else { // 게시글 메인 사진을 안바궜을 때
			try {

				boardService.updateBoard(vo);

				message = "<script>";
				message += "alert('글이 수정되었습니다.');";
				message += "location.href='" + multipartRequest.getContextPath() + "/page/community.do';";
				message += "</script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			} catch (Exception e) {
				message = "<script>";
				message += "alert('오류가 발생했습니다. 다시 시도해주세요.');";
				message += " location.href='" + multipartRequest.getContextPath() + "/page/community.do';";
				message += "</script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

				e.printStackTrace();
			}

		}

		return resEnt;
	}

	@Override
	@RequestMapping("/board/viewBoard.do")
	public ModelAndView viewBoard(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("articleNO") int articleNO, Model model) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");

		if (member != null) {
			String uid = member.getUid();
			LikedVO liked = new LikedVO();
			liked.setUid(uid);
			liked.setArticleNO(articleNO);
			int boardlike = boardService.getBoardLike(liked);
			System.out.println(boardlike);
			model.addAttribute("heart", boardlike);
			Map resultMap = boardService.selectViewArticle(articleNO);
			mav.addObject("resultMap", resultMap);

		} else {
			Map resultMap = boardService.selectViewArticle(articleNO);
			mav.addObject("resultMap", resultMap);
		}
		return mav;
	}

	@Override
	@RequestMapping("/board/selectOneArticle.do")
	@ResponseBody
	public ResponseEntity selectArticle(@RequestParam("articleNO") int articleNO, HttpServletResponse multipartRequest,
			HttpServletResponse response) throws Exception {
		String board;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		board = boardService.selectOneArticle(articleNO);
		resEnt = new ResponseEntity(board, responseHeaders, HttpStatus.CREATED);

		return resEnt;
	}

	@Override
	@RequestMapping(value = "/board/njtour.do")
	public ModelAndView njtour(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(viewName);
		return mav;
	}

//2차 시도	
	@Override
	@ResponseBody
	@RequestMapping(value = "/board/summernoteImage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String uploadSummernoteImageFile(@RequestParam("articleNO") int articleNO,
			MultipartHttpServletRequest multipartFile, HttpServletRequest request) throws Exception {
		JsonObject jsonObject = new JsonObject();
		int flag = 2;

		String orginFileName = upload(multipartFile, articleNO, flag);
		File srcFile = new File(ARTICLE_IMAGE_FILE_NAME + "\\" + "temp" + "\\" + orginFileName);

		try {

			if (orginFileName != null && (orginFileName.length() != 0)) {
				File destDir = new File(ARTICLE_IMAGE_FILE_NAME + "\\" + articleNO);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
			}

			jsonObject.addProperty("url", "bImgDownload.do?articleNO=" + articleNO + "&orginFileName=" + orginFileName);
			jsonObject.addProperty("responseCode", "success");

		} catch (Exception e) {

			FileUtils.deleteQuietly(srcFile);
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();

		}

		String jsonValue = jsonObject.toString();

		return jsonValue;
	}

	@Override
	@ResponseBody
	@RequestMapping(value = "/board/summernoteDeleteImage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String summernoteDeleteImage(@RequestParam("articleNO") int articleNO,
			@RequestParam("fileName") String fileName, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		JsonObject jsonObject = new JsonObject();

		File file = new File(ARTICLE_IMAGE_FILE_NAME + "\\" + articleNO + "\\" + fileName); // 디렉터리 경로를 이용해 폴더를 만듦

		try {
			file.delete();
			jsonObject.addProperty("responseCode", "success");

		} catch (Exception e) {

			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();

		}

		String jsonValue = jsonObject.toString();

		return jsonValue;
	}

	// 썸머노트 사진 삭제
	private String delete(MultipartHttpServletRequest multipartRequest, int articleNO, int flag) throws Exception {
		String imageFileName = null;
		Iterator<String> fileNames = multipartRequest.getFileNames();
		boolean mainFlag = false;

		if (flag > 0) {
			while (fileNames.hasNext()) {
				String fileName = fileNames.next();
				MultipartFile mFile = multipartRequest.getFile(fileName);
				imageFileName = mFile.getOriginalFilename();
				File file = new File(ARTICLE_IMAGE_FILE_NAME + "\\" + "temp" + "\\" + fileName); // 디렉터리 경로를 이용해 폴더를 만듦

				if (mFile.getSize() != 0) {
					if (!file.exists()) {
						file.getParentFile().mkdirs();
						mFile.transferTo(new File(ARTICLE_IMAGE_FILE_NAME + "\\" + "temp" + "\\" + imageFileName));
					}
				}
			}
		}

		return imageFileName;
	}

	// 썸머노트 글 업로드하기
	private String upload(MultipartHttpServletRequest multipartRequest, int articleNO, int flag) throws Exception {
		String imageFileName = null;
		Iterator<String> fileNames = multipartRequest.getFileNames();
		boolean mainFlag = false;

		if (flag > 0) {
			while (fileNames.hasNext()) {
				String fileName = fileNames.next();
				MultipartFile mFile = multipartRequest.getFile(fileName);
				imageFileName = mFile.getOriginalFilename();
				File file = new File(ARTICLE_IMAGE_FILE_NAME + "\\" + "temp" + "\\" + fileName); // 디렉터리 경로를 이용해 폴더를 만듦

				if (mFile.getSize() != 0) {
					if (!file.exists()) {
						file.getParentFile().mkdirs();
						mFile.transferTo(new File(ARTICLE_IMAGE_FILE_NAME + "\\" + "temp" + "\\" + imageFileName));
					}
				}
			}
		} else { // 메인 이미지 올리기

			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			imageFileName = mFile.getOriginalFilename();
			File file = new File(ARTICLE_THUMNAIL_FILE_NAME + "\\" + "temp" + "\\" + articleNO + "\\" + fileName); // 디렉터리
																													// 경로를
																													// 이용해
																													// 폴더를
																													// 만듦

			if (mFile.getSize() != 0) {
				if (!file.exists()) {
					file.getParentFile().mkdirs();
					mFile.transferTo(new File(
							ARTICLE_THUMNAIL_FILE_NAME + "\\" + "temp" + "\\" + articleNO + "\\" + imageFileName));
				}
			}

			return imageFileName;
		}

		return imageFileName;
	}

	// 사용자가 자기 글 삭제하기
	@Override
	@RequestMapping(value = "/board/removeArticle.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity removeArticle(@RequestParam("articleNO") int articleNO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=utf-8");
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		try {
			boardService.removeArticle(articleNO);
			File destIDir = new File(ARTICLE_IMAGE_FILE_NAME + "\\" + articleNO);
			FileUtils.deleteDirectory(destIDir);
			File destTDir = new File(ARTICLE_THUMNAIL_FILE_NAME + "\\" + articleNO);
			FileUtils.deleteDirectory(destTDir);

			message = "<script>";
			message += "alert('글을 삭제했습니다.');";
			message += "location.href='" + request.getContextPath() + "/page/community.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			message = "<script>";
			message += "alert('작업중 오류가 발생했습니다. 다시 시도해주세요.');";
			message += "loaction.href='" + request.getContextPath() + "/board/listArticles.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

			e.printStackTrace();
		}

		return resEnt;
	} // end removeArticle

	@Override
	@RequestMapping(value = "/board/addBoardComment.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView boardComment(HttpServletRequest request, HttpServletResponse response,
			BoardCommentVO boardComment) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();

		MemberVO user = (MemberVO) session.getAttribute("member");

		boardComment.setUid(user.getUid());
		boardComment.setUserName(user.getUserName());
		// mav.addObject("articleNO", );

		int result = boardService.addBoardComment(boardComment);

		System.out.println(viewName);

		mav.setViewName("redirect:/board/viewBoard.do?articleNO=" + boardComment.getArticleNO());
		return mav;
	}

	// 기본값인 최신순 조회
	@Override
	@RequestMapping(value = "/board/myArticleList1.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView myArticleList1(HttpServletRequest request, HttpServletResponse response, Criteria cri,
			HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String uid = memberVO.getUid();

		cri.setUid(uid);

		String category = cri.getSearch();
		// 인기순
		if (category != null) {
			mav.addObject("myArticleList", boardService.myArticleList2(cri));
		} else {
			// 최신순
			mav.addObject("myArticleList", boardService.myArticleList1(cri));
		}
		int total = boardService.totalArticlePage1(cri);
		pageVO pm = new pageVO(cri, total);
		mav.addObject("pm", pm);
		mav.addObject("category", category);

		mav.setViewName("/board/myArticleList1");

		return mav;
	} // end

	// 카테고리별 조회
	@Override
	@RequestMapping(value = "/board/myArticleList2.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView myArticleList2(HttpServletRequest request, HttpServletResponse response, Criteria cri,
			HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String uid = memberVO.getUid();

		cri.setUid(uid);

		String category = cri.getSearch();

		mav.addObject("myArticleList", boardService.myArticleList3(cri));
		int total = boardService.totalArticlePage2(cri);
		pageVO pm = new pageVO(cri, total);

		mav.addObject("pm", pm);

		mav.addObject("category", category);

		mav.setViewName("/mypage/myArticleList1");

		return mav;
	} // end

	@ResponseBody
	@RequestMapping(value = "/board/heart", method = RequestMethod.POST, produces = "application/json")
	public int heart(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		int heart = Integer.parseInt(request.getParameter("heart"));
		int articleNO = Integer.parseInt(request.getParameter("articleNO"));
		MemberVO member = (MemberVO) session.getAttribute("member");
		String uid = member.getUid();
		LikedVO liked = new LikedVO();

		liked.setArticleNO(articleNO);
		liked.setUid(uid);

		System.out.println(heart);

		if (heart >= 1) {
			boardService.deleteBoardLike(liked);
			heart = 0;
		} else {
			boardService.insertBoardLike(liked);
			heart = 1;
		}

		return heart;

	}

	// 내 댓글 조회
	@Override
	@RequestMapping(value = "/board/mycommentList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView myCommentList(HttpServletRequest request, HttpServletResponse response, Criteria cri,
			HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String uid = memberVO.getUid();

		cri.setUid(uid);

		mav.addObject("myCommentList", boardService.myCommentList(cri));
		int total = boardService.totalCommentPage(cri);
		pageVO pm = new pageVO(cri, total);
		mav.addObject("member", memberVO);
		mav.addObject("pm", pm);

		mav.setViewName("board/mycommentList");

		return mav;
	} // end

	// 댓글 삭제하기 삭제하기
	@Override
	@RequestMapping(value = "/board/removecomment.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView removecomment(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			String uid, int commentNo) throws Exception {
		ModelAndView mav = new ModelAndView();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		BoardCommentVO bc = new BoardCommentVO();
		bc.setCommentNo(commentNo);
		bc.setUid(uid);
		boardService.removecomment(bc);
		if (memberVO.getUserType() != 3) {
			mav.setViewName("redirect:/board/mycommentList.do");
		} else {
			mav.setViewName("redirect:/admin/adminCommentList.do");
		}
		return mav;
	}
}
