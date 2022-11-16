<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="businessReviewList" value="${businessReviewList}"/>
<c:set var="pm" value="${pm}" /> 
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<link type="text/css" rel="stylesheet" href="/css/businessReviewList.css" />
<link rel="stylesheet" href="/css/side.css"/>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">	
	</script>
</head>
<body>
<div class="contents_area">
<div class="soon">
    <section class="mypagesidebar0">
	    <div>
		    <ul class="mypagesidebar_ul">
		        <li class="sidebardiv1">
		        	<a class="mypage_sidebar_a" href="${contextPath}/mypage/businessPage.do"><h3>사업자 페이지</h3></a>
		        </li>
		        <li>
		            <a class="mypage_sidebar_a" href="${contextPath}/mypage/businessModMemberPage.do"><h3>개인정보수정</h3></a>
		        </li>
		                <hr>
		        <li>
		            <a class="mypage_sidebar_a" href="${contextPath}/order/bOrderCheck.do"><h3>예약 현황</h3></a> 
		        </li>
		                <hr>
		        <li>
		            <details>
		                <summary><h3>상품 관리</h3></summary>
		                <hr>
		                <a class="mypage_sidebar_b" href="${contextPath}/goods/goodsWrite1.do"><h4>숙소 등록</h4></a>
		                <hr>
		                <a class="mypage_sidebar_b" href="${contextPath}/goods/goodsWrite2.do"><h4>투어&티켓 등록</h4></a>
		                <hr>
		                <a class="mypage_sidebar_b" href="${contextPath}/goods/goodsList.do"><h4>상품 목록</h4></a>
		                <hr>
		                <a class="mypage_sidebar_b" href="#"><h4>상품 리뷰</h4></a>
		            </details>
		        </li>
		            <hr>
		        <li>
		        <li>
		        	<a class="mypage_sidebar_a" href="${contextPath}/order/bSalesStatusPage.do"><h3>매출 현황</h3></a>
		        </li>
		    </ul>
		    </div>
		    </section>

				<div class="contents">
					<div class="goodsList_tit">
						<h2>리뷰 목록</h2>
					</div>

					<div id="review_info">
						<c:if test="${not empty businessReviewList && businessReviewList != 'null' }">
							<c:forEach var="item" items="${businessReviewList}"
								varStatus="status">
								<form name="" method="POST">
									<div class="rooms">
										<div class="room_info_wrap">
											<div class="room_name">
												<strong>작성자: </strong> ${item.userName}
											</div>
											<br>
							
										</div>
										<div class="room_wrap">
										<div class="room_price">
											<b> ${item.goodsId}</b><br> <b>리뷰 점수: ${item.score}</b><br>
											<b>작성 날짜: ${item.regDate}</b>
										</div>
										</div>

										<div class="room_goodsInfo">
											<h4>리뷰 내용</h4>
											<div class="goodsInfo_txt">${item.content}</div>
										</div>
									</div>
								</form>
							</c:forEach>
						</c:if>
					</div>
			
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
							<button id="userListpage_button1">
								<a href="${contextPath}/page/businessReviewList.do"
									style="text-decoration: none;">전체보기</a>
							</button>
						</c:otherwise>
					</c:choose>

				</div>
			</div>
		</div>
	</div>
<script>

let moveForm = $("#moveForm");
$(".pageInfo a").on("click", function(e){
e.preventDefault();
moveForm.find("input[name='pageNum']").val($(this).attr("href"));
moveForm.attr("action", "/mypage/businessReviewList.do");
moveForm.submit();

});	

</script>
</body>
</html>