<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="/css/ordersNocheck.css" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비회원 주문조회 주문번호 입력 페이지</title>
<script>
        function ordersNO_check() {
        var ordersNo=document.getElementById("ordersNO")
        
        if (ordersNO.value == "") {
        alert("주문번호를 입력해주세요");
        ordersNO.focus();
        return false;
        }
        document.ordersNOcheck_form.submit();
        }
    </script>
</head>
<body>
	<div class="non_user_ordersNo_CheckPage">
		<h2>비회원 주문 조회</h2>
		
		<form action="${contextPath}/mypage/orderList.do" method="post"
			name="ordersNOcheck_form" class="ordersNOcheck_form">
			<br> <br> <b>주문 번호 입력</b> <br> <input type="text"
				id="ordersNO" name="ordersNO"> <br> <br>
			<button id="ordersNO_check_button" onclick="ordersNO_check()">비회원 주문 조회</button>
			<br>
			<br><b>주문 번호를 분실하였을 경우<br>고객센터로 연락바랍니다.
			</b>

		</form>
	</div>
</body>
</html>