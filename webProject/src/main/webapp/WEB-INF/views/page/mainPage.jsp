<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
   isELIgnored="false"
%>

<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var="goodsList" value="${goodsMap.lodgingList}" />
<c:set var="goodsList1" value="${goodsMap.lodgingList1}" />
<c:set var="memInfoList" value="${goodsMap.memInfoList}" />
<c:set var="memInfoList1" value="${goodsMap.memInfoList1}" />
<c:set var="boardList" value="${goodsMap.boardList}" />


<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>메인</title>
        <link rel="stylesheet" href="/css/mainPage.css">
       <link rel="stylesheet" href="/css/floating.css">
       <link rel="stylesheet" href="/css/mainslider.css">  
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
        <script>
            $(document).ready(function(){
              $('.slider').bxSlider({
            	 auto: true,
            	 speed: 300,
            	 pause: 4000,
			     mode:'fade',
			     autoControls: false,
			     pager:false
              });
              
              $(".goodsInfo").on("click", function(){

            	  let uid = $(this).children("input").val();
            	  let form = document.getElementById("goodsInfo"+uid);
            	  
            	  form.action = "${contextPath}/page/goodsDetailPage.do";
            	  form.submit();
            	  
              });
              
              $(".goodsInfo2").on("click", function(){

            	  let uid = $(this).children("input").val();
            	  let form = document.getElementById("goodsInfo2"+uid);
            	  
            	  form.action = "${contextPath}/page/goodsDetailPage2.do";
            	  form.submit();
            	  
              });
            
              $(".boardInfo").on("click", function(){

            	  let articleNO = $(this).children("input").val();
            	  let form = document.getElementById("boardInfo"+articleNO);
            	  
            	  form.action = "${contextPath}/board/viewBoard.do";
            	  form.submit();
            	  
              });
              
           });      
            
            function nonMember() {
            	alert("회원만 가능합니다!");
            	return false;
            }
          </script>
    </head>

    <body>
        <!-- 메인페이지 시작 -->
       <div class="mainbig">
       
        <div class="slider">
        	<div><img src="/img/sBanner2.jpg" width="100%" height="540px"></div>
            <div><img src="/img/bBanner.jpg" width="100%" height="540px"></div>
            <div><img src="/img/JBanner1.jpg" width="100%" height="540px"></div>
            <div><img src="/img/dBanner1.jpg" width="100%" height="540px"></div>
            <div><img src="/img/jjBanner1.jpg" width="100%" height="540px"></div>
            
          </div>
   
    <div class="main_fixed">
      <div class="main_fixed_1">
    <div class="main_fixed_a"><img src="/img/subbanner_div1.jpg" alt=""></div>
    <div class="main_fixed_b"><img src="/img/subbanner_div2.jpg" alt=""></div>
  </div>

    </div>
        <div class="maindiv0">
            <h1 class="city-h2">인기 여행지</h1>
            <!-- Three columns of text below the carousel -->
            <div class="maindiv1">
                <div class="cityball">
                   <a href="${contextPath}/page/goodsFilterPage.do?goodsSubCategory=서울"><img class="imgball" src="/img/seoul.JPG"></a>
    
                  </div><!-- /cityball -->
                <div class="cityball">
                    <a href="${contextPath}/page/goodsFilterPage.do?goodsSubCategory=제주"><img class="imgball" src="/img/jeju.JPG"></a>

              </div><!-- /cityball -->
              <div class="cityball">
                <a href="${contextPath}/page/goodsFilterPage.do?goodsSubCategory=부산"><img class="imgball" src="/img/busan.JPG"></a>

              </div><!-- /cityball -->
              <div class="cityball">
                <a href="${contextPath}/page/goodsFilterPage.do?goodsSubCategory=전주"><img class="imgball" src="/img/jeonju1.JPG"></a>

              </div><!-- /cityball -->
              <div class="cityball">
                <a href="${contextPath}/page/goodsFilterPage.do?goodsSubCategory=대전"><img class="imgball" src="/img/deajeon.JPG"></a>

              </div><!-- /cityball -->
            </div><!-- /maindiv1 -->
        </div>
          
            
            <div class="maindiv2_goods">        
               <h3 class="maindiv2_title">최저가 숙소</h4>
                 <div class="maindiv2-1">
	                <div class="product_box">
	                   <c:if test="${not empty goodsList && goodsImgList != 'null' }">
	                      	<c:forEach var="item" items="${memInfoList}" varStatus="status">
		                      	<form id="goodsInfo${item.uid}" method="post">
		                            <div class="product_item goodsInfo">
		                               <input type="hidden" id="uid" name="uid" data-value="${item.uid}" value="${item.uid}" />
		                               <div class="img_wrap">
		                                  <img src="${contextPath}/uImgDownload.do?uid=${item.uid}&userImageFileName=${item.userImageFileName}" alt="상품 이미지"/>      
		                               </div>
		                               <div class="txt_wrap">
		                                  <div class="company_name">${item.companyName}</div>
		                                 <div class="road_address">${item.roadAddress}</div> 
		                                 <div class="goods_price">
		                                		 <fmt:formatNumber value="${goodsList[status.index].goodsPrice}" pattern="#,### 원" />
		                                 </div>
		                                 <div class="goods_score">
		                                 <fmt:formatNumber value="${item.score}" maxFractionDigits="1" />/5점</div>
		                               </div>
		                         
		                            </div>
		                        </form>
		                     </c:forEach>
	                     </c:if>
	                </div>
                </div>
            </div>
            
            
            <div class="maindiv2_goods">        
            <h3 class="maindiv2_title">최저가 투어 & 티켓</h4>
              <div class="maindiv2-1">
	                <div class="product_box">
	                   <c:if test="${not empty goodsList1 && goodsImgList1 != 'null' }">
	                      	<c:forEach var="item" items="${memInfoList1}" varStatus="status">
		                      	<form id="goodsInfo2${item.uid}" method="post">
		                            <div class="product_item goodsInfo2">
		                               <input type="hidden" id="uid" name="uid" data-value="${item.uid}" value="${item.uid}" />
		                               <div class="img_wrap">
		                                  <img src="${contextPath}/uImgDownload.do?uid=${item.uid}&userImageFileName=${item.userImageFileName}" alt="상품 이미지"/>      
		                               </div>
		                               <div class="txt_wrap">
		                                  <div class="company_name">${item.companyName}</div>
		                                 <div class="road_address">${item.roadAddress}</div> 
		                                 <div class="goods_price">
		                                		 <fmt:formatNumber value="${goodsList1[status.index].goodsPrice}" pattern="#,### 원" />
		                                 </div>	                                 
		                                 <div class="goods_score">
		                                 <fmt:formatNumber value="${item.score}" maxFractionDigits="1" />/5점</div>
		                               </div>
		                            </div>
		                        </form>
		                     </c:forEach>
	                     </c:if>
	                </div>
             </div>
         </div>
        

            <div class="maindiv2_wrap">

            <div class="maindiv2">
            <div class="sub_div">
            <div class="maindiv2-1">
                <div class="maindiv2-2">
                    <h1 class="font-weight-light" >날잡아 <br> 이벤트!</h1> <br> 
                    <h4>선물은 물론
                    <br>
                    국내 핫플레이스에서의 <br>
                    특별한 모먼트까지 담은 여행을 <br>
                    만나보세요!</h4>
                    <br>
                    <a href="${contextPath}/page/eventList.do" class="btn-blue">이벤트 보러가기 </a>
                </div>
                <div class="maindiv2-3">
                    <br>
                   
                    <div class="maindiv2-4">
                        <!-- Product image-->
                        <img class="card-img-top"  src="https://image.hanatour.com/usr/manual/event/2022/EV1000000252/bnr/ev_bnr.jpg" >

                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h4 class="main1package">떠나자, 선물만 믿고!</h4>
                                <!-- Product price-->
                                <b class="main1package">2022.10.17 ~ 2022.12.13</b>
                            </div>
                        </div>
                        <br>
                    </div>
                </div>

                <div class="maindiv2-3">
                    <br>
                    
                    <div class="maindiv2-4">
                       <img class="card-img-top" src="https://image.hanatour.com/usr/manual/event/2022/EV1000000232/ev_bnr.jpg" />
                        <!-- Product details-->
                        <div>
                            <div>
                                <!-- Product name-->
                                <h4 class="main1package">날잡아 x SKT baro Box 무료 혜택</h4>
                                <!-- Product price-->
                                <b class="main1package">2022.08.01 ~ 2022.12.31</b>
                            </div>
                        </div>
                        <br>
                    </div>
                </div>

                <div class="maindiv2-3">
                    <br>
                    
                    <div class="maindiv2-4">
                        <img class="card-img-top"  src="https://image.hanatour.com/usr/manual/event/2022/EV1000000258/bnr/ev_bnr.jpg">
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h4 class="main1package">날잡아 믿고, 건강하게 떠나자!</h4>
                                <!-- Product price-->
                                <b class="main1package">2022.10.17 ~ 2022.11.30</b>
                            </div>
                        </div>
                        <br>
                    </div>
                </div>
               </div>
            </div>

            </div>
           <br>
           <br>
                                    
            <!--인기글 목록 시작 DB넣을곳-->
            
            <div class="main_best_articles_cover" style="text-align: center; width: 1200px; margin: auto;">        
            <h3 class="maindiv2_title">이번주 인기글</h3>
            <div class="main_best_article_bigbox">
	                <div class="product_box">
	                   <c:if test="${not empty boardList && boardList != 'null' }">
	                      	<c:forEach var="item" items="${boardList}" varStatus="status">
		                      	<form id="boardInfo${item.articleNO}" method="post">     
		                         <div class="boardInfo">
		                         	<input type="hidden" id="articleNO" name="articleNO" data-value="${item.articleNO}" value="${item.articleNO}" />
		                            <div>
		                                <div class="main_best_article_box">
		                                    
		                                    <img class="best_article_img" src="${contextPath}/bThumbDownload.do?articleNO=${item.articleNO}&mainImageFileName=${item.mainImageFileName}" alt="게시글" width="300px" height="200px">
		                                </div>
		                                <h4 class="best_article_title">[${item.articleCategory}]${item.title}</h4>
		                                <a href="#" class="btn-blue">보러가기</a>
		                            </div>
		                        </div>
		                        </form>
		                     </c:forEach>
	                     </c:if>
	                </div>
             </div>
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
    
    
    <div id="floatMenu">
    <div class="floatcover"><a class="upbutton_a" href="#header" ><img src="/img/toplogo.png"  ></a></div>
   <br>
   <!-- 여기서 <div class=floatcover>를 복사해서 넣으면 추가로 버튼이나 컨텐츠 넣을 수 있음 -->
   <div class="floatcover"><a class="upbutton_a" href="${contextPath}/member/loginForm.do"><img src="/img/loginicon.png"></a></div>
    </div>   
    

    <script>
      (function() {
        var w = window;
        if (w.ChannelIO) {
          return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
        }
        var ch = function() {
          ch.c(arguments);
        };
        ch.q = [];
        ch.c = function(args) {
          ch.q.push(args);
        };
        w.ChannelIO = ch;
        function l() {
          if (w.ChannelIOInitialized) {
            return;
          }
          w.ChannelIOInitialized = true;
          var s = document.createElement('script');
          s.type = 'text/javascript';
          s.async = true;
          s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
          s.charset = 'UTF-8';
          var x = document.getElementsByTagName('script')[0];
          x.parentNode.insertBefore(s, x);
        }
        if (document.readyState === 'complete') {
          l();
        } else if (window.attachEvent) {
          window.attachEvent('onload', l);
        } else {
          window.addEventListener('DOMContentLoaded', l, false);
          window.addEventListener('load', l, false);
        }
      })();
      ChannelIO('boot', {
        "pluginKey": "2a21f970-1983-4703-adff-d6637c0bb7c5"
      });
    </script>
    
    </body>
</html>