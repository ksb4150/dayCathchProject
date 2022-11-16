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
 	<link type="text/css" rel="stylesheet" href="/css/adminside.css"/>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
  	
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
		   	<div id="mainWrapper">
	          <div name="uid" hidden></div>
	          <div name="userType" hidden></div>
	            <!-- 게시판 제목 -->
	            <h3>문의글 내역</h3>
	                                     
	            
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
		                                		<a href="${contextPath}/admin/adViewqna.do?csNO=${cs.csNO}">${cs.title}</a>
		                                	</c:when>
		                                	
		                                	<c:otherwise>
		                                <a href="${contextPath}/admin/adViewqna.do?csNO=${cs.csNO}">${cs.title}</a>
		                                </c:otherwise>
		                                </c:choose>
		                                </li>
		                                <li>${cs.writeDate}</li>
		                            </ul>
		                        </li>
		              </c:forEach> 		
	               </c:when>
	             </c:choose>
	            </ul>
	            </ul>
	            <!-- 게시판 페이징 영역 -->
	     		<div class="pageInfo_wrap" >
				<div class="pageInfo_area">
				<ul id="pageInfo" class="pageInfo">
			
				<!-- 이전페이지 버튼 -->
				<c:if test="${pm.prev}">
					<li class="pageInfo_btn previous"><a href="${pm.startPage-1}">Previous</a></li>
				</c:if>
				
		
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
</div>
<script>

	let moveForm = $("#moveForm");
		$(".pageInfo a").on("click", function(e){
		e.preventDefault();
		moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		moveForm.attr("action", "/admin/adQnaboard.do");
		moveForm.submit();
		
	});	
	
</script>
</body>
</html>