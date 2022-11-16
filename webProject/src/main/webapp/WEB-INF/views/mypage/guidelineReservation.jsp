<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약 안내</title>
        <link rel="stylesheet" href="css/guideline.css">
        <link rel="stylesheet" href="/css/side.css">
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
            <a class="mypage_sidebar_b" href="${contextPath}/mypage/guidelinePointcoupon.do"><h4>포인트/쿠폰 안내</h4></a>
            <hr>
            <a class="mypage_sidebar_b" href="${contextPath}/mypage/guidelineAirplain.do"><h4>항공권 이용 안내</h4></a>
        </details>
    </li>
</ul>
</div>
</section>
</c:when>
<c:otherwise>
	<div style="margin-right: 160px;">
	</div>
</c:otherwise>
</c:choose>
    <section class="guideline_reservation_sec">
        <h2>예약 안내</h2>
        <hr>
        <img class="guideline_reservation_img" src="/img/reservation_guideline1.JPG" width="">
        <img class="guideline_reservation_img" src="/img/reservation_guideline2.JPG">
    </section>
    </div>
    </div>
    </div>
</body>
</html>