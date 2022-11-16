<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="goodsList" value="${goodsListMap.goodsList}" />
<c:set var="goodsList1" value="${goodsListMap.goodsList1}" />
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
    <link type="text/css" rel="stylesheet" href="/css/goodsList.css" />
    <link rel="stylesheet" href="/css/side.css"/>
    <script  src="https://code.jquery.com/jquery-3.6.0.js"></script>
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
	                    <a class="mypage_sidebar_a" href="${contextPath}/order/bOrderCheck.do"><h3>예약 관리</h3></a> 
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
	                        <a class="mypage_sidebar_b" href="#"><h4>상품 리뷰</h4></a>
	                    </details>
	                </li>
	                    <hr>
	                <li>
	                <li>
	                    <a class="mypage_sidebar_a" href="${contextPath}/order/bSalesStatusPage.do"><h3>매출 관리</h3></a>
	                </li>
	            </ul>
	        </div>
	    </section>
	    <div class="contents">
	    
	        <div class="goodsList_tit">
	        <h2>상품 목록</h2>   
	        </div>
	    
	        <div id="rooms_info">
	        <c:if test="${not empty goodsList && goodsList != 'null' }">
	            <c:forEach var="item" items="${goodsList}" varStatus="status">
	                <form name="" method="POST" >   
	                    <input type="hidden" name="goodsId" value="${item.goodsId}">
	                    <div class="rooms">
	                        <div class="room_img_wrap">
	                            <input type="hidden" name="goodsImageFileName" value="${item.goodsImageFileName}">
	                            <img src="${contextPath}/gThumbDownload.do?goodsImageFileName=${item.goodsImageFileName}" alt="상품 이미지"/>
	                        </div>
	                        <div class="room_info_wrap">
	                            <input type="hidden" name="goodsName" value="${item.goodsName}">
	                            <div class="room_name">${item.goodsName} / ${item.lodgingDetailVO.numOfTourist}인</div>
	                            <br>
	                            <div class="room_lodging">
	                                <span>침대: ${item.lodgingDetailVO.bedAmount}개</span>
	                                <span>${item.lodgingDetailVO.TV}</span>
	                                <span>${item.lodgingDetailVO.wifi}</span>
	                                <span>${item.lodgingDetailVO.refrigerator}</span>
	                                <span>${item.lodgingDetailVO.restaurant}</span>
	                                <span>${item.lodgingDetailVO.airConditioner}</span>
	                                <span>${item.lodgingDetailVO.swimmingPool}</span>
	                                <span>${item.lodgingDetailVO.breakfast}</span>
	                                <span>${item.lodgingDetailVO.spar}</span>
	                                <span>${item.lodgingDetailVO.hairAppliance}</span>
	                                <span>${item.lodgingDetailVO.petsAllowed}</span>
	                                <span>${item.lodgingDetailVO.store}</span>
	                                <span>${item.lodgingDetailVO.disabledAccessibility}</span>
	                                <span>${item.lodgingDetailVO.parking}</span>
	                                <span>${item.lodgingDetailVO.hotSpring}</span>                    
	                            </div>
	                                
	                        </div>
	                    
	                        <div class="room_wrap">
	                            <div class="room_price">
	                                <b>남은 객실 : ${item.goodsCount}</b>
	                            </div>
	                        </div>
	                        <div class="room_wrap">
	                            <div class="room_price">
	                                <input type="hidden" name="goodsPrice" value="${item.goodsPrice}">
	                                <b>${item.goodsPrice}원</b>
	                            </div>
	                        </div>
	                        <div class=" room_wrap">
	                            <div class="goods_button_wrap">
	                                <input type="button" class="" onclick="location='/goods/goodsModify.do?goodsId=${item.goodsId}'" value="상품 수정하기"/>
	                            </div>
	                        </div>
	                        <div class="room_wrap">
	                            <div class="goods_button_wrap">
	                                <input type="button" class="" onclick="location='/goods/goodsDelete.do?goodsId=${item.goodsId}'" value="상품 삭제하기"/>
	                            </div>
	                        </div>               
	                    </div>
	                </form>
	            </c:forEach>
	        </c:if>
	        <c:if test="${not empty goodsList1 && goodsList1 != 'null' }">
            <c:forEach var="item" items="${goodsList1}" varStatus="status">
                <form name="" method="POST" >   
                    <input type="hidden" name="goodsId" value="${item.goodsId}">
                    <div class="rooms">
                        <div class="room_img_wrap">
                            <input type="hidden" name="goodsImageFileName" value="${item.goodsImageFileName}">
                            <img src="${contextPath}/gThumbDownload.do?goodsImageFileName=${item.goodsImageFileName}" alt="상품 이미지"/>
                        </div>
                        <div class="room_info_wrap">
                            <input type="hidden" name="goodsName" value="${item.goodsName}">
                            <div class="room_name">${item.goodsName} / ${item.lodgingDetailVO.numOfTourist}인</div>
                            <br>
                            <div class="room_lodging">
                             
                                <span>가이드: ${item.lodgingDetailVO.guide}</span>
                                <span>${item.lodgingDetailVO.wifi}</span>
                                <span>${item.lodgingDetailVO.refrigerator}</span>
                                <span>${item.lodgingDetailVO.restaurant}</span>
                                <span>${item.lodgingDetailVO.airConditioner}</span>
                                <span>${item.lodgingDetailVO.swimmingPool}</span>
                                <span>${item.lodgingDetailVO.breakfast}</span>
                                <span>${item.lodgingDetailVO.spar}</span>
                                <span>${item.lodgingDetailVO.hairAppliance}</span>
                                <span>${item.lodgingDetailVO.petsAllowed}</span>
                                <span>${item.lodgingDetailVO.store}</span>
                                <span>${item.lodgingDetailVO.disabledAccessibility}</span>
                                <span>${item.lodgingDetailVO.parking}</span>
                                <span>${item.lodgingDetailVO.hotSpring}</span>                    
                            </div>
                                
                        </div>
                    
                        <div class="room_wrap">
                            <div class="room_price">
                                <b>남은 객실 : ${item.goodsCount}</b>
                            </div>
                        </div>
                        <div class="room_wrap">
                            <div class="room_price">
                                <input type="hidden" name="goodsPrice" value="${item.goodsPrice}">
                                <b>${item.goodsPrice}원</b>
                            </div>
                        </div>
                        <div class=" room_wrap">
                            <div class="goods_button_wrap">
                                <input type="button" class="" onclick="location='/goods/goodsModify.do?goodsId=${item.goodsId}'" value="상품 수정하기"/>
                            </div>
                        </div>
                        <div class="room_wrap">
                            <div class="goods_button_wrap">
                                <input type="button" class="" onclick="location='/goods/goodsDelete.do?goodsId=${item.goodsId}'" value="상품 삭제하기"/>
                            </div>
                        </div>               
                    </div>
                </form>
            </c:forEach>
        </c:if>
	    </div>
	</div>
</div>

</body>
</html>