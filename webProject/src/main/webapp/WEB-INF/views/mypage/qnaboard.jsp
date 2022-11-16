<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="qnaboard" value="${qnaboard}"/>
<c:set var="pm" value="${pm }" />

<%
	request.setCharacterEncoding("utf-8");
%>


<!DOCTYPE html>
<html lang="en">
<html>
    <head>
         <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link type="text/css" rel="stylesheet" href="/css/qnaboard.css"/>
    <link type="text/css" rel="stylesheet" href="/css/header.css"/>
    <link type="text/css" rel="stylesheet" href="/css/side.css"/>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
  	
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
	    	<div id="mainWrapper">
	          <div name="uid" hidden></div>
	          <div name="userType" hidden></div>
	            <!-- 게시판 제목 -->
	            <h2 style="text-align:center;">나의 문의내역</h3>
	            
	                         
	            
	           <!-- 게시판 목록  -->
	            <ul id="table">
	                 <li>
	                    <ul id ="ulTable">
	                        <li>
	                            <ul id ="title">
	                                <li>카테고리</li>
	                                <li>제목</li>
	                                <li>작성일</li>
	                             </ul>
	                        </li>
	                        <!-- 게시물이 출력될 영역 -->
	             <c:choose>
	             	<c:when test="${qnaboard == null}" >
	             	<ul height="10">
	             		<li colspan="4">
	             			<p align="center">
	             				<span style="font-size:12px"> 등록된 글이 없습니다. </span>
	             			</p>
	             		</li>
	             	</ul>
	             	</c:when>
	             	
	             	<c:when test="${qnaboard != null}" >
		                <c:forEach var="cs" items="${qnaboard}" >          
		                        <li>
		                            <ul>
		                                <li>${cs.csCategory}</li>
		                                <li class="left">
		                                <span style="padding-right:10px"></span>
		                                <c:choose>
		                                	<c:when test='${cs.groupLayer>=1}'>
		                                	<c:forEach begin="1" end="${cs.groupLayer }" step="1" >
		                                		<span style="padding-left:20px"></span>
		                                	</c:forEach>
		                                	<span>[답변]</span>
		                                		<a href="${contextPath}/mypage/viewqna.do?csNO=${cs.csNO}">${cs.title}</a>
		                                	</c:when>
		                                	
		                                	<c:otherwise>
		                                <a href="${contextPath}/mypage/viewqna.do?csNO=${cs.csNO}">${cs.title}</a>
		                                </c:otherwise>
		                                </c:choose>
		                                </li>
		                                <li>${cs.writeDate}</li>
		                            </ul>
		                        </li>
		              </c:forEach> 		
	               </c:when>
	             </c:choose>
	             
	               
	               
	 	         <!-- 게시판 페이징 영역 -->
	     <div class="pageInfo_wrap" >
		<div class="pageInfo_area">
			<ul id="pageInfo" class="pageInfo">
			
				<!-- 이전페이지 버튼 -->
				<c:if test="${pm.prev}">
					<li class="pageInfo_btn previous"><a href="${pm.startPage-1}">Previous</a></li>
				</c:if>
				
				<!-- 각 번호 페이지 버튼 -->
				<c:forEach var="num" begin="${pm.startPage}" end="${pm.endPage}">
					<li class="pageInfo_btn ${pm.cri.pageNum == num ? "active":"" }"><a href="${num}">${num}</a></li>
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
    
</div>
</div>
</div>
</div>

<script>

	let moveForm = $("#moveForm");
		$(".pageInfo a").on("click", function(e){
		e.preventDefault();
		moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		moveForm.attr("action", "/mypage/qnaboard.do");
		moveForm.submit();
		
	});	
	
</script>
</body>
</html>