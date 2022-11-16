<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="festivalList" value="${festivalList}" />
<c:set var="userInput" value="${userInput}" />
<c:set var="pm" value="${pm}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>searchTool</title>
    <link type="text/css" rel="stylesheet" href="/css/festival.css" />
    <link rel="stylesheet" href="/css/jquery.datetimepicker.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <script type="text/javascript" src="/js/jquery.datetimepicker.full.min.js"></script>
    <script>
	    $(document).ready(function () {
	    	fn_egov_init_date();
	    });
	    	
	 // 선택 날짜를 최대 최소값으로 설정해 그 외의 날짜 선택 비활성화
        function fn_egov_init_date() {
            var $startDate = $('#startDate');
            $startDate.datetimepicker({
                timepicker: false,
                lang: 'ko',
                format: 'Y-m-d',
                scrollMonth: false,
                scrollInput: false,
                onShow: function (ct) {
                    this.setOptions({
                    	minDate: "0D"
                    })
                },
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
                        <img src="/img/festivalColor.png" />
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
	        <div id="festival_search">
	        	<form method="post" action="${contextPath}/page/festivalPage.do">
	                <div class="destination">
	                    <p>지역</p>
	                    <select name="areaCode" id="areaCode">
	                    	<option value="" ${userInput['areaCode'] == 'all' ? 'selected="selected"' : ''}>전체</option>
	                    	<option value="1" ${userInput['areaCode'] == '1' ? 'selected="selected"' : ''}>서울</option>
	                    	<option value="2" ${userInput['areaCode'] == '2' ? 'selected="selected"' : ''}>인천</option>
	                    	<option value="3" ${userInput['areaCode'] == '3' ? 'selected="selected"' : ''}>대전</option>
	                    	<option value="4" ${userInput['areaCode'] == '4' ? 'selected="selected"' : ''}>대구</option>
	                    	<option value="5" ${userInput['areaCode'] == '5' ? 'selected="selected"' : ''}>광주</option>
	                    	<option value="6" ${userInput['areaCode'] == '6' ? 'selected="selected"' : ''}>부산</option>
	                    	<option value="7" ${userInput['areaCode'] == '7' ? 'selected="selected"' : ''}>울산</option>
	                    	<option value="8" ${userInput['areaCode'] == '8' ? 'selected="selected"' : ''}>세종</option>
	                    	<option value="31" ${userInput['areaCode'] == '31' ? 'selected="selected"' : ''}>경기도</option>
	                    	<option value="32" ${userInput['areaCode'] == '32' ? 'selected="selected"' : ''}>강원</option>
	                    </select>
	                </div>
	                <div class="startDate">
	                	<p>날짜</p>
	                	<input type="text" id="startDate" name="startDate" placeholder="시작 날짜" autocomplete="off"
	                		value="${userInput['startDate']}"/>
	                </div>
	                <div class="searchFormButton">
	                    <input type="submit" id="searchSubmit" value="검색">
	                </div>
	             </form>
	        </div>
	    </div>
	    <div id="festival_wrap">
	    	<c:choose>
	    		<c:when test="${not empty festivalList && festivalList != 'null' }">
		    		<c:forEach var="item" items="${festivalList}" varStatus="status">
					    <div class="festival">
					    	<div class="festival_img_wrap">
					    		<img src="${item.img1}" onerror="this.src='/img/ing_img.jpg'">
					    	</div>
					    	<div class="festival_info_wrap">
						    	<div class="festival_title">
						    		${item.title}
					    		</div>
					    		<div class="festival_date">
					    			${item.eventStartDate} - ${item.eventEndDate}
					    		</div>
					    		<div class="festival_addr">
					    			${item.addr}
					    		</div>
					    		<div class="festival_tel">
					    			${item.tel}
					    		</div>
					    	</div>
					    </div>	
				    </c:forEach>
			    </c:when>
			    <c:when test="${result == 'false'}">
		    		<div style="text-align: center"> 검색 결과가 없습니다. </div>
		    	</c:when>
	    	</c:choose>
	    </div>
	    
	    <div class="pageInfo_wrap" >
	    	<div class="pageInfo_area">
				<ul id="pageInfo" class="pageInfo">
					<!-- 이전페이지 버튼 -->
					<c:if test="${pm.prev}">
						<li class="pageInfo_btn previous"><a href="${pm.startPage-1}">Previous</a></li>
					</c:if>
					
					<!-- 각 번호 페이지 버튼 -->
					<c:forEach var="num" begin="${pm.startPage}" end="${pm.endPage}">
						<li class="pageInfo_btn ${pm.cri.pageNum == num ? "active":"" }"><a href="${num}">${num}</a></li>
					</c:forEach>
					
					<!-- 다음페이지 버튼 -->
					<c:if test="${pm.next}">
						<li class="pageInfo_btn next"><a href="${pm.endPage + 1 }">Next</a></li>
					</c:if>	
					
				</ul>
			</div>
		</div>
		<form id="moveForm" method="get">
			<input type="hidden" name="pageNum" value="${pm.cri.pageNum }">
			<input type="hidden" name="amount" value="${pm.cri.amount }">
		</form>
	    
		
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
<script>

let moveForm = $("#moveForm");
	$(".pageInfo a").on("click", function(e){
	e.preventDefault();
	
	var startDate = $("#startDate").val();
	var areaCode = $("#areaCode").val();
	
	if(startDate.length > 0) {
		var startDateInput = document.createElement("input");
			startDateInput.setAttribute("type","hidden");
		    startDateInput.setAttribute("name","startDate");
		    startDateInput.setAttribute("value", startDate);
	}
	
	if(areaCode.length > 0) {
		var areaCodeInput = document.createElement("input");
	    	areaCodeInput.setAttribute("type","hidden");
	    	areaCodeInput.setAttribute("name","areaCode");
	    	areaCodeInput.setAttribute("value",areaCode);
	}
    	
	moveForm.append(startDateInput);
	moveForm.append(areaCodeInput);
	
	moveForm.find("input[name='pageNum']").val($(this).attr("href"));
	moveForm.attr("action", "/page/festivalPage.do");
	moveForm.submit();
	
});	

</script>
</body>
</html>