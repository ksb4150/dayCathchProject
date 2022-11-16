<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
    
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="orderList" value="${ordersInfoMap.orderList}"/>
<c:set var="ordergoodsList" value="${ordersInfoMap.ordergoodsList}"/>
<c:set var="pm" value="${ordersInfoMap.pm}"/>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link type="text/css" rel="stylesheet" href="/css/adminside.css" />
<link type="text/css" rel="stylesheet" href="/css/adminOrderList.css" />
<title>관리자 주문 조회 페이지</title>

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"> </script>
	
<script>
	
</script>
</head>
<body>
	<br>
	<div class="contents_area">
		<div class="soon">
			<div class="userListDiv1">
			<section class="mypagesidebar0">
			<div>
				<ul class="mypagesidebar_ul">
					<li class="sidebardiv1"><a class="mypage_sidebar_a"
						href="${contextPath}/admin/adminMain.do"><h3>관리자 페이지</h3></a></li>
					<li><a class="mypage_sidebar_a"
						href="${contextPath}/admin/aSalesStatusPage.do"><h3>매출	현황</h3></a></li>
					<hr>
					<li><a class="mypage_sidebar_a"
						href="${contextPath }/admin/adminOrderList"><h3>주문 취소 현황</h3></a>
					</li>
					<hr>
					<li><details>
							<summary>
								<h3>회원 관리</h3>
							</summary>
							<hr>
							<a class="mypage_sidebar_b"
								href="${contextPath}/admin/userList.do"><h4>사용자회원 목록</h4></a>
							<hr>
							<a class="mypage_sidebar_b"
								href="${contextPath}/admin/buserList.do"><h4>사업자회원 목록</h4></a>

						</details></li>
					<hr>
					<li><details>
							<summary>
								<h3>상품 관리</h3>
							</summary>
							<hr>
							<a class="mypage_sidebar_b"
								href="${contextPath}/admin/adminGoodsList.do"><h4>상품
									목록</h4></a>
							<hr>
							<a class="mypage_sidebar_b"
								href="${contextPath}/admin/adminGoodsList2.do"><h4>상품
									승인</h4></a>
						</details></li>

					<hr>

					<li><a class="mypage_sidebar_a" href="${contextPath}/admin/adminPointHistory.do"><h3>포인트
								내역 조회</h3></a></li>
					<hr>
					<li><details>
							<summary>
								<h3>고객센터 관리</h3>
							</summary>
							<hr>
							<a class="mypage_sidebar_b"
								href="${contextPath}/admin/adNotice.do"><h4>공지사항</h4></a>
							<hr>
							<a class="mypage_sidebar_b"
								href="${contextPath}/admin/adQnaboard.do"><h4>1대1문의</h4></a>
							<hr>
							<a class="mypage_sidebar_b"
								href="${contextPath}/admin/adFaqList.do"><h4>자주하는 질문</h4></a>
						</details></li>
					<hr>
					<li>
						<details>
							<summary>
								<h3>커뮤니티 관리</h3>
							</summary>
							<hr>
							<a class="mypage_sidebar_b" href="${contextPath}/admin/adminCommunityList.do"><h4>게시글 관리</h4></a>
							<hr>
							<a class="mypage_sidebar_b" href="${contextPath}/admin/adminCommentList.do"><h4>댓글 관리</h4></a><hr>
							<a class="mypage_sidebar_b"	href="${contextPath}/admin/adminReviewList.do"><h4>리뷰 관리</h4></a>
						</details>
					</li>
				</ul>
			</div>
		</section>
		
		<div class="contents">
		<div class="caption"> 주문 취소 현황</div>
			<div>
				<table class="orderlist_table">
					<tr class="orderlist_top_tr">
						<td style="width: 200px;">주문번호</td>
						<td style="width: 600px;">결제자명</td>
						<td style="width: 100px;">연락처</td>
						<td style="width: 100px;">결제금액</td>
						<td style="width: 100px;">주문상태</td>
						<td style="width: 100px;">결제일</td>
						<td style="width: 180px;">승인상태</td>
					</tr>
					<c:choose>
						<c:when test="${empty orderList}">
							<tr height="10">
								<td colspan="7">
									<p align="center">
										<b><span style="font-size: 9pt;">주문 일괄 취소요청이
												없습니다.</span></b>
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
									<td><fmt:formatNumber
											value="${orderList.finalTotalPrice}" pattern="#,### 원" /></td>
									<td>${orderList.orderState}</td>
									<td>${orderList.creDate}</td>
									<td class="td_width_4 table_text_align_center">
										<!-- 주문취소 할게 있을때만 주문취소 버튼이 나오게 c태그로 설정해놓음 --> <c:choose>
											<c:when test="${orderList.orderState == '취소대기'}">
												<form action="/admin/orderRefund1" method="POST"
													id="deleteForm">
													<input type="hidden" name="ordersNO"
														value="${orderList.ordersNO}"> <input
														type="hidden" name="uid" value="${orderList.uid}">
													<input type="submit" value="취소승인(전체)">
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
						<td style="width: 200px;">주문번호</td>
						<td style="width: 600px;">상품명</td>
						<td style="width: 100px;">수량</td>
						<td style="width: 100px;">판매가</td>
						<td style="width: 100px;">주문상태</td>
						<td style="width: 100px;">예약 날짜</td>
						<td style="width: 180px;">승인상태</td>
					</tr>
					<c:choose>
						<c:when test="${empty ordergoodsList}">
							<tr height="10">
								<td colspan="7">
									<p align="center">
										<b><span style="font-size: 9pt;">주문 건별 취소요청이
												없습니다.</span></b>
									</p>
								</td>
							</tr>
						</c:when>
						<c:when test="${!empty ordergoodsList}">
							<c:forEach var="ordergoodsList" items="${ordergoodsList}">
								<tr class="orderlist_tr">
									<td class="td_width_1 orderList_info_td">
										${ordergoodsList.ordersNO}</td>
									<td><p class="goods_name">
											${ordergoodsList.goodsName}</p></td>
									<td>${ordergoodsList.goodsQty}</td>
									<td><fmt:formatNumber
											value="${ordergoodsList.totalPrice}" pattern="#,### 원" />
									</td>
									<td>${ordergoodsList.orderState}</td>
									<td>${ordergoodsList.cartcheckin}<br>${ordergoodsList.cartcheckout}</td>
									<td><c:choose>
											<c:when test="${ordergoodsList.orderState == '취소대기'}">
												<form action="/admin/orderRefund2" method="POST"
													id="deleteForm">
													<input type="hidden" name="ordersNO"
														value="${ordergoodsList.ordersNO}"> <input
														type="hidden" name="goodsId"
														value="${ordergoodsList.goodsId}"> <input
														type="submit" value="취소승인(건별)">
												</form>
											</c:when>
										</c:choose></td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
				</table>
			</div>

						<form action="/admin/FindAdminOrdersList.do" method="post" class="usernameform">
							<input type="text" name="search"> 
							<input id="orderList_button1" type="submit" value="검색">
						</form>
						<br> <br>
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
											<c:forEach var="num" begin="${pm.startPage}"
												end="${pm.endPage}">
												<li class="pageInfo_btn ${pm.cri.pageNum == num ? "active":"" }"><a
													href="${num}">${num}</a></li>
											</c:forEach>

											<!-- 다음페이지 버튼 -->
											<c:if test="${pm.next}">
												<li class="pageInfo_btn next"><a
													href="${pm.endPage + 1 }">Next</a></li>
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
								<button id="orderList_button1">
									<a href="${contextPath}/admin/adminOrderList"
										style="color: white; text-decoration: none;">목록보기</a>
								</button>
							</c:otherwise>
						</c:choose>
				</div>
			</div>
		</div>
	</div>

	<script>
		let moveForm = $("#moveForm");
		$(".pageInfo a").on("click", function(e) {
			e.preventDefault();
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.attr("action", "/admin/adminOrderList");
			moveForm.submit();

		});
		
		function cancelPay(frm) {
				$.ajax({
					   type: "POST",
					   data: frm,
					   async: false,
					   cache: false,
					   contentType : false,
					   processData : false,
					   url: "${contextPath}/admin/orderRefund1.do",
					   success: function(result) {
						   alert("검증 다녀옴");
						   var json = JSON.parse(result);
						   let verifyAmount = json.verifyAmount;
						   
						   if(paid_amount == verifyAmount) {
							   alert("정상적인 거래");
						   } else {
							   alert("실패");
						   }
						   
					   } ,
					   error: function(request, status, error) {
				                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				       }
					   
			   });
			}
		
	</script>
</body>
</html>