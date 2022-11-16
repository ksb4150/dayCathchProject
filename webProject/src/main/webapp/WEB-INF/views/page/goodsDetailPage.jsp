<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="mem" value="${goodsMap.mem}"/>
<c:set var="goods" value="${goodsMap.goodsList}"/>
<c:set var="goodsDetail" value="${goodsMap.goodsDetailList}"/>
<c:set var="goodsreview" value="${goodsMap.reviewList}"/>
<c:set var="imgMap" value="${goodsMap.imgMap}"/>
<c:set var="likedList" value="${likedList}"/>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>카테고리별 장소 검색하기</title>
    <link type="text/css" rel="stylesheet" href="/css/productDetailPage.css"/>
    <link rel="stylesheet" href="/css/jquery.datetimepicker.min.css">
    <link type="text/css" rel="stylesheet" href="/css/popup.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jquery.datetimepicker.full.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <style>

    </style>
    <script type="text/javascript">
    	
	    $(document).ready(function () {
	        fn_egov_init_date()
	        scoretitle()	   
	    });

	 	function scoretitle() {
	 		var reviewScore = document.querySelectorAll('.review_score');
   		    var scoretxt = document.querySelectorAll('.review_score_title');
   		    var scoreSum = document.querySelector('.score_sum');
   		    var scoreSumTit = document.querySelector('.score_sum_tit');
   		     		 
   		    var scoreSum_1 = document.querySelector('.rate');
   		    var scoreSumTit_1 = document.querySelector('.txt');
   		for(var i=0; i<reviewScore.length; i++) {
		      var choice = reviewScore[i].textContent;
	
		 
		      switch (choice) {
		      	case "0점":	      		
		        	scoretxt[i].textContent = '너무 싫어요';	
		          break;
		        case "1점":
		        	scoretxt[i].textContent = '싫어요';
		          break;
		         
		        case "2점":
		        	scoretxt[i].textContent = '별로에요';
		          break;
		        case "3점":
		        	scoretxt[i].textContent = '보통이에요';
		          break;
		        case "4점":
		        	scoretxt[i].textContent = '좋아요';
		          break;
		        case "5점":
		        	scoretxt[i].textContent = '아주 좋아요';
		          break;
		        default:
		        	scoretxt[i].textContent = '';
		      }
		      
   			}  
   		
   		
   				
   				var choice1 = 	${goodsreview[0].sscore}
   				result = parseFloat(choice1).toFixed(1);   				   				   				
   							
   				if(result >= 0 && result <= 0.9) {
   					scoreSumTit.textContent = '너무 싫어요';
   					scoreSum.textContent = result;
   					
   					scoreSumTit_1.textContent = '너무 싫어요';
   					scoreSum_1.textContent = result;
   					
   					
   				}else if(result >= 1 && result <= 1.4) {	
   					scoreSumTit.textContent = '싫어요'; 
   					scoreSum.textContent = result;
   					
   					scoreSumTit_1.textContent = '싫어요'; 
   					scoreSum_1.textContent = result;
   					
   				}else if(result >= 1.5 && result <= 2.4) {
   					scoreSumTit.textContent = '별로에요';
   					scoreSum.textContent = result;
   					
   					scoreSumTit_1.textContent = '별로에요';
   					scoreSum_1.textContent = result;
   					
   				}else if(result >= 2.5 && result <= 3.4) {  	
   					scoreSumTit.textContent = '보통이에요';
   					scoreSum.textContent = result;
   					
   					scoreSumTit_1.textContent = '보통이에요';
   					scoreSum_1.textContent = result;
   					
   				}else if(result >= 3.5 && result <= 4.4) {
   					scoreSumTit.textContent = '좋아요';
   					scoreSum.textContent = result;
   					
   					scoreSumTit_1.textContent = '좋아요';
   					scoreSum_1.textContent = result;
   					
   				}else if(result >= 4.5 && result <= 5) {
   					scoreSumTit.textContent = '아주 좋아요';
   					scoreSum.textContent = result;	
   					
   					scoreSumTit_1.textContent = '아주 좋아요';
   					scoreSum_1.textContent = result;
   				}
	   }
	    		
	
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
	                	minDate: 0,
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
	    
	    function cart(frmobj1, n) {
	    	var num = $('#numOfTourist').val(); //투숙객 인원
	    	var startDate = $('#startDate').val();
	    	var endDate	= $('#endDate').val();
	    	
	    	if(num > n) {
	    		alert("객실에서 머물 수 있는 인원이 초과되었습니다.");
	    		return false;
	    	}
	    	
	    	if(startDate == '' && startDate.length < 1) {
	    		alert('예역 날짜를 확인해주세요.');
	    		return false;
	    	} else if (endDate == '' && endDate.length < 1) {
	    		alert('예역 날짜를 확인해주세요.');
	    		return false;
	    	}
	    	
	    	var startInput = document.createElement("input");
	    		startInput.setAttribute("type","hidden");
	    		startInput.setAttribute("name","cartcheckin");
	    		startInput.setAttribute("value", startDate);
	    	var endInput = document.createElement("input");
	    		endInput.setAttribute("type","hidden");
	    		endInput.setAttribute("name","cartcheckout");
	    		endInput.setAttribute("value", endDate);	
	    	var peopleNum = document.createElement("input");
	    		peopleNum.setAttribute("type","hidden");
	    		peopleNum.setAttribute("name","numOfTourist");
	    		peopleNum.setAttribute("value", num);
	    		
	    	var uid = document.create
	    		
	    		frmobj1.appendChild(startInput);
	    		frmobj1.appendChild(endInput);
	    		frmobj1.appendChild(peopleNum);
	    		frmobj1.action = "${contextPath}/mypage/addCart.do";
	    		frmobj1.submit();
	    }
	    
	    function reserve(frmobj2, n) {
	    	var num = $('#numOfTourist').val(); 
	    	var startDate = $('#startDate').val();
	    	var endDate	= $('#endDate').val();
	    	
	    	if(num > n) {
	    		alert("객실에서 머물 수 있는 인원이 초과되었습니다.");
	    		return false;
	    	}
	    	
	    	if(startDate == '' && startDate.length < 1) {
	    		alert('예역 날짜를 확인해주세요.');
	    		return false;
	    	} else if (endDate == '' && endDate.length < 1) {
	    		alert('예역 날짜를 확인해주세요.');
	    		return false;
	    	}
	    	
	    	var startInput = document.createElement("input");
	    		startInput.setAttribute("type","hidden");
	    		startInput.setAttribute("name","cartcheckin");
	    		startInput.setAttribute("value", startDate);
	    	var endInput = document.createElement("input");
	    		endInput.setAttribute("type","hidden");
	    		endInput.setAttribute("name","cartcheckout");
	    		endInput.setAttribute("value", endDate);
	    	var peopleNum = document.createElement("input");
	    		peopleNum.setAttribute("type","hidden");
	    		peopleNum.setAttribute("name","numOfTourist");
	    		peopleNum.setAttribute("value", num);
	    		
	    		frmobj2.appendChild(startInput);
	    		frmobj2.appendChild(endInput);
	    		frmobj2.appendChild(peopleNum);
	    		frmobj2.action = "${contextPath}/page/paymentPage.do";

	    		frmobj2.submit();
	    }
	    
	</script>
