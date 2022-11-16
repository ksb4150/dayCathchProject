<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<c:set var="orderResult" value="${orderResult}"/>

<%
	request.setCharacterEncoding("utf-8");
%>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>주문완료창</title>
  <link type="text/css" rel="stylesheet" href="/css/orderResult.css"/>

</head>
<body class="order_body">
      <div class="orderresult_container" id="contents">
        
        
           
            <h1>주문이 완료되었습니다. </h1>
                           
                    <div class="payerinfo">
                    
                    <b>결제 정보</b>
                    <br><hr>
                    <label>주문번호: <b>${orderResult.ordersNO}</b></label>
                    <br>
                    <label>주문일자: ${orderResult.creDate}</label>
                    <br>
                    <label for="order_name">이름: ${orderResult.ordererName}</label>
                    <br>                                   
                    <label for="order_phone">연락처: ${orderResult.ordererPhoneNumber}</label>                
                    <br>
                    <label><b>결제금액</b><br> <fmt:formatNumber value="${orderResult.finalTotalPrice}" pattern="#,### 원" /></label>
                   <br>
                    </div>    
                    <a href="${contextPath }/page/goodsPage.do"><button id="homebtn" type="submit">쇼핑계속하기</button></a>
                </div>  
              
       
</body>
</html>