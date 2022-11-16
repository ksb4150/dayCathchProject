package com.springboot.admin.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.JsonObject;
import com.springboot.admin.dao.AdminDAO;
import com.springboot.common.vo.Criteria;
import com.springboot.goods.dao.GoodsDAO;
import com.springboot.goods.vo.GoodsVO;
import com.springboot.member.dao.MemberDAO;
import com.springboot.member.vo.MemberVO;
import com.springboot.order.dao.OrderDAO;
import com.springboot.order.vo.OrderGoodsVO;
import com.springboot.order.vo.OrderRefundVO;
import com.springboot.order.vo.OrdercartVO;
import com.springboot.page.vo.csVO;
import com.springboot.page.vo.faqVO;
import com.springboot.page.vo.noticeVO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminDAO adminDAO;
	@Autowired
	MemberDAO memberDAO;
	@Autowired
	OrderDAO orderDAO;
	@Autowired
	GoodsDAO goodsDAO;

	// 관리자가 주문조회시 호출되는 서비스
	@Override
	public List userOrderList() throws DataAccessException {
		List orderList = null;
		orderList = adminDAO.selectUserOrderList();
		return orderList;
	}

	@Override
	public List userordergoodsList(Criteria cri) throws DataAccessException {
		List ordergoodsList = null;
		ordergoodsList = adminDAO.selectUserOrdergoodsList(cri);
		return ordergoodsList;
	}

	// 관리자가 일괄 주문 취소 승인 로직
	@Override
	@Transactional
	public void orderCancel1(OrderRefundVO orf) {

		// 회원의 주문 취소 요청일때
		if (orf.getUid() != "") {

			/* 주문, 주문상품 객체 */

			/* 회원정보 가져옴 */

			MemberVO member = memberDAO.getMemberInfo(orf.getUid());

			/* 주문상품정보 가져와서 VO에 세팅 */
			List<OrderGoodsVO> orvs = orderDAO.getOrderGoodsInfo(orf.getOrdersNO());
			System.out.println(" 주문취소 서비스에서 주문번호에 맞는 상품 정보 리스트 세팅");
			/* 해당 주문정보 VO에 세팅 */
			OrdercartVO ocv = orderDAO.getOrder(orf.getOrdersNO());
			/* 해당 주문정보에 주문상품정보 리스트를 세팅 */
			ocv.setOrders(orvs);

			/* 사용포인트, 쌓인포인트, 재고 반환 if문으로 포인트 있나 없나부터 검증 */

			// 주문 취소 요청한 유저가 가지고있는 포인트
			int calPoint = member.getUserPoint();
			// 해당 주문시 쌓인 포인트
			int savePoint = ocv.getSavePoint();

			calPoint = calPoint + ocv.getUsePoint() - savePoint;
			member.setUserPoint(calPoint);

			// 포인트 변동값 다시 db적용
			orderDAO.deductPoint(member);

			/* pointhis테이블에 포인트이력 갱신 */
			orderDAO.insertPointhis2(ocv);

			orderDAO.insertuserPoint(member.getUserPoint(), ocv.getOrdersNO());
			System.out.println("db pointhis 업데이트 완료");

			// 주문 취소 확정으로 인한 재고 반환과 주문 삭제 테이블에 등록

			for (OrderGoodsVO orv : ocv.getOrders()) {

				GoodsVO goods = goodsDAO.getGoodsInfo(orv.getGoodsId());
				goods.setGoodsCount(goods.getGoodsCount() + orv.getGoodsQty());
				orderDAO.deductStock(goods);

				adminDAO.insertOrderRefund(orv);
				adminDAO.updateRefundInfo(ocv);

			}

			// 다되면 주문 상태 취소로 변경하고 그 하위 주문목록들 또한 상태 취소로 변경함
			adminDAO.orderCancle1(orf.getOrdersNO());

			// 2는 주문번호가 일치하는 건별주문상품 전체가 주문취소 상태로 변경됨
			adminDAO.orderCancle2(orf.getOrdersNO());

			// 비회원의 주문 취소 요청일때(getUid == null) 비회원은 포인트 환원 과정을 거치지 않음
		} else {

			/* 주문상품정보 가져와서 VO에 세팅 */
			List<OrderGoodsVO> orvs = orderDAO.getOrderGoodsInfo(orf.getOrdersNO());
			System.out.println(" 주문취소 서비스에서 주문번호에 맞는 상품 정보 리스트 세팅");
			/* 해당 주문정보 VO에 세팅 */
			OrdercartVO ocv = orderDAO.getOrder(orf.getOrdersNO());
			/* 해당 주문정보에 주문상품정보 리스트를 세팅 */
			ocv.setOrders(orvs);

			// 주문 취소로 인한 재고 반환, 주문취소이력 테이블에 추가

			for (OrderGoodsVO orv : ocv.getOrders()) {

				GoodsVO goods = goodsDAO.getGoodsInfo(orv.getGoodsId());
				goods.setGoodsCount(goods.getGoodsCount() + orv.getGoodsQty());
				orderDAO.deductStock(goods);

				adminDAO.insertOrderRefund(orv);
				adminDAO.updateRefundInfo(ocv);

			}

			// 다되면 주문 상태 취소로 변경하고 그 하위 주문목록들 또한 상태 취소로 변경함
			adminDAO.orderCancle1(orf.getOrdersNO());
			adminDAO.orderCancle2(orf.getOrdersNO());

		} // 비회원일때 else 끝

	} // 관리자가 일괄 주문 취소 승인 로직끝

	// 관리자 주문 건별 취소 승인
	@Override
	@Transactional
	public void orderCancel2(OrderRefundVO orf) {

		int result = 0;

		/* 주문상품정보 가져와서 VO에 세팅 */
		OrderGoodsVO orv = orderDAO.getOrderGoodsInfo2(orf);

		System.out.println(" 주문취소 서비스에서 주문번호에 맞는 상품 정보 세팅");

		/* 해당 주문정보 VO에 세팅 */
		OrdercartVO ocv = orderDAO.getOrder(orf.getOrdersNO());

		orf.setUid(ocv.getUid());

		// 원래의 전체 주문 리스트 수 구하기 아래의 IF문에서 주문품목 리스트 수가 활용됨
		List<OrderGoodsVO> orvs = orderDAO.getOrderGoodsInfo(orf.getOrdersNO());
		int listsize = orvs.size();

		// 회원의 주문 취소 요청일때
		if (orf.getUid() != "") {

			/* 주문, 주문상품 객체 */

			/* 회원정보 가져옴 */

			MemberVO member = memberDAO.getMemberInfo(orf.getUid());

			// 건별 취소시 사용포인트, 쌓일포인트 재계산
			int finalTotalPrice1 = ocv.getFinalTotalPrice();

			int usePoint = ocv.getUsePoint();

			int unfinalTotalPrice = finalTotalPrice1 + usePoint;

			System.out.println("주문총액: " + unfinalTotalPrice);

			// 동일한 주문번호를 가진 여러 주문 상품 리스트에서 취소한 특정 주문상품의 정보를 가져옴
			OrderGoodsVO ogv = orderDAO.getOrderGoodsInfo2(orf);

			int totalPrice = ogv.getTotalPrice();

			System.out.println("개별 상품 총액: " + totalPrice);

			double pointcal = (totalPrice * 1.0) / (unfinalTotalPrice * 1.0);

			System.out.println("해당 취소 상품의 사용포인트 점유율: " + pointcal);

			int goodsPoint = (int) Math.round(usePoint * pointcal);

			System.out.println("개별 상품 포인트: " + goodsPoint);

			// 취소한 상품 금액을 반영한 결제금액 재계산
			int finalTotalPrice2 = (unfinalTotalPrice - totalPrice) - (ocv.getUsePoint() - goodsPoint);

			int savePoint2 = (int) Math.round(finalTotalPrice2 * 0.05);

			int usePoint2 = usePoint - goodsPoint;

			// 주문 취소 요청한 유저가 가지고있는 포인트
			int calPoint = member.getUserPoint();
			// 해당 주문시 쌓인 포인트
			int savePoint = ocv.getSavePoint();

			// 주문 취소전 적립포인트와 취소후 재계산된 적립포인트의 차이(포인트 이력테이블에 쓰임) `
			int savePoint3 = savePoint - savePoint2;

			// 주문 전 유저 포인트 상황
			int olduserPoint = calPoint - savePoint + usePoint;

			calPoint = olduserPoint - usePoint2 + savePoint2;

			member.setUserPoint(calPoint);

			ocv.setFinalTotalPrice(finalTotalPrice2);
			ocv.setSavePoint(savePoint2);
			ocv.setUsePoint(usePoint2);

			// 유저 포인트 변동값 다시 db적용
			orderDAO.deductPoint(member);
			// 재계산한 결제금액, 사용포인트, 쌓일포인트를 주문테이블에 적용
			adminDAO.modifyOrder(ocv);

			// 포인트 이력 내용들을 담을 객체
			OrdercartVO ocv2 = ocv;

			ocv2.setUsePoint(goodsPoint);
			ocv2.setSavePoint(savePoint3);

			/* pointhis테이블에 포인트이력 추가(건별 취소용) */
			orderDAO.insertPointhis3(ocv2);

			orderDAO.insertuserPoint(member.getUserPoint(), ocv.getOrdersNO());
			System.out.println("db pointhis 업데이트 완료");

			// 주문 취소된 상품에 대한 재고를 반환

			GoodsVO goods = goodsDAO.getGoodsInfo(orv.getGoodsId());
			goods.setGoodsCount(goods.getGoodsCount() + orv.getGoodsQty());
			orderDAO.deductStock(goods);

			// 1주문에 1상품인경우 상품을 건별 취소할때
			if (listsize == 1 || ocv.getFinalTotalPrice() == 0) {
				// orders, ordersgoods의 주문 상태를 양쪽 다 취소로 변경
				adminDAO.orderCancle1(orf.getOrdersNO());
				adminDAO.orderCancle2(orf.getOrdersNO());
			} else {

				// ordersgoods테이블 주문 상태를 취소로 변경
				adminDAO.orderCancle3(orf);

			}

			// 주문상품 취소 이력 테이블에 취소된 상품 등록
			adminDAO.insertOrderRefund(ogv);
			adminDAO.updateRefundInfo(ocv);

		}

//비회원의 건별 주문 취소 요청일때(getUid == null) 비회원은 포인트 환원 과정을 거치지 않음
		else {

			// 취소된 상품금액 만큼 결제금액 재계산
			OrderGoodsVO ogv = orderDAO.getOrderGoodsInfo2(orf);
			int totalPrice = ogv.getTotalPrice();
			int finalTotalPrice = ocv.getFinalTotalPrice();

			ocv.setFinalTotalPrice(finalTotalPrice - totalPrice);

			// 주문 취소로 인한 재고 반환
			GoodsVO goods = goodsDAO.getGoodsInfo(orv.getGoodsId());
			goods.setGoodsCount(goods.getGoodsCount() + orv.getGoodsQty());
			orderDAO.deductStock(goods);

			// 1주문 1상품인경우 상품을 건별 취소할때
			if (listsize == 1 || ocv.getFinalTotalPrice() == 0) {
				// orders, ordersgoods의 주문 상태를 양쪽 다 취소로 변경
				adminDAO.orderCancle1(orf.getOrdersNO());
				adminDAO.orderCancle2(orf.getOrdersNO());
			} else {

				// ordersgoods테이블 주문 상태를 취소로 변경
				adminDAO.orderCancle3(orf);

			}

			// 주문상품 취소 이력 테이블에 취소된 상품 등록
			adminDAO.insertOrderRefund(ogv);
			adminDAO.updateRefundInfo(ocv);

		} // 비회원일때 else 끝

	}

	// 상품 목록
