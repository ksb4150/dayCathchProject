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
    <title>포인트 적립 관련</title>
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
            <a class="mypage_sidebar_b" href="${contextPath}/mypage/guidelinePointcoupon.do"><h4>포인트</h4></a>
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
    <section class="guideline_pc_sec">
        <h2>포인트 적립 안내</h2>
        <hr>
        <ul class="guideline_ul">
            <li class="guideline_li">
                날잡아 사이트에서 상품을 구매하시면 그 금액의 1%를 포인트로 적립해드립니다. (1포인트 = 1원)
                ※ 결제 시 포인트를 사용한 경우 그 금액 및 할인을 제외한 나머지 지불 금액에 대하여 포인트가 지급됩니다.
            </li>
            <li class="guideline_li">
                포인트 적립 시점은 결제완료 시점입니다.
            </li>
            <li class="guideline_li">
            프로모션이 진행 중일 경우, 일부 정책이 기본 포인트 정책과 상이할 수 있습니다. 이 경우, 프로모션 정책이 본 포인트 정책보다 우선 적용됩니다.
        </ul>
        <br>
        <h3>적립 대상</h3>
        <ul class="guideline_ul">
            <li class="guideline_li">
                포인트 적립을 위해서는 반드시 날잡아 회원이어야 합니다.
                </li>
            <li class="guideline_li">
                포인트는 여행객 앞으로 개별 적립되며, 대표구매자 앞으로 일행의 포인트를 통합 적립하는 것은 불가합니다.
            </li> 
        </ul>
        <br>
        <h3>유의사항</h3>
        <ul class="guideline_ul">
            <li class="guideline_li">
                내방 or 전화 예약자의 경우, 예약 시 담당자에게 포인트 적립 의사를 밝혀 적립 절차를 안내 받을 수 있습니다.
            </li>
            <li class="guideline_li">
                프로모션이 진행 중일 경우, 일부 정책이 기본 포인트 정책과 상이할 수 있습니다. 이 경우, 프로모션 정책이 본 포인트 정책보다 우선 적용됩니다.
            </li>
            <li> 
                포인트는 유효기간 경과 시 자동 소멸 되며 복구되지 않습니다. 포인트 유효기간은 휴면 회원 전환 여부와 관계없이 적용됩니다. 
            </li>
            <li>
                회원 탈퇴 즉시 포인트는 소멸되며 재가입 시 복구할 수 없습니다. 
            </li>
            <li>
                포인트 유효기간은 적립일로부터 통상 1년이며, 일부 프로모션 참여 보상 등으로 지급된 포인트는 포인트 별로 유효기간이 상이할 수 있습니다.
            </li>

                </ul>
                <br>
                <br>
                <h2>포인트 사용 안내</h2>
                <hr>
                <ul class="guideline_ul">
                    <li>
                        1포인트(P)부터 사용 가능하며, 날잡아 사이트에서 판매하는 상품의 온라인 결제 시에만 사용할 수 있습니다. 단, 복합 결제로 사용 시 할인쿠폰 사용 조건 등에 따라 포인트 사용이 일부 제한될 수 있습니다.
                    </li>
                    <li>
                        포인트로 결제가 가능한 상품은 아래와 같습니다.
                        ※포인트 결제 가능: 국내 여행상품, 실시간 호텔,
                    </li>
                    <li>
                        사용할 포인트는 상품 결제단계(온라인)에서 구매자(회원) 본인이 직접 입력하게 됩니다. 이때 포인트 사용액은 포인트 보유액을 초과할 수 없습니다.
                    </li>
                    <li>
                        포인트는 유효기간이 짧은 포인트가 우선적으로 사용됩니다. 유효기간이 경과된 포인트는 소멸되며, 사용할 수 없습니다.
                    </li>
                    <li>
                        미성년자 회원의 경우 일부 서비스가 제한 될 수 있습니다.
                    </li>
                </ul>
                <br>
                        <img src="img/guideline_point1.JPG">
         
    </section>
    </div>
    </div>
    </div>
</body>
</html>