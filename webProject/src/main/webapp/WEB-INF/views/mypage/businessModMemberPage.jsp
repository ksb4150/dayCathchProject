<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="businessMember" value="${businessMemberMap.businessMember}" />
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/css/side.css"/>
    <link rel="stylesheet" href="/css/bMemberModify.css"/>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script type="text/javascript" src="/js/addMember.js"></script>
    <script type="text/javascript">

  
	  function readURL(input) {
			if(input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#preview').attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
    
	    function procDoubleCheck() {
	        /* 이메일 아이디 생성 */
	        var id = $("#userId").val();
	        var emailId = $("#userId").val();
	        if ($("#email_type").val() !== "NONE") {
	            emailId += "@"+$("#email_type").val();
	        } else if($("#email_type").val() === "NONE") {
	        	var format3 = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	        	if(!format3.test(id)) {
	        		alert('이메일 형식을 맞춰주세요!');
	        		return false;
	        	}
	        }

	        $.ajax({
	                url: "${contextPath}/member/overlapCheck.do",
	                type:"post",
	                async: false,
	                data : {id : emailId},
	                success: function(data, textStatus) {
	                    if(data.re === "true") {
	                        _IS_ID_CHECK_TF = true; // 아이디 중복 확인
	                        $('#userId').val(id);
	                        alert("[ "+emailId+" ]\n 사용 가능한 아이디입니다.");
	                        document.getElementById("idChk3").style.display="none";
	                        return;
	                    }else{
	                        _IS_ID_CHECK_TF = false;
	                        $('#userId').val("");
	                        alert("[ "+emailId+" ]\n 사용할 수 없는 아이디입니다.");
	                        return false;
	                    } 
	                },
	                error: function(request, status, error) {
	                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	                }
	        });
	    }
	    
	    
	    function join(frmObj) {
	    	var flag = false; // @ 안시킨 아이디
	    	var id = $("#userId").val();
	   
	         // 이름 유효성 체크
	        var userName = $('#userName').val();
	        var nameFormat = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi;
	        if(nameFormat.test(userName)){
	            $("#userName").val(userName.replace(nameFormat, ''));
	            document.getElementById("nameChk2").style.display="block";
	            
	            if(flag) {
	            	$("#userId").val(id);
	            }
	            return false;
	        } else if ($("#userName").val().length <= 1){
	            document.getElementById("nameChk1").style.display="block";
	            
	            if(flag) {
	            	$("#userId").val(id);
	            }
	            return false;
	        }
	     
	               
	     
	     // 생년월일 체크
	         if($('#userBirth').val() == ''){
	            document.getElementById("birthChk1").style.display="block";
	            
	            if(flag) {
	            	$("#userId").val(id);
	            }
	            return false;
	        }

	         var birth = $('#userBirth').val();
	        if(birth.length !== 8 || birth.substr(0,4) > (new Date()).getFullYear() || birth.substr(4,2) > 12 || birth.substr(6,2) > 31 ){
	            document.getElementById("birthChk2").style.display="block";

	            if(flag) {
	            	$("#userId").val(id);
	            }
	            return flase;
	        }
	        	   
	    	frmObj.action="${contextPath}/mypage/businessModMember.do";
	        frmObj.submit();
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
					        	<a class="mypage_sidebar_a" href="${contextPath}/order/bSalesStatusPage.do"><h3>매출 관리</h3></a>
					        </li>
					    </ul>
					</div>
				</section>
            
				<div class="contents">
					<h1><strong>사업자 회원정보 수정</strong></h1>
					<hr>
	            	
					<div class="wrap">			
	                    <div class="block">
							<input type="hidden" id="smsCertChk" />
							<input type="hidden" id="smsCertChkVal" />
	                  
	                        <form name="addMemberFrm" id="frm" method="post" action="${contextPath}" enctype="multipart/form-data" >  
	                        	<input type="hidden" id="userType" name="userType" value="2"/>
								<span class="input_row">
									<span class="input_grp input_row_email">
			                            <input type="text" class="inp_pw" placeholder="이메일" title="이메일 입력" id="userId" name="userId" maxlength="30" value="${businessMember.userId}" required readonly />		                     
									</span>
		                        </span>              	                        
		                        <span class="input_row">
		                            <span class="input_grp">
		                                <input type="text" class="txt" placeholder="이름(실명)" title="이름 입력" id="userName" name="userName" maxlength="13" value="${businessMember.userName}" required>
		                            	<p class="txt_check" id="nameChk1">- 이름은 2글자 이상 입력</p>
		                            	<p class="txt_check" id="nameChk2">- 이름은 한글 영어만 입력 가능합니다.</p>
		                            </span>
		                        </span>
		                        <!-- 얼럿메시지 시 해당 엘리먼트에 wrong 클래스 추가-->
		                        <span class="input_row">
		                            <span class="input_grp">
		                                <input type="number" class="item_phone" id="phone" placeholder="휴대폰번호(숫자만 입력)"  name="userPhoneNumber" maxlength="11" value="${businessMember.userPhoneNumber}">
		                                <button type="button" class="btn_nor btn_nor1" id="phoneChk" onclick="smsEachCertNum()">인증번호 발송</button>  
		                            </span>
		                            <p class="txt_check" id="phoneChk1">- 휴대폰 번호를 정확히 입력해주세요.</p>
		                        </span>
		                       
		                        <span class="input_row" id="inputCert">
		                            <span class="input_grp">
		                                <input type="text" class="item_count" id="phone2" placeholder="인증번호(숫자만 입력)" id="btnWrite" maxlength="4">
		                                <button type="button" class="btn_nor2" id="smsCheckBtn">확인</button><br>
		                                <span class="successPhoneChk">휴대폰 번호 입력후 인증번호 전송을 해주십시오.</span> 
		                                 <p class="txt_check" id="phoneChk2">- 휴대폰 번호를 인증해주세요.</p>
		                            </span>
		                        </span>
		                        
		                        <span class="input_row">
		                            <span class="input_grp">
		                                <input type="number" class="item_lft item_lft1" id="userBirth" name="userBirth" placeholder="생년월일 (예 : 19900101)" title="생년월일 입력" value="${businessMember.userBirth}" >      
		                            </span>
		                            <p class="txt_check" id="birthChk1">- 생년월일을 입력해주세요</p>
									<p class="txt_check" id="birthChk2">- 생년월일을 정확하게 입력해주세요</p>
									<p class="txt_check" id="genderChk1">- 성별을 선택해주세요</p>
		                        </span>
		                        
		                        <span class="input_row">
		                            <span class="input_grp">
		                                <input type="number" class="item_businessNumber" id="businessNumber" placeholder="사업자 번호(숫자만 입력)" name="businessNumber" maxlength="11" value="${businessMember.businessNumber}">
		                            </span>                       
	                            </span>
	        
	                            <span class="input_row">
		                            <span class="input_grp">
		                         		<h4>회사 대표 이미지</h4>
		                         		<span class="input_img">
		                         			<input type="hidden" name="originalFileName" value="${businessMember.userImageFileName}">                      
		                         			<input type="file" name="file[0]" onchange="readURL(this);" value="${businessMember.userImageFileName}"/>
		                         		</span>                                            
		                            	<img id="preview" style="width:490px; height:400px; display:block;" src="${contextPath}/uImgDownload.do?userImageFileName=${businessMember.userImageFileName}&uid=${businessMember.uid}"/> 
		                            </span>                   
	                            </span> 
	                            
	                            <span class="input_row">
		                            <span class="input_grp">
		                            	<input type="text"   class="item_companyName txt" name="companyName" id="companyName" placeholder="회사명" value="${businessMember.companyName}">                          
		                            </span>                   
	                            </span>    
	                                     
	                            <span class="input_row">
	                            	<span class="input_grp">
		                            	<h4>회사주소</h4>           
		                            	<span class="span_zipcode">
			                            	<input type="text" class="txtZipcode" id="zipcode" name="zipcode" placeholder="우편번호" value="${businessMember.zipcode}">
			                            	<input type="button" class="txtBnt btn_nor" onclick="sample5_execDaumPostcode()" value="주소 검색">
		                            	</span>
		                      	        <input type="text" class="txt" id="roadAddress" name="roadAddress" placeholder="도로명" value="${businessMember.roadAddress}">
		                      	        <input type="text" class="txt" id="jibunAddress" name="jibunAddress" placeholder="지번" value="${businessMember.jibunAddress}">
		                      	        <input type="text" class="txt" id="extraAddress" name="extraAddress" placeholder="상세주소" value="${businessMember.extraAddress}">
	                         
	                  	     
		                      	        <div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
	              
	            	        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	            	        <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=10af0c364ccd50527826adfc13887d3f&libraries=services"></script>
	            	        <script>
		            	        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		            	        mapOption = {
		            	            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
		            	            level: 5 // 지도의 확대 레벨
		            	        	};
	
			            	    //지도를 미리 생성
			            	    var map = new daum.maps.Map(mapContainer, mapOption);
			            	    //주소-좌표 변환 객체를 생성
			            	    var geocoder = new daum.maps.services.Geocoder();
			            	    //마커를 미리 생성
			            	    var marker = new daum.maps.Marker({
			            	        position: new daum.maps.LatLng(37.537187, 127.005476),
			            	        map: map
			            	    });
			
			
			            	    function sample5_execDaumPostcode() {
			            	        new daum.Postcode({
			            	            oncomplete: function(data) {
			            	                var addr = data.address; // 최종 주소 변수
			
			            	                // 주소 정보를 해당 필드에 넣는다.
			            	           
			            	                document.getElementById("roadAddress").value = data.roadAddress;
			            	                document.getElementById("jibunAddress").value = data.jibunAddress;
			            	                document.getElementById('zipcode').value = data.zonecode;
			            	                // 주소로 상세 정보를 검색
			            	                geocoder.addressSearch(data.address, function(results, status) {
			            	                    // 정상적으로 검색이 완료됐으면
			            	                    if (status === daum.maps.services.Status.OK) {
			
			            	                        var result = results[0]; //첫번째 결과의 값을 활용
			
			            	                        // 해당 주소에 대한 좌표를 받아서
			            	                        var coords = new daum.maps.LatLng(result.y, result.x);
			            	                        // 지도를 보여준다.
			            	                        mapContainer.style.display = "block";
			            	                        map.relayout();
			            	                        // 지도 중심을 변경한다.
			            	                        map.setCenter(coords);
			            	                        // 마커를 결과값으로 받은 위치로 옮긴다.
			            	                        marker.setPosition(coords)
			            	                    }
			            	                });
			            	            }
			            	        }).open();
			            	    }
			            	        
	            	  
	            	        </script>
	            	        			</span>                   
	            	        		</span>   
			                        <span class="input_row">
				                        <span class="input_grp">
				                        	  <input type="number" class="txt" id="companyNum" placeholder="회사 전화	번호(숫자만 입력)" name="companyNum" maxlength="11" value="${businessMember.companyNum}">
				                        </span>                   
			                        </span>   
	                                 
			                        <span class="input_row">
				                        <span class="input_grp">
				                        	<h4>호텔 소개</h4>
				                        	<textarea rows="5" class="txt_textarea" cols="60" name="companyInfo" id="companyInfo" value="${businessMember.companyInfo}">${businessMember.companyInfo}</textarea>          
				                        </span>                   
			                        </span>   
	                        
			                        <span class="input_row">
				                        <span class="input_grp">
				                        	<h4>편의 시설</h4>
				                        	<textarea rows="5" class="txt_textarea" cols="60" name="Facilities" id="facilities" value="${businessMember.facilities}" >${businessMember.facilities}</textarea>          
				                        </span>                   
			                        </span>  
			                        <span class="input_row">
				                        <span class="input_grp">
				                        	<h4>유의 사항</h4>
				                        	<textarea rows="5" class="txt_textarea" cols="60" name="companyNotice" id="companyNotice" value="${businessMember.companyNotice}" >${businessMember.companyNotice}</textarea>          
				                        </span>                   
			                        </span>  
	                                  
	                                  	
		                        </div>
		                        <div class="agreement">
		                            <label for="a"><input type="checkbox" id="check_a"> (선택)개인정보 수집 및 이용 동의</label><br>
		                            <label for="b"><input type="checkbox" id="check_b"> (선택)마케팅 정보 수신동의 </label>
		                         </div>
		                       
		                        <div class="btn_block">
		                            <input type="button" class="btn_block_input" onclick="join(this.form)" value="수정하기" /> 
		                            <input class="btn_block_input" type="reset" value="다시입력"/>
		                        </div>
	                        </form>              
	                    </div>
	                </div> 
	           </div> 
	       </div>
	   </div>
 <script>
	//휴대폰 번호 인증
	var code2 = "";
	$("#phoneChk").click(function(){
		alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
		var phone = $("#phone").val();
		$.ajax({
	       type:"GET",
	       url:"/member/phoneCheck?phone=" + phone,
	       cache : false,
	       success:function(data){
	       	if(data == "error"){
	       		alert("휴대폰 번호가 올바르지 않습니다.")
	       		$(".successPhoneChk").text("유효한 번호를 입력해주세요.");
					$(".successPhoneChk").css("color","red");
	   			$("#phone").attr("autofocus",true);
	       	}else{	        		
	       		$("#phone2").attr("disabled",false);
	       		$("#phoneChk2").css("display","inline-block");
	       		$(".successPhoneChk").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오.");
	       		$(".successPhoneChk").css("color","green");
	       		$("#phone").attr("readonly",true);
	       		code2 = data;
	       	}
	       }
	   });
	});
		
	
	//휴대폰 인증번호 대조
	$("#phoneChk2").click(function(){
		if($("#phone2").val() == code2){
			$(".successPhoneChk").text("인증번호가 일치합니다.");
			$(".successPhoneChk").css("color","green");
			$("#phoneDoubleChk").val("true");
			$("#phone2").attr("disabled",true);
	
		}else{
			$(".successPhoneChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
			$(".successPhoneChk").css("color","red");
			$("#phoneDoubleChk").val("false");
			$(this).attr("autofocus",true);
		}
	});
</script>   
</body>
</html>