//	@Override
//	public Map adminGoodsList() throws Exception {
//		Map<String, Object> adminGoodsListMap = new HashMap<>();
//
//		List<GoodsVO> adminGoodsList = adminDAO.adminGoodsList();
//		adminGoodsListMap.put("adminGoodsList", adminGoodsList);
//
//		return adminGoodsListMap;
//	}

	// 관리자 상품 리스트
	@Override
	public List adminGoodslistCri(Criteria cri) throws Exception {
		return adminDAO.adminGoodslistCri(cri);
	}

	// DB 모든 글 개수 리턴
	@Override
	public int TotalAdminGoodsList(Criteria cri) throws Exception {
		return adminDAO.TotalAdminGoodsList(cri);
	}

	// 관리자 상품승인대기
	@Override
	public List adminGoodslistCri2(Criteria cri) throws Exception {
		return adminDAO.adminGoodslistCri2(cri);
	}

	// DB 모든 글 개수 리턴
	@Override
	public int TotalAdminGoodsList2(Criteria cri) throws Exception {
		return adminDAO.TotalAdminGoodsList2(cri);
	}

	@Override
	public List adminGoodsListSearch(String search) throws Exception {
		return adminDAO.adminGoodsListSearch(search);

	}

	@Override
	public int adminGoodsAllow(int goodsId) throws Exception {
		return adminDAO.adminGoodsAllow(goodsId);
	}

	@Override
	public int deleteReviewList(String uid) {
		return adminDAO.deleteReview(uid);
	}

	@Override
	public List adminCommunitylistCri(Criteria cri) throws Exception {
		return adminDAO.adminCommunitylistCri(cri);
	}

	// DB 모든 글 개수 리턴
	@Override
	public int TotalAdminCommunityList(Criteria cri) throws Exception {
		return adminDAO.TotalAdminCommunityList(cri);
	}

	@Override
	public List adminCommunityListSearch(String search) throws Exception {
		return adminDAO.adminCommunityListSearch(search);
	}

	@Override
	public List adminReviewListCri(Criteria cri) throws Exception {
		return adminDAO.adminReviewListCri(cri);
	}

	// DB 모든 글 개수 리턴
	@Override
	public int TotalAdminReviewList(Criteria cri) throws Exception {
		return adminDAO.TotalAdminReviewList(cri);
	}

	@Override
	public List adminReviewListSearch(String search) throws Exception {
		return adminDAO.adminReviewListSearch(search);
	}

	@Override
	public Map aSalesStatus(Criteria cri) throws Exception {
		Map<String, Object> resultMap = new HashMap();

		List<OrdercartVO> totalSalesList = adminDAO.atotalSales();
		List<OrdercartVO> businessSalesList = new ArrayList();
		Map<String, String> companyName = new HashMap();

		List<MemberVO> member = adminDAO.bUserInfo(cri); // 사업자 uid 가지고 있음

		for (int i = 0; i < member.size(); i++) {
			businessSalesList.addAll(adminDAO.userSales(member.get(i).getUid()));
			companyName.put(member.get(i).getUid(), member.get(i).getCompanyName());
		}

		resultMap.put("bCompanyName", companyName);

		Date nowDate = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("MM");

		List<Integer> totalData = null;
		for (OrdercartVO vo : totalSalesList) {
			String sMon = sdf.format(vo.getCreDate());
			int mon = Integer.parseInt(sMon); // vo에 들어있는 월

			if (!resultMap.containsKey("total")) {
				totalData = new ArrayList<>();
				for (byte i = 1; i <= 12; i++) {
					if (mon > i) {
						if (totalData.size() < i) {
							totalData.add(0);
						} else if (totalData.get(i - 1) <= 0) {
							totalData.set(i - 1, 0);
						}
					} else if (mon == i) {
						totalData.add(vo.getFinalTotalPrice());
					} else {
						totalData.add(0);
					}
				}
				resultMap.put("total", totalData);
			} else {
				totalData = (List<Integer>) resultMap.get("total");
				for (int i = mon; i <= mon; i++) {
					totalData.set(i - 1, vo.getFinalTotalPrice());
				}
				resultMap.put("total", totalData);
			}
		}

		List<Integer> bUidData = null;
		for (OrdercartVO vo : businessSalesList) {
			String buid = String.valueOf(vo.getUid());
			String sMon = sdf.format(vo.getCreDate());
			int mon = Integer.parseInt(sMon);

			if (!resultMap.containsKey(buid)) { // map에 키가 있으면 true
				bUidData = new ArrayList<>();
				for (byte i = 1; i <= 12; i++) {
					if (mon > i) {
						if (bUidData.size() < i) {
							bUidData.add(0);
						} else if (bUidData.get(i - 1) <= 0) {
							bUidData.set(i - 1, 0);
						}
					} else if (mon == i) {
						bUidData.add(vo.getFinalTotalPrice());
					} else {
						bUidData.add(0);
					}
				}
				resultMap.put(buid, bUidData);

			} else { // 있으면 buid가 일치하는 배열 가져오기
				bUidData = (List<Integer>) resultMap.get(buid);
				for (int i = mon; i <= mon; i++) {
					bUidData.set(i - 1, vo.getFinalTotalPrice());
				}
				resultMap.put(buid, bUidData); // 동일한 key 값 있으면 대체됨
			}
		}

		return resultMap;
	}

	public Map aSearchSalesStatus(String search) throws Exception {
		Map<String, Object> resultMap = new HashMap();

		List<OrderGoodsVO> totalSalesList = adminDAO.searchTotalSales(search);
		List<OrderGoodsVO> goodsSalesList = adminDAO.searchGoodsSales(search);
		Date nowDate = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("MM");

		List<Integer> totalData = null;
		for (OrderGoodsVO vo : totalSalesList) {
			String sMon = sdf.format(vo.getCreDate());
			int mon = Integer.parseInt(sMon); // vo에 들어있는 월

			if (!resultMap.containsKey("total")) {
				totalData = new ArrayList<>();
				for (byte i = 1; i <= 12; i++) {
					if (mon > i) {
						if (totalData.size() < i) {
							totalData.add(0);
						} else if (totalData.get(i - 1) <= 0) {
							totalData.set(i - 1, 0);
						}
					} else if (mon == i) {
						totalData.add(vo.getTotalPrice());
					} else {
						totalData.add(0);
					}
				}
				resultMap.put("total", totalData);
			} else {
				totalData = (List<Integer>) resultMap.get("total");
				for (int i = mon; i <= mon; i++) {
					totalData.set(i - 1, vo.getTotalPrice());
				}
				resultMap.put("total", totalData);
			}
		}

		List<Integer> goodsData = null;
		for (OrderGoodsVO vo : goodsSalesList) {
			String goodsId = String.valueOf(vo.getGoodsId());
			String sMon = sdf.format(vo.getCreDate());
			int mon = Integer.parseInt(sMon);

			if (!resultMap.containsKey(goodsId)) { // map에 키가 있으면 true
				goodsData = new ArrayList<>();
				for (byte i = 1; i <= 12; i++) {
					if (mon > i) {
						if (goodsData.size() < i) {
							goodsData.add(0);
						} else if (goodsData.get(i - 1) <= 0) {
							goodsData.set(i - 1, 0);
						}
					} else if (mon == i) {
						goodsData.add(vo.getTotalPrice());
					} else {
						goodsData.add(0);
					}
				}
				resultMap.put(goodsId, goodsData);

			} else { // 있으면 goodsId가 일치하는 배열 가져오기
				goodsData = (List<Integer>) resultMap.get(goodsId);
				for (int i = mon; i <= mon; i++) {
					goodsData.set(i - 1, vo.getTotalPrice());
				}
				resultMap.put(goodsId, goodsData); // 동일한 key 값 있으면 대체됨
			}
		}

		Map<Integer, String> goodsName = new HashMap();
		for (int i = 0; i < goodsSalesList.size(); i++) {
			goodsName.put(goodsSalesList.get(i).getGoodsId(), goodsSalesList.get(i).getGoodsName());
		}

		resultMap.put("goodsName", goodsName);
		return resultMap;
	}

	public int getSalesTotal(Criteria cri) throws Exception {
		return adminDAO.aSalesGetTotal(cri);
	}

	@Override
	public List userList() throws Exception {
		List userList = adminDAO.userList();

		return userList;

	}

	// 회원 리스트 불러오기(페이징)
	@Override
	public List userListpage(Criteria cri) throws Exception {
		List userList = adminDAO.userListpage(cri);

		return userList;

	}

	// 사업자 회원 리스트 불러오기
	@Override
	public List buserListpage(Criteria cri) throws Exception {
		List userList = adminDAO.buserListpage(cri);

		return userList;

	}

	@Override
	public int totalUserListPage(Criteria cri) throws Exception {
		return adminDAO.totalUserListPage(cri);

	}

	@Override
	public int totalbUserListPage(Criteria cri) throws Exception {
		return adminDAO.totalbUserListPage(cri);

	}

	@Override
	public int getOrderCount() throws Exception {
		return adminDAO.getOrderCount();

	}

	@Override
	public int getOrderCancelCount() throws Exception {
		return adminDAO.getOrderCancelCount();

	}

	@Override
	public int getcsCount() throws Exception {
		return adminDAO.getcsCount();

	}

	@Override
	public int getcsAnswerCount() throws Exception {
		return adminDAO.getcsAnswerCount();

	}

	@Override
	public int getboardCount() throws Exception {
		return adminDAO.getboardCount();

	}

	@Override
	public int getboardcommentCount() throws Exception {
		return adminDAO.getboardcommentCount();

	}

	@Override
	public List findUserList(String search) throws Exception {
		return adminDAO.findUserList(search);

	}

	@Override
	public List findbUserList(String search) throws Exception {
		return adminDAO.findbUserList(search);

	}

	@Override
	public List buserAllowList() throws Exception {
		return adminDAO.buserAllowList();

	}

	@Override
	public void buserAdminAllow(String uid) throws Exception {

		adminDAO.buserAdminAllow(uid);

	}

	@Override
	public void removeuser(String uid) throws Exception {

		adminDAO.removeuser(uid);

	}

	@Override
	public void insertDeleteusertable(MemberVO memberVO) throws Exception {

		adminDAO.insertDeleteusertable(memberVO);

	}

	@Override
	public int totalAdminOrderGoodsList(Criteria cri) throws Exception {
		return adminDAO.totalAdminOrderGoodsList(cri);

	}

	/* 검색으로 특정 주문정보를 가져다주기 */
	@Override
	public List FindAdminOrderList(String search) throws DataAccessException {
		List orderList = null;
		orderList = adminDAO.FindAdminOrderList(search);
		return orderList;
	}

	/* 검색으로 특정 주문상품정보를 가져다주기 */
	@Override
	public List FindAdminOrdergoodsList(String search) throws DataAccessException {
		List ordergoodsList = null;
		ordergoodsList = adminDAO.FindAdminOrdergoodsList(search);
		return ordergoodsList;
	}

	// 1:1 페이징한 목록
	@Override
	public List<csVO> listPageQna(Criteria cri) throws Exception {
		return adminDAO.listPageQna(cri);
	}

	@Override
	public List<csVO> getQnaList(String uid) throws Exception {
		List<csVO> qnaboard = adminDAO.getQnaList(uid);

		return qnaboard;
	}

	// DB 모든 글 개수 리턴
	@Override
	public int qnaTotal(Criteria cri) throws Exception {
		return adminDAO.qnaTotal(cri);
	}

	// 1:1문의 글 보기
	@Override
	public csVO detailQna(int csNO) throws Exception {
		csVO viewqna = adminDAO.detailQna(csNO);

		return viewqna;
	}

	// 1:1문의 글 삭제
	@Override
	public void removeQna(int csNO) throws Exception {
		adminDAO.deleteQna(csNO);
	}

	// 1:1문의 답글 작성
	@Override
	public void updateOriginNo(csVO cs) throws Exception {
		adminDAO.updateOriginNo(cs);

	}

	@Override
	public int readGroupLayer(int csNO) throws Exception {
		return adminDAO.readGroupLayer(csNO);

	}

	@Override
	public int readOriginNo(int csNO) throws Exception {
		return adminDAO.readOriginNo(csNO);

	}

	@Override
	public void insertReply(csVO cs) throws Exception {
		// 계층번호
		int groupLayer = adminDAO.readGroupLayer(cs.getCsNO());
		// 계층번호= 부모글의 계층번호+1
		cs.setGroupLayer(groupLayer + 1);

		// 부모글이 답글인 경우
		if (cs.getGroupOrd() == 0) {
			// 순서번호의 max
			int maxGroupOrd = adminDAO.maxGroupOrd();
			cs.setGroupOrd(maxGroupOrd + 1);
		}
		adminDAO.insertReply(cs);

	}

	// 공지사항 글 목록
	@Override
	public List listNotice() throws Exception {
		List noticeList = null;
		noticeList = adminDAO.selectAllNoticeList();
		return noticeList;
	}

	// 공지사항 작성
	@Override
	public int noticeWrite(noticeVO notice) throws Exception {
		return adminDAO.noticeWrite(notice);
	}

	// 공지사항 글 삭제
	@Override
	public int noticeRemove(int noticeNO) throws Exception {
		return adminDAO.noticeDelete(noticeNO);
	}

	// 공지사항 글 조회
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public noticeVO noticeView(int noticeNO) throws Exception {
		adminDAO.updateView(noticeNO); // 조회수 구현
		return adminDAO.noticeSelect(noticeNO);
	}

	// 공지사항 글 수정 기능
	@Override
	public void noticeModify(noticeVO notice) throws Exception {
		adminDAO.noticeUpdate(notice);
	}

	// 페이징한 글목록
	@Override
	public List<noticeVO> listPage(Criteria cri) throws Exception {
		return adminDAO.listPage(cri);
	}

	// DB 모든 글 개수 리턴
	@Override
	public int noticeTotal(Criteria cri) throws Exception {
		return adminDAO.noticeTotal(cri);
	}

	// FAQ 글 목록
	@Override
	public List listFaq() throws Exception {
		List faqList = null;
		faqList = adminDAO.selectAllFaqList();
		return faqList;
	}

	// FAQ 글 작성
	@Override
	public int faqWrite(faqVO faq) throws Exception {
		return adminDAO.faqWrite(faq);
	}

	// FAQ 글 삭제
	@Override
	public int faqRemove(int faq_no) throws Exception {
		return adminDAO.faqDelete(faq_no);
	}

	// FAQ 조회
	@Override
	public faqVO faqMod(int faq_no) throws Exception {
		faqVO faq = adminDAO.faqSelect(faq_no);
		return faq;
	}

	// FAQ 글 수정 기능
	@Override
	public int faqModify(faqVO faq) throws Exception {
		return adminDAO.faqUpdate(faq);
	}

	// 새로추가된거 관리자가 회원들의 포인트 이력 조회할때
	@Override
	public List adminPointHistory(Criteria cri) throws Exception {
		List pointHistory = adminDAO.adminPointHistory(cri);

		return pointHistory;
	}

	@Override
	public int totalPointHistory() throws Exception {
		return adminDAO.totalPointHistory();
	}

	/* 검색으로 특정 주문정보를 가져다주기 */
	@Override
	public List findpointHistory(String search) throws DataAccessException {
		List pointHistory = null;
		pointHistory = adminDAO.findpointHistory(search);

		return pointHistory;
	}

	@Override
	public void paymentCancle1(String accessToken) throws Exception {
		HttpURLConnection conn = null;
		URL url = new URL("https://api.iamport.kr/payments/cancel");

		conn = (HttpsURLConnection) url.openConnection();

		conn.setRequestMethod("POST");

		conn.setRequestProperty("Content-type", "application/json");
		conn.setRequestProperty("Accept", "application/json");
		conn.setRequestProperty("Authorization", accessToken);

		conn.setDoOutput(true);

		JsonObject json = new JsonObject();

		json.addProperty("reason", "취소 테스트");
		json.addProperty("imp_uid", "imp_874459489766");
		json.addProperty("amount", 40000);
		json.addProperty("checksum", 40000);

		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));

		bw.write(json.toString());
		bw.flush();
		bw.close();

		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));

		br.close();
		conn.disconnect();
	}

	// 내가 쓴 댓글 조회
	@Override
	public List adminCommentList(Criteria cri) throws Exception {
		List myCommentList = adminDAO.adminCommentList(cri);

		return myCommentList;

	}

	@Override
	public int adminTotalCommentPage(Criteria cri) throws Exception {
		return adminDAO.adminTotalCommentPage(cri);

	}
}