</head>
<body>
<div class="contents_area">
	<div class="productName">
	    <div class="text_area">
	        <div>선택하신 숙소의 옵션을 선택하세요.</div>
	    </div>
        <ul class="step">
        <li>
            <p class="num">1</p>
            <p class="text">숙소선택</p>
        </li>
        <li>
            <p class="active">2</p>
            <p class="text">객실선택</p>
        </li>
        <li>
            <p class="num">3</p>
            <p class="text">예약하기</p>
        </li>
    </ul>
	</div>
	<div class="contents">
	    <div class="productDetail">
	        <div class="main_thumbnail">
	            <a style="background:url()"><img src="${contextPath}/uImgDownload.do?uid=${mem.uid}&userImageFileName=${mem.userImageFileName}" alt="상품 이미지"></a>
	        </div>
	    </div>
	    <div class="hotel_title">
	        <div class="hotel_name_wrap">
	            <h2><strong>${mem.companyName}</strong></h2>
	            <p>${mem.roadAddress}</p>
	        </div>
	        <div class="review_sub">
	           <div class="review_rate"><strong class="rate">${goodsreview[0].sscore}</strong><string>/ 5점</string></div>
	            <span class="txt">많이 좋아요</span>
	            <span class="cnt">(후기 1개)</span>
	        </div>
	    </div>
	</div>
	<div class="indexBar">
	    <div class="indexButton">
	    	<a href="#rooms_info">객실요금/선택</a>
	    </div>
	    <div class="indexButton">
	        <a href="#hotelNearInfo">주변 정보</a>
	    </div>
	    <div class="indexButton">
	        <a href="#hotelInfo">숙소 정보</a>
	    </div>
	    <div class="indexButton">
	        <a href="#review">후기</a>
	    </div>
	</div>
	<div class="contents_item">
	    <h2>객실 선택</h2>
	    <div class="default_option">
	        <div class="peopleNum ">
	        	<span> 객실 </span>
	            <select id="numOfTourist" name="numOfTourist">
	            	<option value="1">1명</option>
	            	<option value="2" selected>2명</option>
	            	<option value="3">3명</option>
	            	<option value="4">4명</option>
	            	<option value="5">5명</option>
	            	<option value="6">6명</option>
	            	<option value="7">7명</option>
	            	<option value="8">8명</option>
	            	<option value="9">9명</option>
	            	<option value="10">10명</option>
	            </select>
	        </div>
	        <div class="day">
	        	<div>
	        		<input type="date" id="startDate" autocomplete="off" name="cartcheckin" placeholder="체크인"/>
	        	</div>
	            <div>
	                <input type="date" id="endDate" autocomplete="off" name="cartcheckout" placeholder="체크아웃">
	            </div>
	        </div>
	    </div>
	</div>
	<div id="rooms_info">
		<c:if test="${not empty goods && goods != 'null'}">	
			<c:forEach var="item" items="${goods}" varStatus="status">
	            <form name="lodgingInfoFrm" method="post" submit="return false;">
	            <input type="hidden" name="goodsMainCategory" id="goodsMainCategory" value="${item.goodsMainCategory}">
	            	<input type="hidden" name="companyName" id="hotel_name" value="${mem.companyName}"/>
	            	<input type="hidden" id="goodsId" name="goodsId" value="${item.goodsId}"/>
		            <input type="hidden" id="road_address" name="roadAddress" value="${mem.roadAddress}"/>
	            	<input type="hidden" name="goodsQty" value="1"/>
	            	<input type="hidden" name="buid" value="${item.uid}">
	                <div class="rooms">
	                    <div class="room_img_wrap">
	                    	<input type="hidden" name="goodsImageFileName" value="${item.goodsImageFileName}">
	                        <img src="${contextPath}/gThumbDownload.do?goodsImageFileName=${item.goodsImageFileName}" alt="상품 이미지"/>
	                    </div>
	                    <div class="room_info_wrap">
	                    	<input type="hidden" name="goodsName" value="${item.goodsName}">
	                        <div class="room_name">${item.goodsName} / ${goodsDetail[status.index].numOfTourist}인
	                        		   <div class="liked${item.goodsId}">
        					<input type="hidden" value="${item.goodsId}"/>
        					<a class="text-dark heart" style="text-decoration-line: none;"> 
        					<img src="/img/heart.svg" id="heart${item.goodsId}"> 찜 </a>
        				</div>	</div>
	                     
	                        <div class="room_detail_button">
	                            <button type="button" id="modal_opne_btn${item.goodsId}">숙소상세정보</button>
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
	                    <c:choose>
	                   	<c:when test="${item.goodsCount != 0}">
	                    <div class=" room_wrap">
	                        <div class="cart_button_wrap">
	                            <input type="button" class="product_btn product_cart" onclick="cart(this.form, ${goodsDetail[status.index].numOfTourist})" value="장바구니"></button>
	                        </div>
	                    </div>
	                    <div class="room_wrap">
	                        <div class="reserve_button_wrap">
	                            <input type="button" class="product_btn product_reservation" onclick="reserve(this.form, ${goodsDetail[status.index].numOfTourist})" value="예약하기"></button>
	                        </div>
	                    </div>
	                    </c:when>
	                    <c:otherwise>
	                    <div class=" room_wrap">
	                        <div class="cart_button_wrap">
	                            <input type="button" class="product_btn product_cart" value="매진" style="background-color: rgb(219, 103, 112);"></button>
	                        </div>
	                    </div> 
	                    </c:otherwise>
	                    </c:choose>
	                </div>
	            </form>
	            <div id="modal${item.goodsId}" style="display: none;">
	            
	            <div class="modal_content">

	                <div class="img_wrap">
	                	<div id="slider${item.goodsId}">
			           	     <c:if test="${not empty imgMap}">
			           	 		<c:forEach var="img" items="${imgMap[item.goodsId]}" varStatus="sts">  
			           	 			<div><img src="${contextPath}/gImgDownload.do?goodsId=${item.goodsId}&orginFileName=${img.orginFileName}" width="100%" height="500px"></div>	           	 		
			           	 		</c:forEach>
			           	     </c:if>    
		           	     </div>  	     
		           	</div>
		           	<div class="modal_detail_div">
		            <div class="modal_detail_goodsName">${item.goodsName} / ${goodsDetail[status.index].numOfTourist}인</div>	
		           	<div class="modal_detail_div_1">
		           	<h3>객실 정보</h3>
		            <div class="modal_detail_div_2">	
		            <c:if test="${goodsDetail[status.index].singleBed != null}">
		            <span class="modal_detail_span">침대 타입: <span>싱글(singleBed)</span></span><br>
		            </c:if>
		            <c:if test="${goodsDetail[status.index].doubleBed != null}">
		         	<span class="modal_detail_span">침대 타입: <span>더블(doubleBed)</span></span><br>
		         	</c:if>  
		            <c:if test="${goodsDetail[status.index].twinBed != null}">
		            <span class="modal_detail_span">침대 타입: <span>트윈(twinBed)</span></span><br>
		            </c:if>   
		            <c:if test="${goodsDetail[status.index].ondol != null}">
		            <span class="modal_detail_span">침대 타입: <span>온돌(ondol)</span></span><br>
		            </c:if>  
		            <span class="modal_detail_span">침대 정보: <span>${goodsDetail[status.index].bedAmount}개</span></span><br>
		            <span class="modal_detail_span">최대 인원: <span>${goodsDetail[status.index].numOfTourist}인</span></span><br>	
		            <c:if test="${goodsDetail[status.index].wifi != null}">
		            <span class="modal_detail_span">인터넷: <span>wifi</span></span><br>
		            </c:if>  
		            <c:if test="${goodsDetail[status.index].breakfast != null}">
		            <span class="modal_detail_span">조식 정보: <span>조식 포함</span></span>
		            </c:if>  
		            
		            </div>
		            <h3>객실 서비스</h3>
		            <div class="modal_detail_div_3">		        
		            <c:if test="${goodsDetail[status.index].TV != null}">
		            <span><img src="/img/TV.png">TV</span>
		            </c:if>  
		            <c:if test="${goodsDetail[status.index].refrigerator != null}">
		            <span><img src="/img/refrigerator.png">냉장고</span>
		            </c:if>  
		            <c:if test="${goodsDetail[status.index].restaurant != null}">
		            <span><img src="/img/restaurant.png">레스토랑</span>
		            </c:if>  
		            <c:if test="${goodsDetail[status.index].airConditioner != null}">
		            <span><img src="/img/airConditioner.png">에어컨</span>
		            </c:if>  
		            <c:if test="${goodsDetail[status.index].swimmingPool != null}">
		            <span><img src="/img/swimmingPool.png">수영장</span>
		            </c:if>  
		            <c:if test="${goodsDetail[status.index].spar != null}">
		            <span><img src="/img/spar.png">객실스파</span>
		            </c:if>  
		            <c:if test="${goodsDetail[status.index].hairAppliance != null}">
		            <span><img src="/img/hairAppliance.png">헤어드라이기</span>
		            </c:if>  
		            <c:if test="${goodsDetail[status.index].petsAllowed != null}">
		            <span><img src="/img/petsAllowed.png">애완견 동반</span>
		            </c:if>  
		            <c:if test="${goodsDetail[status.index].store != null}">
		            <span><img src="/img/store.png">편의점</span>
		            </c:if>  
		            <c:if test="${goodsDetail[status.index].disabledAccessibility != null}">
		            <span><img src="/img/disabledAccessibility.png">장애인 편의시설</span>
		            </c:if>  
		            <c:if test="${goodsDetail[status.index].parking != null}">
		            <span><img src="/img/parking.png">주차장</span>
		            </c:if>  
		            <c:if test="${goodsDetail[status.index].hotSpring != null}">
		            <span><img src="/img/hotSpring.png">온천</span>
		            </c:if>  
		            </div>
		            </div>
		            </div>
		            
		           	<div class="modal_close_div">
		            <button class="modal_close_btn" type="button" id="modal_close_btn${item.goodsId}"><img src="/img/modal_icon.png"></button>
		            </div>
		          
	            </div>
	            <div class="modal_layer"></div>
	        </div>
	        <script>
		    
        
	        	document.getElementById("modal_opne_btn${item.goodsId}").onclick = function() {
	       	    	document.getElementById("modal${item.goodsId}").style.display="block";
	       	    	
	    	        $('#slider${item.goodsId}').bxSlider({
	                    auto: false,
	    			    speed: 300,
	    			    pause: 4000,
	    			    mode:'fade',
	    			    autoControls: false,
	    			    pager:false
	                });
	    		   
	            }
	           
	            document.getElementById("modal_close_btn${item.goodsId}").onclick = function() {
	                document.getElementById("modal${item.goodsId}").style.display="none";
	            }   
	            
	         
	            $('.liked${item.goodsId}').on('click', function() {
	            	var that = $('.liked${item.goodsId}');
	            	console.log(that)
	       	    	
	            	var sendData = {'goodsId' : '${item.goodsId}', 'liked' : that.attr('name')};
	            
	            	$.ajax({
	            		url: '/goods/liked',
	            		type :'POST',
	                    data : sendData,
	                    success : function(data){
	                        that.attr('name',data);
	                        if(data==1) {
	                            $('#heart${item.goodsId}').attr('src','/img/heart-fill.svg');
	                        }
	                        else if(data==0){
	                            $('#heart${item.goodsId}').attr('src','/img/heart.svg');
	                        } else {
	                        	alert("실패")
	                        }


	                    }
	                });
	            });
	            
	            $('.liked${item.goodsId}').attr('name', 0); //기본으로 name 0을 주기
		            
		            if(${likedList}) {
						var likeList = ${likedList};
						console.log("if" + likeList.length);
						
						if(likeList.length > 0) {
							for(var i=0; i<likeList.length; i++) {
								 $("#heart"+likeList[i]).attr("src", "/img/heart-fill.svg");
					        	 $(".liked"+likeList[i]).attr('name', 1)
							}
						}
			    	} else {
			    		console.log("test")
			    	}
	         </script>
	        </c:forEach>
	    </c:if>

	    
	</div>
	<div>
		<h2 id="hotelNearInfo"> 주변 정보 </h2>
	</div>
	<div class="map_wrap">
	    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
	    <ul id="category">
	        <li id="CT1" data-order="0"> 
	            <span class="category_bg bank"></span>
	            문화시설
	        </li>       
	        <li id="MT1" data-order="1"> 
	            <span class="category_bg mart"></span>
	            마트
	        </li>  
	        <li id="AT4" data-order="2"> 
	            <span class="category_bg pharmacy"></span>
	            관광명소
	        </li>  
	        <li id="OL7" data-order="3"> 
	            <span class="category_bg oil"></span>
	            주유소
	        </li>  
	        <li id="CE7" data-order="4"> 
	            <span class="category_bg cafe"></span>
	            카페
	        </li>  
	        <li id="CS2" data-order="5"> 
	            <span class="category_bg store"></span>
	            편의점
	        </li>      
	    </ul>
	</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9fdcadf32f7a781b43f14d2f91977aea&libraries=services"></script>
	<script type="text/javascript" src="/js/hotelNearInfo.js"></script>
	<div>
		<h2> 숙소 정보 </h2>
	</div>
	<div id="hotelInfo">
	    <div class="hotelDetailInfo">
	        <ul class="detail-info-list">
	            <li>
	                <span class="title">주소</span><br>
	                <span class="txt">우편번호: ${mem.zipcode}</span><br>
	                <span class="txt">지번: ${mem.jibunAddress}</span><br>
	                <span class="txt">도로명: ${mem.roadAddress}</span><br>
	            </li>
	            <li>
	                <span class="title">회사 전화</span><br>
	                <span class="txt">${mem.companyNum}</span>
	            </li>
	            <li>
	                <span class="title">회사 소개</span><br>
	                <span class="txt">${mem.companyInfo}</span></li>
	            <li>
	                <span class="title">객실</span><br>
	                <c:if test="${not empty goods && goods != 'null' }">
	    				<c:forEach var="item" items="${goods}" varStatus="status">
	    				<span class="txt">${item.goodsName}:</span>
	    					<span class="txt">${item.goodsInfo}</span><br><br>
	    				</c:forEach>
	    	        </c:if> 
	            <li>
	                <span class="title">편의시설</span><br>                
	                <span class="txt">${mem.facilities}</span>
	            </li>
	            <li>
	            	<span class="title">유의 사항</span><br>
	            	<span class="txt">${mem.companyNotice}</span>
	            </li>
	        </ul>
	    </div>
	</div>
	<div>
	<h2> 후기 </h2>
