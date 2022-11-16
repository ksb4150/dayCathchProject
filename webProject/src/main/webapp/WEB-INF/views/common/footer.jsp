<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>footer</title>
    <link rel="stylesheet" href="/css/footer.css">
</head>
<body>

    <nav class="footer_nav">

        <div class="footer_div1">

            <div class="footer_div2">
            <a class="footer_a" href="${contextPath}/page/mainPage.do"><b>날잡아</b></a>
        </div>
        <div class="footer_div2">
            <a class="footer_a" href="${contextPath}/mypage/notice.do"><b>공지사항</b></a>
        </div>
        <div class="footer_div2">
            <a class="footer_a" href="${contextPath}/mypage/guidelineReservation.do"><b>예약안내</b></a>
        </div>
        <div class="footer_div2">
            <a class="footer_a" href="${contextPath}/page/eventList.do"><b>이벤트</b></a>
        </div>
        <div class="dropdown">
            <button class="dropbtn"> 
              <b>비지니스 센터</b>
            </button>
            <div class="dropdown-content">
              <a href="${contextPath }/member/businessAddMemberForm.do"><b>비지니스 파트너 회원가입</b></a>
            </div>

          </div>

    </nav>

    <footer class="footer">
        
        <div class="footer_div1">

            <div class="footer_div2">
            <a class="footer_b" href="#"><b>회사소개</b></a>
        </div>
        <div class="footer_div2">
            <a class="footer_b" href="${contextPath}/mypage/personalInfoPage.do"><b>개인정보 처리방침</b></a>
        </div>
        <div class="footer_div2">
            <a class="footer_b" href="#"><b>이용약관</b></a>
        </div>
        <div class="footer_div2">
            <a class="footer_b" href="#"><b>오시는길</b></a>
        </div>

       </div>

        <p class="text-center text-muted"> © 2022 Dobbys Company, Inc</p>

    </footer>

</body>
</html>