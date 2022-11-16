<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>게시판</title>
    <link type="text/css" rel="stylesheet" href="/css/faqWriteForm.css"/>
    <link type="text/css" rel="stylesheet" href="/css/adminside.css"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
	
	
</head>


<title>글쓰기</title>
		
		
</head>
<body>
<br>
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
				<form name="faqForm" action="/admin/faqWrite.do" method="post">
					<div class="page-header">
						<h3>FAQ 등록</h3>
					</div>
					<br> <input id="faq_uid" type="hidden" value="${member.uid}"
						name="uid" />

					<table class="table" border="0" align="center">
						<tr>
							<td align="right">작성자 :</td>
							<td colspan="2" align="left"><input type="text" size="20"
								maxlength="100" value="${member.userName}" readonly /></td>
						</tr>

						<tr>
							<td align="right">글 제목 :</td>
							<td colspan="2"><input type="text" size="67" maxlength="500"
								id="faq_title" name="faq_title" /></td>
						</tr>
						<tr>
							<td align="right" valign="top"><br>글 내용 :</td>
							<td colspan="2"><textarea id="summernote" name="faq_content"
									rows="10" cols="65" maxlength="4000"></textarea></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
						</tr>
					</table>

					<td align="right"></td>
					<td colspan="2">
						<button id="button" type="submit" onclick="${contextPath}/admin/adFaqList.do">등록</button>
						<button id="button" href="${contextPath}/admin/adFaqList.do" >목록으로</button>
				</form>
			</div>
      </div>
   </div>
 </body>
</html>