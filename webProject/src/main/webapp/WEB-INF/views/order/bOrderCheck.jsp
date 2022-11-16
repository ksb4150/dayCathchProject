<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="ordersInfo" value="${orderCheckInfo.orderInfo}"/>
<c:set var="touristInfo" value="${orderCheckInfo.touristInfo}"/>
<%
  request.setCharacterEncoding("UTF-8");
%>  
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>예약 확인창</title>
  <link rel="stylesheet" href="/css/side.css"/>
  <link rel="stylesheet" href="/css/bOrderCheck.css"/>
  <link rel="stylesheet" href="/css/main.css"/>
  <script src="/js/main.js"></script>
  
  
</head>

<body>
<div class="contents_area">
	<div class="soon">
		<section class="bmypagesidebar0" >
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
			            <a class="mypage_sidebar_a" href="${contextPath}/order/bOrderCheck.do"><h3>예약 현황</h3></a> 
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
			
		<h2> 예약 현황 </h2>
		
		<div id='calendar'></div>
		
		<br>
		    <table class="bSalestable" align="center">
		        <tr bgcolor="#cdd5ec">
		            <td>
		                <div class="reserve_num">
		                    예약 번호
		                </div>
		            </td>
		            <td>
		                <div class="reserver_name">
		                    예약자 명
		                </div>
		            </td>              
		            <td>
		                <div class="reserve_date">
		                    예약 일
		                </div>
		            </td>
		            <td>
		                <div class="check_in">
		                    체크인
		                </div>
		            </td>
		            <td>
		                <div class="check_out">
		                    체크아웃
		                </div>
		            </td>
		            <td>
		                <div class="goods_name">
		                    객실
		                </div>
		            </td>
		            <td>
		                <div class="reserve_status">
		                    상태
		                </div>
		            </td>
		            <td>
			            <div class="tourist_name">
	                    	예약자 명
	                    </div>
		            </td>
		            <td>
			            <div class="tourist_phone_num">
	                    	예약자 핸드폰
	                    </div>
		            </td>
		            <td>
			            <div class="tourist_info">
		                	예약자 생년월일 / 성별
		                </div>
		            </td>
		        </tr>
		
				<c:choose>
					<c:when test="${orderCheckInfo ==null }" >
						<tr>
							<td colspan="7">
								<b><span style="font-size:9pt;">예약 내역이 없습니다.</span></b>
							</td>  
						</tr>
					</c:when>
					<c:when test="${ordersInfo !=null }" >
						<c:forEach  var="order" items="${ordersInfo}" varStatus="status" >
							
							<tr>
						    	<td>
						    		<div class="reserve_num">
						    			${order.ordersNO}
						    		</div>
						    	</td>
								<td>
									<div class="reserver_name">
										${order.ordercartVO.ordererName}
									</div>
								</td>
								<td>
									<div class="reserve_date">
										${order.ordercartVO.creDate}
									</div>
								</td>
								<td>
									<div class="check_in">
										${order.cartcheckin}
									</div>
								</td>
								<td>
									<div class="check_out">
										${order.cartcheckout}
									</div>
								</td>
								<td>
									<div class="goods_name">
										${order.goodsName}
									</div>
								</td>
								<td>
									<div class="reserve_status">
									${order.ordercartVO.orderState}
									</div>
								</td>
								<td>
					            <div class="tourist_name">
					            	${touristInfo[status.index].touristName}
			                    </div>
					            </td>
					            <td>
						            <div class="tourist_phone_num">
						            	${touristInfo[status.index].touristPhoneNumber}
				                    </div>
					            </td>
					            <td>
						            <div class="tourist_info">
						            	${touristInfo[status.index].touristBirth} / ${touristInfo[status.index].touristGender}
					                </div>
					            </td>
							</tr>
						</c:forEach>
					</c:when>
				 </c:choose>
		        <tr>
		            <td colspan="7">
		                
		            </td>
		        </tr>
		    </table>
		    <br>
		    <br>
		      

		    
		    
		</div>
	</div>
</div>



<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      initialView: 'dayGridMonth',
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      locale: "ko",
      select: function(arg) {
        var title = prompt('Event Title:');
        if (title) {
          calendar.addEvent({
            title: title,
            start: arg.start,
            end: arg.end,
            allDay: arg.allDay
          })
        }
        calendar.unselect()
      },
      eventClick: function(arg) {
        if (confirm('예약 표시를 삭제하시겠습니까?')) {
          arg.event.remove()
        }
      },
      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events
     
      events: [
    	  <c:forEach var = "order" items="${ordersInfo}" varStatus="status">
    	  {
    	  title: '${order.ordercartVO.ordererName}',
    	  start: '${order.cartcheckin}',
    	  end: '${order.cartcheckout}'
    	  },

    	  </c:forEach>
    	  ]
          
    });

    calendar.render();
  });

</script>



</body>
</html>
