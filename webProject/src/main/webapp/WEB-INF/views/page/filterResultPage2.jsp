<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="filterList1" value="${filterMap.filterList1}"/>
<c:set var="memInfoList" value="${filterMap.memInfoList}"/>  

<c:choose>
	<c:when test="${not empty filterList1 && filterList1 != 'null'}">
	<c:forEach var="filterList" items="${filterList1}" varStatus="status">
        <li class="list_2">
        	<a href="${contextPath}/page/goodsDetailPage2.do?uid=${memInfoList[status.index].uid}">
        		<p class="pic" style="height: 280px;">   
                    <img class="lazy align"
                    		src="${contextPath}/uImgDownload.do?uid=${memInfoList[status.index].uid}&userImageFileName=${memInfoList[status.index].userImageFileName}"
                        alt="${filterList.goodsName}" style="width:100%; height:100%;">
                </p>
                <div class="stage">
                    <div class="name">
                        <strong>${filterList.goodsName}</strong>
                        <p class="score">
                            <span><em>${filterList.score}</em></span>
                        </p>
                        <p>
                        	${memInfoList[status.index].roadAddress} 
                        </p>
                    </div>
                    <div class="price">
                        <p><b>${filterList.goodsPrice}</b></p>
                        <fmt:formatNumber value="${filterList.goodsPrice}" pattern="#,### 원"/>
                        </div>
                    </div>
                </a>
            </li>
       </c:forEach>
       </c:when>
       <c:otherwise>
       		<p> 조건에 맞는 상품이 없습니다. </p>
       </c:otherwise>
   </c:choose>

