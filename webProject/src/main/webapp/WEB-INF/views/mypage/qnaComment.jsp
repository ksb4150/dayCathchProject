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
<link type="text/css" rel="stylesheet" href="/css/side.css"/>
<link type="text/css" rel="stylesheet" href="/css/qnaComment.css"/>
<title>답글쓰기</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
$(document).ready(function() {
	
	var form = $('#frmReply');
	
	// 등록 버튼 클릭 이벤트
	$('#btnRegister').on('click',function(){
		form.attr('method', 'post');
		form.submit();
	});

	// 목록 버튼 클릭 이벤트
	$('#btnList').on('click',function(){
		self.location  = "list";
	});
	
});


</script>

</head>
<body>
<div class="contents_area">
<div class="soon">
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
	<div class="container">
	<form id="frmReply" name="frmReply" method="post" action="${contextPath}/mypage/addComment.do" style="margin-left:190px;">
		<div id="header">
		<h3 style="font-weight:300; padding:20px; margin-bottom:16px;">답글쓰기</h3>
		</div>
		<input type="text" id="csNO" name="csNO"  value="${cs.csNO}"/> <!-- 부모 게시글 번호 -->	
		<input type="hidden" id="originNo" name="originNo"  value="${cs.originNo}"/> 	
		<input type="hidden" id="groupOrd" name="groupOrd"  value="${cs.groupOrd}"/>
		<input type="hidden" name="groupLayer" id="groupLayer" value="${cs.groupLayer}"/> 	
		
		
		 
		<table align="center">
		 	<tr>
				<td align="right">작성자 : </td>
				<td colspan="2" align="left"><input type="text" size="20" maxlength="100" value="${member.userName}" readonly /></td>
			</tr>
			<tr>
				<td align="right">글 제목 : </td>
				<td colspan="2"><input type="text" id="title" name="title" size="67" maxlength="500"  /></td>
			</tr>
			<tr>
				<td align="right" valign="top"><br>글 내용 : </td>
				<td colspan="2"><textarea id="txtContent" name="txtContent" rows="10" cols="65" maxlength="4000"></textarea></td>
 			</tr>
            <tr>
                <td></td>
                <td></td>
            </tr>
        </table>
        
        <td align="right"></td>
        <td colspan="2" >
         	<button type="submit" id="btnRegister" onclick="${contextPath}/mypage/qnaboard">등록</button>
            <button type="submit" id="btnList">목록으로</button>
         </td>
        </form>	 
	</div>
</div>
</div>
</body>
</html>