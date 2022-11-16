package com.springboot.goods.controller;

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
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.goods.service.GoodsService;
import com.springboot.goods.vo.GoodreviewVO;
import com.springboot.goods.vo.GoodsLikeVO;
import com.springboot.goods.vo.GoodsVO;
import com.springboot.goods.vo.LodgingDetailVO;
import com.springboot.goods.vo.OrderVO;
import com.springboot.goods.vo.TouristVO;
import com.springboot.member.vo.MemberVO;
import com.springboot.page.vo.ImageVO;

@Controller("goodsController")

public class GoodsControllerImpl implements GoodsController {
	private static final String GOODS_THUMBNAIL_FILE_NAME = "C:\\goods\\goods_Images\\thumbnail";
	private static final String GOODS_IMAGES_FILE_NAME = "C:\\goods\\goods_Images";
	@Autowired
	private GoodsService goodsService;
	@Autowired
	private GoodsVO goodsVO;
	@Autowired
	private LodgingDetailVO lodgingdetailVO;
	@Autowired
	private OrderVO orderVO;
	@Autowired
	private TouristVO touristVO;
	@Autowired
	private MemberVO memberVO;

	public GoodsControllerImpl() {

	}

	// 상품 등록 페이지 이동
	@RequestMapping(value = "/goods/goodsWritePage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView goodsWrite(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(viewName);
		return mav;
	} // end

	// 숙소 등록 페이지 이동
	@RequestMapping(value = "/goods/goodsWrite1.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView goodsWrite1(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(viewName);
		return mav;
	} // end

	// 투어 & 티켓 등록 페이지 이동
	@RequestMapping(value = "/goods/goodsWrite2.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView goodsWrite2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(viewName);
		return mav;
	} // end

	// 숙박 등록
	@Override
	@RequestMapping(value = "/goods/goodsWrite3.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ResponseEntity goodsWrite1(GoodsVO goods, LodgingDetailVO lodging,
			MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		String goodsImageFileName = null;

		Map<String, Object> goodsMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			goodsMap.put(name, value);
		}

		String GgoodsId = RandomStringUtils.random(6, false, true);
		int GggoodsId = Integer.parseInt(GgoodsId);

		List<String> goodsImageFileList = upload(multipartRequest, GggoodsId); // 상품의 다중 이미지들 이름이 들어있는 리스트

		HttpSession session = multipartRequest.getSession();
		List<ImageVO> imageFileList = new ArrayList<ImageVO>(); // 상품의 이미지 객체가 들어있는 리스트

		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String uid = memberVO.getUid();
		String companyName = memberVO.getCompanyName();
		goodsMap.put("uid", uid);
		goodsMap.put("goodsId", GggoodsId);
		goodsMap.put("goodsImageFileName", GggoodsId + ".jpg"); // 대표 이미지는 goodId로 저장해서
		goodsMap.put("companyName", companyName);
		lodging.setGoodsId(GggoodsId); // 만들어준 goodsId 넣어주기

		if (goodsImageFileList != null && goodsImageFileList.size() != 0) {
			for (String fileName : goodsImageFileList) {
				ImageVO imageVO = new ImageVO();
				imageVO.setOrginFileName(fileName);
				imageVO.setGoodsId(GggoodsId);
				imageFileList.add(imageVO);
			}
			imageFileList.remove(0);
		}

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		int result = goodsService.goodsWrite1(goodsMap);
		int result1 = goodsService.lodgingdetail(lodging);
			goodsMap.put("imageFileList", imageFileList);
		int reulst2 = goodsService.goodsImgList(goodsMap);
		int goodsId = (int) goodsMap.get("goodsId");
		int thumFlag = 0;

