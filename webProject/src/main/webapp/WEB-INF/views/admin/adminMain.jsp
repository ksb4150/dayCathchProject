<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="member" value="${member}"/>
<c:set var="oc" value="${orderCount}"/>
<c:set var="occ" value="${orderCancelCount}" /> 
<c:set var="cc" value="${csCount}"/>
<c:set var="cac" value="${csAnswerCount}" /> 
<c:set var="bc" value="${boardCount}"/>
<c:set var="bcc" value="${boardcommentCount}" /> 



<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/css/side.css"/>
    <link rel="stylesheet" href="/css/mypage.css"/>
</head>
<body>
 	<div class="contents_area">
		<div class="soon">
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
				<div class="mypage_block">
					<p class="mypage_hello">관리자 메인 페이지 <em class="emp_blue" style="color: blue;"> ${member.userName}</em> 로그인됨 </p>
					<ul class="mypage_link">
						<li><a href="${contextPath}/admin/userList.do"><em><strong class="mymod"><img src="/img/nj-personal-data.png" alt="회원목록조회"></strong></em><br>회원 목록 조회</a></li>
						<li>
							<a href="#">
								<em>
									<img src="/img/nj-point.png" alt="">
								</em><br>회원 포인트 사용 현황
							</a>
						</li>
						<li id="Coupon_nj"><a href="#"><em><img src="/img/bSalesPage.png" alt="매출현황"></em><br>날잡아 매출 현황</a></li>
						<li id="Basket_nj"><a href="#"><em><img src="/img/bussinessparter1.JPG" alt="사업자회원"></em><br>사업자 회원 승인 대기</a></li> 
					</ul>
				</div>
			
				<div class="block_tit_area">
					<h4 class="stit_con_title">주문 관리</h4>
					<div class="btn_tit_area">
						<button type="button" class="btn_wit" onclick="location.href='#'">전체보기</button>
					</div>
				</div>

				<div class="bookinglist">
					<ul class="booking_count">
						<li><span>주문 현황<a href="#"><em>${oc}</em>건</a></span></li>
						<li id="Booking_nj"><span>주문 취소 현황 <a href="#"><em>${occ}</em>건</a></span></li>
					</ul>
				</div>
				
				<div class="content_area1">
					<div class="part_area_in">
						<h4 class="stit_con_title">문의내역</h4>
						<div class="mypage_count">
							<ul class="list_count">
							<li><span>고객 문의 현황<a href="#"><em>${cc}</em>건</a></span></li>
							<li><span>답변 내역<a href="#"><em>${cac}</em>건</a></span></li>
							</ul>
						</div>	
					</div>
					<div class="part_area_in">
						<h4 class="stit_con_title">커뮤니티</h4>
						<div class="mypage_count">
							<ul class="list_count">
								<li><span>작성된 게시글<a href="#"><em>${bc}</em>건</a></span></li>
								<li><span>작성된 댓글<a href="#"><em>${bcc}</em>건</a></span></li>
							</ul>							 
						</div>	
					</div>
				</div>
			</div>
		</div>
    </div>
</body>
</html>