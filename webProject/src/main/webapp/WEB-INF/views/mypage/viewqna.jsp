<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="viewqna" value="${viewqna}" />
<c:set var="css" value="${css}" />
<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="/css/viewqna.css" />
<link type="text/css" rel="stylesheet" href="/css/header.css" />
<link type="text/css" rel="stylesheet" href="/css/side.css" />
<title>글 보기</title>

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
		
		function fn_modqna(url, csNO) {
			alert('글을 수정하시겠습니까?');
			var form = document.createElement("form");
		    form.setAttribute("method", "get");
		    form.setAttribute("action", url);
	    var csNOInput = document.createElement("input");
		    csNOInput.setAttribute("type","hidden");
		    csNOInput.setAttribute("name","csNO");
		    csNOInput.setAttribute("value", csNO);
		
			
			form.appendChild(csNOInput);
			document.body.appendChild(form);
			form.submit();
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

			<form name="frmqnaView" method="post" action="${contextPath}"
				enctype="multipart/form-data">
				<!-- 제목 -->
				<div class="viewqna">
					<h2>나의 문의 내역</h2>
					<table align="center">
						<tr align="center">
							<td align="center" id="inp_csNO" bgcolor="#FFFFFF">
								글번호</td>
							<td><input type="text" name="csNO" id="inp_csNO2"
								value="${viewqna.csNO}" disabled /> <input type="hidden"
								name="originNo" id="inp_csNO2" value="${viewqna.originNo}"
								disabled /> <input type="hidden" name="uid" id="uid"
								value="${viewqna.uid}" disabled /></td>
						</tr>
						<tr align="center">
							<td  align="center" id="inp_writer" bgcolor="#FFFFFF">
								작성자</td>
							<td><input type="text" value="${viewqna.writer}"
								id="inp_writer2" name="writer" disabled /></td>
						</tr>
						<tr align="center">
							<td  align="center" id="inp_title" bgcolor="#FFFFFF">
								제목</td>
							<td><input type="text" id="i_title" value="${viewqna.title}"
								name="title" disabled /></td>
						</tr>
						<tr align="center">
							<td  align="center" id="inp_content" bgcolor="#FFFFFF">
								내용</td>
							<td><textarea id="i_content" name="txtContent" disabled>${viewqna.txtContent}</textarea></td>
						</tr>


						<tr>
							<td align="center" id="inp_writeDate"
								bgcolor="#FFFFFF">등록일자</td>
							<td><input type="text" id="inp_writeDate2"
								value="<fmt:formatDate value="${viewqna.writeDate}"/>" disabled />
							</td>
						</tr>

						<tr id="tr_btn_modify" align="center">
							<td colspan="2"><input type="button" id=btnModify
								value="수정반영하기" onclick="fn_modify_cs(this.form)" /> <input
								type="button" value="취소" onClick="backToList(frmqnaView)" /></td>
						</tr>
						<tr id="tr_btn">
							<td colspan="2" align="center"><c:if
									test="${cs.uid==viewqna.uid}">
									<input type="button" value="수정하기"
										onclick="fn_modqna('${contextPath}/mypage/modqna.do', ${viewqna.csNO})">
									<input type="button" value="삭제하기"
										onclick="fn_removeqna('${contextPath}/mypage/removeQna.do', ${viewqna.csNO})">
								</c:if> <input type="button" value="리스트로"
								onclick="location.href='/mypage/qnaboard.do'"></td>
						</tr>

					</table>
				</div>
			</form>
		</div>
	</div>
</body>
</html>