		if (goodsImageFileList != null && (goodsImageFileList.size() != 0)) {

			all: for (ImageVO imageVO : imageFileList) {
				goodsImageFileName = imageVO.getOrginFileName();
				while (thumFlag < 1) {
					File TsrcFile = new File(GOODS_THUMBNAIL_FILE_NAME + "\\" + "temp" + "\\" + GggoodsId + ".jpg");
					File TdestDir = new File(GOODS_THUMBNAIL_FILE_NAME);
					FileUtils.moveFileToDirectory(TsrcFile, TdestDir, true);

					thumFlag++;
				}

				File srcFile = new File(
						GOODS_IMAGES_FILE_NAME + "\\" + "temp" + "\\" + GggoodsId + "\\" + goodsImageFileName);
				File destDir = new File(GOODS_IMAGES_FILE_NAME + "\\" + GggoodsId);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);

			}
		}

		message = "<script>";
		message += "alert('상품을 추가했습니다.');";
		message += "location.href='" + multipartRequest.getContextPath() + "/goods/goodsList.do';";
		message += "</script>";
		resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		return resEnt;
	}

	@Override
	@RequestMapping(value = "/goods/goodsWrite4.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ResponseEntity goodsWrite2(GoodsVO goods, LodgingDetailVO ticket,
			MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		String goodsImageFileName = null;

		Map<String, Object> goodsMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			goodsMap.put(name, value);
		}

		String GgoodsId = RandomStringUtils.random(6, false, true);
		int GggoodsId = Integer.parseInt(GgoodsId);

		List<String> goodsImageFileList = upload(multipartRequest, GggoodsId);

		HttpSession session = multipartRequest.getSession();
		List<ImageVO> imageFileList = new ArrayList<ImageVO>(); // 상품의 이미지 객체가 들어있는 리스트

		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String uid = memberVO.getUid();
		String companyName = memberVO.getCompanyName();
		goodsMap.put("uid", uid);
		goodsMap.put("goodsId", GggoodsId);
		goodsMap.put("goodsImageFileName", GggoodsId + ".jpg"); // 대표 이미지는 goodId로 저장해서
		goodsMap.put("companyName", companyName);
		ticket.setGoodsId(GggoodsId); // 만들어준 goodsId 넣어주기

		if (goodsImageFileList != null && goodsImageFileList.size() != 0) {
			for (String fileName : goodsImageFileList) {
				ImageVO imageVO = new ImageVO();
				imageVO.setOrginFileName(fileName);
				imageVO.setGoodsId(GggoodsId);
				imageFileList.add(imageVO);
			}
			imageFileList.remove(0);
		}

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		try {

			int result = goodsService.goodsWrite2(goodsMap);
			int result1 = 0;
			result1 = goodsService.ticketdetail(ticket);
			goodsMap.put("imageFileList", imageFileList);
			int reulst2 = goodsService.goodsImgList(goodsMap);
			int thumFlag = 0;

			if (goodsImageFileList != null && (goodsImageFileList.size() != 0)) {

				all: for (ImageVO imageVO : imageFileList) {
					goodsImageFileName = imageVO.getOrginFileName();
					while (thumFlag < 1) {
						File TsrcFile = new File(GOODS_THUMBNAIL_FILE_NAME + "\\" + "temp" + "\\" + GggoodsId + ".jpg");
						File TdestDir = new File(GOODS_THUMBNAIL_FILE_NAME);
						FileUtils.moveFileToDirectory(TsrcFile, TdestDir, true);

						thumFlag++;
					}

					File srcFile = new File(
							GOODS_IMAGES_FILE_NAME + "\\" + "temp" + "\\" + GggoodsId + "\\" + goodsImageFileName);
					File destDir = new File(GOODS_IMAGES_FILE_NAME + "\\" + GggoodsId);
					FileUtils.moveFileToDirectory(srcFile, destDir, true);

				}
			}
			message = "<script>";
			message += "alert('상품을 추가했습니다.');";
			message += "location.href='" + multipartRequest.getContextPath() + "/page/mainPage.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			File TsrcFile = new File(GOODS_THUMBNAIL_FILE_NAME + "\\" + "temp" + "\\" + goodsImageFileName);
			TsrcFile.delete();
			File srcFile = new File(
					GOODS_IMAGES_FILE_NAME + "\\" + "temp" + "\\" + GggoodsId + "\\" + goodsImageFileName);
			srcFile.delete();

			message = "<script>";
			message += "alert('오류가 발생했습니다. 다시 시도해주세요.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/goods/goodsWrite2.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

	private List<String> upload(MultipartHttpServletRequest multipartRequest, int goodsId) throws Exception {
		List<String> fileList = new ArrayList<String>();
		Iterator<String> fileNames = multipartRequest.getFileNames(); // jsp에서 file[cnt]들이 들어감
		int thumFlag = 0;

		all: while (fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName = mFile.getOriginalFilename();

			while (thumFlag < 1) { // 회사의 대표 이미지 한 개만 들어가게 함, 이미지의 이름은 goodsId로 들어감
				File file = new File(GOODS_THUMBNAIL_FILE_NAME + "\\" + "temp" + "\\" + fileName);
				if (mFile.getSize() != 0) {// File Null Check
					if (!file.exists()) {
						file.getParentFile().mkdirs();
						mFile.transferTo(new File(GOODS_THUMBNAIL_FILE_NAME + "\\" + "temp" + "\\" + goodsId + ".jpg"));
						fileList.add(goodsId + ".jpg");
					}
				}
				thumFlag++;
				continue all;
			}

			File file = new File(GOODS_IMAGES_FILE_NAME + "\\" + "temp" + "\\" + goodsId + "\\" + fileName);
			if (mFile.getSize() != 0) {// File Null Check
				if (!file.exists()) {
					file.getParentFile().mkdirs();
					mFile.transferTo(new File(
							GOODS_IMAGES_FILE_NAME + "\\" + "temp" + "\\" + goodsId + "\\" + originalFileName));
					fileList.add(originalFileName);
				}
			}
		}
		return fileList;
	}

	// 한개 이미지 업로드
	private String upload1(MultipartHttpServletRequest multipartRequest, int goodsId) throws Exception {
		String imageFileName = null;
		Iterator<String> fileNames = multipartRequest.getFileNames();

		while (fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);

			if (mFile.getSize() != 0) {
				imageFileName = goodsId + ".jpg";
				File file = new File(GOODS_THUMBNAIL_FILE_NAME + "\\" + "temp" + "\\" + fileName);
				if (!file.exists()) {
					file.getParentFile().mkdirs();
					mFile.transferTo(new File(GOODS_THUMBNAIL_FILE_NAME + "\\" + "temp" + "\\" + goodsId + ".jpg"));

				}
			}
		}
		return imageFileName;
	}

	@Override
	@RequestMapping(value = "/goods/addReview.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ResponseEntity addReview(@RequestParam("goodsId") int goodsId, @RequestParam("buid") String buid, 
			GoodreviewVO goodreview, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		HashMap<String, Object> reviewmap = new HashMap<String, Object>();

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String uid = memberVO.getUid();
		String userName = memberVO.getUserName();

		reviewmap.put("uid", uid);
		reviewmap.put("buid", buid);
		reviewmap.put("goodsId", goodsId);

		goodreview.setUserName(userName);
		goodreview.setUid(uid);

	
			String result = goodsService.userReviewCheckService(uid);
			int result1 = goodsService.userReviewCheckService1(reviewmap);
			System.out.println(result1);

			if (result.equals(uid)) {

				if (result1 == (goodsId)) {
					
					int result3 = goodsService.addReviewScore(goodreview);
					int result2 = goodsService.addReview(goodreview);
					
					int result4 = goodsService.addReviewUserScore(buid);											

					System.out.println("uid, goodsId 유효성검사 성공");
					message = "<script>";
					message += "alert('리뷰 작성이 완료되었습니다.');";
					message += "location.href='" + request.getContextPath() + "/page/goodsDetailPage.do?uid=" + buid
							+ "'";
					message += "</script>";
					resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
				} else {
					message = "<script>";
					message += "alert('구매한 상품이 아닙니다.');";
					message += "location.href='" + request.getContextPath() + "/page/goodsDetailPage.do?uid=" + buid
							+ "'";
					message += "</script>";
					resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
					System.out.println("구매한 상품이 아님");
				}

			} else {
				message = "<script>";
				message += "alert('상품을 구매후 작성해주세요.');";
				message += "location.href='" + request.getContextPath() + "/page/goodsDetailPage.do?uid=" + buid + "'";
				message += "</script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
				System.out.println("구매하지 않음");
			}
		

		return resEnt;
	}

	// 상품 목록 페이지
	@Override
	@RequestMapping(value = "/goods/goodsList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView goodsList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String uid = memberVO.getUid();

		Map goodsListMap = goodsService.goodsList(uid);

		ModelAndView mav = new ModelAndView(viewName);

		mav.addObject("goodsListMap", goodsListMap);
		System.out.println(viewName);
		return mav;
	} // end

	// 상품 삭제
	@Override
	@RequestMapping(value = "/goods/goodsDelete.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ResponseEntity goodsdelete(@RequestParam("goodsId") int goodsId, HttpServletRequest request,
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
			message += "location.href='" + request.getContextPath() + "/goods/goodsList.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			message = "<script>";
			message += "alert('오류');";
			message += "location.href='" + request.getContextPath() + "/goods/goodsList.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;

	}

	@Override
	@RequestMapping(value = "/goods/goodsModify.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ModelAndView goodsModify(@RequestParam("goodsId") int goodsId, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		Map goodsModifyMap = goodsService.selectGoodsModify(goodsId);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("goodsModifyMap", goodsModifyMap);
		System.out.println(viewName);
		return mav;

	} // end

	// 이미지 제외 삭제
	@Override
	@RequestMapping(value = "/goods/modGoods.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ResponseEntity modGoods(GoodsVO goods, LodgingDetailVO lodging, MultipartHttpServletRequest multipartRequest,
			HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		String goodsImageFileName = null;
		int result = 0;
		int result1 = 0;

		Map<String, Object> modGoodsMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			modGoodsMap.put(name, value);
		}

		int goodsId = goods.getGoodsId();

		String imageFileName = upload1(multipartRequest, goodsId);
		modGoodsMap.put("goodsImageFileName", imageFileName);

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			result = goodsService.updateGoodsModify(goods);
			result1 = goodsService.updateLodgingModify(lodging);
			if (imageFileName != null && imageFileName.length() != 0) {

				String originalFileName = (String) modGoodsMap.get("originalFileName");
				File oldFile = new File(GOODS_THUMBNAIL_FILE_NAME + "\\" + originalFileName);
				oldFile.delete();

				File srcFile = new File(GOODS_THUMBNAIL_FILE_NAME + "\\" + "temp" + "\\" + imageFileName);
				File destDir = new File(GOODS_THUMBNAIL_FILE_NAME + "\\");
				FileUtils.moveFileToDirectory(srcFile, destDir, true);

			}
			message = "<script>";
			message += "alert('수정되었습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/goods/goodsList.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			message = "<script>";
			message += " alert('오류.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/goods/goodsList.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}
		return resEnt;
	}
	
	@Override
	@ResponseBody
    @RequestMapping(value = "/goods/liked", method = RequestMethod.POST, produces = "application/json")
    public int heart(HttpServletRequest request, HttpServletResponse response) throws Exception {
	 	HttpSession session = request.getSession();
        int liked = Integer.parseInt(request.getParameter("liked")); //취소 or 찜
        int goodsId = Integer.parseInt(request.getParameter("goodsId"));
      
	        MemberVO member = (MemberVO) session.getAttribute("member");
			String uid = member.getUid(); 
			GoodsLikeVO gLiked = new GoodsLikeVO();
	
			gLiked.setGoodsId(goodsId);
			gLiked.setUid(uid);
	
	        System.out.println(liked);
	
	        if(liked >= 1) {
	            goodsService.deleteGoodsLike(gLiked);
	            liked=0;
	        } else {
	        	goodsService.insertGoodsLike(gLiked);
	            liked=1;
	        }
	        
        return liked;
    }
}