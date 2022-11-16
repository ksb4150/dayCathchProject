<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="goodsModifyMap" value="${goodsModifyMap.goodsModify}" />
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/css/side.css"/>
    <script  src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script type="text/javascript">	
    
    
    	
		  var cnt=1;
		  function fn_addFile(){
			  $("#d_file").append("<br>"+"<input type='file' name='file"+cnt+"' />");
			  cnt++;
		  } 
		  
		  
		  function readURL(input) {
				if(input.files && input.files[0]) {
					var reader = new FileReader();
					reader.onload = function(e) {
						$('#preview').attr('src', e.target.result);
					}
					reader.readAsDataURL(input.files[0]);
				}
			}
	</script>
</head>
<body>
<div class="contents_area">
<div class="soon">
<section class="mypagesidebar0">
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
                <a class="mypage_sidebar_b" href="${contextPath}/mypage/faqList.do"><h4>상품 리뷰</h4></a>
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
    <h2>상품등록</h2>
    <form id="form1" name="form1" enctype="multipart/form-data" method="post">  
    <input type="hidden" name="goodsId" value="${goodsModifyMap[0].goodsId}">
        <table>
	        <tr>
	        	<td>
	        	</td>
	        </tr>

	        <tr>
	            <td>상품명</td>
	            <td colspan="2"><input type="text" name="goodsName" id="goodsName" value="${goodsModifyMap[0].goodsName}"></td>
	        </tr>
	        <tr>
	            <td>상품종류</td>
	            <td colspan="2">
	            	<span> 숙박 </span>
	                <span><input type="hidden" id="mainCategory" name="goodsMainCategory" value="숙박"><span></span></label></span></li>
	            </td>
	        </tr>
	        <tr>
	            <td>상품지역</td>
	            <td colspan="2">
	                <span><input type="radio" id="subCategory" name="goodsSubCategory" value=""><span></span>서울</label></span></li>
	                <span><input type="radio" id="subCategory" name="goodsSubCategory" value=""><span></span>제주</label></span></li>
	                <span><input type="radio" id="subCategory" name="goodsSubCategory" value=""><span></span>부산</label></span></li>
	                <span><input type="radio" id="subCategory" name="goodsSubCategory" value=""><span></span>전주</label></span></li>
	                <span><input type="radio" id="subCategory" name="goodsSubCategory" value=""><span></span>대전</label></span></li>
	            </td>
	        </tr>
	        <tr>
	            <td>가격</td>
	            <td colspan="2">
	            	<input type="text" name="goodsPrice" id="goodsPrice" value="${goodsModifyMap[0].goodsPrice}">
	            </td>
	        </tr>
	        <tr>
	            <td>상품정보</td>
	            <td colspan="2">
	            	<textarea rows="5" cols="60" name="goodsInfo" id="goodsInfo" >${goodsModifyMap[0].goodsInfo}</textarea>
	            </td>
	        </tr>
	        <tr>
            	<td>상품 대표 이미지</td>
            	<input type="hidden" name="originalFileName" value="${goodsModifyMap[0].goodsImageFileName}">
            	<td><input type="file" name="file[0]" onchange="readURL(this);"/>
            	
            	</td> 
            	<td><img id="preview" width=200 height=200 src="${contextPath}/gThumbDownload.do?goodsImageFileName=${goodsModifyMap[0].goodsImageFileName}"/></td> 
			</tr>
    
	        <tr>
	        <td>상품상세정보</td>
	        </tr>
	        <tr>
	        <td>숙소 판매 기간</td>
	        <td colspan="2">
	            <span><input type="Date" id="goodsStart" name="goodsStart" value="${goodsModifyMap[0].lodgingDetailVO.goodsStart}"><span></span></span>     
	        </td>
	        </tr>
	        <tr>
	        <td>숙소 판매 종료기간</td>
	        <td colspan="2">
	            <span><input type="Date" id="goodsEnd" name="goodsEnd" value="${goodsModifyMap[0].lodgingDetailVO.goodsEnd}"><span></span></span>       
	        </td>
	        </tr>
	   
	        <tr>
	        <td>숙소유형</td>
	            <td colspan="2">
	                <span><input type="radio" id="lodgingType" name="lodgingType" value="1"><span></span>호텔</label></span></li>
	                <span><input type="radio" id="lodgingType" name="lodgingType" value="2"><span></span>펜션</label></span></li>
	                <span><input type="radio" id="lodgingType" name="lodgingType" value="3"><span></span>게스트하우스</label></span></li>                 
	            </td>
	        </tr>
	        <tr>
	        	<td>인원</td>
		        <td colspan="2">           
		            <span><input type="number" id="numOfTourist" name="numOfTourist" min="1" max="10" value="${goodsModifyMap[0].lodgingDetailVO.numOfTourist}"><span></span></span>       
		        </td>
	        <tr>
		        <td>침대 갯수</td>
		        <td colspan="2">
		            <span><input type="number" id="bedAmount" name="bedAmount" min="1" max="10" value="${goodsModifyMap[0].lodgingDetailVO.bedAmount}"><span></span></label></span></li>             
		        </td>
	        </tr>
	        </tr>
	        <tr>
		        <td>체크인</td>
		        <td colspan="2">
		            <span><input type="time" id="checkIn" name="checkIn" value="${goodsModifyMap[0].lodgingDetailVO.checkIn}"><span></span></label></span></li>        
		        </td>
	        </tr>
	        <tr>
		        <td>체크아웃</td>
		        <td colspan="2">
		            <span><input type="time" id="checkOut" name="checkOut" value="${goodsModifyMap[0].lodgingDetailVO.checkOut}"><span></span></label></span></li>        
		        </td>
	        </tr>
	        <tr>
		        <td>배드 타입</td>
		        <td colspan="2">
		            <span><input type="checkbox" id="singleBed" name="singleBed" value="singleBed"><span>싱글</span></span>
		            <span><input type="checkbox" id="doubleBed" name="doubleBed" value="doubleBed"><span>더블</span></span>
		            <span><input type="checkbox" id="twinBed" name="twinBed" value="twinBed"><span>트윈</span></span>
		            <span><input type="checkbox" id="ondol" name="ondol" value="ondol"><span>온돌</span></span>
		        </td>
	        </tr>
	        <tr>
		        <td>공용 시설</td>
		        <td colspan="2">
		            <span><input type="checkbox" id="swimmingPool" name="swimmingPool" value="swimmingPool"><span></span>수영장</label></span></li>
		            <span><input type="checkbox" id="restaurant" name="restaurant" value="restaurant"><span></span>레드토랑</label></span></li>
		            <span><input type="checkbox" id="parking" name="parking" value="parking"><span></span>주차장</label></span></li>
		            <span><input type="checkbox" id="hotSpring" name="hotSpring" value="hotSpring"><span></span>온천</label></span></li>  
		        </td>
	        </tr>
	        <tr>
		        <td>객실 내 시설</td>
		        <td colspan="2">
		            <span><input type="checkbox" id="spar" name="spar" value="spar"><span></span>객실스파</label></span></li>
		            <span><input type="checkbox" id="wifi" name="wifi" value="wifi"><span></span>와이파이</label></span></li>
		            <span><input type="checkbox" id="TV" name="TV" value="TV"><span></span>TV</label></span></li>
		            <span><input type="checkbox" id="airConditioner" name="airConditioner" value="airConditioner"><span></span>에어컨</label></span></li>
		            <span><input type="checkbox" id="refrigerator" name="refrigerator" value="refrigerator"><span></span>냉장고</label></span></li>
		            <span><input type="checkbox" id="hairAppliance" name="hairAppliance" value="hairAppliance"><span></span>드라이기</label></span></li>
		        </td>
	        </tr>
	        <tr>
		        <td>기타</td>
		        <td colspan="2">
		            <span><input type="checkbox" id="petsAllowed" name="petsAllowed" value="petsAllowed"><span></span>반려견동반</label></span></li>
		            <span><input type="checkbox" id="breakfast" name="breakfast" value="breakfast"><span></span>조식포함</label></span></li>
		            <span><input type="checkbox" id="store" name="store" value="store"><span></span>store</label></span></li>
		            <span><input type="checkbox" id="disabledAccessibility" name="disabledAccessibility" value="disabledAccessibility"><span></span>장애인편의시설</label></span></li>
		        </td>
	        </tr>   
        </table>
        <input type="button" value="등록" id="addBtn">
        <input type="button" value="목록" id="listBtn">
    </form>
    </div>
    </div>
    </div>	
    <script>
        $(document).ready(function(){
        //상품 등록 유효성 검사
        $("#addBtn").click(function(){
            var goodsName = $("#goodsName").val();
            var goodsPrice = $("#goodsPrice").val();
            var productDesc = $("#productDesc").val();
            var productPhoto = $("#productPhoto").val();

            if(goodsName == ""){
                alert("상품명을 입력해주세요");
                goodsName.foucs();
            }else if(goodsPrice == ""){
                alert("상품 가격을 입력해주세요");
                goodsPrice.foucs();
            }
          
           

            //상품 정보 전송
            document.form1.action = "${contextPath}/goods/modGoods.do";
            document.form1.submit();
        });
        //상품 목록 이동
        $("#listBtn").click(function(){
            location.href='${contextPath}/goods/goodsList.do';
        });
    });
    
    </script>

</body>
</html>