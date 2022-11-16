<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>  

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/css/faqList.css">
  <link type="text/css" rel="stylesheet" href="/css/adminside.css"/>
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
					<div class="faq-content">
						<div class="faq-title">
						<h2>자주 하는 질문(FAQ)</h2>
						<div id=faqbtn>
						<a href="${contextPath}/admin/faqWriteForm.do">
						<button class="faqbtn" style="float:right; margin-bottom: 20px; ">등록</button></a> 
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
											<c:when test="${member.userType==0}">
											<span>${faq.faq_content}
												<input type="button" class="faqdel" id="deletebut" value="삭제" style="float:right; margin-right:20px;"
													onclick="fn_removeFaq('${contextPath}/admin/removeFaq.do', ${faq.faq_no})" /> 	 
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