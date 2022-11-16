<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="orderList" value="${ordersInfoMap.orderList}" />
<c:set var="ordergoodsList" value="${ordersInfoMap.ordergoodsList}" />
<c:set var="pm" value="${ordersInfoMap.pm}" />
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>주문 조회 페이지</title>
<link rel="stylesheet" href="/css/orderList.css" />
<link rel="stylesheet" href="/css/side.css"/>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>

</head>
<body>
<div class="contents_area">
	<div class="soon">
	<section class="mypagesidebar0">
	<div>
		<ul class="mypagesidebar_ul">
			<li class="sidebardiv1"><a class="mypage_sidebar_a"
				href="${contextPath}/mypage/mypage.do"><h3>마이페이지</h3></a></li>
			<li><details>
					<summary>
						<h3>개인정보수정</h3>
					</summary>
					<hr>
					<a class="mypage_sidebar_b" href="${contextPath}/member/memberModify.do"><h4>내 정보 수정</h4></a>
					<hr>
					<a class="mypage_sidebar_b" href="${contextPath}/member/modifyPw.do"><h4>비밀번호 수정</h4></a>
			</details></li>
			<hr>
			<li><a class="mypage_sidebar_a"
				href="${contextPath}/mypage/listCart.do"><h3>장바구니</h3></a></li>
			<hr>
			<li>
	        <details>
	            <summary><h3>커뮤니티</h3></summary>
	            <hr>
	            <a class="mypage_sidebar_b" href="${contextPath}/board/myArticleList1.do"><h4>작성한 게시글</h4></a>
	            <hr>
	            <a class="mypage_sidebar_b" href="${contextPath}/board/mycommentList.do"><h4>작성한 댓글</h4></a>
	            
	        </details>
	    </li>
	             <hr>
	             
	    <li>
	         <details>
	            <summary><h3>상품내역</h3></summary>
	              <hr>
	             <a class="mypage_sidebar_b" href="${contextPath}/mypage/wishList.do"><h4>관심내역</h4></a>
	             <hr>
	             <a class="mypage_sidebar_b" href="${contextPath}/mypage/ordersNocheck"><h4>예약확인</h4></a>        
	         </details>
	    </li>
	    		<hr>
	    <li>
	        <a class="mypage_sidebar_a" href="${contextPath}/mypage/pointCoupon.do"><h3>포인트/쿠폰</h3></a>
	    </li>
	            <hr>
	    <li>
	        <details>
	            <summary><h3>고객센터</h3></summary>
	            <hr>
	            <a class="mypage_sidebar_b" href="${contextPath}/mypage/notice.do"><h4>공지사항</h4></a>
	            <hr>
	            <a class="mypage_sidebar_b" href="${contextPath}/mypage/qna.do"><h4>1대1문의</h4></a>
	            <hr>
	            <a class="mypage_sidebar_b" href="${contextPath}/mypage/faqList.do"><h4>자주하는 질문</h4></a>
	            <hr>
	            <a class="mypage_sidebar_b" href="${contextPath}/page/eventList.do"><h4>이벤트</h4></a>
	        </details>
	    </li>
	        <hr>
	    <li>
	       <details>
	            <summary><h3>이용안내</h3></summary>
	            <hr>
	            <a class="mypage_sidebar_b" href="${contextPath}/mypage/guidelineReservation.do"><h4>예약 안내</h4></a>
	            <hr>
	            <a class="mypage_sidebar_b" href="${contextPath}/mypage/guidelinePay.do"><h4>결제 방법 안내</h4></a>
	            <hr>
	            <a class="mypage_sidebar_b" href="${contextPath}/mypage/guidelinePointcoupon.do"><h4>포인트/쿠폰 안내</h4></a>
	            <hr>
	            <a class="mypage_sidebar_b" href="${contextPath}/mypage/guidelineAirplain.do"><h4>항공권 이용 안내</h4></a>
	        </details>
	    </li>
	</ul>
	</div>
	</section>
	<div class="contents">
		<section class="orderlistsection">
			<div>
				<h2 style="margin-bottom: 35px;">나의 주문내역</h2>
				<table class="orderlist_table">
					<tr class="orderlist_top_tr">
						<td>주문번호</td>
						<td>결제자명</td>
						<td>연락처</td>
						<td>결제금액</td>
						<td>주문상태</td>
						<td>결제일</td>
						<td></td>
					</tr>
					<c:choose>
						<c:when test="${empty orderList}">
							<tr height="10">
								<td colspan="7">
									<p align="center">
										<b><span style="font-size: 9pt;">주문 기록이 없습니다.</span></b>
									</p>
								</td>
							</tr>
						</c:when>
						<c:when test="${!empty orderList}">
							<c:forEach var="orderList" items="${orderList}">
	
								<tr class="orderlist_tr">
									<td class="td_width_1 orderList_info_td">
										${orderList.ordersNO}</td>
									<td>${orderList.ordererName}</td>
									<td>${orderList.ordererPhoneNumber}</td>
									<td><fmt:formatNumber value="${orderList.finalTotalPrice}"
											pattern="#,### 원" /></td>
									<td>${orderList.orderState}</td>
									<td>${orderList.creDate}</td>
									<td class="td_width_4 table_text_align_center">
										<!-- 주문취소 할게 있을때만 주문취소 버튼이 나오게 <c태그로 설정해놓음 --> <c:choose>
											<c:when test="${orderList.orderState == '결제완료'}">
												<form action="/mypage/orderRefund1" method="POST"
													id="deleteForm">
													<input type="hidden" name="ordersNO"
														value="${orderList.ordersNO}"> <input type="hidden"
														name="uid" value="${orderList.uid}"> <input
														type="submit" value="취소요청(전체)">
												</form>
											</c:when>
											<c:otherwise>
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
					<tr class="orderlist_top_tr">
						<td>주문번호</td>
						<td>상품명</td>
						<td>수량</td>
						<td>판매가</td>
						<td>주문상태</td>
						<td>예약 날짜</td>
						<td></td>
					</tr>
					<c:choose>
						<c:when test="${empty ordergoodsList}">
							<tr height="10">
								<td colspan="7">
									<p align="center">
										<b><span style="font-size: 9pt;">주문 상품이 없습니다.</span></b>
									</p>
								</td>
							</tr>
						</c:when>
						<c:when test="${!empty ordergoodsList}">
							<c:forEach var="ordergoodsList" items="${ordergoodsList}">
								<tr class="orderlist_tr">
									<td class="td_width_1 orderList_info_td">
										${ordergoodsList.ordersNO}</td>
									<td><p class="goods_name">${ordergoodsList.goodsName}</p></td>
									<td>${ordergoodsList.goodsQty}</td>
									<td><fmt:formatNumber value="${ordergoodsList.totalPrice}"
											pattern="#,### 원" /></td>
									<td>${ordergoodsList.orderState}</td>
									<td>${ordergoodsList.cartcheckin}<br>${ordergoodsList.cartcheckout}</td>
									<td><c:choose>
											<c:when test="${ordergoodsList.orderState == '결제완료'}">
												<form action="/mypage/orderRefund2" method="POST"
													id="deleteForm">
													<input type="hidden" name="ordersNO"
														value="${ordergoodsList.ordersNO}"> <input
														type="hidden" name="goodsId"
														value="${ordergoodsList.goodsId}"> <input
														type="submit" value="취소요청(건별)">
												</form>
											</c:when>
											<c:otherwise>
											</c:otherwise>
										</c:choose></td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
				</table>
			</div>
	
			<br>
	
			<form action="/order/FindOrdersList.do" method="post"
				class="usernameform">
				<input type="text" name="search"> <input
					id="orderList_button1" type="submit" value="검색">
			</form>
	
			<!-- 게시판 페이징 영역 -->
			<c:choose>
				<c:when test="${pm != null}">
					<div class="pageInfo_wrap">
						<div class="pageInfo_area">
							<ul id="pageInfo" class="pageInfo">
	
								<!-- 이전페이지 버튼 -->
								<c:if test="${pm.prev}">
									<li class="pageInfo_btn previous"><a
										href="${pm.startPage-1}">Previous</a></li>
								</c:if>
	
								<!-- 각 번호 페이지 버튼 -->
								<c:forEach var="num" begin="${pm.startPage}" end="${pm.endPage}">
									<li class="pageInfo_btn ${pm.cri.pageNum == num ? "active":"" }"><a
										href="${num}">${num}</a></li>
								</c:forEach>
	
								<!-- 다음페이지 버튼 -->
								<c:if test="${pm.next}">
									<li class="pageInfo_btn next"><a href="${pm.endPage + 1 }">Next</a></li>
								</c:if>
	
							</ul>
						</div>
					</div>
	
					<form id="moveForm" method="get">
						<input type="hidden" name="pageNum" value="${pm.cri.pageNum }">
						<input type="hidden" name="amount" value="${pm.cri.amount }">
					</form>
				</c:when>
				<c:otherwise>
					<button id="orderList_button1" class="btn_order">
						<a href="${contextPath}/mypage/ordersNocheck"
							style="color: white; text-decoration: none;">주문조회</a>
					</button>
				</c:otherwise>
			</c:choose>
			<button id="orderList_button1" class="btn_return">
				<a href="${contextPath}/page/mainPage.do"
					style="color: white; text-decoration: none;">홈으로</a>
			</button>
	
		</section>
	</div>

		<script>
			let moveForm = $("#moveForm");
			$(".pageInfo a").on("click", function(e){
			e.preventDefault();
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.attr("action", "/mypage/ordersNocheck");
			moveForm.submit();
			
			});	
		</script>
	</div>
	</div>
</body>
</html>