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
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="/css/adminside.css" />
<link type="text/css" rel="stylesheet" href="/css/noticeForm.css" />
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
				<form name="frmNotice" method="post"
					action="${contextPath}/admin/noticeWrite.do"
					enctype="multipart/form-data">
					<table align="center">
						<div class="page-header">
							<h3>공지사항</h3>
						</div>
						<input id="notice_uid" type="hidden" value="${member.uid}" name="uid" />

						<tr>
							<td id="category" bgcolor="#FFFFFF">
								카테고리</td>
							<td><select class="select_category" class="input" id="category"
								title="category" name="notice_category">
									<option>공지사항</option>
									<option>중요공지사항</option>
							</select></td>
						</tr>

						<tr>
							<td id="inp_writer" bgcolor="#FFFFFF">
								작성자</td>
							<td><input type="text" id="writer" name="writer"
								value="${member.userName }" disabled /></td>
						</tr>

						<tr align="center">
							<td align="center" id="inp_title" bgcolor="#FFFFFF">
								제목</td>
							<td><input type="text" id="title" name="title" id="i_title" />
							</td>
						</tr>
						<tr align="center">
							<td align="center" bgcolor="#FFFFFF">
								내용</td>
							<td><textarea id="inp_content" name="content"></textarea>
						</tr>


						<tr class="button">
							<td colspan="2" align="center">
								<button id="button" type="submit" onclick="${contextPath}/admin/adNotice.do">등록</button>
								<button id="button" href="${contextPath}/admin/adNotice.do" >목록으로</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>

</body>
</html>
