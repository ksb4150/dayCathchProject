<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/css/goodsWritePage.css"/>
    
</head>
<body>
    <div class="contents_area">
    <h2 class="goods_title">상품 등록</h2>
        <div class="contents">
              <div class="goods1">
              <a href="${contextPath }/goods/goodsWrite1.do"><img src="/img/goodsWritePage1.jpg"></a>
          
              </div>
              <div class="goods2">
              <a href="${contextPath }/goods/goodsWrite2.do"><img src="/img/goodsWritePage2.jpg"></a>
              </div>
        </div>
</div>


</body>
</html>