<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="goodsList" value="${goodsMap.lodgingList}" />
<c:set var="memInfoList" value="${goodsMap.memInfoList}" />
<c:set var="HotgoodsList" value="${goodsHotMap.HotlodgingList}" />
<c:set var="HotmemInfoList" value="${goodsHotMap.HotmemInfoList}" />
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>searchTool</title>
    <link type="text/css" rel="stylesheet" href="/css/productPage.css" />
    <link rel="stylesheet" href="/css/goodsPageSlider.css">  
    <link rel="stylesheet" href="/css/jquery.datetimepicker.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <script type="text/javascript" src="/js/jquery.datetimepicker.full.min.js"></script>

    <script type="text/javascript">

        $(document).ready(function () {
        	
            $('.slider').bxSlider({
                
             speed: 300,
             pause: 4000,		 
   			 minSlides: 4,
   			 maxSlides: 4,
   			 infiniteLoop: false,
   			 hideControlOnEnd:false,
   			 slideWidth: 1200,  
   			 touchEnabled: false,
   			   
                });
               
               	
               $('.slider_1').bxSlider({
                  
              speed: 300,
              pause: 4000,		 
       		  minSlides: 4,
       		  maxSlides: 4,
       		  infiniteLoop: false,
       		  hideControlOnEnd:false,
       		  slideWidth: 1200,  
       		  touchEnabled: false,
       			   
                    });
        	
        	
            fn_egov_init_date();
            
            $(".product_item").on("click", function(){

            	  let uid = $(this).children("input").val();
            	  let form = document.getElementById("goodsInfo"+uid);
            	  
            	  form.action = "${contextPath}/page/goodsDetailPage.do";
            	  form.submit();
            	  
              });
        })
        
	        // 선택 날짜를 최대 최소값으로 설정해 그 외의 날짜 선택 비활성화
	        function fn_egov_init_date() {
	            var $startDate = $('#startDate');
	            var $endDate = $('#endDate');
	            $startDate.datetimepicker({
	                timepicker: false,
	                lang: 'ko',
	                format: 'Y-m-d',
	                scrollMonth: false,
	                scrollInput: false,
	                onShow: function (ct) {
	                    this.setOptions({
	                        maxDate: $endDate.val() ? $endDate.val() : false
	                    })
	                },
	            });
	
            $endDate.datetimepicker({
                timepicker: false,
                lang: 'ko',
                format: 'Y-m-d',
                scrollMonth: false,
                scrollInput: false,
                onShow: function (ct) {
                    this.setOptions({
                        minDate: $startDate.val() ? $startDate.val() : false
                    })
                }
            });
        }
        
        function nonMember() {
        	alert("회원만 가능합니다!");
        	return false;
        }
    </script>
</head>

