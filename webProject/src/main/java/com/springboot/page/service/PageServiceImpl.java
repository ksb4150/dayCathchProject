package com.springboot.page.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.springboot.board.vo.BoardVO;
import com.springboot.common.vo.Criteria;
import com.springboot.goods.vo.GoodreviewVO;
import com.springboot.goods.vo.GoodsVO;
import com.springboot.goods.vo.LodgingDetailVO;
import com.springboot.member.dao.MemberDAO;
import com.springboot.member.vo.MemberVO;
import com.springboot.page.dao.PageDAO;
import com.springboot.page.vo.ImageVO;
import com.springboot.page.vo.csVO;
import com.springboot.page.vo.faqVO;
import com.springboot.page.vo.noticeVO;

@Service("pageService")
@Transactional(propagation = Propagation.REQUIRED)
public class PageServiceImpl implements PageService {
	@Autowired
	PageDAO pageDAO;
	@Autowired
	MemberDAO memberDAO;

	public Map selectRowLodgingList() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		List<GoodsVO> lodgingList = pageDAO.selectLowLodgingList(); // 낮은 가격 순 상품 4개
		List<MemberVO> memInfoList = new ArrayList(); // 낮은 가격 순 상품을 등록한 member의 vo를 담을 list

		for (GoodsVO goods : lodgingList) {
			String uid = goods.getUid();
			memInfoList.add(pageDAO.selectMemberList(uid));
		}

		map.put("lodgingList", lodgingList);
		map.put("memInfoList", memInfoList);