</div>
<div id="review">
<div class="goods_review">
    <div class="reviewHotelScore">
        <div class="scoreWrap">
      
            <div class="score start_40"></div>
            <div><span class="score_sum"></span><span class="score_sum1">/ 5점</span></div>
    		<div class="score_sum_tit"></div>
           
       
        </div>
    </div>
    <c:choose>
		<c:when test="${isLogOn == true && member != null }">
			<form id="form3" name="form3" class="reviewInputWrap">
				<input type="hidden" name="buid" value="${mem.uid}"/>
				<div class="userInfo">
				<div class="goodsId_wrap">
				<div class="goodsId_wrap1">
					<div>리뷰 점수</div>
					<div class="star_score">
					<input type="radio" id="5_stars" class="star1" name="score" value="5" />
					<label for="5_stars" class="star">★</label>
					<input type="radio" id="4_stars" class="star1" name="score" value="4" />
					<label for="4_stars" class="star">★</label>
					<input type="radio" id="3_stars" class="star1"name="score" value="3" />
					<label for="3_stars" class="star">★</label>
					<input type="radio" id="2_stars" class="star1" name="score" value="2" />
					<label for="2_stars" class="star">★</label>
					<input type="radio" id="1_star" class="star1" name="score" value="1" />
					<label for="1_star" class="star">★</label>
				  </div>
		    
				<div class="select_goods">구매 한 상품명</div>
            <select  class="select_goodsName" name="goodsId">
    	    	<c:if test="${not empty goods && goods != 'null' }">
    	    		<c:forEach var="item" items="${goods}" varStatus="status">
    	    			<option class="select_goodsName" name="goodsId" value="${item.goodsId}"> ${item.goodsName} / ${goodsDetail[status.index].numOfTourist}인</option>
    	    		</c:forEach>
    	    	</c:if>
    		</select>
    		</div>
			
	        <div class="reviewInput">
				<div>리뷰내용</div>
				<textarea type="text" name="content" id="reviewtxt1"></textarea>
	        
          
	        <div class="reviewButtonWrap">
				<input type="reset" class="reviewButton" value="다시 입력" >
	          	<input type="button" class="reviewButton" value="리뷰 작성" id="addBtn">
			
	        </div>
		</div>
		</div>
			
		
	    </form>
    </c:when>
    <c:otherwise>
    	  <div class="nonuserInfo">상품 리뷰는 로그인 후 이용가능합니다.</div>
    </c:otherwise>
