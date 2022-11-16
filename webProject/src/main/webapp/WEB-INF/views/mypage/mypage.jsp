<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="member" value="${member}"/>
<c:set var="cartcount" value="${cartcount}"/>
<c:set var="likecount" value="${likecount}" /> 
<c:set var="ordercount" value="${ordercount}"/>
<c:set var="ordercancelcount" value="${ordercancelcount}" /> 
<c:set var="cscount" value="${cscount}"/>
<c:set var="articlecount" value="${articlecount}" /> 
<c:set var="commentcount" value="${commentcount}"/>



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
<c:choose>
	<c:when test="${isLogOn == true && member != null }">
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
		            <a class="mypage_sidebar_b" href="${contextPath}/mypage/guidelinePointcoupon.do"><h4>포인트 안내</h4></a>
		            <hr>
		            <a class="mypage_sidebar_b" href="${contextPath}/mypage/guidelineAirplain.do"><h4>항공권 이용 안내</h4></a>
		        </details>
		    </li>
		</ul>
		</div>
		</section>
	</c:when>
	<c:otherwise>
	test
	</c:otherwise>
</c:choose>
<div class="contents">
        <div class="mypage_block">
            <p class="mypage_hello">안녕하세요, 날잡아 <em class="emp_blue"> ${member.userName}</em> 회원님! </p>
            <ul class="mypage_link">
                <li><a href="${contextPath}/member/memberModify.do"><em><strong class="mymod"><img src="/img/nj-personal-data.png" alt="개인정보수정"></strong></em><br>개인정보 수정</a></li>
                <li>
                    <a href="#">
                        <em>
                            <img src="/img/nj-point.png" alt=""><strong class="mypoint">${member.userPoint}</strong> P
                        </em><br>보유 포인트
                    </a>
                </li>
                <li id="Coupon_nj"><a href="${contextPath}/mypage/pointCoupon.do"><em><img src="/img/like.png" alt="찜목록"><strong class="mycoupon">${likecount}</strong> 개</em><br>찜 목록</a></li>
                <li id="Basket_nj"><a href="${contextPath}/mypage/listCart.do"><em><img src="/img/nj-shoppingcart.png" alt="장바구니"><strong class="mycart">${cartcount}</strong> 개</em><br>나의 장바구니</a></li> 
            </ul>
        </div>
        
        <div class="block_tit_area">
            <h4 class="stit_con_title">예약내역</h4>
            <div class="btn_tit_area">
                <button type="button" class="btn_nor" onclick="location.href='${contextPath}/mypage/ordersNocheck'">내 예약찾기</button>
                <button type="button" class="btn_wit" onclick="location.href='${contextPath}/mypage/ordersNocheck'">전체보기</button>
            </div>
        </div>

        <div class="bookinglist">
            <ul class="booking_count">
                <li><span>예약 완료<a href="${contextPath}/mypage/ordersNocheck"><em>${ordercount}</em>건</a></span></li>
                <li id="Booking_nj"><span>예약 취소<a href="${contextPath}/mypage/ordersNocheck"><em>${ordercancelcount}</em>건</a></span></li>
            </ul>
        </div>
        
        <div class="content_area1">
            <div class="part_area_in">
                <h4 class="stit_con_title">문의내역</h4>
                <div class="mypage_count">
                    <ul class="list_count">
                        <li><span>상담 문의 <a href="#"><em>${cscount}</em>건</a></span></li>
                        <li><span>나의 1:1 문의<a href="#"><em>${cscount}</em>건</a></span></li>
                    </ul>
                </div>	
            </div>
            <div class="part_area_in">
                <h4 class="stit_con_title">커뮤니티</h4>
                <div class="mypage_count">
                    <ul class="list_count">
                        <li><span>작성한 게시글<a href="#"><em>${articlecount}</em>건</a></span></li>
                        <li><span>작성한 댓글 <a href="#"><em>${commentcount}</em>건</a></span></li>
                    </ul>							 
                </div>	
            </div>
        </div>
    </div>
    </div>
    </div>
</body>
</html>