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
	<title>헤더</title>
	<link type="text/css" rel="stylesheet" href="/css/hearder.css"/>
	<script>
		function alertFnc() {
			alert("관리자의 승인이 필요합니다.");
		}
	</script>
</head>
<body>
<header>
<section id="top">
<nav id="top_menu">   
<ul>
	<c:choose>
    	<c:when test="${isLogOn == true && member != null }">
    		<li><a href="${contextPath}/member/logout.do">로그아웃</a></li>
    	</c:when>
    	<c:otherwise>
        	<li><a href="${contextPath }/member/loginForm.do">로그인</a></li>
        </c:otherwise>
    </c:choose>	
    <c:choose>
    	<c:when test="${isLogOn == true && member != null }">
	    	<c:choose>
		    	<c:when test="${member.userType == 1}">
		    	<li><a href="${contextPath }/mypage/mypage.do">마이페이지</a></li>
		    	</c:when>
		    	<c:when test="${member.userType == 2 && member.adminAllow > 0}">
					<li><a href="${contextPath}/mypage/businessPage.do">사업자페이지</a></li>
		    	</c:when>
		    	<c:when test="${member.userType == 2 && member.adminAllow < 1}">
		    		<li><span onclick="alertFnc();">사업자페이지</span></li>
		    	</c:when>
		    	<c:otherwise>
		    		<li><a href="${contextPath }/admin/adminMain.do">관리자페이지</a></li>
		    	</c:otherwise>
	    	</c:choose>
	    </c:when>
        <c:otherwise>
        <li><a href="${contextPath }/member/addMemberForm.do">회원가입</a></li>
        </c:otherwise>
    </c:choose>
    <c:choose>
    	<c:when test="${member.userType == 1}">
    		<li><a href="${contextPath}/mypage/ordersNocheck">예약확인</a></li>
    	</c:when>
    	<c:otherwise>
    		<li><a href="${contextPath}/mypage/ordersNocheck">예약확인</a></li>
    	</c:otherwise>
    </c:choose>
    <li><a href="${contextPath }/mypage/listCart.do">장바구니</a></li>
    <c:choose>
	<c:when test="${member.userType == 1}">
		<li class="revise"><a href="${contextPath }/mypage/notice.do">고객센터</a></li>
	</c:when>
	<c:when test="${member.userType == 0}">
		<li class="revise"><a href="${contextPath }/admin/adNotice.do">고객센터</a></li>
	</c:when>
	</c:choose>
</ul>
</nav>
    <!--top_menu-->
    <div class="clear"></div>
</section>
<!--section top-->
<nav id="main_menu">
    <ul>
        <li><a id="logo" href="${contextPath }/page/mainPage.do"><img src="/img/logo.png"></a></li>
        <li><a href="${contextPath }/page/goodsPage.do" class="main_menu_nav"><strong>숙소</strong></a></li>
        <li><a href="${contextPath }/page/goodsPage2.do" class="main_menu_nav"><strong>투어 & 티켓</strong></a></li>
        <li><a href="${contextPath }/page/airport.do" class="main_menu_nav"><strong>항공</strong></a></li>
        <li><a href="${contextPath }/page/festivalPage.do" class="main_menu_nav"><strong>즐길거리</strong></a></li>
        <li><a href="${contextPath }/page/community.do" class="main_menu_nav"><strong>커뮤니티</strong></a></li>
        <li><a href="${contextPath}/page/eventList.do" class="main_menu_nav"><strong>이벤트</strong></a></li>
        <li>
            <button type="button" class="btn_total_search" value="search"><a href="#"><img src="/img/searching12.png" alt=""></a></button>
        </li>
       
    </ul>
</nav>
</header>
</body>
</html>