</c:choose>
</div>
</div>
<div class="reviews">
    <ul>
        <li>
        	<c:if test="${not empty goodsreview && goodsreview != 'null' }">
        		<c:forEach var="review" items="${goodsreview}" varStatus="status">
        			<div class="review_list">
        			<div class="review_title"><span class="review_score">${review.score}점</span><span class="review_score_title"></span><span class="review_name">${review.userName}</span><span class="review_date"> ${review.regDate}</span></div>
        			<div class="review_goods_name">상품명: ${review.goodsName}</div>
        			<div>후기: ${review.content}</div>
        			</div>
        			<br>
        		       
        			
        		</c:forEach>
        	</c:if>
        </li>
    </ul>
</div>
</div>
</div>
    	


<script>

$(document).ready(function(){

 $("#addBtn").click(function(){
	 
	 		var starscore = $("#5_star").val();
            var reviewtxt1 = $("#reviewtxt1").val();
            var productPhoto = $("#productPhoto").val();

            if(starscore == 5){
                alert("리뷰 점수를 입력해주세요");
                starscore.foucs();
				
            }else if(reviewtxt1 == ""){
                alert("리뷰 내용을 입력해주세요");
                reviewtxt1.foucs();
            }

        //상품 정보 전송
        document.form3.action = "${contextPath}/goods/addReview.do";
        document.form3.submit();
});
});
</script>

</body>
</html>