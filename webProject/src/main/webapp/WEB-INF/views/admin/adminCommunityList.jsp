<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="adminCommunitylist" value="${adminCommunitylist}"/>
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
    <script src="https://code.jquery.com/jquery-3.4.1.js"integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="crossorigin="anonymous"></script>
    <link type="text/css" rel="stylesheet" href="/css/adminCommunityList.css" />
    <link type="text/css" rel="stylesheet" href="/css/adminside.css"/>
    <script  src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script type="text/javascript">	
    
    function removeBoard(articleNO) {
    	console.log(articleNO)
		var form = document.createElement("form");
			form.setAttribute("method", "post");
			form.setAttribute("action", "${contextPath}/admin/adminremoveArticle.do");
		var articleNOInput = document.createElement("input");
		    articleNOInput.setAttribute("type","hidden");
		    articleNOInput.setAttribute("name","articleNO");
		    articleNOInput.setAttribute("value", articleNO);
		    
		    form.appendChild(articleNOInput);
		    document.body.appendChild(form);
		    form.submit();
	}
	</script>
</head>
<body>
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
					<div class="goodsList_tit">
					<h2>커뮤니티 목록</h2> 
					</div>
					<div id="rooms_info">
						<c:if test="${not empty adminCommunitylist && adminCommunitylist != 'null' }">
							<c:forEach var="item" items="${adminCommunitylist}" varStatus="status">
								<form name="" method="POST" >   
							
									<div class="rooms">
										<div class="room_img_wrap">
											<input type="hidden" name="mainImageFileName" value="${item.mainImageFileName}">
											<img src="${contextPath}/bThumbDownload.do?articleNO=${item.articleNO}&mainImageFileName=${item.mainImageFileName}" alt="상품 이미지"/>
										
										</div>
										<div class="room_info_wrap">
											<input type="hidden" name="userName" value="${item.userName}">
											<div class="room_name"><strong>작성자: </strong> ${item.userName}</div>
											<br>
											<div class="room_goodsInfo">
											<h4>게시글 제목</h4>
											<div class="goodsInfo_txt">[${item.articleCategory}]${item.title}</div>
											</div>
												
										</div>
									
										<div class="room_wrap">
											<div class="room_price">
												<b> ${item.addressList}</b><br>
												<b>조회수 ${item.viewCnt}</b>
											
											</div>
										</div>  
									
										<div class="room_wrap">
											<div class="goods_button_wrap">
												<input type="button" class="admin_btn" onclick="removeBoard(${item.articleNO})" value="커뮤니티 삭제"/>
											</div>
												
										</div>               
									</div>
								</form>
							</c:forEach>
						</c:if>
					</div>
					<div class="paging">
						<div class="search_wrap">
							<form action="/admin/adminCommunityListSearch.do" method="post" >
								<input type="text" name="search">
								<input class="admin_btn" type="submit" value="검색">
							</form>
						</div>
						<br>
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
						<button id="userListpage_button1"><a href="${contextPath}/admin/adminGoodsList.do" style="text-decoration: none;">전체보기</a></button>
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
moveForm.attr("action", "/admin/adminGoodsList.do");
moveForm.submit();

});	

</script>

</body>
</html>