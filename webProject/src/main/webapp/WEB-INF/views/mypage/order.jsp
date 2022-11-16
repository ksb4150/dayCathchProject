<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
    <c:set var="memberInfo" value="${memberInfo}" />   
    <c:set var="orderList" value="${orderList}" />  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제창</title>
    
  <link type="text/css" rel="stylesheet" href="/css/order.css"/>  
    
    <script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
    
     <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>


</head>
<body>
        
            <div class="content_area">
                <form class="order_form" action="/mypage/payment" method="post">
                
                
                  
                    
                    <input type="hidden" value="" name="savePoint"/>
                    
                    <input id= "goodsPrice_1" type="hidden" value="" name="finalTotalPrice"/>
                    
                  <input type="hidden" value="" name="usePoint"/>  

					<input type="hidden" value="" name="ordersNO"/>  
					<br>
					<h2>결제 정보</h2>
                    <hr>
                    <!-- 상품 정보 -->
                    <div class="orderGoods_div">
                    
                        <!-- 상품 종류 -->
                        <div class="goods_kind_div">
                            주문상품 <span class="goods_kind_div_kind"></span>종 <span class="goods_kind_div_count"></span>개
                        </div>
                        <!-- 상품 테이블 -->
             
                        <table class="goods_table">
                           				
                            <tbody>
                            <tr class= "pay_table_top">
                            <td></td>
                            <td>상품 정보</td>
                            <td>인원</td>
                            <td>기간</td>
                            <td>판매가</td>
                            </tr>
                            
                                <c:forEach items="${orderList}" var="ol">
                                    <tr>
                                        <td><img src="${contextPath}/gThumbDownload.do?goodsImageFileName=${ol.goodsImageFileName}" width="100px" height="100px"></td>
                                        <td class="goods_name">[${ol.companyName}]${ol.goodsName}</td>
                                        <td>${ol.numOfTourist}명</td>
                                        <td>${ol.cartcheckin} <br>${ol.cartcheckout}</td>
                                        <td class="goods_table_price_td">
                                           <b><fmt:formatNumber value="${ol.totalPrice}" pattern="#,###원" /></b>
                                            <br>[<fmt:formatNumber value="${ol.totalPrice * 0.05}" pattern="#,###" />P]
                                            <input type="hidden" class="individual_goodsPrice_input" value="${ol.goodsPrice}">
                                            <input type="hidden" class="individual_savePoint_input" value="${ol.totalPrice * 0.05}">
                                            <input type="hidden" class="individual_goodsQty_input" value="${ol.goodsQty}">
                                            <input type="hidden" class="individual_goodsId_input" value="${ol.goodsId}">
                                            <input type="hidden" class="individual_totalPrice_input" value="${ol.totalPrice}">
                                            <input type="hidden" class="individual_numOfTourist_input" value="${ol.numOfTourist}">
                                            <input type="hidden" class="individual_cartcheckin_input" value="${ol.cartcheckin}">
                                            <input type="hidden" class="individual_cartcheckout_input" value="${ol.cartcheckout}">
                                        </td>
                                    </tr>							
                                </c:forEach>
    
                            </tbody>
                        </table>
                    </div>		
                    <hr>
                    
                       <!-- 주문자 정보 -->
                
                <div class="tours_Info_total">
                
                    <!-- 주문자 회원번호 -->
               	 <input name="uid" value="${memberInfo.uid}" type="hidden">
                    <!-- 사용 포인트와 최종 결제금액 -->
                 
                   
                    <!-- 상품 정보 -->
				
                        <div class="Reservation_info">
                            <div class="row_list">
                               
                  
                                <h2>예약자 정보 입력</h2>
                                <h4>예약과 관련된 중요사항을 연락처로 발송합니다.</h4>
                                <div class="row_item">
                                    <div class="row_label ">예약자 명</div>
                                    <div class="row_form">
                                        <div class="input_line tours_Info_total_input"><input id="ordererName_1" name="ordererName"  type="text" value="${memberInfo.userName}" class="">
                                        </div>
                                    </div>
                                </div>
                                <div class="row_item">
                                    <div class="row_label">휴대폰 번호</div>
                                    <div class="row_form">
                                        <div class="input_line tours_Info_total_input"><input id = "ordererPhoneNumber_1" name="ordererPhoneNumber" type="text" value="${memberInfo.userPhoneNumber}"  class="">
                                        </div>
                                    </div>
                                </div>	
                            </div>
                            
                            <div class="tourlistInfo">
                                
                                <h2>이용자 정보 입력</h2>
                             
                                <h4>이용자 이름이 같지 않으면 투숙이 거부되거나 서비스를 이용할 수 없습니다.</h4>
                                <div class="row_item">
                                    <div class="row_label">이용자 명</div>
                                    <div class="row_form">
                                        <div class="input_line tours_Info_total_input"><input name="touristName" type="text"
                                                placeholder="이용자명 입력"  class="">
                                        </div>
                                    </div>
                                </div>
                                <div class="row_item">
                                    <div class="row_label">휴대폰번호</div>
                                    <div class="row_form">
                                        <div class="input_line tours_Info_total_input"><input name="touristPhoneNumber"  type="text"
                                                placeholder="'-' 제외하고 입력" class="">
                                        </div>
                                    </div>
        
                                </div>
                                <div class="row_item">
                                <div class="row_label">생년월일</div>
                                <div class="row_form">
                                    <div class="input_line tours_Info_total_input"><input name="touristBirth"  type="text"
                                            placeholder="'-' 제외하고 입력" class="">
                                    </div>
                                </div>
                                </div>
                            <div class="gender_form">
                                <ul class="gender">
                                <li>성별</li>
                                <li><input type="radio"  id="touristGender" name="touristGender" value="M">남</li>
                                <li><input type="radio"  id="touristGender" name="touristGender" value="F">여</li>
                                </ul>
                            </div>
                            
                            </div>
                            
                            <br>
                            
                            <h2>질문사항</h2>
                            <div>
                                
                                <div class="row_item">
                                    <div class="row_label">1. 숙소 도착 날짜</div>
                                    <div class="row_form">
                                        <div class="input_line tours_Info_total_input"><input name="QA1" type="text"
                                            placeholder="도착 날짜를 입력"  value="${orderList[0].cartcheckin}" class="">
                                    </div>
                                    </div>
                                </div>
                                <div class="row_item">
                                    <div class="row_label">2. 숙소 이름</div>
                                    <div class="row_form">
                                        <div class="input_line tours_Info_total_input"><input name="QA2" type="text"
                                                placeholder="숙소 이름을 입력" class="">
                                        </div>
                                    </div>
                                </div>
                                <div class="row_item">
                                    <div class="row_label">3. 숙소 픽업 장소</div>
                                    <div class="row_form">
                                        <div class="input_line tours_Info_total_input"><input name="QA3" type="text"
                                                placeholder="숙소 픽업 이용 희망시" class="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                           
                        </div>
                    </div>

	
		<input class="order_point_input" value="0" style="width: 50px;" type="hidden">
                                        </form> <!-- 폼 끝 -->
                   
                   
                   
                       
                  <!-- 회원이냐 비회원이냐에 따라 c태그 choose문을 이용해 사용할 수 있는 포인트창을 보여주거나 안알랴줌  -->
                  
                   			
                    <!-- 주문 종합 정보 -->           
                    <div class="total_info_div">
                    <div class="total_info_div2">
                     <div class="point_div">
                        <table class="point_table">
                        
                           <!-- 포인트 정보 -->
                            <tbody>
                                <tr>
                                    <td>
                                    <c:choose>
                                    <c:when test="${memberInfo.uid != null}">
                                       보유 포인트 <b class="userhavingpoint">${memberInfo.userPoint}</b> | <input class="order_point_input" value="0" style="width: 50px;" type="text">P <br>
                                       <div class="pointbuttondiv">
                                        <button id="order_button_id" class="order_point_input_btn order_point_input_btn_N" data-state="N">모두사용</button>
                                        <button id="order_button_id" class="order_point_input_btn order_point_input_btn_Y" data-state="Y">사용취소</button>
                                        </div>
                                        </c:when>
                                        <c:otherwise> 
                                        <br>
                                        비회원 결제 정보
                                        </c:otherwise>
                                         </c:choose>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>	
                    <hr>
                        <!-- 가격 종합 정보 -->
                        <c:choose>
                                    <c:when test="${memberInfo.uid != null}">
                        
                        <div class="total_info_price_div">
                            <ul>
                                <li>
                                    <span class="price_span_label">판매가: </span>
                                   
                                    <span class="totalPrice_span"></span>원
                                    
                                </li>   
                                <li>
                                    <span class="price_span_label">할인금액: </span>
                                    <span class="usePoint_span" style="color:red">원</span>
                                  
                                </li>
                                <li class="price_total_li">
                                    <strong class="price_span_label total_price_label">최종 결제 금액: </strong>
                                    <strong class="strong_red">
                                        <span class="total_price_red finalTotalPrice_span"></span>원
                                    </strong>
                                    
                                </li>
                                <li class="point_li">
                                    <span class="price_span_label">적립예정 포인트: </span>
                                    <span class="savePoint_span" style="color:blue">원</span>
                                </li>
                            </ul>
                        </div>
                        
                        </c:when>
                           <c:otherwise> 
                           
                           <div class="total_info_price_div">
                            <ul>
                                <li>
                                    <span class="price_span_label">상품 금액: </span>
                                   
                                    <span class="totalPrice_span"></span>원
                                    
                                </li>   
                                <li>
                                    <span class="price_span_label">할인금액: </span>
                                    <span class="usePoint_span" style="color:red">원</span>
                                  
                                </li>
                                <li class="price_total_li">
                                    <strong class="price_span_label total_price_label">최종 결제 금액: </strong>
                                    <strong class="strong_red">
                                        <span class="total_price_red finalTotalPrice_span"></span>원
                                    </strong>
                                    
                                </li>
                               
                            </ul>
                        </div>
                        
                            </c:otherwise>
                            </c:choose>
                        



                        <!-- 버튼 영역 -->
                        <div class="total_info_btn_div">
                        	
                        	<button id="order_button_id" onclick="requestPay()"><b>이니시스 결제</b></button>
                             
                           
                           
                           <button id="order_kakao_button_id" onclick="requestKakaoPay()"><b>카카오페이 결제</b></button>
                           
                                  
                        </div>
                    </div>
                    <hr>
                    <div class="aside_refund">
							<h2 class="aside_refund_title">숙박 상품 취소 환불 안내</h2>

							<strong class="check_date">취소 마감일 : 예약 전날 /
								16:00</strong>

							<p>
								예약 일로부터 7일 전 / 16:00 <br>
								<b>취소 시: 취소 수수료 없이 취소 가능</b>
							</p>

							<p>
								예약 일로부터 3일 전 / 16:00 <br>
								<b class="if_you_cancel">취소 시: 해당 상품판매금액의 50% 청구
								</b>
							</p>

							<p>
								취소 마감일 / 16:00 이후 <br>
								<b class="if_you_cancel">취소 시: 해당 상품판매금액의 100% 청구
								</b>
							</p>
						</div>
                    
                   
                    </div>		
                    
                    <!-- 결제에 쓰이는 정보들 -->
            <input id="userId_1" name="userId" value="${memberInfo.userId}" type="hidden">
            <input id="goodsName_1" name="userId" value="${orderList[0].goodsName} 외" type="hidden">
                     
                </div>			
         	
         	
         	
            


    <script>
    $(document).ready(function(){
        
    	  var IMP = window.IMP; // 생략 가능
   	   IMP.init("imp81787223"); // 예: imp00000000

    	pay_method_orderNo = Math.floor(Math.random()*1000000);
    	
        /* 주문 조합정보란 최신화 */
        setTotalInfo();        
       
    });

    /* 포인트 입력 */
    //0 이상 & 최대 포인트 수 이하
    $(".order_point_input").on("propertychange change keyup paste input", function(){
        const maxPoint = parseInt('${memberInfo.userPoint}');	
        
        let inputValue = parseInt($(this).val());	
        
        if(inputValue < 0){
            $(this).val(0);
        } else if(inputValue > maxPoint){
            $(this).val(maxPoint);
        }	
        
        /* 주문 조합정보란 최신화 */
        setTotalInfo();	
        
    });
    /* 포인트 모두사용 취소 버튼 
     * Y: 모두사용 상태 / N : 모두 취소 상태
     */
     
     
    $(".order_point_input_btn").on("click", function(){
        const maxPoint = parseInt('${memberInfo.userPoint}');	
        
        let state = $(this).data("state");	
        
         if(state == 'N'){
            console.log("n동작");
            /* 모두사용 */
            //값 변경
            $(".order_point_input").val(maxPoint);
            //글 변경
            $(".order_point_input_btn_Y").css("display", "inline-block");
            $(".order_point_input_btn_N").css("display", "none");
        } else if(state == 'Y'){
            console.log("y동작");
            /* 취소 */
            //값 변경
            $(".order_point_input").val(0);
            //글 변경
            $(".order_point_input_btn_Y").css("display", "none");
            $(".order_point_input_btn_N").css("display", "inline-block");		
        }	
        
        /* 주문 조합정보란 최신화 */
        setTotalInfo();	
        
    });
    /* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
    function setTotalInfo(){
        let totalPrice = 0;				// 총 가격
        let totalCount = 0;				// 총 갯수
        let totalKind = 0;				// 총 종류
        let savePoint = 0;				// 총 마일리지
        let usePoint = 0;				// 사용 포인트(할인가격)
        let finalTotalPrice = 0; 		// 최종 가격 총 가격
       
        
        $(".goods_table_price_td").each(function(index, element){
            // 총 가격
            totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
            // 총 갯수
            totalCount += parseInt($(element).find(".individual_goodsQty_input").val());
            // 총 종류
            totalKind += 1;
            // 총 마일리지
            savePoint += parseInt($(element).find(".individual_savePoint_input").val());
        });	

        finalTotalPrice = totalPrice
        
        /* 사용 포인트 */
        usePoint = $(".order_point_input").val();
        
        finalTotalPrice = totalPrice - usePoint;	

        
        /* 값 삽입 */

        // 총 가격
        $(".totalPrice_span").text(totalPrice.toLocaleString());
        // 총 갯수
        $(".goods_kind_div_count").text(totalCount);
        // 총 종류
        $(".goods_kind_div_kind").text(totalKind);
        // 총 마일리지
        $(".savePoint_span").text(savePoint.toLocaleString());
        // 최종 가격(총 가격)
        $(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());		
        // 할인가(사용 포인트)
        $(".usePoint_span").text(usePoint.toLocaleString());	
        

        // 쌓일포인트, 최종결제할가격 의 값을 input value에 넣어줌
   		
       // $('input[name=usePoint]'.attr('value',usePoint);
        $('input[name=savePoint]').attr('value',savePoint);
        $('input[name=finalTotalPrice]').attr('value',finalTotalPrice);
        
        $('input[name=ordersNO]').attr('value',pay_method_orderNo);
        
        
    }
   
   function requestPay() {
      
	   
		 // IMP.request_pay(param, callback) 결제창 호출
	   
	   goodsName = $('#goodsName_1').val();
      	ordererName = $('#ordererName_1').val();
      	userId = $('#userId_1').val();
      	goodsPrice = $('#goodsPrice_1').val();
   	var ordererPhoneNumber = $('#ordererPhoneNumber_1').val();  
   
   
   	
       IMP.request_pay({ // param
           pg: "html5_inicis",
           pay_method: "card",
           merchant_uid: pay_method_orderNo,
           name: goodsName,
           amount: goodsPrice,
           buyer_email: userId,
           buyer_name: ordererName,
           buyer_tel: ordererPhoneNumber
       }, 
       function (rsp) { // callback
           if (rsp.success) {
           	   alert('결제 완료')
           	   
           	 //결제 성공시 
           	// 사용한 포인트는 주문요청 누를때 생성 
             	
           	$("input[name='usePoint']").val($(".order_point_input").val());	
           	

          
               /* 상품정보 */
               let form_contents = ''; 
               let index = 0;
               
               $(".goods_table_price_td").each(function(index, element){
               	
               	
                   let goodsId = $(element).find(".individual_goodsId_input").val();
                   let goodsQty = $(element).find(".individual_goodsQty_input").val();
                   
                   let cartcheckin = $(element).find(".individual_cartcheckin_input").val();
                   let cartcheckout = $(element).find(".individual_cartcheckout_input").val();
                   
                   let goodsId_input = "<input name='orders[" + index + "].goodsId' type='hidden' value='" + goodsId + "'>";
                   form_contents += goodsId_input;
                   let goodsQty_input = "<input name='orders[" + index + "].goodsQty' type='hidden' value='" + goodsQty + "'>";
                   form_contents += goodsQty_input;
                   
                   let cartcheckin_input = "<input name='orders[" + index + "].cartcheckin' type='hidden' value='" + cartcheckin + "'>";
                   form_contents += cartcheckin_input;
                   let cartcheckout_input = "<input name='orders[" + index + "].cartcheckout' type='hidden' value='" + cartcheckout + "'>";
                   form_contents += cartcheckout_input;
                   
                   index += 1;
                   
               });	
               
               $(".order_form").append(form_contents);	
               
               /* 서버 전송 */
               $(".order_form").submit();	
           	   
           	   
           	   
           	   
           } else {
           	alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
           	return;
           }
       });
     }
   
   
   
   
   function requestKakaoPay() {
    	
	   
	   var ordererName_1 =document.getElementById("ordererName_1")
       var ordererPhoneNumber_1 = document.getElementById("ordererPhoneNumber_1")
	   
       if (ordererName_1.value == "") {
       alert("예약자 명을 입력해주세요");
       ordererName_1.focus();
       return false;
       }
	   
	   if (ordererPhoneNumber_1.value == "") {
	       alert("연락처를 입력해주세요");
	       ordererPhoneNumber_1.focus();
	       return false;
	       }
	   
	   
	   
	   
   	 // IMP.request_pay(param, callback) 결제창 호출
	   
	   goodsName = $('#goodsName_1').val();
      	ordererName = $('#ordererName_1').val();
      	userId = $('#userId_1').val();
      	goodsPrice = $('#goodsPrice_1').val();
   	var ordererPhoneNumber = $('#ordererPhoneNumber_1').val();  
   	
       IMP.request_pay({ // param      
           pg: "kakaopay",
           pay_method: "kakaopay",
           merchant_uid: pay_method_orderNo,
           name: goodsName,
           amount: goodsPrice,
           buyer_email: userId,
           buyer_name: ordererName,
           buyer_tel: ordererPhoneNumber,
           
       }, function (rsp) { // callback
           if (rsp.success) {
           
        	   console.log('결제 금액: '+rsp.paid_amount);
        	   doInsert(rsp.imp_uid, rsp.paid_amount); 
        	   
        	      
        	  	// 사용한 포인트는 주문요청 누를때 생성 
        	  	
        	    	$("input[name='usePoint']").val($(".order_point_input").val());	
        	    	

        	   
        	        /* 상품정보 */
        	        let form_contents = ''; 
        	        let index = 0;
        	        
        	        $(".goods_table_price_td").each(function(index, element){
        	        	
        	        	
        	            let goodsId = $(element).find(".individual_goodsId_input").val();
        	            let goodsQty = $(element).find(".individual_goodsQty_input").val();
        	            
        	            let numOfTourist = $(element).find(".individual_numOfTourist_input").val();
        	            let cartcheckin = $(element).find(".individual_cartcheckin_input").val();
        	            let cartcheckout = $(element).find(".individual_cartcheckout_input").val();
        	            
        	            let goodsId_input = "<input name='orders[" + index + "].goodsId' type='hidden' value='" + goodsId + "'>";
        	            form_contents += goodsId_input;
        	            let goodsQty_input = "<input name='orders[" + index + "].goodsQty' type='hidden' value='" + goodsQty + "'>";
        	            form_contents += goodsQty_input;
        	            
        	            let numOfTourist_input = "<input name='orders[" + index + "].numOfTourist' type='hidden' value='" + numOfTourist + "'>";
        	            form_contents += numOfTourist_input;
        	            let cartcheckin_input = "<input name='orders[" + index + "].cartcheckin' type='hidden' value='" + cartcheckin + "'>";
        	            form_contents += cartcheckin_input;
        	            let cartcheckout_input = "<input name='orders[" + index + "].cartcheckout' type='hidden' value='" + cartcheckout + "'>";
        	            form_contents += cartcheckout_input;
        	            
        	            numOfTourist
        	            index += 1;
        	            
        	        });	
        	        
        	        $(".order_form").append(form_contents);	
        	        
        	        /* 서버 전송 */
        	        $(".order_form").submit();	
					
        	        
        	        
           } else {
           	
           	alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
           }
       
          
       });
     }
   
   function doInsert(impNum, paid_amount) {   
	   var data = new FormData();
	   	   data.append("impNum", impNum);
	   
	   $.ajax({
		   type: "POST",
		   data: data,
		   async: false,
		   cache: false,
		   contentType : false,
		   processData : false,
		   url: "${contextPath}/order/confirmPay.do",
		   success: function(result) {
			
			   var json = JSON.parse(result);
			   let verifyAmount = json.verifyAmount;
			   
			   if(paid_amount == verifyAmount) {
				   alert("결제 완료");
			   } else {
				   alert("결제 실패");
			   }
			   
		   } ,
		   error: function(request, status, error) {
	                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       }
		   
	   });
 
   }

</script>

    
    </body>
</html>