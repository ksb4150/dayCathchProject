<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인창</title>
	<link rel="stylesheet" href="/css/loginForm.css"/>
	 <style>
    
     </style>
	<c:choose>
		<c:when test="${result=='loginFailed'}">
			<script>
				window.onload=function() {
					alert("아이디 or 비밀번호가 틀립니다. 다시 로그인 하세요!");
				}
			</script>
		</c:when>
	</c:choose>
	
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
</head>
<body>
    <div class="contents_area">
        <div class="soon">
	<section class="login_form">
	
    <div class="content">
        <h1 class="logo"><a href="${contextPath}/page/mainPage.do"><img src="/img/logo.png" alt="날잡아"></a></h1>
        
        <form id="frmLogin" class="nj_validation" method="post" action="${contextPath}/member/login.do" autocomplete="off">
            <input type="hidden" id="userType" name="userType" value="1"/>
            <div class="int_area">
                <div class="int_grp">
                    <input type="text" id="userId" name="userId" class="inp_id" placeholder="아이디" title="아이디 입력" value="" autofocus="autofocus" maxlength="50" required="">
                </div>
            </div>
            <br>
            <div class="int_area">
                <div class="int_grp">
                    <input type="password" id="userPwd" name="userPwd" class="inp_pw" placeholder="비밀번호" title="비밀번호 입력" required="" minlength="5" maxlength="20">
                  
                </div>
            </div>
        </form>
        <div class="btn_area">
            <button type="submit" id="btnSignIn" class="btn_submit" form="frmLogin">로그인</button>
        </div>
        <ul class="list_bar">
            <li><a href="${contextPath}/member/findId.do">아이디/비밀번호 찾기</a></li>
            <li>|</li>
            <li><a href="#">비회원 예약조회</a></li>
        </ul>	
        <h2 class="tit_list">간편하게 로그인하기</h2>	
        <ul class="list_id">
        	
        	<div id="naverIdLogin" ></div>
        <!--<li><button type="button" id="naverLogin" class="btn_naver" value="naver"></button></li>-->
            <li><button type="button" id="kaokaologin" class="btn_kakao" value="kakao"></button></li>
                
        </ul>	
       				
        <button type="button" class="btn_m" onclick="location.href='/member/addMemberForm.do'">회원가입</button>
        <ul class="list_nj">
            <li>날잡아 회원으로 가입을 하시면 더 많은 서비스를 이용하실 수 있습니다.</li>
        </ul>
    </div>
    
</section>
</div>
</div>
<script>
<!--카카오 스크립트 -->
	function addEventListenerToButton() {
		const kaokaologin = document.getElementById("kaokaologin");
		
		kaokaologin.onclick = function() {
			window.location.href= 'https://kauth.kakao.com/oauth/authorize?client_id=c3b3b906a5d5fcfc1f9e4e2cab90cad5&redirect_uri=http://localhost:8080/oauth/kakao&response_type=code';
		}
	}
	addEventListenerToButton();
	
<!--네이버 스크립트 -->	
		var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "wjpqIKoyLWVBkhXybSoM",
  			callbackUrl: "http://localhost:8080/member/callback",
  			isPopup: false,
			loginButton: {color: "white", type: 1, height: 40}
		
  			}
		);
		naverLogin.init();
		
		
</script>
</body>
</html>