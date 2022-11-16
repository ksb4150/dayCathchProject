<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="filterList" value="${filterMap.filterList}"/>
<c:set var="memInfoList" value="${filterMap.memInfoList}"/>
<c:set var="goodsSubCategory" value="${filterMap.goodsSubCategory}"/>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/css/goodsFilterPage.css">
    <link rel="stylesheet" href="/css/jquery.datetimepicker.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jquery.datetimepicker.full.min.js"></script>
	<script type="text/javascript">
	    $(document).ready(function(){
	    	fn_egov_init_date()  	
	    	    	
	    	$("#goodsSubCategory").val() ;
	
	    	filter = function(frm) {
	    		var data = new FormData(frm);
	    		
	    		$.ajax({
					type : "POST",
					contentType : false,
					processData : false,
					data : data,
					tranditional: true,
					url : "${contextPath}/page/goodsFilter1.do",
					success: function(result) {
						$(".list_2").remove(); //원래 있던 내용 지워주기			
						$("#lodging_list_wrap").html(result);
					},
					error: function(request, status, error) {
	                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	                },
					complete: function() {
	                }
				});
	    	}
	    });
	    
        function fn_egov_init_date() {
            var $startDate = $('#startDate');
            var $endDate = $('#startDate');
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
                    	minDate: "0D",
                    
                    })
                },
            });
        }
	    </script>
	    
	    </script>
    <style>
    
    </style>
</head>

<body>
<div class="contents_area">
<div class="soon">
	<div id="search">
		<form method="post" action="${contextPath}/page/goodsFilterPage1.do" id="destination_form">
		    <div class="destination">
		        <p>목적지</p>
		    </div>
		    <div class="searchFormButton">
		    	<input type="text" name="goodsSubCategory" id="goodsSubCategory" value="${goodsSubCategory}" />
		        <input type="submit" id="searchSubmit" value="">
		    </div>
		 </form>
		 
	</div>
	
	
	<div class="contents">
		<div class="filter_wrap">
		<form name="filterForm" method="post" action="${contextPath}/page/goodsFilter1.do">
        	<input type="hidden" name="goodsSubCategory" id="goodsSubCategory" value="${goodsSubCategory}"/>
		    <section class="date_wrap">
		        <h3>날짜</h3>
		        <div class="day">
                <div style="display: flex; width: 100%;" >
                    <input type="text" id="startDate" placeholder="티켓 이용 날짜" autocomplete="off" name="goodsStart" style="width: 100px;"/>
                </div>
            </div>
		    </section>
		    <hr>
	
		    <h3>상세조건</h3>
		    <div class="btn_wrap1">
		        <input id="reset_button" type="reset" value="초기화" />
		        <input id="submit_button" type="button" value="적용" onclick="filter(this.form);"/>
		    </div>
		
		    <hr>
		    <section><strong>가이드 유무</strong>
	        <ul>
	            <li><input type="radio" id="guide1" name="guide" value="있음"><label for="guide1">있음</label></li>
	            <li><input type="radio" id="guide2" name="guide" value="없음"><label for="guide2">없음</label></li>	     
	        </ul>
	        </section>
		    </form>
		</div>

        <div class="list_wrap">
            <div id="poduct_list_area">
                <div id="lodging_list_wrap">
                	<c:choose>
		                <c:when test="${not empty filterList && filterList != 'null'}">
		                	<c:forEach var="filterItem" items="${filterList}" varStatus="status">
				                <li class="list_2">
				                	<a href="${contextPath}/page/goodsDetailPage.do?uid=${filterItem.uid}">
				                	  <p class="pic" style="height: 280px;">
				                            <img class="lazy align"
				                            		src="${contextPath}/uImgDownload.do?uid=${memInfoList[status.index].uid}&userImageFileName=${memInfoList[status.index].userImageFileName}"
				                                alt="${filterItem.goodsName}" style="width:100%; height:100%;">
				                        </p>
				                        <div class="stage">
				                            <div class="name">
				                                <strong>${filterItem.goodsName}</strong>
				                                <p class="score">
				                                    <span><em>${filterItem.score}</em></span>
				                                </p>
				                                <p>
				                                	${memInfoList[status.index].roadAddress} 
				                                </p>
				                            </div>
				                            <div class="price">
				                                <p><b>${filterItem.goodsPrice}</b></p>
				                                <fmt:formatNumber value="${filterItem.goodsPrice}" pattern="#,### 원"/>
				                            </div>
				                        </div>
				                    </a>
				                </li>
				           </c:forEach>
			           </c:when>
			           <c:otherwise>
			           		<p> 조건에 맞는 상품이 없습니다. </p>
			           </c:otherwise>
		           </c:choose>
               </div>
            </div>

            </div>
        </div> 
    </div> 
</div>
</body>

</html>