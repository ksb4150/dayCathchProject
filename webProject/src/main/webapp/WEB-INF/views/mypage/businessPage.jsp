<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="member" value="${member}"/>
<c:set var="oc" value="${orderCount}"/>
<c:set var="occ" value="${orderCancelCount}" /> 
<c:set var="eg" value="${enrollGoods}"/>
<c:set var="wg" value="${waitingGoods}" /> 
<c:set var="be" value="${businessEarning}"/>

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
    <link rel="stylesheet" href="/css/side.css"/>
    <link rel="stylesheet" href="/css/mypage.css"/>
    <style>
    </style>
</head>
<body>
    <div class="contents_area">
	    <div class="soon">
		    <section class="mypagesidebar0">
			    <div>
				    <ul class="mypagesidebar_ul">
				        <li class="sidebardiv1">
				        	<a class="mypage_sidebar_a" href="${contextPath}/mypage/businessPage.do"><h3>사업자 페이지</h3></a>
				        </li>
				        <li>
				            <a class="mypage_sidebar_a" href="${contextPath}/mypage/businessModMemberPage.do"><h3>개인정보수정</h3></a>
				        </li>
				                <hr>
				        <li>
				            <a class="zmypage_sidebar_a" href="${contextPath}/order/bOrderCheck.do"><h3>예약 현황</h3></a> 
				        </li>
				                <hr>
				        <li>
				            <details>
				                <summary><h3>상품 관리</h3></summary>
				                <hr>
				                <a class="mypage_sidebar_b" href="${contextPath}/goods/goodsWrite1.do"><h4>숙소 등록</h4></a>
				                <hr>
				                <a class="mypage_sidebar_b" href="${contextPath}/goods/goodsWrite2.do"><h4>투어&티켓 등록</h4></a>
				                <hr>
				                <a class="mypage_sidebar_b" href="${contextPath}/goods/goodsList.do"><h4>상품 목록</h4></a>
				                <hr>
				                <a class="mypage_sidebar_b" href="${contextPath}/mypage/businessReviewList.do"><h4>상품 리뷰</h4></a>
				            </details>
				        </li>
				            <hr>
				        <li>
				        <li>
				        	<a class="mypage_sidebar_a" href="${contextPath}/order/bSalesStatusPage.do"><h3>매출 현황</h3></a>
				        </li>
				    </ul>
				</div>
			</section>
	    
	    
		    <div class="contents">
		            <div class="mypage_block">
		                <p class="mypage_hello">안녕하세요, 날잡아 <em class="emp_blue" style="color: blue;"> ${member.userName}</em> 사업자 회원님! </p>
		                <ul class="mypage_link">
		                    <li><a href="${contextPath }/mypage/businessModMemberPage.do"><em><strong class="mymod"><img src="/img/bInfoMod.png" alt="정보 수정"></strong></em><br>정보 수정</a></li>
		                    <li><a href="${contextPath }/goods/goodsList.do"><em><img src="/img/bGoodsList.png" alt="상품 정보"></em><br>상품 정보</a></li>
		                    <li><a href="${contextPath}/order/bOrderCheck.do"><em><img src="/img/bReserve.png" alt="예약 현황"></em><br>예약 현황</a></li>
		                    <li><a href="${contextPath}/order/bSalesStatusPage.do"><em><img src="/img/bSalesPage.png" alt="매출 현황"></em><br>매출 현황</a></li> 
		                </ul>
		            </div>
		            
		            <div class="block_tit_area">
		                <h4 class="stit_con_title">예약 관리</h4>
		            </div>
		
		            <div class="bookinglist">
		                <ul class="booking_count">
		                    <li><span>예약 현황<a href="${contextPath}/order/bOrderCheck.do"><em>${oc}</em>건</a></span></li>
		                    <li><span>예약 취소<a href="${contextPath}/order/bOrderCheck.do"><em>${occ}</em>건</a></span></li>
		                    
		                </ul>
		            </div>
		            <div class="content_area1">
		                <div class="part_area_in">
		                    <h4 class="stit_con_title">상품 관리</h4>
		                    <div class="mypage_count">
		                        <ul class="list_count">
		                        <li><span>판매중인 상품<a href=""><em>${eg}</em>건</a></span></li>
		                        <li><span>승인 대기 상품<a href=""><em>${wg}</em>건</a></span></li>
		                        </ul>
		                    </div>	
		                </div>
		                <div class="part_area_in">
		                    <h4 class="stit_con_title">매출 관리</h4>
		                    <div class="mypage_count">
		                        <ul class="list_count">
		                            <li><span>매출 현황<a href="${contextPath}/order/bSalesStatusPage.do"><em><fmt:formatNumber value="${be}" pattern="#,### 원" /></em></a></span></li>
		                        </ul>							 
		                    </div>	
		                </div>
		            </div>
		        </div>
	        </div>
        </div>
</body>
</html>