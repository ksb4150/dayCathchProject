<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="viewqna" value="${viewqna}"/>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>게시판</title>
<link type="text/css" rel="stylesheet" href="/css/side.css" />
<link rel="stylesheet" href="/css/modifyqna.css" />

<style>
#tr_btn_modify {
	display: none;
}
</style>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
		
		function backToList(obj) {
			obj.action="${contextPath}/mypage/qnaboard.do";
			obj.submit();
		}	
		
				
		function fn_modify_qna(obj) {
			
			obj.action = "${contextPath}/mypage/modqna";
			obj.submit();
		}
		
		function fn_removeqna(url, csNO) {
			alert('글을 삭제하시겠습니까?');
			var form = document.createElement("form");
			    form.setAttribute("method", "post");
			    form.setAttribute("action", url);
		    var csNOInput = document.createElement("input");
			    csNOInput.setAttribute("type","hidden");
			    csNOInput.setAttribute("name","csNO");
			    csNOInput.setAttribute("value", csNO);
			
				form.appendChild(csNOInput);
				document.body.appendChild(form);
				form.submit();
		}
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

			<form name="frmqna" method="post" action="${contextPath}/mypage/modqna?csNO=${viewqna.csNO}">
				<table align="center">
					<div class="page-header">
						<h2 style="padding:30px; margin-bottom:30px; text-align:center; font-weight:300;">나의 문의 내역</h2>
					
					</div>
					<input id="cs_uid" type="hidden" value="${member.uid}" name="uid" />
				
					<tr align="center">
						<td width=150 align="center" id="inp_csNO" bgcolor="#FFFFFF">
							글번호</td>
						<td><input type="text" name="csNO" id="inp_csNO2" value="${viewqna.csNO}" disabled /> 
							<input type="hidden" name="csNO" value="${viewqna.csNO}" disabled /></td>
					</tr>
					
					<tr align="center">
						<td width="150" align="center" id="inp_title" bgcolor="#FFFFFF">
							제목</td>
						<td><input type="text" id="i_title" value="${viewqna.title}" name="title" /></td>
					</tr>
					<tr align="center">
						<td width="150" align="center" id="inp_content" bgcolor="#FFFFFF">내용</td>
						<td><textarea rows="20" cols="60" name="txtContent" id="i_content">${viewqna.txtContent}</textarea></td>
					</tr>
					<tr>
						<td width="150" align="center" id="inp_date" bgcolor="#FFFFFF"> 등록일자</td>
						<td><input type="text" id="inp_date2"
							value="<fmt:formatDate value="${viewqna.writeDate}"/>" disabled />

						</td>
					</tr>

					<tr id="tr_btn">
						<td colspan="2" align="center">

							<button type="submit" id="btn_mod">수정하기</button>
							<button type="button" id="btn_return" value="리스트로" onclick="backToList(frmqna)">리스트로</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>