<body>
    <div class="contents_area">
        <div class="backgroundImg1">
        </div>
        <div class="contents">    
            <div class="searchBox">
                <div class="iconBar">
                    <ul>
                        <li>
                            <a href="${contextPath}/page/goodsPage.do">
                                <p class="iconHotel">
                                    <img src="/img/hotelColor.png" />
                                </p>
                                <p class="iconFont">숙소</p>
                            </a>
                        </li>
                        <li>
                            <a href="${contextPath}/page/goodsPage2.do">
                                <p class="iconTourism">
                                    <img src="/img/tourism.png" />
                                </p>
                                <p class="iconFont">투어&티켓</p>
                            </a>
                        </li>
                        <li>
                            <a href="${contextPath}/page/airport.do">
                                <p class="iconAirpalne">
                                    <img src="/img/airplane.png" />
                                </p>
                                <p class="iconFont">항공</p>
                            </a>
                        </li>
                        <li>
                        	<a href="${contextPath }/page/festivalPage.do">
                                <p class="iconFestival">
                                    <img src="/img/festival.png" />
                                </p>
                            </a>
                            <p class="iconFont">즐길거리</p>
                        </li>
                        <li> <a href="${contextPath}/page/community.do" >
                                <p class="iconCommunity">
                                    <img src="/img/community.png" />
                                </p>
                                <p class="iconFont">커뮤니티</p>
                            </a>
                        </li>
                        <li>
                            <a href="${contextPath}/page/eventList.do">
                                <p class="iconEvent">
                                    <img src="/img/event.png" />
                                </p>
                                <p class="iconFont">이벤트</p>
                            </a>

                        </li>
                   </ul>
                </div>
                <div id="search">
                	<form method="post" action="${contextPath}/page/goodsFilterPage.do">
	                    <div class="destination" >
	                        <p>목적지</p>
	                        <input type="text" name="goodsSubCategory" id="goodsSubCategory" placeholder="원하는 지역을 입력해주세요." />
	                    </div>
	                    <div class="searchFormButton">
	                        <input type="submit" id="searchSubmit" value="검색">
	                    </div>
	                 </form>
                </div>
            </div>
            
            
            <div class="product_contents_area">
            <div class="product_contens">
            	<h3>인기 상품</h4>
                <div class="product_box slider">
                	<c:if test="${not empty HotgoodsList && HotgoodsImgList != 'null' }">
                		<c:forEach var="Hotitem" items="${HotmemInfoList}" varStatus="status">
                			<form id="goodsInfo${Hotitem.uid}" method="post">
                				<div class="product_item">
                					<input type="hidden" id="uid" name="uid" value="${Hotitem.uid}"/>
                					<div class="img_wrap">
                						<img src="${contextPath}/uImgDownload.do?uid=${Hotitem.uid}&userImageFileName=${Hotitem.userImageFileName}" alt="상품 이미지"/>		
                					</div>
                					<div class="txt_wrap">
                						<div class="company_name">${Hotitem.companyName}</div>
            							<div class="road_address">${Hotitem.roadAddress}</div>
            							<div class="score"><fmt:formatNumber value="${Hotitem.score}" maxFractionDigits="1" />/5점</div>
            							<div class="goods_price">
            								<fmt:formatNumber value="${HotgoodsList[status.index].goodsPrice}" pattern="#,### 원" />
        								</div>
            							
                					</div>
                				</div>  
                			</form>
                		</c:forEach>
                     </c:if>
                </div>
            </div>
            </div>
            
           
            <div class="product_contents_area">
                <div class="product_contens">
                	<h3>최저가 상품</h4>
                	  <div class="product_box slider_1">
                    	<c:if test="${not empty goodsList && goodsImgList != 'null' }">
                    		<c:forEach var="item" items="${memInfoList}" varStatus="status">
                    			<form id="goodsInfo${item.uid}" method="post">
                    				<div class="product_item">
                    					<input type="hidden" id="uid" name="uid" value="${item.uid}"/>
                    					<div class="img_wrap">
                    						<img src="${contextPath}/uImgDownload.do?uid=${item.uid}&userImageFileName=${item.userImageFileName}" alt="상품 이미지"/>		
                    					</div>
                    					<div class="txt_wrap">
                    						<div class="company_name">${item.companyName}</div>
                							<div class="road_address">${item.roadAddress}</div> 
                							<div class="score"><fmt:formatNumber value="${item.score}" maxFractionDigits="1" />/5점</div>
                							<div class="goods_price">
                								<fmt:formatNumber value="${goodsList[status.index].goodsPrice}" pattern="#,### 원" />
                							</div>
                    					</div>
                    				</div>
                    			</form>                    		
                    		</c:forEach>
	                     </c:if>
                    </div>
                </div>
            </div>
                                  
            <div class="area_info">
                <div class="container">
                    <div class="area_cs_info">
                        <div class="cs_info">
                            <ul>
                                <li>
                                    <h1 class="area_cs_number"><img src="/img/csicon1.png" alt=""><br>상담전화 <br>1999-1999
                                    </h1>
                                </li>
                                <li>
                                    <h2 class="area_cs_time">평 일 09:00 ~ 19:00 <br>주말 및 공휴일 휴무</h2>
                                </li>
                            </ul>
                        </div>
                        <div class="mypage_info">
	                        <ul>
	                            <li><button class="mypage_info_btn" onclick="location.href='${contextPath}/mypage/guidelineReservation.do'">예약안내</button> </li>
	                            <li><button class="mypage_info_btn" onclick="location.href='${contextPath}/mypage/guidelinePay.do'">결제방법</button> </li>
	                            <li><button class="mypage_info_btn" onclick="location.href='${contextPath}/mypage/guidelinePointcoupon.do'">포인트</button> </li>
	                            <c:choose>
		        	                <c:when test="${isLogOn == true && member != null }">
		        	                	<li><button class="mypage_info_btn" onclick="location.href='${contextPath }/mypage/mypage.do'">마이페이지</a></li>
		        	                </c:when>
		        	                <c:otherwise>
		        	                	<li><button class="mypage_info_btn" onclick="nonMember()">마이페이지</button> </li>
		        	                </c:otherwise>
	        	                </c:choose>
	                            <li><button class="mypage_info_btn" onclick="location.href='${contextPath}/mypage/notice.do'">공지사항</button> </li>
	                            <li><button class="mypage_info_btn" onclick="location.href='${contextPath}/page/eventList.do'">이벤트</button> </li>
	                        </ul>
	                    </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>