		return map;

	}

	public Map selectHotRowLodgingList() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		List<GoodsVO> HotlodgingList = pageDAO.selectHotRowLodgingList(); // 인기 순 상품 4개
		List<MemberVO> HotmemInfoList = new ArrayList(); // 인기 순 상품을 등록한 member의 vo를 담을 list

		for (GoodsVO goods : HotlodgingList) {
			String uid = goods.getUid();
			HotmemInfoList.add(pageDAO.selectMemberList(uid));
		}

		map.put("HotlodgingList", HotlodgingList);
		map.put("HotmemInfoList", HotmemInfoList);

		return map;

	}

	public Map viewLodgingDetail(String uid) throws Exception {
		Map<String, Object> goodsDetailMap = new HashMap<>();
		Map<Integer, Object> imgMap = new HashMap<>();
		List<LodgingDetailVO> loadingDetailList = new ArrayList<>();
//		List img = new ArrayList<>();

		MemberVO mem = pageDAO.selectMemInfo(uid);
		List<GoodsVO> goodsList = pageDAO.selectGoods(uid); // 멤버가 등록한 모든 상품 가져오기
		List<GoodreviewVO> reviewList = pageDAO.selectReviewList(uid);

		for (GoodsVO goods : goodsList) {
			int goodsId = goods.getGoodsId();
			loadingDetailList.add(pageDAO.selectlodgingDetail(goodsId));
			List<ImageVO> img = pageDAO.selectlodgingImgs(goodsId); // 사진 이름만 저장
			imgMap.put(goodsId, img);
//			img.add(pageDAO.selectlodgingImgs(goodsId)); // 사진 이름만 저장
		}

		goodsDetailMap.put("mem", mem);
		goodsDetailMap.put("goodsList", goodsList);
		goodsDetailMap.put("goodsDetailList", loadingDetailList);
		goodsDetailMap.put("reviewList", reviewList);
//		goodsDetailMap.put("imgMap", img);
		goodsDetailMap.put("imgMap", imgMap);

		return goodsDetailMap;
	}

	public Map viewLodgingDetail1(String uid) throws Exception {
		Map<String, Object> goodsDetailMap = new HashMap<>();
		Map<Integer, Object> imgMap = new HashMap<>();
		List<LodgingDetailVO> ticketDetailList = new ArrayList<>();
//		List img = new ArrayList<>();

		MemberVO mem = pageDAO.selectMemInfo(uid);
		List<GoodsVO> goodsList = pageDAO.selectGoods1(uid); // 멤버가 등록한 모든 상품 가져오기
		List<GoodreviewVO> reviewList = pageDAO.selectReviewList(uid);

		for (GoodsVO goods : goodsList) {
			int goodsId = goods.getGoodsId();
			ticketDetailList.add(pageDAO.selectTicketDetail(goodsId));
			List<ImageVO> img = pageDAO.selectlodgingImgs(goodsId); // 사진 이름만 저장
			imgMap.put(goodsId, img);
//			img.add(pageDAO.selectlodgingImgs(goodsId)); // 사진 이름만 저장
		}

		goodsDetailMap.put("mem", mem);
		goodsDetailMap.put("goodsList", goodsList);
		goodsDetailMap.put("goodsDetailList", ticketDetailList);
		goodsDetailMap.put("reviewList", reviewList);
//		goodsDetailMap.put("imgMap", img);
		goodsDetailMap.put("imgMap", imgMap);

		return goodsDetailMap;
	}

	public Map selectGoodsInfo(int goodsId) throws Exception {
		Map<String, Object> selectGoodsInfo = new HashMap<>();
		GoodsVO goods = pageDAO.selectGood(goodsId); // 특정 상품의 정보 가져오기
		LodgingDetailVO detail = pageDAO.selectlodgingDetail(goodsId);
		List img = pageDAO.selectlodgingImgs(goodsId);

		selectGoodsInfo.put("goods", goods);
		selectGoodsInfo.put("detail", detail);
		selectGoodsInfo.put("img", img);

		return selectGoodsInfo;
	}

	// 메인 페이지 인기 상품
	public Map selectRowLodgingList1() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		List<GoodsVO> lodgingList = pageDAO.selectLowLodgingList1(); // 낮은 가격 순 숙소 3개
		List<GoodsVO> lodgingList1 = pageDAO.selectLowLodgingList3(); // 낮은 가격 순 티켓 3개
		List<BoardVO> boardList = pageDAO.selectboardList(); // 인기 순 커뮤니티 3개

		List uidList = new ArrayList();
		List<MemberVO> memInfoList = new ArrayList(); // 낮은 가격 순 상품을 등록한 member의 vo를 담을 list
		List<MemberVO> memInfoList1 = new ArrayList();

		for (GoodsVO goods : lodgingList) {
			String uid = goods.getUid();
			memInfoList.add(pageDAO.selectMemberList(uid));
		}

		for (GoodsVO goods : lodgingList1) {
			String uid = goods.getUid();
			memInfoList1.add(pageDAO.selectMemberList(uid));
		}

		map.put("lodgingList", lodgingList);
		map.put("lodgingList1", lodgingList1);
		map.put("memInfoList", memInfoList);
		map.put("memInfoList1", memInfoList1);
		map.put("boardList", boardList);

		return map;

	}

	// 투어 티켓 최저가
	public Map selectRowLodgingList2() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		List<GoodsVO> lodgingList = pageDAO.selectLowLodgingList2(); // 낮은 가격 순 상품 4개
		List uidList = new ArrayList();
		List<MemberVO> memInfoList = new ArrayList(); // 낮은 가격 순 상품을 등록한 member의 vo를 담을 list

		for (GoodsVO goods : lodgingList) {
			String uid = goods.getUid();
			memInfoList.add(pageDAO.selectMemberList(uid));
		}

		map.put("lodgingList", lodgingList);
		map.put("memInfoList", memInfoList);

		return map;

	}

	// 투어 티켓 인기순
	public Map selectHotRowLodgingList2() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		List<GoodsVO> HotlodgingList = pageDAO.selectHotRowLodgingList2(); // 인기 순 상품 4개
		List<MemberVO> HotmemInfoList = new ArrayList(); // 인기 순 상품을 등록한 member의 vo를 담을 list

		for (GoodsVO goods : HotlodgingList) {
			String uid = goods.getUid();
			HotmemInfoList.add(pageDAO.selectMemberList(uid));
		}

		map.put("HotlodgingList", HotlodgingList);
		map.put("HotmemInfoList", HotmemInfoList);

		return map;

	}

	public Map selectBoardAsc() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		List<BoardVO> boardListAsc = pageDAO.selectBoardAsc();

		map.put("boardAsc", boardListAsc);

		return map;
	}

	public Map<String, Object> selectBoardCnt() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		List<BoardVO> boardListCnt = pageDAO.selectBoardCnt();
		map.put("boardCntList", boardListCnt);
		return map;
	}
	
	public Map<String, Object> selectHotArticle() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		BoardVO article = pageDAO.selectHotArticle();
		
			map.put("hotArticle", article);
		return map;
		
	}

