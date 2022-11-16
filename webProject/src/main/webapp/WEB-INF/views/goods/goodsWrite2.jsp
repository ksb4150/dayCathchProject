<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
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
    <link rel="stylesheet" href="/css/goodsWrite.css"/>

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
			                <a class="mypage_sidebar_b" href="#"><h4>상품 리뷰</h4></a>
			            </details>
			        </li>
			            <hr>
			        <li>
			        <li>
			        	<a class="mypage_sidebar_a" href="${contextPath}/order/bSalesStatusPage.do"><h3>매출 현황</h3></a>
			        </li>
			    </ul>
			</div>
		</section>
    <div class="contents">
    <h2>상품등록</h2>
    <form id="form1" name="form1" enctype="multipart/form-data" method="post">   
	        <div>상품종류: <span>투어티켓</span></div>
	        <span><input type="hidden" id="mainCategory" name="goodsMainCategory" value="투어티켓"><span></span></label></span>

            <div class="goods_div">
	        <div>상품지역</div>
	        <div>
	                <span><input type="radio" id="subCategory" name="goodsSubCategory" value="서울"><span>서울</span></span>
	                <span><input type="radio" id="subCategory" name="goodsSubCategory" value="제주"><span>제주</span></span>
	                <span><input type="radio" id="subCategory" name="goodsSubCategory" value="부산"><span>부산</span></span>
	                <span><input type="radio" id="subCategory" name="goodsSubCategory" value="전주"><span>전주</span></span>
	                <span><input type="radio" id="subCategory" name="goodsSubCategory" value="대전"><span>대전</span></span>
	        </div>
        </div>
	       
            <div class="goods_tit"><input type="text" name="goodsName" id="goodsName" placeholder="상품명"></div>
            <div class="goods_tit">
	            <input type="text" name="goodsPrice" id="goodsPrice" placeholder="상품 가격">
	        </div>

	        
		    <section id="goodsCount_section"> 
		    <h4>상품 개수</h4>
		    <div class="flex_wrap1">
			    <input type="button" class="goodsCount_down"/>
			    <input type="text" value="1" id="goodsCount" name="goodsCount"/>
			    <input type="button" class="goodsCount_up" />
			</div>
			</section>
	        	
	        <div class="goods_info">상품정보</div>
            <textarea rows="5" cols="60" name="goodsInfo" id="goodsInfo"></textarea>
	            
            <div class="goods_tit">상품 대표 이미지</div>
            <div><input type="file" name="file[0]" onchange="readURL(this);" /></div>
			<div><img id="preview" width=400px height=400px /></div> 
		
	           <div>상품이미지</div>
	            <input type="button" value="파일 추가" onClick="fn_addFile()"/>
				<div id="d_file"></div><br>

	        <h3>상품상세정보</h3>
	        <div> 상품 상세 정보를 추가하면 고객님이 사업자님의 상품을 더 쉽게 찾을 수 있습니다! </div>
            <div class="goods_div">
		        <div>숙소 판매 기간</div>
		        	<div><span><input type="Date" id="goodsStart" name="goodsStart" value=""></span>     
	            </div>
            </div>

            <div class="goods_div">
            	<div>숙소 판매 종료기간</div>
            		<div> <span><input type="Date" id="goodsEnd" name="goodsEnd" value=""></span>   
            	</div>
            </div>
	   
		        <div class="goods_detail">가이드 유무</div>
		        <div>
		            <span><input type="radio" id="guide" name="guide" value="있음"><span>있음</span></span>
		            <span><input type="radio" id="guide" name="guide" value="없음"><span>없음</span></span>
		        </div>

		        	<input class="goodsWrite_btn" type="button" value="등록" id="addBtn">
		        	<input class="goodsWrite_btn" type="button" value="목록" id="listBtn">
		        
		        	</form>
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
	            document.form1.action = "${contextPath}/goods/goodsWrite4.do";
	            document.form1.submit();
	        });
	        //상품 목록 이동
	        $("#listBtn").click(function(){
	            location.href='${contextPath}/goodsinsert.do';
	        });
	    });
	        
	    	var goodsCount =$("#goodsCount").val();
	    	$(".goodsCount_up").on("click",function(){
	    		setTimeout(function(){
	    		if (goodsCount == 10)
	    		{
	    			goodsCount;
	    		}
	    		else{goodsCount ++;}
	    		$("#goodsCount").val(goodsCount);
	    		},10);
	    	});
	    	$(".goodsCount_down").on("click",function(){
	    		setTimeout(function(){
	    		if (goodsCount == 1)
	    		{
	    			goodsCount;
	    		}
	    		else if(goodsCount <= 10)
	    		{
	    			goodsCount--;
	    		}
	    		$("#goodsCount").val(goodsCount);
	    		},10);
	    	});	
	    
	    </script>
	    </div>
	    </div>
	    </div>

	</body>
	</html>