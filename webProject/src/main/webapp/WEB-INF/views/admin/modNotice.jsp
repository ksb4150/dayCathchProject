<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="viewNotice" value="${viewNotice}"/>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>게시판</title>
    <link type="text/css" rel="stylesheet" href="/css/adminside.css"/>
    <link rel="stylesheet" href="/css/noticeView.css" />
    <link type="text/css" rel="stylesheet" href="/css/header.css"/>
	<style>
		#tr_btn_modify {
			display: none;
		}
	</style>
	
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
		
		function backToList(obj) {
			obj.action="${contextPath}/admin/adNotice.do";
			obj.submit();
		}	
		
				
		function fn_modify_notice(obj) {
			
			obj.action = "${contextPath}/admin/noticeMod.do";
			obj.submit();
		}
		
		function fn_removeNotice(url, noticeNO) {
			alert('삭제하기');
			var form = document.createElement("form");
			    form.setAttribute("method", "post");
			    form.setAttribute("action", url);
		    var noticeNOInput = document.createElement("input");
			    noticeNOInput.setAttribute("type","hidden");
			    noticeNOInput.setAttribute("name","noticeNO");
			    noticeNOInput.setAttribute("value", noticeNO);
			
				
				form.appendChild(noticeNOInput);
				document.body.appendChild(form);
				form.submit();
		} 
	</script>

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
					action="${contextPath}/admin/modNotice?noticeNO=${viewNotice.noticeNO}">
					<table align="center">
						<div class="page-header">
							<h2
								style="padding: 30px; margin-bottom: 30px; text-align: center; font-weight: 300;">공지사항</h2>
						</div>
						<input id="notice_uid" type="hidden" value="${member.uid}"
							name="uid" />

						</tr>
						<tr align="center">
							<td width=150 align="center" id="inp_noticeNO" bgcolor="#FFFFFF">
								글번호</td>
							<td><input type="text" name="noticeNO" id="inp_noticeNO2"
								value="${viewNotice.noticeNO}" disabled /> <input type="hidden"
								name="noticeNO" value="${viewNotice.noticeNO}" disabled /></td>
						</tr>

						<tr align="center">
							<td width="150" align="center" id="inp_hit" bgcolor="#FFFFFF">
								조회수</td>
							<td><input type="text" id="inp_hit2"
								value="${viewNotice.view_cnt}" name="view_cnt" disabled /></td>
						</tr>
						<tr align="center">
							<td width="150" align="center" id="inp_title" bgcolor="#FFFFFF">
								제목</td>
							<td><input type="text" id="i_title"
								value="${viewNotice.title}" name="title" /></td>
						</tr>
						<tr align="center">
							<td width="150" align="center" id="inp_content" bgcolor="#FFFFFF">
								내용</td>
							<td><textarea rows="20" cols="60" name="content"
									id="i_content">
						 ${viewNotice.content}
					</textarea></td>
						</tr>


						<tr>
							<td width="150" align="center" id="inp_date" bgcolor="#FFFFFF">
								등록일자</td>
							<td><input type="text" id="inp_date2"
								value="<fmt:formatDate value="${viewNotice.regDate}"/>" disabled />

							</td>
						</tr>

						<tr id="tr_btn">
							<td colspan="2" align="center">

								<button type="submit" id="button">수정하기</button>
								<button id="button" value="리스트로" onclick="backToList(frmNotice)">리스트로</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
