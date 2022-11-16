<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="goods" value="${goodsMap.goods}"/>
<C:set var="detail" value="${goosMap.detail}"/>
<c:set var="img" value="${goodsMap.img}"/>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link type="text/css" rel="stylesheet" href="/css/popup.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <script>
         $(document).ready(function(){
              $('.slider').bxSlider({
	                auto: false,
				    speed: 300,
				    pause: 4000,
				    mode:'fade',
				    autoControls: false,
				    pager:false
                });
            });
    </script>
</head>
<body>
    <div class="content_area">
        <div class="content_wrap">
            <div class="goodsId_wrap">
                <div class="goodsId">
                	${goods.goodsId}
                </div>
            </div>
            <div class="con">
                <div class="detail_info_wrap">
                    <div class="detail">
                        <table>
                            <tr>
                                <td colspan="2">객실 상세 정보</td>
                            </tr>
                            <tr>
                                <td>numOfTourist</td>
                                <td>${detail.numOfTourist}</td>
                            </tr>
                            <tr>
                                <td>TV</td>
                                <td>${detail.TV}</td>
                            </tr>
                            <tr>
                                <td>wifi</td>
                                <td>${detail.wifi}</td>
                            </tr>
                            <tr>
                                <td>refrigerator</td>
                                <td>${detail.refrigerator}</td>
                            </tr>
                            <tr>
                                <td>chekIn</td>
                                <td>${detail.chekIn}</td>
                            </tr>
                            <tr>
                                <td>chekOut</td>
                                <td>${detail.chekOut}</td>
                            </tr>
                            <tr>
                                <td>bedType</td>
                                <td>${detail.bedType}</td>
                            </tr>
                            <tr>
                                <td>bedAmout</td>
                                <td>${detail.bedAmout}</td>
                            </tr>
                            <tr>
                                <td>restaurant</td>
                                <td>${detail.restaurant}</td>
                            </tr>
                            <tr>
                                <td>airConditioner</td>
                                <td>${detail.airConditioner}</td>
                            </tr>
                            <tr>
                                <td>swimmingPool</td>
                                <td>${detail.swimmingPool}</td>
                            </tr>
                            <tr>
                                <td>breakfast</td>
                                <td>${detail.breakfast}</td>
                            </tr>
                            <tr>
                                <td>spar</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>hairAppliance</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>petsAllowed</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>store</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>disabledAccessibility</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>parking</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>hotSpring</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>lodgingType</td>
                                <td></td>
                            </tr>
                        </table>
                    </div>
                    <div class="info">

                    </div>
                </div>
                <div class="img_wrap">
                    <div class="slider">
                    	<c:if test="${not empty img}">
                    		<c:forEach var="item" items="${img}" varStatus="status">
                        		<div><img src="${contextPath}/gImgDownload.do?goodsId=${goods.goodsId}&orginFileName=${item.orginFileName}" width="100%" height="500px"></div>
                        	</c:forEach>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>