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
    <title>결제 가이드라인</title>
    <link rel="stylesheet" href="/css/guideline.css">
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
<div class="contents">
    <section class="guideline_pay1">
        <h1>결제 방법 안내</h1>
        <hr>
        <div class="guideline_pay3">
        <h3>여행상품 신용카드 결제방법</h3>
        <hr>
        <img class="guideline_pay_img" src="/img/guideline_pay1.JPG">
        <ul class="guideline_ul">

            <li class="guideline_li"> 
                상품 예약이 완료되면 담당자가 확인 후, 최종 예약이 성립되면 [예약확인/결제] 페이지의 예약 내역에 [결제하기]가 표시됩니다.
            </li>
            <li class="guideline_li"> 
                회원이신 경우 회원 로그인을, 비회원이신 경우에는 이름과 예약번호를 입력하여 비회원 로그인을 하시면
                [예약확인/결제] 페이지를 확인하실 수 있습니다.
            </li>
            <li class="guideline_li">
                [결제하기]를 클릭한 후 표시되는 화면의 내용에 맞춰 결제 금액 등 결제 정보를 입력한 후, [결제하기]를 클릭하면 결제하실 카드를
                선택하는 창이 뜨고, 결제를 진행할 카드를 선택하면 각 카드사 별로 결제를 위한 창이 뜹니다.
            </li>
            <li class="guideline_li">
                카드번호를 입력하시고 공인인증서 인증을 받아 결제를 진행합니다.
            </li>
            <li class="guideline_li">
                결제가 완료되면 예약확인/결제 페이지의 예약 현황 항목이 [입금 대기중]에서 [입금 완료]로 변경됩니다.
            </li>

        </ul>
        </div>
        <br>
        <h3>신용카드 결제 순서</h3>
        <div class="guideline_pay2">
            <img class="guideline_pay_img" src="/img/guideline_pay2.JPG">
    </div>
        <br>
        <div class="guideline_pay3">
        <h3>호텔 신용카드 결제 방법</h3>
        <hr>
        <img class="guideline_pay_img" src="/img/guideline_hotel1.JPG">
        <br>
        <ul class="guideline_ul">
            <li>
                호텔 조회 후 선택하신 호텔의 예약과 결제가 동시에 진행됩니다.
            </li>
            <li>
                [결제하기]를 클릭한 후 표시되는 화면의 내용에 맞춰 결제금액 등 결제정보를 입력한 후, [결제하기]를 클릭하면 결제하실 카드를 선택하는
                    창이 뜨고, 결제를 진행할 카드를 선택하면 각 카드사 별로결제를 위한 창이 뜹니다.
            </li>
            <li>
                카드번호를 입력하시고 필요한 경우 공인인증서 인증을 받아 결제를 진행합니다.
            </li>

            <br>
            <h3>신용카드 결제 순서</h3>
            <div class="guideline_pay2">
            <img class="guideline_pay_img" src="/img/guideline_hotel2.JPG">
            </div>
        </ul>
        </div>
    </section>
    </div>
    </div>
</div>
</body>
</html>