//		public List filtering(LodgingDetailVO vo, String sDate, String eDate, String subCate) throws Exception {
//			List<LodgingDetailVO> filterList = pageDAO.filtering(vo, sDate, eDate, subCate);
//			
//			return filterList;
//		}

	public Map filtering(LodgingDetailVO detailVO) throws Exception {
		Map<String, Object> filterMap = new HashMap<String, Object>();
		Map<String, Object> paramMap = new HashMap<String, Object>();

		List<GoodsVO> filterList = pageDAO.filtering(detailVO);
		List<MemberVO> memInfoList = new ArrayList();

		for (GoodsVO mem : filterList) {
			String uid = mem.getUid();
			memInfoList.add(pageDAO.selectMemberList(uid));
		}
		filterMap.put("filterList", filterList);
		filterMap.put("memInfoList", memInfoList);

		return filterMap;
	}

	public Map filtering1(LodgingDetailVO detailVO) throws Exception {
		Map<String, Object> filterMap = new HashMap<String, Object>();
		Map<String, Object> paramMap = new HashMap<String, Object>();

		List<GoodsVO> filterList = pageDAO.filtering1(detailVO);
		List<MemberVO> memInfoList = new ArrayList();

		for (GoodsVO mem : filterList) {
			String uid = mem.getUid();
			memInfoList.add(pageDAO.selectMemberList(uid));
		}
		filterMap.put("filterList", filterList);
		filterMap.put("memInfoList", memInfoList);

		return filterMap;
	}

	public Map basicFiltering(String goodsSubCategory) throws Exception {
		Map<String, Object> bFilterMap = new HashMap<String, Object>();
		List<GoodsVO> filterList = pageDAO.basicFiltering(goodsSubCategory);
		List<MemberVO> memInfoList = new ArrayList();

		for (GoodsVO mem : filterList) {
			String uid = mem.getUid();
			memInfoList.add(pageDAO.selectMemberList(uid));
		}

		bFilterMap.put("filterList", filterList);
		bFilterMap.put("memInfoList", memInfoList);

		return bFilterMap;

	}

	public Map basicFiltering1(String goodsSubCategory) throws Exception {
		Map<String, Object> bFilterMap = new HashMap<String, Object>();
		List<GoodsVO> filterList = pageDAO.basicFiltering1(goodsSubCategory);
		List<MemberVO> memInfoList = new ArrayList();

		for (GoodsVO mem : filterList) {
			String uid = mem.getUid();
			memInfoList.add(pageDAO.selectMemberList(uid));
		}

		bFilterMap.put("filterList", filterList);
		bFilterMap.put("memInfoList", memInfoList);

		return bFilterMap;

	}

	// 1:1문의 글 삭제
	@Override
	public void removeQna(int csNO) throws Exception {
		pageDAO.deleteQna(csNO);
	}

	// 1:1문의 글 쓰기
	@Override
	public void addNewQna(csVO cs) throws Exception {
		pageDAO.addNewQna(cs);

		int csNO = pageDAO.maxCsNO();
		cs.setOriginNo(csNO);
		cs.setCsNO(csNO);

		pageDAO.updateOriginNo(cs);
	}

	// 1:1문의 글 목록
	@Override
	public List<csVO> getQnaList(String uid) throws Exception {
		List<csVO> qnaboard = pageDAO.getQnaList(uid);

		return qnaboard;
	}

	// 1:1문의 글 보기
	@Override
	public csVO detailQna(int csNO) throws Exception {
		csVO viewqna = pageDAO.detailQna(csNO);

		return viewqna;
	}

	// 1:1문의 답글 작성
	@Override
	public void updateOriginNo(csVO cs) throws Exception {
		pageDAO.updateOriginNo(cs);

	}

	@Override
	public int readGroupLayer(int csNO) throws Exception {
		return pageDAO.readGroupLayer(csNO);

	}

	@Override
	public int readOriginNo(int csNO) throws Exception {
		return pageDAO.readOriginNo(csNO);

	}

	@Override
	public int maxGroupOrd() throws Exception {
		return pageDAO.maxGroupOrd();

	}

	@Override
	public void insertReply(csVO cs) throws Exception {
		// 계층번호
		int groupLayer = pageDAO.readGroupLayer(cs.getCsNO());
		// 계층번호= 부모글의 계층번호+1
		cs.setGroupLayer(groupLayer + 1);

		// 부모글이 답글인 경우
		if (cs.getGroupOrd() == 0) {
			// 순서번호의 max
			int maxGroupOrd = pageDAO.maxGroupOrd();
			cs.setGroupOrd(maxGroupOrd + 1);
		}
		pageDAO.insertReply(cs);

	}

	// FAQ 글 목록
	@Override
	public List listFaq() throws Exception {
		List faqList = null;
		faqList = pageDAO.selectAllFaqList();
		return faqList;
	}

	// FAQ 조회
	@Override
	public faqVO faqMod(int faq_no) throws Exception {
		faqVO faq = pageDAO.faqSelect(faq_no);
		return faq;
	}

	// 공지사항 글 목록
	@Override
	public List listNotice() throws Exception {
		List noticeList = null;
		noticeList = pageDAO.selectAllNoticeList();
		return noticeList;
	}

	// 공지사항 글 조회
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public noticeVO noticeView(int noticeNO) throws Exception {
		pageDAO.updateView(noticeNO); // 조회수 구현
		return pageDAO.noticeSelect(noticeNO);
	}

	// 페이징한 글목록
	@Override
	public List<noticeVO> listPage(Criteria cri) throws Exception {
		return pageDAO.listPage(cri);
	}

	// DB 모든 글 개수 리턴
	@Override
	public int getTotal(Criteria cri) throws Exception {
		return pageDAO.getTotal(cri);
	}

	// 포인트
	@Override
	public int sumSavePoint(String uid) throws Exception {
		return memberDAO.sumSavePoint(uid);
	}

	@Override
	public int sumUsePoint(String uid) throws Exception {
		return memberDAO.sumUsePoint(uid);
	}

	// 기본 게시글 게시판 리스트(최신순)

	@Override
	public List communityList1(Criteria cri) throws Exception {
		List communityList = pageDAO.communityList1(cri);

		return communityList;

	}

	@Override
	public int totalcommunityPage1() throws Exception {
		return pageDAO.totalcommunityPage1();

	}

