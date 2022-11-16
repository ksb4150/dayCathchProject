<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="member" value="${paymentMap.memberVO}" />
<c:set var="goods" value="${paymentMap.goods}" />
<c:set var="detail" value="${paymentMap.detail}" />
<c:set var="cart" value="${paymentMap.cart}" />
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta ="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<link type="text/css" rel="stylesheet" href="/css/paymentPage.css"/>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.js"></script>


</head>

<body>
	<form id="form1" name="form1" action="${contextPath}/mypage/order"
		method="post">
		<div class="contents_area">
			<div class="productName">
				<div class="text_area">
					<br>
					<br>
					<div>
						주문 상세 확인<br>
						<h5>여행 일정 확인 및 여행자 정보를 입력해주세요.</h5>
					</div>

				</div>
				<ul class="step">
				<c:choose>
                <c:when test="${goods.goodsMainCategory != '투어티켓'}">
				<li>
					<p class="num">1</p>    
					<p class="text">숙소선택</p>
				</li>
				<li>
					<p class="num">2</p>
					<p class="text">객실선택</p>
				</li>
				<li>
					<p class="active">3</p>
					<p class="text">예약하기</p>
				</li>
				</c:when>
				<c:otherwise>
				<li>
					<p class="num">1</p>    
					<p class="text">상품선택</p>
				</li>
				<li>
					<p class="num">2</p>
					<p class="text">티켓선택</p>
				</li>
				<li>
					<p class="active">3</p>
					<p class="text">예약하기</p>
				</li>

				</c:otherwise>
				</c:choose>
				</ul>
			</div>
			<hr>
			<div class="contents">
				<div class="productDetail">
					<div class="main_thumbnail">
						<h2>숙소정보</h2>

						<a style="background: url()"><img
							src="${contextPath}/gThumbDownload.do?goodsImageFileName=${goods.goodsImageFileName}"
							width="750px" height="600px" alt=""></a>
					</div>
					<div class="paymentPage_contents_item">
						<div class="hotel_name">
							<input type="hidden" id="userId_1" name="uid"
								value="${member.userId}"> <input type="hidden"
								name="orders[0].goodsId" value="${goods.goodsId}"> <input
								type="hidden" name="orders[0].goodsQty" value="1"> <input
								type="hidden" name="orders[0].goodsName"
								value="${goods.goodsName}"> <input type="hidden"
								name="orders[0].goodsPrice" value="${goods.goodsPrice}">
										
						    <c:if test="${goods.goodsMainCategory.equals('숙박')}">
			    	    	
							<input type="hidden" name="orders[0].cartcheckin"
							value="${cart.cartcheckin}"> <input type="hidden"
							name="orders[0].cartcheckout" value="${cart.cartcheckout}">
							
			    	    	</c:if>
			    	    	
			    	    	<c:if test="${goods.goodsMainCategory.equals('투어티켓')}">
			    	    	
							<input type="hidden" name="orders[0].cartcheckin"
							value="${cart.cartcheckin}"> <input type="hidden"
							name="orders[0].cartcheckout" value="${cart.cartcheckin}">
							
			    	    	</c:if>
			    	    	
			    	   
			    	    	<c:choose>
                  			 <c:when test="${goods.goodsMainCategory != '투어티켓'}">
							<input type="hidden" name="orders[0].numOfTourist"
								value="${cart.numOfTourist}"> <input type="hidden"
								name="orders[0].goodsImageFileName"
								value="${goods.goodsImageFileName}">

							<p class="payment_Page_name">${goods.companyName}</p>
							<p class="roadAddress" style="font-size: medium;">
								${member.roadAddress}</p>
							<p class="rate">
								<span class="hotel_rating"><span class="rating"></span></span>
							</p>
							<ul class="option_list">
								<li><img src="/img/days1.JPG"><span
									class="paymentPage_options"><b> 이용일: </b></span><span>${cart.cartcheckin}
										~ ${cart.cartcheckin}</span></li>
								<br>
								<li><img src="/img/logging1.JPG"><span
									class="paymentPage_options"><b> 객실명: </b></span><span>${goods.goodsName}</span></li>
								<br>
								<li><img src="/img/bed.JPG"><span
									class="paymentPage_options"><b> 객실 수: </b></span><span>1</span></li>
								<br>
								<li><img src="/img/human.JPG"><span
									class="paymentPage_options"><b> 인원 수: </b></span><span>성인
										${cart.numOfTourist} 명</span></li>
								<br>
								<li><img src="/img/macmorning.JPG"><span
									class="paymentPage_options"><b> 조식: </b></span> <span>
										<strong>
										<c:choose>
										<c:when test = "${detail.breakfast == 'breakfast'}">포함</c:when>
										<c:otherwise>미포함</c:otherwise>
										</c:choose>							
										</strong>
								</span></li>
								<br>
								<li><img src="/img/wifi.png" style="width:24px; height:24px;"><span
									class="paymentPage_options"><b> 와이파이: </b></span><span>
									<c:choose>
										<c:when test = "${detail.wifi == 'wifi'}">무료</c:when>
										<c:otherwise>없음</c:otherwise>
										</c:choose>	
									</span></li>
							</ul>
							</c:when>
							<c:otherwise>
							
							<input type="hidden" name="orders[0].numOfTourist"
								value=1> <input type="hidden"
								name="orders[0].goodsImageFileName"
								value="${goods.goodsImageFileName}">

							<p class="payment_Page_name">${goods.companyName}</p>
							<p class="roadAddress" style="font-size: medium;">
								${member.roadAddress}</p>
							<p class="rate">
								<span class="hotel_rating"><span class="rating"></span></span>
							</p>
							<ul class="option_list">
								<li><img src="/img/days1.JPG"><span
									class="paymentPage_options"><b> 이용일: </b></span><span>${cart.cartcheckin}
										~ ${cart.cartcheckin}</span></li>
								<br>
								<li><img src="/img/tourism.png" style="width:20px; height:20px;"><span
									class="paymentPage_options"><b> 티켓명: </b></span><span>${goods.goodsName}</span></li>

								<br>
								<li><img src="/img/human.JPG"><span
									class="paymentPage_options"><b> 인원 수: </b></span><span>성인
										1명</span></li>
								<br>
								
							</ul>
							
							</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
				<br>
				<hr>
				<br>

				<div class="traveler_info_paymentPage">
					<div class="traveler_info">



						<div class="aside_refund">
							<h2 class="aside_refund_title">취소 마감일 안내</h2>

							<strong class="check_date">취소 마감일: ${cart.cartcheckin} /
								16:00</strong>

							<p>
								예약 일로부터 7일 전 / 16:00 <br>
								<b>취소 시: 취소 수수료 없이 취소 가능</b>
							</p>

							<p>
								예약 일로부터 3일 전 / 16:00 <br>
								<b class="if_you_cancel">취소 시: <fmt:formatNumber
										value="${goods.goodsPrice * 0.5}" pattern="#,### 원" /> 청구
								</b>
							</p>

							<p>
								취소 마감일 / 16:00 이후 <br>
								<b class="if_you_cancel">취소 시: <fmt:formatNumber
										value="${goods.goodsPrice}" pattern="#,### 원" /> 청구
								</b>
							</p>
						</div>


						<div class="Reservation_info">

							
							<div class="aside_payment">
							<h2 class="aside_payment_title">결제 정보</h2>
								<p>[${goods.companyName}] ${goods.goodsName}</p>
						
								<c:choose>
								<c:when test="${goods.goodsMainCategory != '투어티켓'}">
								<p><b>${cart.cartcheckin} ~ ${cart.cartcheckout}</b></p>
							
								<p><b>인원 성인 ${cart.numOfTourist} 명</b></p>
								</c:when>
								<c:otherwise>
								<p><b>${cart.cartcheckin} ~ ${cart.cartcheckin}</b></p>
								<p><b>인원 성인 1 명</b></p>
								
								</c:otherwise>
								</c:choose>
								
								<b>주문 금액: <b class="paymentPage_totalpay"><fmt:formatNumber
										value="${goods.goodsPrice}" pattern="#,### 원"/></b></b>
								<br>
								<br>
								<button class="paymentbutton" type="submit" form="form1">주문하기</button>

							</div>

						</div>


					</div>
				</div>
			</div>
		</div>
	</form>

</body>

</html>