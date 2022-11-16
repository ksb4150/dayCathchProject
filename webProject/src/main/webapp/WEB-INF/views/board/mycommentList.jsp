<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
   	isELIgnored="false"%>
    <%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/> 
    <%
    request.setCharacterEncoding("UTF-8");
    %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="member" value="${member}"/>
<c:set var="myCommentList" value="${myCommentList}"/>

<c:set var="pm" value="${pm}" /> 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 댓글 내역</title>
<link type="text/css" rel="stylesheet" href="/css/side.css"/>
<link type="text/css" rel="stylesheet" href="/css/mycomment.css"/>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

</head>

<body>
<section class="soon">
<section class="mypagesidebar0">
<div>
	<ul class="mypagesidebar_ul"> 
		<li class="sidebardiv1"><a class="mypage_sidebar_a"
			href="${contextPath}/mypage/mypage.do"><h3>마이페이지</h3></a></li>
		<li><details>
				<summary>
					<h3>개인정보수정</h3>
				</summary>
				<hr>
				<a class="mypage_sidebar_b" href="${contextPath}/member/memberModify.do"><h4>내 정보 수정</h4></a>
				<hr>
				<a class="mypage_sidebar_b" href="${contextPath}/member/modifyPw.do"><h4>비밀번호 수정</h4></a>
		</details></li>
		<hr>
		<li><a class="mypage_sidebar_a"
			href="${contextPath}/mypage/listCart.do"><h3>장바구니</h3></a></li>
		<hr>
		<li>
        <details>
            <summary><h3>커뮤니티</h3></summary>
            <hr>
            <a class="mypage_sidebar_b" href="${contextPath}/board/myArticleList1.do"><h4>작성한 게시글</h4></a>
            <hr>
            <a class="mypage_sidebar_b" href="${contextPath}/board/mycommentList.do"><h4>작성한 댓글</h4></a>
            
        </details>
    </li>
             <hr>
             
    <li>
         <details>
            <summary><h3>상품내역</h3></summary>
              <hr>
             <a class="mypage_sidebar_b" href="${contextPath}/mypage/wishList.do"><h4>관심내역</h4></a>
             <hr>
             <a class="mypage_sidebar_b" href="${contextPath}/mypage/ordersNocheck"><h4>예약확인</h4></a>        
         </details>
    </li>
    		<hr>
    <li>
        <a class="mypage_sidebar_a" href="${contextPath}/mypage/pointCoupon.do"><h3>포인트/쿠폰</h3></a>
    </li>
            <hr>
    <li>
        <details>
            <summary><h3>고객센터</h3></summary>
            <hr>
            <a class="mypage_sidebar_b" href="${contextPath}/mypage/notice.do"><h4>공지사항</h4></a>
            <hr>
            <a class="mypage_sidebar_b" href="${contextPath}/mypage/qna.do"><h4>1대1문의</h4></a>
            <hr>
            <a class="mypage_sidebar_b" href="${contextPath}/mypage/faqList.do"><h4>자주하는 질문</h4></a>
            <hr>
            <a class="mypage_sidebar_b" href="${contextPath}/page/eventList.do"><h4>이벤트</h4></a>
        </details>
    </li>
        <hr>
    <li>
       <details>
            <summary><h3>이용안내</h3></summary>
            <hr>
            <a class="mypage_sidebar_b" href="${contextPath}/mypage/guidelineReservation.do"><h4>예약 안내</h4></a>
            <hr>
            <a class="mypage_sidebar_b" href="${contextPath}/mypage/guidelinePay.do"><h4>결제 방법 안내</h4></a>
            <hr>
            <a class="mypage_sidebar_b" href="${contextPath}/mypage/guidelinePointcoupon.do"><h4>포인트/쿠폰 안내</h4></a>
            <hr>
            <a class="mypage_sidebar_b" href="${contextPath}/mypage/guidelineAirplain.do"><h4>항공권 이용 안내</h4></a>
        </details>
    </li>
</ul>
</div>
</section>
  <div class="content1s">
	        <!-- 게시판 제목 -->
	        <table class="userListtable" align="center">
	            <h2 style="text-align: center; margin-bottom: 35px;">내가 쓴 댓글 </h2>
	            <tr align="center" bgcolor="#cdd5ec">
	                <td><b>글 번호</b></td>
	                <td><b>댓글 내용</b></td>
	                <td><b>작성자</b></td>
	                <td><b>등록일자</b></td>
	                <td></td>
	
	            </tr>
	
	            <c:forEach var="cl" items="${myCommentList}">
	                <tr align="center">
	                    <td>${cl.articleNO }</td>
	                    <td class="comment_title">${cl.commentContent }</td>
	                    <td>${member.userName }</td>
	                    <td>${cl.regDate }</td>
	                    <td><button class="delete_btn" data-uid="${cl.uid}" data-commentno="${cl.commentNo}">삭제</button>
	                    </td>
	                    
	                </tr>
	            </c:forEach>
	        </table>
	        
	        <!-- 게시판 페이징 영역 -->
	        <div class="paging">
	  
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

	                </c:otherwise>
	            </c:choose>
	        </div>
	    </div>
	    </section>

<!-- 삭제 form -->
<form action="/board/removecomment.do" method="get" class="user_delete_form">
    <input type="hidden" name="uid" class="delete_uid">
    <input type="hidden" name="commentNo" class="delete_commentNo">
</form>	

<script>

let moveForm = $("#moveForm");

$(".pageInfo a").on("click", function(e){
e.preventDefault();
moveForm.find("input[name='pageNum']").val($(this).attr("href"));
moveForm.attr("action", "/board/mycommentList.do");
moveForm.submit();

});	

/* 회원 삭제 버튼 */
$(".delete_btn").on("click", function(e){
		
	if(confirm("댓글을 삭제 하시겠습니까?")==true) {
	
	const uid = $(this).data("uid");
	const commentNo = $(this).data("commentno");
	
		e.preventDefault();
	$(".delete_uid").val(uid);
	$(".delete_commentNo").val(commentNo);
	$(".user_delete_form").submit();
	
	} else {
		
		return false;
		
	}
	
	
	
});

</script>
</body>
</html>