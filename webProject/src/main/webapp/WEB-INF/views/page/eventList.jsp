<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
 <link rel="stylesheet" href="/css/eventList.css"/>
<title>event page</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
function nonMember() {
	alert("회원만 가능합니다!");
	return false;
}
</script>
</head>

<body>
<div class="contents_area">
<div class="backgroundImg">
</div>
<div class="contents">    
    <div class="searchBox">
        <div class="iconBar">
            <ul>
                <li>
                    <a href="${contextPath}/page/goodsPage.do">
                        <p class="iconHotel">
                            <img src="/img/hotel.png" />
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
                            <img src="/img/eventColor.png" />
                        </p>
                        <p class="iconFont">이벤트</p>
                    </a>

                </li>
           </ul>
        </div>
        <div id="search">
        	<form method="post" action="${contextPath}/page/goodsFilterPage.do">            
             </form>
        </div>
    </div>
    
    <div id="festival_wrap">
	    <div class="event_tit">
			<h2>이벤트</h2>
			<ul class="event_tit_ul">
				<li id="EM00000245" class="on"><a href="${contextPath }/page/eventList.do" >진행중인 이벤트</a></li>
				<li>|</li>
				<li id="EM00000246" class=""><a href="${contextPath}/page/eventWin.do">당첨자 발표</a></li>
			</ul>
		</div>
	
	<div class="festival">
	  	<div class="festival_img_wrap">
			<img src="https://image.hanatour.com/usr/manual/event/2022/EV1000000258/bnr/ev_bnr.jpg" title="img" data-src="" alt="img">
	  	</div>
	  	<div class="festival_info_wrap">
	    	<div class="festival_title">
	    		[날잡아X정관장] 건강하게 떠나자, 하나만 믿고!
	    	</div>
	  		<div class="festival_date">
	  			2022.10.17 ~ 2022.11.13 <em>D-6일 남음</em>
	  		</div>
  		</div>
  	</div>	
  	
  	
    <div class="festival">
	  	<div class="festival_img_wrap">
		  	<img src="https://image.hanatour.com/usr/manual/event/2022/EV1000000253/ev_bnr.jpg"
			title="img" data-src="" alt="img">
	  	</div>
	  	<div class="festival_info_wrap">
	    	<div class="festival_title">
		    	날잡아 면세점 혜택!
	  		</div>
	  		<div class="festival_date">
	  			2022.10.17 ~ 2022.12.31 <em>D-54일 남음</em>
	  		</div>
	  	</div>
  	</div>
  	
    <div class="festival">
	  	<div class="festival_img_wrap">
			<img src="https://image.hanatour.com/usr/manual/event/2022/EV1000000252/bnr/ev_bnr.jpg"
			title="img" data-src="" alt="img">
	  	</div>
	  	<div class="festival_info_wrap">
	    	<div class="festival_title">
		    	떠나자, 선물만 믿고!
	  		</div>
	  		<div class="festival_date">
	  			2022.10.17 ~ 2022.11.13 <em>D-6일 남음</em>
	  		</div>
	  	</div>
  	</div>	
  	
    <div class="festival">
	  	<div class="festival_img_wrap">
	  		<img src="https://image.hanatour.com/usr/manual/event/2022/EV1000000232/ev_bnr.jpg" title="img" data-src="" alt="img">
	  	</div>
	  	<div class="festival_info_wrap">
	    	<div class="festival_title">
		    	날잡아 x SKT baro Box 무료 혜택드림!
	  		</div>
	  		<div class="festival_date">
	  			2022.08.01 ~ 2022.12.31 <em>D-54일 남음</em>
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
  </div>

    
    

</body>
</html>