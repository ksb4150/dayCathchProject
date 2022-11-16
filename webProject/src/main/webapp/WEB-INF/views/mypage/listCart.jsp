<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"	
    isELIgnored="false"
%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cartList" value="${cartList}" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장바구니 페이지</title>
    <link rel="stylesheet" href="/css/side.css"/>
    <link rel="stylesheet" href="/css/listCart.css"/>
    <script src="https://code.jquery.com/jquery-3.4.1.js"integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="crossorigin="anonymous"></script>

</head>
<body>
	<div class="contents_area">
		<div class="soon">
		<section class="mypagesidebar0">
		<div>
			<ul class="mypagesidebar_ul">
				<li class="sidebardiv1"><a class="mypage_sidebar_a"
					href="${contextPath}/mypage/mypage.do"><h3>마이페이지</h3></a></li>
				<li><details>
						<summary>
							<h3>개인정보수정</h3>
						</summary>
						<hr>
						<a class="mypage_sidebar_b" href="${contextPath}/member/memberModify.do"><h4>내 정보 수정</h4></a>
						<hr>
						<a class="mypage_sidebar_b" href="${contextPath}/member/modifyPw.do"><h4>비밀번호 수정</h4></a>
				</details></li>
				<hr>
				<li><a class="mypage_sidebar_a"
					href="${contextPath}/mypage/listCart.do"><h3>장바구니</h3></a></li>
				<hr>
				<li>
		        <details>
		            <summary><h3>커뮤니티</h3></summary>
		            <hr>
		            <a class="mypage_sidebar_b" href="${contextPath}/board/myArticleList1.do"><h4>작성한 게시글</h4></a>
		            <hr>
		            <a class="mypage_sidebar_b" href="${contextPath}/board/mycommentList.do"><h4>작성한 댓글</h4></a>
		            
		        </details>
		    </li>
		             <hr>
		             
		    <li>
		         <details>
		            <summary><h3>상품내역</h3></summary>
		              <hr>
		             <a class="mypage_sidebar_b" href="${contextPath}/mypage/wishList.do"><h4>관심내역</h4></a>
		             <hr>
		             <a class="mypage_sidebar_b" href="${contextPath}/mypage/ordersNocheck"><h4>예약확인</h4></a>        
		         </details>
		    </li>
		    		<hr>
		    <li>
		        <a class="mypage_sidebar_a" href="${contextPath}/mypage/pointCoupon.do"><h3>포인트/쿠폰</h3></a>
		    </li>
		            <hr>
		    <li>
		        <details>
		            <summary><h3>고객센터</h3></summary>
		            <hr>
		            <a class="mypage_sidebar_b" href="${contextPath}/mypage/notice.do"><h4>공지사항</h4></a>
		            <hr>
		            <a class="mypage_sidebar_b" href="${contextPath}/mypage/qna.do"><h4>1대1문의</h4></a>
		            <hr>
		            <a class="mypage_sidebar_b" href="${contextPath}/mypage/faqList.do"><h4>자주하는 질문</h4></a>
		            <hr>
		            <a class="mypage_sidebar_b" href="${contextPath}/page/eventList.do"><h4>이벤트</h4></a>
		        </details>
		    </li>
		        <hr>
		    <li>
		       <details>
		            <summary><h3>이용안내</h3></summary>
		            <hr>
		            <a class="mypage_sidebar_b" href="${contextPath}/mypage/guidelineReservation.do"><h4>예약 안내</h4></a>
		            <hr>
		            <a class="mypage_sidebar_b" href="${contextPath}/mypage/guidelinePay.do"><h4>결제 방법 안내</h4></a>
		            <hr>
		            <a class="mypage_sidebar_b" href="${contextPath}/mypage/guidelinePointcoupon.do"><h4>포인트/쿠폰 안내</h4></a>
		            <hr>
		            <a class="mypage_sidebar_b" href="${contextPath}/mypage/guidelineAirplain.do"><h4>항공권 이용 안내</h4></a>
		        </details>
		    </li>
		</ul>
		</div>
		</section>
			<div class="contents">
			    <section class="cartsec1">
					<div class="content_subject"><h2>장바구니</h2></div>
					<hr>
					<!-- 장바구니 리스트 -->
					<div class="content_middle_section"></div>
					<!-- 장바구니 가격 합계 -->
					<!-- cartInfo -->
					<div class="content_totalCount_section">
							
						<!-- 체크박스 전체 여부 -->
						<div class="all_check_input_div">
							<input type="checkbox" class="all_check_input input_size_20"><span class="all_chcek_span">전체선택</span>
						</div>
							<table class="carttable">
							    
							    <tr class="cart_top_tr">
							    <td>구분</td>
							    <!--이미지-->
							    <td></td>
							    <td>상품명</td>
							    <td>판매가</td>
							    <td>수량</td>
							    <td>인원</td>
							    <td>기간</td>
							    <td>합계</td>
							    <td></td>
							    
							    </tr>
							    <c:choose>
									<c:when test="${empty cartList}">
										<tr height="10">
											<td colspan="7">
												<p align="center">
													<b><span style="font-size:9pt;">장바구니에 상품이 없습니다.</span></b>
												</p>
											</td>
										</tr>
									</c:when>
							
							
								    <c:when test="${!empty cartList}">
								        <c:forEach var="cart" items="${cartList}">
								        <c:set var="sum" value="0" />
								            <tr>
								                <td class="td_width_1 cart_info_td">
								                    <input type="checkbox" class="individual_cart_checkbox input_size_20">
								                    <input type="hidden" class="individual_cartId_input" value="${cart.cartId}">
								                    <input type="hidden" class="individual_uid_input" value="${cart.uid}">
								                    <input type="hidden" class="individual_goodsId_input" id="goodsIdcheck" value="${cart.goodsId}">
								                    <input type="hidden" class="individual_goodsName_input" value="${cart.goodsName}">
								                    <input type="hidden" class="individual_goodsPrice_input" value="${cart.goodsPrice}">
													<input type="hidden" class="individual_goodsQty_input" value="${cart.goodsQty}">
													<input type="hidden" class="individual_cartcheckin_input" value="${cart.cartcheckin}">
													
													 <c:choose>
									                	<c:when test="${cart.cartcheckout != null}">
									                		<input type="hidden" class="individual_cartcheckout_input" value="${cart.cartcheckout}">
									                	</c:when>
									                	<c:otherwise>
									                		<input type="hidden" class="individual_cartcheckout_input" value="${cart.cartcheckin}">
									                	</c:otherwise>
									                </c:choose>
													
													<input type="hidden" class=" individual_numOfTourist_input" value="${cart.numOfTourist}">
													<input type="hidden" class="individual_goodsImageFileName_input" value="${cart.goodsImageFileName}">
								                    <input type="hidden" class="individual_totalPrice_input" value="${cart.goodsPrice * cart.goodsQty}">
								                     
								                   
								                </td>
								                <td><a href="${contextPath}/page/goodsDetailPage.do?uid=${cart.buid}"><img src="${contextPath}/gThumbDownload.do?goodsImageFileName=${cart.goodsImageFileName}" width="100px" height="100px"></a></td> 
								                <td><p class="goods_name">[${cart.companyName}]${cart.goodsName}</p></td>
								                <td class="td_width_4 price_td"><fmt:formatNumber value="${cart.goodsPrice}" pattern="#,### 원" /></td>
								                <td class="td_width_4 table_text_align_center">
								
								                    <div class="table_text_align_center quantity_div">
								                    	<button class="plus_btn">+</button>
								                        <input type="text" value="${cart.goodsQty}" class="quantity_input" style="width: 15px;">	 
								                        <button class="minus_btn">-</button>
								                        </div>
								                        <button class="quantity_modify_btn" data-cartid="${cart.cartId}">변경</button>
								                </td>
								                <td>
								                ${cart.numOfTourist}명
								                </td>
								                <td>${cart.cartcheckin}<br>${cart.cartcheckout}</td>
								                <td class="td_width_4 table_text_align_center">
								                    <fmt:formatNumber value="${cart.goodsPrice * cart.goodsQty}" pattern="#,### 원" />
								                </td>
								                <td class="td_width_4 table_text_align_center">
								                    <button class="delete_btn" data-cartid="${cart.cartId}">삭제</button>
								                </td>
								                   
								                </tr>
								                </c:forEach>
								    </c:when>
							 </c:choose>
						 </table>
					</div>
					<div class="content_total_section">
					    <div class="total_wrap">
					        <table>
					            <tr>
					                <td>
					                    <table>
					                        <tr>
					                        
					                            <td>총 상품 금액 :</td>
					                            
					                            <td>
					
					                                <span class="totalPrice_span"></span> 원
					                            </td>
					                        </tr>									
					                        <tr>
					                            <td>주문할 상품</td>
					                            <td><span class="totalKind_span"></span>종류  <span class="totalCount_span"></span>개</td>
					                        </tr>
					                    </table>
					                </td>
					            </tr>
					        </table>
					        <hr>
							<table>
								<tr>
									<td>
										<table>
											<tbody>
												<tr>
													<td>
														<strong>총 주문 금액 :</strong>
													</td>
													<td>
														<span class="finalTotalPrice_span"></span> 원
														
													</td>
												</tr>
											</tbody>
										</table>
									</td>
		                        </tr>
							</table>
						</div>
					</div>
						
					<!-- 구매 버튼 영역 수정해야함 -->
					<div class="content_btn_section">
					<br>
					    <button id="orderpage_button1" class="order_btn">주문하기</button>
					    <button id="orderpage_button1"><a href="${contextPath}/page/goodsPage.do" style="color: white; text-decoration: none;">상품 더보기</a></button>
					
					</div>
						
					<!-- 수량 조정 form -->
					<form action="/mypage/updateQty" method="post" class="quantity_update_form">
					    <input type="hidden" name="cartId" class="update_cartId">
					    <input type="hidden" name="goodsQty" class="update_goodsQty">
					
					</form>	
						
					<!-- 삭제 form -->
					<form action="/mypage/deleteCart" method="post" class="quantity_delete_form">
					    <input type="hidden" name="cartId" class="delete_cartId">
					
					</form>	
					
					<!-- 주문 form -->
					<!-- /mypage/order  -->
					<form action="${contextPath}/mypage/order" method="post" class="order_form">
						<input type="hidden" name="uid" class="order_uid">
					
					
					</form>			
					
					<input type="hidden" name="checkcount" class="checkcount">		
						
				 <script>   
				    function setTotalInfo(){
				    let totalPrice = 0;			// 총 가격
					let totalCount = 0;			// 총 갯수
				    let totalKind = 0;				// 총 종류
					let finalTotalPrice = 0;  //최종 가격
				
				    $(".cart_info_td").each(function(index, element){
						
				        if($(element).find(".individual_cart_checkbox").is(":checked") === true){	//체크여부
						
				        // 총 가격 찾을때마다 계속 더하면서 순회함
						totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
						// 총 갯수 찾을때마다 계속 더하면서 순회함
						totalCount += parseInt($(element).find(".individual_goodsQty_input").val());
						
						
						// 총 종류
						totalKind += 1;
				
				    }
						
					});
				
				    finalTotalPrice = totalPrice;
				    /* 값 삽입 */
					// 총 가격
					$(".totalPrice_span").text(finalTotalPrice.toLocaleString());
				
				
					// 총 갯수
					$(".totalCount_span").text(totalCount);
				
					// 총 종류
					$(".totalKind_span").text(totalKind);
				
					// 최종 가격(총 가격)
					$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString()); //통화 형식으로 출력
					
				}
				
				/* 체크여부 변경시 밑에 종합 정보 변화 */
				$(".individual_cart_checkbox").on("change", function(){
				
				    setTotalInfo($(".cart_info_td"));
				});
				/*체크박스 전체 선택*/
				$(".all_check_input").on("click", function(){
				
					/* 체크박스 체크/해제 */
					if($(".all_check_input").prop("checked")){
						$(".individual_cart_checkbox").prop("checked", true);
					} else{
						$(".individual_cart_checkbox").prop("checked", false);
					}
				    /* 총 주문 정보 세팅(총 가격, 물품 수, 종류) */
					setTotalInfo($(".cart_info_td"));
				
				});
				
				
				/* 수량버튼 */
				$(".plus_btn").on("click", function(){	
					let quantity = $(this).parent("div").find("input").val();
					$(this).parent("div").find("input").val(++quantity);
				});
				$(".minus_btn").on("click", function(){
					let quantity = $(this).parent("div").find("input").val();
					if(quantity > 1){
						$(this).parent("div").find("input").val(--quantity);		
					}
				});
				            
		            /* 수량 수정 버튼 */
		            $(".quantity_modify_btn").on("click", function(){
		            	let cartId = $(this).data("cartid");
		            	let goodsQty = $(this).parent("td").find("input").val();
		            	$(".update_cartId").val(cartId);
		            	$(".update_goodsQty").val(goodsQty);
		            	$(".quantity_update_form").submit();
		            	
		            });	
		            
		            /* 장바구니 삭제 버튼 */
		            $(".delete_btn").on("click", function(e){
		            	
		            	if(!confirm("장바구니에서 삭제 하시겠습니까?")) {
		            		return false;
		            	} else {
			            	e.preventDefault();
			            	const cartId = $(this).data("cartid");
			            	$(".delete_cartId").val(cartId);
			            	$(".quantity_delete_form").submit();
		            	}
		            });
		            
		            /* 회원 주문 페이지 이동 */	
		            $(".order_btn").on("click", function(){
		
		
		            	let uid = $(this).data("uid");
		            	$(".order_uid").val(uid);
		            	
		            	let form_contents ='';
		            	let orderNumber = 0;
		            	//유효성검사
		 				let checkcount = 0;
		            
			
	            	$(".cart_info_td").each(function(index, element){
	            			
	            		
	            		if($(element).find(".individual_cart_checkbox").is(":checked") === true){	//체크박스 체크된 상품일시
	            			
	            			let goodsId = $(element).find(".individual_goodsId_input").val();
	            			let goodsQty = $(element).find(".individual_goodsQty_input").val();
	            			let goodsName = $(element).find(".individual_goodsName_input").val();
	            			let goodsPrice = $(element).find(".individual_goodsPrice_input").val();
	            			let cartcheckin = $(element).find(".individual_cartcheckin_input").val();
	            			let cartcheckout = $(element).find(".individual_cartcheckout_input").val();   
	            			let numOfTourist = $(element).find(".individual_numOfTourist_input").val();
	            			let goodsImageFileName = $(element).find(".individual_goodsImageFileName_input").val();   
	            			
	            			
	            			// orders[] 배열로 주문상품 차례 차례 저장
	            			let goodsId_input = "<input class='orders_input' name='orders[" + orderNumber + "].goodsId' type='hidden' value='" + goodsId + "'>";
	            			form_contents += goodsId_input;
	            			
	            			let goodsQty_input = "<input class='orders_input' name='orders[" + orderNumber + "].goodsQty' type='hidden' value='" + goodsQty + "'>";
	            			form_contents += goodsQty_input;
	            		
	            			let goodsName_input = "<input class='orders_input' name='orders[" + orderNumber + "].goodsName' type='hidden' value='" + goodsName + "'>";
	            			form_contents += goodsName_input;
	            			
	            			let goodsPrice_input = "<input class='orders_input' name='orders[" + orderNumber + "].goodsPrice' type='hidden' value='" + goodsPrice + "'>";
	            			form_contents += goodsPrice_input;
	            			
	            			let cartcheckin_input = "<input class='orders_input' name='orders[" + orderNumber + "].cartcheckin' type='hidden' value='" + cartcheckin + "'>";
	            			form_contents += cartcheckin_input;
	            			
	            			let cartcheckout_input = "<input class='orders_input' name='orders[" + orderNumber + "].cartcheckout' type='hidden' value='" + cartcheckout + "'>";
	            			form_contents += cartcheckout_input;
	            			
	            			let numOfTourist_input = "<input class='orders_input' name='orders[" + orderNumber + "].numOfTourist' type='hidden' value='" + numOfTourist + "'>";
	            			form_contents += numOfTourist_input;
	            			
	            		
	            			let goodsImageFileName_input = "<input name='orders[" + orderNumber + "].goodsImageFileName' type='hidden' value='" + goodsImageFileName + "'>";
	            			form_contents += goodsImageFileName_input;
	            			
	            			orderNumber += 1;
	            			checkcount += 1;
	            		}
	            	});	
		            	if(checkcount == 0) {
		            		alert("선택된 상품이 없습니다")
		            		return false;
		            		
		            	} else{
		            	$(".order_form").html(form_contents);
		            	$(".order_form").submit();
		            	
		            	}
		            });
				  
				            
				               
				    </script>
				</section>
			</div>
		</div>
	</div>
</body>
</html>