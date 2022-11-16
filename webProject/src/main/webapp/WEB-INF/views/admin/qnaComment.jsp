<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="cs" value="${cs}"/>
 
<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="/css/adminside.css" />
<link type="text/css" rel="stylesheet" href="/css/qnaComment.css" />
<title>답글쓰기</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

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
				<form id="frmReply" name="frmReply" method="post" action="${contextPath}/admin/addComment.do"
					style="margin-left: 190px;">
					<div id="comment-top">
						<h3>답글쓰기</h3>
					</div>
					
					<input type="hidden" id="userName" name="userName" value="${member.userName}" />
					<input type="hidden" id="csNO" name="csNO" value="${cs.csNO}" />
					<!-- 부모 게시글 번호 -->
					<input type="hidden" id="originNo" name="originNo"
						value="${cs.originNo}" /> <input type="hidden" id="groupOrd" name="groupOrd" value="${cs.groupOrd}" /> 
						<input type="hidden" name="groupLayer" id="groupLayer" value="${cs.groupLayer}" />

					<table align="center">
						<tr>
							<td align="right">작성자 :</td>
							<td colspan="2" align="left"><input type="text" size="20"
								maxlength="100" value="${member.userName}" readonly /></td>
						</tr>
						<tr>
							<td align="right">글 제목 :</td>
							<td colspan="2"><input type="text" id="title" name="title"
								size="67" maxlength="500" /></td>
						</tr>
						<tr>
							<td align="right" valign="top"><br>글 내용 :</td>
							<td colspan="2"><textarea id="txtContent" name="txtContent" rows="10" cols="65" maxlength="4000"></textarea></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
						</tr>
					</table>

					<td align="right"></td>
					<td colspan="2">
						<button type="submit" id="btnRegister" onclick="${contextPath}/admin/adQnaboard">등록</button>
						<button type="button" id="btnList">목록으로</button>
					</td>
				</form>
			</div>
		</div>
	</div>
</body>
</html>