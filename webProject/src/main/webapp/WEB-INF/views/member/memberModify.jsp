<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원정보수정</title>
    <link rel="stylesheet" href="/css/memberModify.css"/>
    <link rel="stylesheet" href="/css/side.css"/>
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script type="text/javascript" src="/js/memberModify.js"></script>

<script>
	function modify() {
		alert("수정이 완료되었습니다. 다시 로그인 하세요.");
	}

	if ($("#userPwd1").val() == '') { //비밀번호를 입력해주세요
		document.getElementById("pwdChk3").style.display = "block";

		if (flag) {
			$("#userId").val(id);
		}
		return false;
	}

	if ($("#userPwd2").val() == '') { //비밀번호 확인을 입력해주세요.
		document.getElementById("pwdChk4").style.display = "block";

		if (flag) {
			$("#userId").val(id);
		}
		return false;
	}

	function mod(frmObj) {
		var flag = false;
		var id = $("#userId").val();

		// 휴대폰 번호 체크	         
		if (!$("#userPhoneNumber").val().match(
				/^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/)) {
			document.getElementById("phoneChk1").style.display = "block";

			if (flag) {
				$("#userId").val(id);
			}
			return false;
		}

		// 휴대폰 인증번호 체크

		if ($("#phone2").val() == '') { //비밀번호 확인을 입력해주세요.
			document.getElementById("phoneChk2").style.display = "block";

			if (flag) {
				$("#userId").val(id);
			}
			return false;
		}

		// 생년월일 체크
		if ($('#userBirth').val() == '') {
			document.getElementById("birthChk1").style.display = "block";

			if (flag) {
				$("#userId").val(id);
			}
			return false;
		}

		var birth = $('#userBirth').val();
		if (birth.length !== 8
				|| birth.substr(0, 4) > (new Date()).getFullYear()
				|| birth.substr(4, 2) > 12 || birth.substr(6, 2) > 31) {
			document.getElementById("birthChk2").style.display = "block";

			if (flag) {
				$("#userId").val(id);
			}
			return false;
		}
		frmObj.action = "${contextPath}/member/loginForm.do";
		frmObj.submit();
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
      <div class="member">
      <form action="/member/memberModify" id="modifyForm" method="post">
        <h2>회원정보수정</h2>
        <!-- 필드 -->
        <div class="mod_wrapper">
        <div class="field">
        <input type="hidden" id="custPassChk" />   
        <span class="input_row">
            <b>* 아이디</b>
            <span class="placehold-text"><input type="text" id="userId" name="userId" value="${member.userId}" readonly="readonly" style="background-color:#F5F5F5"></span>
        </div>
        <div class="field">
            <b>* 이름</b>
            <input class="username" type="text" name="userName" value="${member.userName}" readonly="readonly" style="background-color:#F5F5F5">
        </div>
        
        <!-- 생년월일 -->
        <div class="field birth">
        <span class="input_row">
	    <span class="input_grp">
            <b>* 생년월일</b>
            </span>
         <input type="number"  id="userBirth" name="userBirth" value="${member.userBirth}" placeholder="생년월일 (예 : 19900101)"  required/>
			<p class="txt_check" id="birthChk1">- 생년월일을 입력해주세요</p>
			<p class="txt_check" id="birthChk2">- 생년월일을 정확하게 입력해주세요</p>	
			</div>
     
               
       <!--  전화번호 -->
         <div class="field tel-add">
            <b>* 휴대폰번호</b>
            <div>
              <input type="text" id="phone" placeholder="전화번호 입력" name="userPhoneNumber" required/>
              <input type="button" value="인증번호 전송" id="phoneChk"/>
            </div>
              <input type="text" id="phone2" placeholder="인증번호를 입력하세요" disabled>
              <input type="button" value="본인인증 확인" id="phoneChk2" class="doubleChk" style=background-color:gray; width:auto;><br>
              <span class="successPhoneChk" style=font-size:9px;>휴대폰 번호 입력후 인증번호 전송을 해주십시오.</span>
			  <input type="hidden" id="phoneDoubleChk"/>
            </div>

        <div class="modbtn">        
        <!-- 수정하기 버튼 -->
        <input type="submit" id="m_submit" value="수정하기" onclick="mod(this.form)" />
        <!-- 회원탈퇴 버튼 -->
        <input type="button" id="m_delete" value="탈퇴하기" onclick="location.href='/member/memberDelete.do'"" />
        </div>
    </div>
</div>
</form>
</div>
</div>
     
<script>

//휴대폰 번호 인증
var code2 = "";
$("#phoneChk").click(function(){
	alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
	var phone = $("#phone").val();
	$.ajax({
        type:"GET",
        url:"/member/phoneCheck?phone=" + phone,
        cache : false,
        success:function(data){
        	if(data == "error"){
        		alert("휴대폰 번호가 올바르지 않습니다.")
        		$(".successPhoneChk").text("유효한 번호를 입력해주세요.");
				$(".successPhoneChk").css("color","red");
    			$("#phone").attr("autofocus",true);
        	}else{	        		
        		$("#phone2").attr("disabled",false);
        		$("#phoneChk2").css("display","inline-block");
        		$(".successPhoneChk").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오.");
        		$(".successPhoneChk").css("color","green");
        		$("#phone").attr("readonly",true);
        		code2 = data;
        	}
        }
    });
});
	
 
//휴대폰 인증번호 대조
$("#phoneChk2").click(function(){
	if($("#phone2").val() == code2){
		$(".successPhoneChk").text("인증번호가 일치합니다.");
		$(".successPhoneChk").css("color","green");
		$("#phoneDoubleChk").val("true");
		$("#phone2").attr("disabled",true);

	}else{
		$(".successPhoneChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
		$(".successPhoneChk").css("color","red");
		$("#phoneDoubleChk").val("false");
		$(this).attr("autofocus",true);
	}
});
</script>
</form>     
</body>
</html>