<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="wishList" value="${resultMap.wishList}"/>
<c:set var="likeList" value="${resultMap.likeList}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <link rel="stylesheet" href="/css/side.css">
    <link rel="stylesheet" href="/css/wishList.css">
    <script>
	    $(document).ready(function() {
	    	$('#wish_list_item_goods').css('display', 'block');
    		$('#wish_list_item_commu').css('display', 'none');
	    	
	    	$('#wish_list_name1').on('click', function() {
	    		$('#wish_list_item_goods').css('display', 'block');
	    		$('#wish_list_item_commu').css('display', 'none');
	    	});
	    	
	    	$('#wish_list_name2').on('click', function() {
	    		$('#wish_list_item_goods').css('display', 'none');
	    		$('#wish_list_item_commu').css('display', 'block');
	    	});
	    	
	    	$(".wish_list_detail").on("click", function() {
	    		let uid = $(this).children("input").val();
	    		let form = document.getElementById("wish_list_detail_goods"+uid);
	    		
	    		form.action = "${contextPath}/page/goodsDetailPage.do";
	    		form.submit();
	    	});

	    	function removeWishList(goodsId) {
	    		$.ajax({
	    			data: {"goodsId" : goodsId},
	    			type: "POST",
	    			url: "${contextPath}/goods/likedRemove.do",
	    			cache: false,
					contentType : false,
					processData : false,
					success: function(data) {
	    				alert("관심 목록에서 삭제되었습니다.");
	    			},
					error: function(request, status, error) {
	                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	                }
	    		});
	    	}
	    
	    });
    </script>
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
        <div class="wish_list">
        	<h2 style="text-align: center; margin-bottom: 35px">관심 내역</h2>
        </div>
        <div class="wish_list_header">
            <div class="wish_list_title">
                <a><span id="wish_list_name1">상품 (${fn:length(wishList)})</span></a>
                <a><span id="wish_list_name2">커뮤니티 (${fn:length(likeList)})</span></a>
            </div>
        </div>
        
        <div class="wish_list_body">
            <div id="wish_list_item_goods">
                <c:choose>
	      	      <c:when test='${wishList != null && not empty wishList}'>  
	      	         <c:forEach var="wishList" items="${wishList}">
      	         		<form id="wish_list_detail_goods${wishList.uid}" name="wish_list_detail_goods" method="post">
		                    <div class="wish_list_detail">
		                    	<input name="uid" id="uid" type="hidden" value="${wishList.uid}" />
			                    <div class="">
				                    <div class="wish_list_detail1">       
				                        <div class="wish_img_wrap">
				                        	<img src="${contextPath}/gThumbDownload.do?goodsImageFileName=${wishList.goodsImageFileName}" alt="상품 이미지"/>
				                        </div>
				                        <div>
				                            <p class="wish_list_detail_name">[${wishList.goodsMainCategory}] ${wishList.goodsName}</p>
				                            <p class="price wish_list_detail_name">
				                            	<strong><fmt:formatNumber value="${wishList.goodsPrice}"
													pattern="#,###" /></strong>원
											</p>
				                        </div> 
				                        <div class="wish_list_btn">
				                            <button onclick="removeWishList(${wishList.goodsId})">삭제하기</button>
				                        </div>                                       
				                    </div>
			                    </div>
		                    </div>
		                </form>
	                 </c:forEach>
	             </c:when>
	             <c:otherwise>
	             	<div class="wish_list_detail">
	             		관심 내역이 없습니다.
	             	</div>
	             </c:otherwise>
	          </c:choose>
            </div>
            
            
            <div id="wish_list_item_commu">
                <c:choose>
	      	      <c:when test='${likeList != null && not empty likeList}'>  
	      	         <c:forEach var="likeList" items="${likeList}">
	      	         	<form name="wish_list_detail_commu${likeList.articleNO}" method="post">
	      	         		<input name="articleNO" type="hidden" value="${likeList.articleNO}" />
		                    <div class="wish_list_detail">
			                    <div class="">
				                    <div class="wish_list_detail1">       
				                        <div class="wish_img_wrap">
				                        <img src="${contextPath}/bThumbDownload.do?articleNO=${likeList.articleNO}&mainImageFileName=${likeList.mainImageFileName}" alt="게시글 이미지"/>
				                        </div>
				                        <div>
				                            <p class="wish_list_detail_name">[${likeList.articleCategory}] ${likeList.title}</p>
				                        </div>
				                        
				                        <div class="wish_list_btn">
				                            <button>삭제하기</button>				                  
				                        </div>                                       
				                    </div>
			                    </div>
		                    </div>
		                 </form>
	                 </c:forEach>
	             </c:when>
	             <c:otherwise>
	             	<div class="wish_list_detail">
	             		관심 내역이 없습니다.
	             	</div>
	             </c:otherwise>
	          </c:choose>
            </div>
        </div>
    </div>
</div>
</div>

</body>
</html>