//인기순으로 조회한 게시판 리스트

	@Override
	public List communityList2(Criteria cri) throws Exception {
		List communityList = pageDAO.communityList2(cri);

		return communityList;

	}

//카테고리별 게시판
	@Override
	public List communityList3(Criteria cri) throws Exception {
		List communityList = pageDAO.communityList3(cri);

		return communityList;

	}

	@Override
	public int totalcommunityPage2(Criteria cri) throws Exception {
		return pageDAO.totalcommunityPage2(cri);

	}

//검색으로 특정 게시글 찾기
	@Override
	public List findArticleList(Criteria cri) throws Exception {
		List communityList = pageDAO.findArticleList(cri);
		return communityList;

	}

	@Override
	public int totalcommunityPage3(Criteria cri) throws Exception {
		return pageDAO.totalcommunityPage3(cri);

	}

	@Override
	public List<Integer> selectLikeGoods(String uid, String buid) throws Exception {
		List<Integer> list = pageDAO.selectLikeGoods(uid, buid);
		return list;
	}

	// qna 수정
	@Override
	public void qnaModify(csVO cs) throws Exception {
		pageDAO.csUpdate(cs);
	}

//	비지니스 리뷰 리스트 가져오기
	@Override
	public List businessReviewListCri(@Param("cri") Criteria cri, @Param("uid") String uid) throws Exception {
		return pageDAO.businessReviewListCri(cri, uid);
	}

	// DB 모든 글 개수 리턴
	@Override
	public int TotalbusinessReviewList(@Param("cri") Criteria cri, @Param("uid") String uid) throws Exception {
		return pageDAO.TotalbusinessReviewList(cri, uid);
	}

	@Override
	public Map selectsWishList(String uid) throws Exception {
		Map resultMap = new HashMap();

		List<GoodsVO> wishList = pageDAO.selectsWishList(uid);
		List<BoardVO> likeList = pageDAO.selectsLikeList(uid);

		resultMap.put("wishList", wishList);
		resultMap.put("likeList", likeList);

		return resultMap;
	}

//	@Override
//	public List adminReviewListSearch(String search) throws Exception {
//		return adminDAO.adminReviewListSearch(search);
//	}
}
