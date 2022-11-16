<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>항공안내</title>
    <link rel="stylesheet" href="/css/side.css">
    <link rel="stylesheet" href="/css/guideline.css">
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
    <section class="guideline_air_sec">
        <h1>국내 항공권 이용 안내</h1>
        <hr>
        <h3>예약 변경 및 취소/환불</h3>
        <ul class="guideline_ul">
            <li>
                천재지변에 의한 취소나 항공사 사정으로 인하여 취소 및 지연 건은 유선상으로 취소 하시기 바랍니다.
            </li>
            <li>
                취소 된 예약은 취소철회가 불가능하오니 주의 하시기 바랍니다.
            </li>
            <li>
                구매한 항공권은 일정 및 이름 수정이 불가하오니 취소 후 새로 예약해주셔야 합니다.
            </li>
            <li>
                부분 취소의 경우 사이트에서 처리 불가능 하오니 유선 또는 온라인상 문의글에 요청 주시기 바랍니다.
            </li>
            <li>
                탑승수속 마감시간 이후 취소 시 출발 후 수수료가 적용됩니다.(유선 요청주시기 바랍니다.)
            </li>
            <li>
                여행사 업무시간 이후 취소요청은 해당 항공사로 문의 바랍니다.
            </li>
            <li>
                환불 수수료는 항공사 사정에 의해 공지없이 변경 될 수 있습니다. (취소 전 환불 수수료를 정확히 확인하시기 바랍니다.)
            </li>
        </ul>
        <h3>
            항공권 수령 방법
        </h3>
        <ul class="guideline_ul">
            <li>
                국내선은 항공사 예약번호로 확인되며, 탑승수속시 키오스크 또는 항공사 홈페이지에서 모바일 탑승권(웹체크인)으로 발급 받으시길 바랍니다.
            </li>
            <li>
                예약번호와 신분증 (탑승자 모두 신분증 지참)확인 후 온라인 체크인 또는 공항 내 키오스크를 이용하여 간편하게 탑승권을 받으실 수 있습니다.
                 (단, 신분할인 적용 대상자는 항공사 카운터에서 증빙서류 확인 후 체크인 하셔야 합니다.)
            </li>
            <li>
                17년 7월1일부로 본인 사진이 부착된 신분증 미소지 승객은 항공기 탑승불가하오니 반드시 지참바랍니다.
                 (단,소아 및 유아는 건강보험증, 주민등록등본, 가족관계증명서 등으로 신분 확인이 가능합니다.)
            </li>
            <li>
                아시아나항공, 에어서울, 티웨이항공의 경우 소아, 유아는 반드시 만 18세 이상의 성인과 동반할 경우에만 이용가능합니다.
            </li>
            </ul>

            <h2>항공권 수령시 준비물</h2>
            <br>
            <img src="/img/guideline_airplain1.JPG">
            <br>
            <h2>무료 위탁 수하물 규정</h2>
            <br>
            <img src="/img/guideline_airplain2.JPG"> 
            <br>
            
    </section>
    </div>
    </div>
    </div>
    
</body>
</html>