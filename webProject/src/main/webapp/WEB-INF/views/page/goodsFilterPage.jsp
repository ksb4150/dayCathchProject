<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	    	
	    	var numOfTourist =$("#numOfTourist").val();
	    	$(".numOfTourist_up").on("click",function(){
	    		setTimeout(function(){
	    		if (numOfTourist == 10)
	    		{
	    			numOfTourist;
	    		}
	    		else{numOfTourist ++;}
	    		$("#numOfTourist").val(numOfTourist);
	    		},10);
	    	});
	    	$(".numOfTourist_down").on("click",function(){
	    		setTimeout(function(){
	    		if (numOfTourist == 1)
	    		{
	    			numOfTourist;
	    		}
	    		else if(numOfTourist <= 10)
	    		{
	    			numOfTourist--;
	    		}
	    		$("#numOfTourist").val(numOfTourist);
	    		},10);
	    	});
	    	
	     	var bedAmount =$("#bedAmount").val();
	    	$(".bedAmount_up").on("click",function(){
	    		setTimeout(function(){
	    		if (bedAmount == 10)
	    		{
	    			bedAmount;
	    		}
	    		else{bedAmount ++;}
	    		$("#bedAmount").val(bedAmount);
	    		},10);
	    	});
	    	
	    	$(".bedAmount_down").on("click",function(){
	    		setTimeout(function(){
	    		if (bedAmount == 1)
	    		{
	    			bedAmount;
	    		}
	    		else if(bedAmount <= 10)
	    		{
	    			bedAmount--;
	    		}
	    		$("#bedAmount").val(bedAmount);
	    		},10);
	    	});
	    	
	    	$("#goodsSubCategory").val() ;
	
	    	filter = function(frm) {
	    		var data = new FormData(frm);
	    		
	    		$.ajax({
					type : "POST",
					contentType : false,
					processData : false,
					data : data,
					tranditional: true,
					url : "${contextPath}/page/goodsFilter.do",
					success: function(result) {
						$(".list_2").remove(); //?????? ?????? ?????? ????????????			
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
	    
	 // ?????? ????????? ?????? ??????????????? ????????? ??? ?????? ?????? ?????? ????????????
        function fn_egov_init_date() {
            var $startDate = $('#startDate');
            var $endDate = $('#endDate');
            $startDate.datetimepicker({
                timepicker: false,
                lang: 'ko',
                format: 'Y-m-d',
                startDate: '-d',
    		    todayHighlight : true ,	//?????? ????????? ??????????????? ?????? ????????? :false 
                scrollMonth: false,
                scrollInput: false,
                onShow: function (ct) {
                    this.setOptions({
                    	minDate: "0D",
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
	    </script>
    <style>
    
    </style>
</head>

<body>
<div class="contents_area">
<div class="soon">
	<div id="search">
		<form method="post" action="${contextPath}/page/goodsFilterPage.do" id="destination_form">
		    <div class="destination">
		        <p>?????????</p>
		    </div>
		    <div class="searchFormButton">
		    	<input type="text" name="goodsSubCategory" id="goodsSubCategory" value="${goodsSubCategory}" />
		        <input type="submit" id="searchSubmit" value="">
		    </div>
		 </form>
	</div>
	
	
	<div class="contents">
		<div class="filter_wrap">
		<form name="filterForm" method="post" action="${contextPath}/page/goodsFilter.do">
        	<input type="hidden" name="goodsSubCategory" id="goodsSubCategory" value="${goodsSubCategory}"/>
		    <section class="date_wrap">
		        <h3>??????</h3>
		        <div class="day">
                <div style="display: flex; width: 100%;" >
                    <input type="text" id="startDate" placeholder="?????????" autocomplete="off" name="goodsStart" style="width: 100px;"/>
                    <input type="text" id="endDate" placeholder="????????????" autocomplete="off" name="goodsEnd" style="width: 100px;"/>
                </div>
            </div>
		    </section>
		    <hr>
	
		    <h3>????????????</h3>
		    <div class="btn_wrap1">
		        <input id="reset_button" type="reset" value="?????????" />
		        <input id="submit_button" type="button" value="??????" onclick="filter(this.form);"/>
		    </div>
		    <section><strong>????????????????? ??????</strong>
		        <ul>
		            <li><input type="radio" id="lodgingType1" name="lodgingType" value="1"><label for="lodgingType1">??????</label></li>
		            <li><input type="radio" id="lodgingType2" name="lodgingType" value="2"><label for="lodgingType2">??????</label></li>
		            <li><input type="radio" id="lodgingType3" name="lodgingType" value="3"><label for="lodgingType3">??????????????????</label></li>
		        </ul>
		    </section>
	    
		    <section id="numOfTourist_section"> 
			    <h4>??????</h4>
			    <div class="flex_wrap1">
				    <input type="button" class="numOfTourist_down"/>
				    <input type="text" value="1" id="numOfTourist" name="numOfTourist"/>
				    <input type="button" class="numOfTourist_up" />
				</div>
		    </section>
	    
	
		    <section id="bedAmount_section"> 
			    <h4>?????? ??????</h4>
			    <div class="flex_wrap2">
				    <input type="button" class="bedAmount_down"/>
				    <input type="text" value="1" id="bedAmount" name="bedAmount"/>
				    <input type="button" class="bedAmount_up" />
				</div>
		    </section>
	
	
		    <!-- ?????? ????????? -->
		    <section class="check_in_out"><strong>Check In Time</strong><input type="time" id="checkIn" name="checkIn"
		            value="">
		    </section>
		
		    <section class="check_in_out"><strong>Check Out Time</strong><input type="time" id="checkOut" name="checkOut"
		            value="">
		    </section>
	
		    <hr>
		    <section><strong>?????? ??????</strong>
		        <div class="room_type">
		            <p><input type="checkbox" name="singleBed" id="singleBed" class="inp_chk" value="singleBed"><label for="singleBed">??????</label></p>
		            <p><input type="checkbox" name="doubleBed" id="doubleBed" class="inp_chk" value="doubleBed"><label for="doubleBed">??????</label></p>
		            <p><input type="checkbox" name="twinBed" id="twinBed" class="inp_chk" value="twinBed"><label for="twinBed">??????</label></p>
		            <p><input type="checkbox" name="ondol" id="ondol" class="inp_chk" value="ondol"><label for="ondol">??????</label></p>
		        </div>
		        <hr>
		    </section>
		    <section><strong>????????????</strong>
		        <ul class="hide_type half">
		            <li><input type="checkbox" id="swimmingPool" class="inp_chk" name="swimmingPool"  value="swimmingPool"><label for="swimmingPool">?????????</label></li>
		            <li><input type="checkbox" id="restaurant" class="inp_chk" name="restaurant"  value="restaurant"><label for="restaurant">????????????</label></li>
		            <li><input type="checkbox" id="parking" class="inp_chk" name="parking"  value="parking"><label for="parking">?????????</label></li>
		            <li><input type="checkbox" id="hotSpring" class="inp_chk" name="hotSpring"  value="hotSpring"><label for="hotSpring">??????</label></li>
		
		        </ul>
		    </section>
		    <hr>
		    <section><strong>?????? ??? ??????</strong>
		        <ul class="hide_type half">
		            <li><input type="checkbox" id="spar" class="inp_chk" name="spar"  value="spar"><label for="spar">????????????</label></li>
		            <li><input type="checkbox" id="wifi" class="inp_chk" name="wifi"  value="wifi"><label for="wifi">????????????</label></li>
		            <li><input type="checkbox" id="TV" class="inp_chk" name="TV"  value="TV"><label for="TV">TV</label></li>
		            <li><input type="checkbox" id="airConditioner" class="inp_chk" name="airConditioner" value="airConditioner"><label for="airConditioner">?????????</label></li>
		            <li><input type="checkbox" id="refrigerator" class="inp_chk" name="refrigerator" value="refrigerator"><label for="refrigerator">?????????</label></li>
		            <li><input type="checkbox" id="hairAppliance" class="inp_chk" name="hairAppliance" value="hairAppliance"><label for="hairAppliance">????????????</label></li>
		        </ul>
		    </section>
		    <hr>
		    <section><strong>??????</strong>
		        <ul class="hide_type half">
		            <li><input type="checkbox" id="petsAllowed" class="inp_chk" name="petsAllowed"  value="petsAllowed"><label for="petsAllowed">???????????????</label></li>
		            <li><input type="checkbox" id="breakfast" class="inp_chk" name="breakfast" value="breakfast"><label for="breakfast">????????????</label></li>
		            <li><input type="checkbox" id="store" class="inp_chk" name="store"  value="store"><label for="store">?????????</label></li>
		            <li><input type="checkbox" id="disabledAccessibility" class="inp_chk" name="disabledAccessibility" value="disabledAccessibility"><label for="disabledAccessibility">?????????????????????</label></li>
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
				                                    <span><em><fmt:formatNumber value="${filterItem.score}" maxFractionDigits="1" /></em></span>
				                                </p>
				                                <p>
				                                	${memInfoList[status.index].roadAddress} 
				                                </p>
				                            </div>
				                            <div class="price">
				                                <p><b>${filterItem.goodsPrice}</b></p>
				                                <fmt:formatNumber value="${filterItem.goodsPrice}" pattern="#,### ???"/>
				                            </div>
				                        </div>
				                    </a>
				                </li>
				           </c:forEach>
			           </c:when>
			           <c:otherwise>
			           		<p> ????????? ?????? ????????? ????????????. </p>
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