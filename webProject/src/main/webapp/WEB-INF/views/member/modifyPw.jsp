<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경창</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link type="text/css" rel="stylesheet" href="/css/side.css" />
<link type="text/css" rel="stylesheet" href="/css/modifyPw.css" />

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
			<div class="contents">
				<form action="/member/modifyPw" method="post" id="pwUpdateForm" name="pwUpdateForm">
					<h2>비밀번호 변경</h2>
					<fieldset>
					<div class="modify_wrapper">
					<input type="hidden" id="uid" name="uid" value="${member.uid}">
					<input type="hidden" id="userId" name="userId" value="${member.userId}">
						
						<div class="panel panel-default panel-margin-10">
							<div class="panel-body panel-body-content text-center">
							
							
								<p class="lead">변경하실 비밀번호를 입력해 주세요.</p>
								<div class="form-group">
									<input type="password" name="userPwd" id="userPwd" placeholder="현재 비밀번호" />
								</div>
								<div class="form-group">
									<input type="password" name="userPwd1" id="userPwd1" placeholder="새 비밀번호" />
								</div>
								<div class="form-group">
									<input type="password" name="userPwd2" id="userPwd2" placeholder="새 비밀번호 확인" />
								</div>
								<input type="button" class="inp_bt" id="pwUpdate" value="변경하기" />
								<input type="button" class="inp_bt" id="cancel" value="취소" onclick="location.href='/member/memberModify.do'"/>
							</div>
						</div>
					</div>
					</fieldset>
				</form>

			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function(e) {
		$('#pwUpdate').click(function() {

			//패스워드 입력 확인
			if ($('#userPwd').val() == '') {
				alert("패스워드를 입력해 주세요.");
				$('#userPwd').focus();
				return;
			} else if ($('#userPwd1').val() == '') {
				alert("패스워드를 입력해 주세요.");
				$('#userPwd1').focus();
				return;
			} else if  ($('#userPwd2').val() == '') {
				alert("패스워드를 입력해 주세요.");
				$('#userPwd2').focus();
				return;
				
			}

			//입력한 패스워드가 같인지 체크
			if ($('#userPwd2').val() != $('#userPwd1').val()) {
				alert("패스워드가 일치하지 않습니다.");
				$('#userPwd2').focus();
				return;
			}

			//패스워드 맞는지 확인
			$.ajax({
				url : "${contextPath}/member/passChk",
				type : "POST",
				data : $('#pwUpdateForm').serializeArray(),
								
				success : function(data) {
					
					if (data == true) {
						if(confirm("변경 하시겠습니까?")){
							$("#pwUpdateForm").submit();
						}
					} else {
						alert("패스워드가 틀렸습니다.");
						return;
			     	}
				},
				error : function() {
					alert("error");
				}
			})
		});
	})
</script>
</html>