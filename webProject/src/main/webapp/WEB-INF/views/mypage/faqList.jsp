<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>  

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/css/faqList.css">
<link rel="stylesheet" href="/css/side.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <title>faqList</title>
<script>

function fn_removeFaq(url, faq_no) {
	alert('삭제하기');
	var form = document.createElement("form");
	    form.setAttribute("method", "post");
	    form.setAttribute("action", url);
    var faq_noInput = document.createElement("input");
	    faq_noInput.setAttribute("type","hidden");
	    faq_noInput.setAttribute("name","faq_no");
	    faq_noInput.setAttribute("value", faq_no);
	
		
		form.appendChild(faq_noInput);
		document.body.appendChild(form);
		form.submit();
}
</script>
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
	             <a class="mypage_sidebar_b" href="#"><h4>관심내역</h4></a>
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
			 <div class="container">
					<div class="faq-title">
					<h2 style="text-align:center;">자주 하는 질문(FAQ)</h2>
					<div class="faq-content">
								<div class="faq-btn" style="padding:15px;" >					
								<a href="${contextPath}/mypage/qnaboard.do">
									<button class="faqbtn" style="float:right; margin-top:20px; margin-bottom: 30px; margin-left: 10;">1:1 문의내역</button>
								</a>
								<a href="${contextPath}/mypage/qna.do">
									<button class="faqbtn" style="float:right; margin-top:20px; margin-bottom: 30px;">1:1 문의하기</button>
								</a>
								</div>
					    
					    	<%-- 아코디언 --%>
					    <div style="margin-top: 80px;">
						  <div name="uid" hidden></div>
						  <input type="hidden" name="faq_no" value="${faq.faq_no}" disabled/>
						  <div id="Accordion_wrap" style="margin-top: 40;">
						    
					     <c:forEach items="${faqList}" var="faq">
					     
						     <div class="que">
						     	<span>${faq.faq_title}</span>
						     	<input type="hidden" value="${faq.faq_no}">
						        <div class="arrow-wrap">
						         	<span class="arrow-top">↑</span>
						         	<span class="arrow-bottom">↓</span>
						        </div>
						     </div>
							 <div class="anw">
							     <c:choose>
										<c:when test="${manager==0}">
										<span>${faq.faq_content}
											<input type="button" id="deletebut" value="삭제" style="float:right; margin-right:20px;"
												onclick="fn_removeFaq('${contextPath}/mypage/removeFaq.do', ${faq.faq_no})" /> 	 
											</span> 
										</c:when>
										<c:otherwise>
										<span>${faq.faq_content}</span>
										</c:otherwise>
									</c:choose>
							  </div>
						</c:forEach>
						 </div>
					   </div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>    
<script>
	$(".que").click(function() {
	   $(this).next(".anw").stop().slideToggle(300);
	  $(this).toggleClass('on').siblings().removeClass('on');
	  $(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
	});

</script>
</body>
</html>