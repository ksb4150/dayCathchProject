<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="airportList" value="${airportList}"/>
<c:set var="userInput" value="${userInput}" />
<c:set var="pm" value="${pm}"/>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>카테고리별 장소 검색하기</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jquery.datetimepicker.full.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <link rel="stylesheet" href="/css/jquery.datetimepicker.min.css">
    <link type="text/css" rel="stylesheet" href="/css/airport.css" />
    <style>
    
    </style>
    <script>
    $(document).ready(function () {
        fn_egov_init_date()
    });
    
    function fn_egov_init_date() {
        var $startDate = $('#depPlandTime');
     
        $startDate.datetimepicker({
            timepicker: false,
            lang: 'ko',
            format: 'Y-m-d',
            startDate: '-d',
		    todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
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
                    <img src="/img/airplaneColor.png" />
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
        	<form method="post" action="${contextPath}/page/airport.do">
                <div class="destination" >
                    <p>출발공항</p>
                    <select id="depAirportId" title="depAirportId" name="depAirportId" >
                   <option value="NAARKPC" ${userInput['depAirportId'] == 'NAARKPC' ? 'selected="selected"' : ''}>제주</option>
                   <option value="NAARKSS" ${userInput['depAirportId'] == 'NAARKSS' ? 'selected="selected"' : ''}>서울/김포</option>
                   <option value="NAARKPK" ${userInput['depAirportId'] == 'NAARKPK' ? 'selected="selected"' : ''}>부산/김해</option>
                   <option value="NAARKNW" ${userInput['depAirportId'] == 'NAARKNW' ? 'selected="selected"' : ''}>횡성/원주</option>
                   <option value="NAARKSI" ${userInput['depAirportId'] == 'NAARKSI' ? 'selected="selected"' : ''}>인천</option>
                   <option value="NAARKJK" ${userInput['depAirportId'] == 'NAARKJK' ? 'selected="selected"' : ''}>군산</option>
                   <option value="NAARKJY" ${userInput['depAirportId'] == 'NAARKJY' ? 'selected="selected"' : ''}>여수</option>
                   <option value="NAARKJJ" ${userInput['depAirportId'] == 'NAARKJJ' ? 'selected="selected"' : ''}>광주</option>
                   <option value="NAARKJB" ${userInput['depAirportId'] == 'NAARKJB' ? 'selected="selected"' : ''}>무안</option>
                   <option value="NAARKNY" ${userInput['depAirportId'] == 'NAARKNY' ? 'selected="selected"' : ''}>양양</option>
                   <option value="NAARKPS" ${userInput['depAirportId'] == 'NAARKPS' ? 'selected="selected"' : ''}>사천</option>
                   <option value="NAARKPU" ${userInput['depAirportId'] == 'NAARKPU' ? 'selected="selected"' : ''}>울산</option>
                   <option value="NAARKTH" ${userInput['depAirportId'] == 'NAARKTH' ? 'selected="selected"' : ''}>포항</option>
                   <option value="NAARKTN" ${userInput['depAirportId'] == 'NAARKTN' ? 'selected="selected"' : ''}>대구</option>
                   <option value="NAARKPU" ${userInput['depAirportId'] == 'NAARKPU' ? 'selected="selected"' : ''}>울산</option>
                   <option value="NAARKTU" ${userInput['depAirportId'] == 'NAARKTU' ? 'selected="selected"' : ''}>청주</option>
                   </select>
                </div>
                <div class="destination">
                    <p>도착공항</p>
                    <select id="arrAirportId" title="arrAirportId" name="arrAirportId" >
                    <option value="NAARKSS" ${userInput['arrAirportId'] == 'NAARKSS' ? 'selected="selected"' : ''}>서울/김포</option>
                   <option value="NAARKPC" ${userInput['arrAirportId'] == 'NAARKPC' ? 'selected="selected"' : ''}>제주</option>
                   <option value="NAARKPK" ${userInput['arrAirportId'] == 'NAARKPK' ? 'selected="selected"' : ''}>부산/김해</option>
                   <option value="NAARKNW" ${userInput['arrAirportId'] == 'NAARKNW' ? 'selected="selected"' : ''}>횡성/원주</option>
                   <option value="NAARKSI" ${userInput['arrAirportId'] == 'NAARKSI' ? 'selected="selected"' : ''}>인천</option>
                   <option value="NAARKJK" ${userInput['arrAirportId'] == 'NAARKJK' ? 'selected="selected"' : ''}>군산</option>
                   <option value="NAARKJY" ${userInput['arrAirportId'] == 'NAARKJY' ? 'selected="selected"' : ''}>여수</option>
                   <option value="NAARKJJ" ${userInput['arrAirportId'] == 'NAARKJJ' ? 'selected="selected"' : ''}>광주</option>
                   <option value="NAARKJB" ${userInput['arrAirportId'] == 'NAARKJB' ? 'selected="selected"' : ''}>무안</option>
                   <option value="NAARKNY" ${userInput['arrAirportId'] == 'NAARKNY' ? 'selected="selected"' : ''}>양양</option>
                   <option value="NAARKPS" ${userInput['arrAirportId'] == 'NAARKPS' ? 'selected="selected"' : ''}>사천</option>
                   <option value="NAARKPU" ${userInput['arrAirportId'] == 'NAARKPU' ? 'selected="selected"' : ''}>울산</option>
                   <option value="NAARKTH" ${userInput['arrAirportId'] == 'NAARKTH' ? 'selected="selected"' : ''}>포항</option>
                   <option value="NAARKTN" ${userInput['arrAirportId'] == 'NAARKTN' ? 'selected="selected"' : ''}>대구</option>
                   <option value="NAARKPU" ${userInput['arrAirportId'] == 'NAARKPU' ? 'selected="selected"' : ''}>울산</option>
                   <option value="NAARKTU" ${userInput['arrAirportId'] == 'NAARKTU' ? 'selected="selected"' : ''}>청주</option>
                   </select>
                </div>
                <div class="destination" >
                    <p>항공사</p>
                    <select id="airlineId" title="airlineId" name="airlineId" >   
                    <option value="" ${userInput['airlineId'] == 'all' ? 'selected="selected"' : ''}>전체</option>
                   <option value="AAR" ${userInput['airlineId'] == 'AAR' ? 'selected="selected"' : ''}>아시아나항공</option>
                   <option value="ABL" ${userInput['airlineId'] == 'ABL' ? 'selected="selected"' : ''}>에어부산</option>
                   <option value="ASV" ${userInput['airlineId'] == 'ASV' ? 'selected="selected"' : ''}>에어서울</option>
                   <option value="ESR" ${userInput['airlineId'] == 'ESR' ? 'selected="selected"' : ''}>이스타항공</option>
                   <option value="FGW" ${userInput['airlineId'] == 'FGW' ? 'selected="selected"' : ''}>플라이강원</option>
                   <option value="HGG" ${userInput['airlineId'] == 'HGG' ? 'selected="selected"' : ''}>하이에어</option>
                   <option value="JJA" ${userInput['airlineId'] == 'JJA' ? 'selected="selected"' : ''}>제주항공</option>
                   <option value="JNA" ${userInput['airlineId'] == 'JNA' ? 'selected="selected"' : ''}>진에어</option>
                   <option value="KAL" ${userInput['airlineId'] == 'KAL' ? 'selected="selected"' : ''}>대한항공</option>
                   <option value="TWB" ${userInput['airlineId'] == 'TWB' ? 'selected="selected"' : ''}>티웨이항공</option>               
                   </select>
                </div>
                <div class="destination" >
                    <p>출발 날짜</p>
                    <input type="text" id="depPlandTime" title="depPlandTime" name="depPlandTime" autocomplete='off' value="${userInput['depPlandTime1']}">
                </div>
                <div class="searchFormButton">
                    <input type="submit" id="searchSubmit" value="검색">
                </div>
             </form>
        </div>
    </div>

    <div class="airport_contents_area">
    <div class="airport_contens">  	
        <table class="airport_table" width ="1200" align = "center">  
	        <caption>항공 운항정보</caption>
	        <tr align ="center" border="1px" bgcolor="whitesmoke">
		        <th>항공사</th>
		        <th>출발공항</th>
		        <th>출발시간</th>
		        <th>도착공항</th>
		        <th>도착시간</th>
		        <th>항공편명</th>
		        <th>비지니스석운임</th>
		        <th>일반석운임</th>
	        </tr>
        
	        <c:choose>
	        	<c:when test="${not empty airportList && airportList != 'null'}">
			        <c:forEach var="airportList" items="${airportList}" varStatus="status">
				    	<div>
					    	<items>
						    	<item>
							        <tr align = "center" >
								        <td class="airport_Name" >
									        <c:if test="${airportList.airlineNm.equals('아시아나항공')}">
									        	<airlineNm><img src="/img/asianaAirport.png">아시아나항공</airlineNm>
									        </c:if>
									        <c:if test="${airportList.airlineNm.equals('에어부산')}">
									        	<airlineNm><img src="/img/airbusan.png">에어부산</airlineNm>
									        </c:if>
									        <c:if test="${airportList.airlineNm.equals('에어서울')}">
									        	<airlineNm><img src="/img/airseoul.png">에어서울</airlineNm>
									        </c:if>
									        <c:if test="${airportList.airlineNm.equals('이스타항공')}">
									        	<airlineNm><img src="/img/petsAllowed.png">이스타항공</airlineNm>
									        </c:if>
									        <c:if test="${airportList.airlineNm.equals('플라이강원')}">
									        	<airlineNm><img src="/img/petsAllowed.png">플라이강원</airlineNm>
									        </c:if>
									        <c:if test="${airportList.airlineNm.equals('하이에어')}">
									        	<airlineNm><img src="/img/highair.png">하이에어</airlineNm>
									        </c:if>
									        <c:if test="${airportList.airlineNm.equals('제주항공')}">
									        	<airlineNm><img src="/img/jejuAirport.png">제주항공</airlineNm>
									        </c:if>
									        <c:if test="${airportList.airlineNm.equals('진에어')}">
									        	<airlineNm><img src="/img/jinair.png">진에어</airlineNm>
									        </c:if>
									        <c:if test="${airportList.airlineNm.equals('대한항공')}">
									        	<airlineNm><img src="/img/koreanair.png">대한항공</airlineNm>
									        </c:if>
									        <c:if test="${airportList.airlineNm.equals('티웨이항공')}">
									        	<airlineNm><img src="/img/twayAirport.png">티웨이항공</airlineNm>
									        </c:if> 
								        </td>
								        <td>
								    		<depAirportNm>${airportList.depAirportNm}</depAirportNm>
								    	 </td>
								        <td>
								        	<depPlandTime>${airportList.depPlandTime}</depPlandTime>
								        </td>
								        <td>
								     		<arrAirportNm>${airportList.arrAirportNm}</arrAirportNm>
								     	</td>
								     	<td>
								     		<arrPlandTime>${airportList.arrPlandTime}</arrPlandTime>
							     		</td>
								    	<td>
								     		<vihicleId>${airportList.vihicleId}</vihicleId>
								     	</td>
								    	<td>
								    		<prestigeCharge>${airportList.prestigeCharge}</prestigeCharge>
								    	</td>
								    	<td>
									   	  	<c:if test="${airportList.economyCharge == 0}">
									   	  		<economyCharge>항공사 참고</economyCharge>
									   	  	</c:if>
									   		<c:if test="${airportList.economyCharge != 0}">
									   	    	<economyCharge>${airportList.economyCharge}</economyCharge>
										   	    </c:if>
									   	    </td>
								        </tr>
						    	</item>
					    	</items>
				    	</div>
			    	</c:forEach>
			    </c:when>
			    <c:when test="${result == 'false'}">
			    	<div>
			    		<tr align = "center">
			    			<td colspan="8">검색 결과가 없습니다.</td>
			    		</tr>
			    	</div>
			    </c:when>
	        </c:choose>
    	</table>
    </div>
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
	
	var depAirportId = $("#depAirportId").val();
	var arrAirportId = $("#arrAirportId").val();
	var depPlandTime = $("#depPlandTime").val();
	var airlineId = $("#airlineId").val();
	
	if(depAirportId.length > 0) {
		var depAirportIdInput = document.createElement("input");
			depAirportIdInput.setAttribute("type","hidden");
			depAirportIdInput.setAttribute("name","depAirportId");
			depAirportIdInput.setAttribute("value", depAirportId);
	}
	
	if(arrAirportId.length > 0) {
		var arrAirportIdInput = document.createElement("input");
			arrAirportIdInput.setAttribute("type","hidden");
			arrAirportIdInput.setAttribute("name","arrAirportId");
			arrAirportIdInput.setAttribute("value",arrAirportId);
	}
    	
	
	if(depPlandTime.length > 0) {
		var depPlandTimeInput = document.createElement("input");
			depPlandTimeInput.setAttribute("type","hidden");
			depPlandTimeInput.setAttribute("name","depPlandTime");
			depPlandTimeInput.setAttribute("value",depPlandTime);
	}
	
	if(airlineId.length > 0) {
		var airlineIdInput = document.createElement("input");
			airlineIdInput.setAttribute("type","hidden");
			airlineIdInput.setAttribute("name","airlineId");
			airlineIdInput.setAttribute("value",airlineId);
	}
	
	moveForm.append(depAirportIdInput);
	moveForm.append(arrAirportIdInput);
	moveForm.append(depPlandTimeInput);
	moveForm.append(airlineIdInput);
	
	moveForm.find("input[name='pageNum']").val($(this).attr("href"));
	moveForm.attr("action", "/page/airport.do");
	moveForm.submit();
	
});	

</script>
</body>
</html>