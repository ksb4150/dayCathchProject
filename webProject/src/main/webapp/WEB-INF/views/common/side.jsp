<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
    
    <%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>    
    <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
    <%
    request.setCharacterEncoding("UTF-8");
    %>
    
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mypage_sidebar</title>

    <link rel="stylesheet" href="/css/side.css">
    

</head>
<body>
   
   <div class="sidebardiv1">
    <a class="mypage_sidebar_a" href="#"><h2 class="sidebar_h2" style="color: white">마이페이지</h2></a>
    </div>
    <section class="mypagesidebar0">
    
    <div>
    <ul class="mypagesidebar_ul">
        <li>
            <a class="mypage_sidebar_a" href="#"><h3>개인정보수정</h3></a>
        </li>
                <hr>
        <li>
            <a class="mypage_sidebar_a" href="#"><h3>장바구니</h3></a> 
        </li>
                <hr>
        <li>
            <details>
                <summary><h3>커뮤니티</h3></summary>
                <hr>
                <a class="mypage_sidebar_b" href="#"><h4>작성한 게시글</h4></a>
                <hr>
                <a class="mypage_sidebar_b" href="#"><h4>작성한 댓글</h4></a>
                
            </details>
        </li>
                 <hr>
        <li>
            <a class="mypage_sidebar_a" href="#"><h3>관심내역</h3></a>
        </li>
                 <hr>    
        <li>
            <a class="mypage_sidebar_a" href="#"><h3>포인트/쿠폰</h3></a>
        </li>
                <hr>
        <li>
            <details>
                <summary><h3>고객센터</h3></summary>
                <hr>
                <a class="mypage_sidebar_b" href="#"><h4>공지사항</h4></a>
                <hr>
                <a class="mypage_sidebar_b" href="#"><h4>1대1 문의</h4></a>
                <hr>
                <a class="mypage_sidebar_b" href="#"><h4>자주하는 질문</h4></a>
                <hr>
                <a class="mypage_sidebar_b" href="#"><h4>이벤트</h4></a>
            </details>
        </li>
            <hr>
        <li>
            <details>
                <summary><h3>이용안내</h3></summary>
                <hr>
                <a class="mypage_sidebar_b" href="#"><h4>예약 안내</h4></a>
                <hr>
                <a class="mypage_sidebar_b" href="#"><h4>결제 방법 안내</h4></a>
                <hr>
                <a class="mypage_sidebar_b" href="#"><h4>포인트/쿠폰 안내</h4></a>
                <hr>
                <a class="mypage_sidebar_b" href="#"><h4>회원 등급 안내</h4></a>
                <hr>
                <a class="mypage_sidebar_b" href="#"><h4>항공권 이용 안내</h4></a>
            </details>
        </li>

    
</ul>
</div>
</section>
</body>
</html>