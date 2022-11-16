<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
   	isELIgnored="false"%>
    <%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/> 
    <%
    request.setCharacterEncoding("UTF-8");
    %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="pointHistory" value="${pointHistory}"/>
<c:set var="pm" value="${pm}" /> 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 회원 정보 출력창</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="crossorigin="anonymous"></script>
<link type="text/css" rel="stylesheet" href="/css/adminside.css" />
<style>


.userListtable {
	background-color: #fff;
    border-collapse: collapse;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.15);
    border-radius: 5px;
    overflow: hidden;
    width: 1380px;
}

.userListtable tr {
	height: 50px;
}


</style>
</head>
<body>
<br>
<div class="soon">
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
			<div class="caption"> 주문 취소 현황</div>
				<table class="userListtable" align="center">
					<tr align="center" bgcolor="#cdd5ec">
						<td><b>주문번호</b></td>
						<td><b>유저번호</b></td>
						<td><b>아이디</b></td>
						<td><b>이름</b></td>
						<td><b>사용포인트</b></td>
						<td><b>적립포인트</b></td>
						<td><b>보유포인트</b></td>
						<td><b>날짜</b></td>
					</tr>
					<c:forEach var="pointHis" items="${pointHistory}">
						<tr align = "center">
							<td>${pointHis.ordersNO}</td>
							<td>${pointHis.uid }</td>
							<td>${pointHis.userId }</td>
							<td>${pointHis.userName }</td>
							<td>${pointHis.usePoint }</td>
							<td>${pointHis.savePoint }</td>
							<td>${pointHis.userPoint }</td>
							<td>${pointHis.creDate }</td>
						</tr>
					</c:forEach>
				</table>
				<div class="paging">
					<div class="search_wrap">
						<form action="/admin/findpointHistory.do" method="post" class="usernameform">
							<input type="text" name="search">
							<input class="admin_btn" type="submit" value="검색">
						</form>
					</div>
					<!-- 게시판 페이징 영역 -->
					<c:choose>
						<c:when test="${pm != null}">
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
						</c:when>
						 <c:otherwise>
						 	<button id="userListpage_button1"><a href="${contextPath}/admin/pointHistory.do" style="text-decoration: none;">전체 목록</a></button>
						 </c:otherwise>
					 </c:choose>
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
moveForm.attr("action", "/admin/pointHistory.do");
moveForm.submit();

});	

</script>
</body>
</html>