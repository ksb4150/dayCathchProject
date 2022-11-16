<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
   	isELIgnored="false"%>
    <%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/> 
    <%
    request.setCharacterEncoding("UTF-8");
    %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="userList" value="${userList}"/>
<c:set var="pm" value="${pm}" /> 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 회원 정보 출력창</title>
<link type="text/css" rel="stylesheet" href="/css/buserList.css" />
<link type="text/css" rel="stylesheet" href="/css/adminside.css" />
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>

<body>

<br>
<div class="contents_area" >
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

				<table class="buserListtable" align="center">
				<caption>사업자 목록 </caption>
					<tr align="center" bgcolor="#cdd5ec">
						<td><b>유저번호</b></td>
						<td><b>아이디</b></td>
						<td><b>이름</b></td>
						<td><b>생년월일</b></td>
						<td><b>연락처</b></td>
						<td><b>사업장</b></td>
						<td><b>사업자번호</b></td>
						<td><b>우편번호</b></td>
						<td><b>도로명주소</b></td>
						<td><b>기타주소</b></td>
						<td><b>가입일</b></td>
						<td><b>승인현황</b></td>
						<td></td>
					</tr>

					<c:forEach var="user" items="${userList}">
						<tr align="center">
							<td>${user.uid }</td>
							<td>${user.userId }</td>
							<td>${user.userName }</td>
							<td>${user.userBirth }</td>
							<td>${user.userPhoneNumber }</td>
							<td>${user.companyName }</td>
							<td>${user.businessNumber}</td>
							<td>${user.zipcode }</td>
							<td>${user.roadAddress }</td>
							<td><b>${user.extraAddress }</b></td>
							<td>${user.joinDate }</td>
							<td><c:choose>
									<c:when test="${user.adminAllow != 1}">
										<button class="allow_btn" data-uid="${user.uid}">승인대기</button>
									</c:when>
									<c:otherwise>
											승인완료
									</c:otherwise>
								</c:choose></td>
							<td><button class="delete_btn admin_btn" data-uid="${user.uid}">삭제</button></td>
						</tr>
					</c:forEach>
				</table>

				
				
				<!-- 게시판 페이징 영역 -->
				<div class="paging">
					<div class="search_wrap">
						<form action="/admin/findbUserList.do" method="post" class="usernameform">
							<input type="text" name="search"> <input class="admin_btn" type="submit"
								value="검색">
						</form>
						
						<div class="btn_wrap">
							<button class="list_btn" id="userListpage_button1">
								<a href="${contextPath}/admin/buserAllowList.do" style="text-decoration: none;">승인 대기자 목록 보기</a>
							</button>
						</div>
						
					</div>
				<br>
				
				
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
								<a href="${contextPath}/admin/buserList.do"
									style="text-decoration: none;">회원 목록</a>
							</button>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 사업자 회원 승인 form -->
<form action="/admin/buserAdminAllow.do" method="get" class="admin_allow_form">
    <input type="hidden" name="uid" class="business_uid">

</form>	

<!-- 삭제 form -->
<form action="/admin/removeuser.do" method="get" class="user_delete_form">
    <input type="hidden" name="uid" class="delete_uid">

</form>	



<script>

//페이징 관련
let moveForm = $("#moveForm");
$(".pageInfo a").on("click", function(e){
e.preventDefault();
moveForm.find("input[name='pageNum']").val($(this).attr("href"));
moveForm.attr("action", "/admin/buserList.do");
moveForm.submit();

});	


/* 사업자회원 승인 버튼 */
$(".allow_btn").on("click", function(e){
	
	if(confirm("승인 요청을 수락 하시겠습니까?")==true) {
		
		e.preventDefault();
	const uid = $(this).data("uid");
	$(".business_uid").val(uid);
	$(".admin_allow_form").submit();
	
	} else {
		
		return false;
		
	}
	
	
	
});

/* 회원 삭제 버튼 */
$(".delete_btn").on("click", function(e){
	
	if(confirm("선택한 회원을 삭제 하시겠습니까?")==true) {
		
		e.preventDefault();
	const uid = $(this).data("uid");
	$(".delete_uid").val(uid);
	$(".user_delete_form").submit();
	
	} else {
		
		return false;
		
	}
	

});

</script>
</body>
</html>