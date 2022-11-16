<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
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
    <link rel="stylesheet" href="/css/addMemberForm.css"/>
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
	    	
	        if(!_IS_ID_CHECK_TF){ //아이디 중복 확인을 해주세요
	            document.getElementById("idChk3").style.display="block";

	            return false;
	        }

	        if($("#email_type").val() === 'NONE') { //이메일 형식이 틀렸습니다.
	        	 var format3 = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	            if(!format3.test(id)) {
	                document.getElementById("idChk2").style.display="block";

	                return false;
	            }
	        } else {
	            /* 이메일 아이디 생성 */
	            var emailId = $("#userId").val();
	            
	            if ($("#email_type").val() !== "NONE") {
	                emailId += "@"+$("#email_type").val();
	                $("#userId").val(emailId);
	                flag = true; // 실패할 때 userId 초기화 시키기 위한 flag
	            }
	        }

	        if($("#userPwd1").val() == ''){  //비밀번호를 입력해주세요
	            document.getElementById("pwdChk3").style.display="block";
	            
	            if(flag) {
	            	$("#userId").val(id);
	            }
	            return false;
	        }

	        if($("#userPwd2").val() == ''){ //비밀번호 확인을 입력해주세요.
	            document.getElementById("pwdChk4").style.display="block";

	            if(flag) {
	            	$("#userId").val(id);
	            }
	            return false;
	        }

	        //비밀번호 체크
	        if($("#userPwd2").val() != $("#userPwd1").val()){ //비밀번호와 비밀번호 확인이 불일치합니다.
	            document.getElementById("pwdChk2").style.display="block";

	            if(flag) {
	            	$("#userId").val(id);
	            }
	            return false;
	        }

	        //비밀번호 체크
	        if($("#custPassChk").val() != "Y"){ 
	            document.getElementById("pwdChk1").style.display="block";

	            if(flag) {
	            	$("#userId").val(id);
	            }
	            return false;
	        }

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
	     
	     // 휴대폰 번호 체크	         
	         if(!$("#phone").val().match(/^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/)){
	        	 document.getElementById("phoneChk1").style.display="block";
		            
		            if(flag) {
		            	$("#userId").val(id);
		            }
		            return false;
	         }
	     // 휴대폰 인증번호 체크
	         
	         if($("#phone2").val() == ''){ //비밀번호 확인을 입력해주세요.
		            document.getElementById("phoneChk2").style.display="block";

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
	        
	        if($('input[name="userGender"]:checked').length === 0){
	            document.getElementById("genderChk1").style.display="block";

	            if(flag) {
	            	$("#userId").val(id);
	            }
	            return false;
	        }
	    	frmObj.action="${contextPath}/member/businessAddMember.do";
	        frmObj.submit();
	    }
    </script>
</head>
<body>
    <div class="contents_area">        
            <div class="soon">
                <div class="top_block">
                    <a href="/"><img src="/img/logo.png" alt="날잡아" class="top_logo"></a>
                </div>
                <h1><strong>사업자 회원가입</strong></h1>
                <hr>
                
                <div class="contents">			
                    <div class="block">
                    <input type="hidden" id="custPassChk" />
					<input type="hidden" id="smsCertChk" />
					<input type="hidden" id="smsCertChkVal" />
                  
                        <form name="addMemberFrm" id="frm" method="post" action="${contextPath}" enctype="multipart/form-data" >  
                        	<input type="hidden" id="userType" name="userType" value="2"/>
							<span class="input_row">
								<span class="input_grp input_row_email">
		                            <input type="text" class="inp_email" placeholder="이메일" title="이메일 입력" id="userId" name="userId" />
		                            <select name="email_type" id="email_type" class="input_select_email">
			                            <option value="NONE">직접입력</option>
										<option value="naver.com">@naver.com</option>
										<option value="google.com">@gmail.com</option>
										<option value="daum.com">@daum.com</option>
										<option value="hanmail.net">@hanmail.net</option>
		                            </select>
									<input type="button" class="btn_nor" id="btn_nor" onclick="procDoubleCheck()" value="중복확인"/> 
								</span>
								<p class="txt_check" id="idChk1"> - 아이디는 영소문자,숫자 조합으로 6자리 이상 </p>
								<p class="txt_check" id="idChk2"> - 이메일 형식이 올바르지 않습니다! </p>
								<p class="txt_check" id="idChk3"> - ID 중복 확인을 해주세요. </p>
	                        </span>              
	                        <span class="input_row">
	                            <span class="input_grp">
	                                <input type="password" class="inp_pw" name="userPwd" id="userPwd1" placeholder="비밀번호(영문 숫자 특수문자 조합, 8~16자리)" title="비밀번호 입력" required>                            
	                            	<p class="txt_check" id="pwdChk1">   - 영문,숫자,특수문자 중 2가지 종류이상을 조합으로 10자리 이상
																	<br >- 영문,숫자,특수문자 중 3가지 종류이상을 조합으로 8자리 이상 </p>
									<p class="txt_check" id="pwdChk3">- 비밀번호를 입력해주세요.</p>
								</span>
	                        </span>
	                        <span class="input_row">
	                            <span class="input_grp">
	                                <input type="password" class="inp_pw" name="userPwd2" id="userPwd2" placeholder="비밀번호 확인" title="비밀번호  재입력">
	                            	<p class="txt_check" id="pwdChk2">- 비밀번호와 비밀번호 확인이 불일치합니다!</p>
	                            	<p class="txt_check" id="pwdChk4">- 비밀번호 확인을 입력해주세요!</p>
	                            </span>
	                        </span>
	                        
	                        <span class="input_row">
	                            <span class="input_grp">
	                                <input type="text" class="txt" placeholder="이름(실명)" title="이름 입력" id="userName" name="userName" maxlength="13" required>
	                            	<p class="txt_check" id="nameChk1">- 이름은 2글자 이상 입력</p>
	                            	<p class="txt_check" id="nameChk2">- 이름은 한글 영어만 입력 가능합니다.</p>
	                            </span>
	                        </span>
	                        <!-- 얼럿메시지 시 해당 엘리먼트에 wrong 클래스 추가-->
	                        <span class="input_row">
	                            <span class="input_grp">
	                                <input type="number" class="item_phone" id="phone" placeholder="휴대폰번호(숫자만 입력)" name="userPhoneNumber" maxlength="11">
	                                <button type="button" class="btn_nor btn_nor1" id="phoneChk" onclick="smsEachCertNum()">인증번호 발송</button>  
	                            </span>
	                            <p class="txt_check" id="phoneChk1">- 휴대폰 번호를 정확히 입력해주세요.</p>
	                          
	                        </span>
	                       
	                        <span class="input_row" id="inputCert">
	                            <span class="input_grp">
	                                <input type="text" class="item_count" id="phone2" placeholder="인증번호(숫자만 입력)" id="btnWrite" maxlength="4">
	                              <!--   <span class="count_num">03:00</span> -->
	                                <button type="button" class="btn_nor2" id="smsCheckBtn">확인</button><br>
	                                <span class="successPhoneChk">휴대폰 번호 입력후 인증번호 전송을 해주십시오.</span> 
	                                 <p class="txt_check" id="phoneChk2">- 휴대폰 번호를 인증해주세요.</p>
	                            </span>
	                        </span>
	                        
	                        <span class="input_row">
	                            <span class="input_grp">
	                                <input type="number" class="item_lft item_lft1" id="userBirth" name="userBirth" placeholder="생년월일 (예 : 19900101)" title="생년월일 입력">
	                                <ul class="form_align">
	                                    <li><span><input type="radio" id="sex1" name="userGender" value="M"><label for="sex1"><span></span>남</label></span></li>
	                                    <li><span><input type="radio" id="sex2" name="userGender" value="F"><label for="sex2"><span></span>여</label></span></li>
	                                    <input type="hidden" id="genderCd" name="genderCd">
	                                </ul>
	                            </span>
	                            <p class="txt_check" id="birthChk1">- 생년월일을 입력해주세요</p>
								<p class="txt_check" id="birthChk2">- 생년월일을 정확하게 입력해주세요</p>
								<p class="txt_check" id="genderChk1">- 성별을 선택해주세요</p>
	                        </span>
	                        
	                        <span class="input_row">
                            <span class="input_grp">
                                <input type="number" class="item_businessNumber" id="businessNumber" placeholder="사업자 번호(숫자만 입력)" name="businessNumber" maxlength="11">   
                            </span>                       
                            </span>
                            <span class="input_row">
                            <span class="input_grp">
                         		<h4>사업자 등록증</h4>
                         		<span class="input_img">
                         
                         		<input type="file" name="file[1]"  />
                         		</span>
                            </span>                   
                            </span> 
                            
                            <span class="input_row">
                            <span class="input_grp">
                         		<h4>회사 대표 이미지</h4>
                         		<span class="input_img">
                         		<img id="preview" width=490 height=400 />
                         		<input type="file" name="file[0]" onchange="readURL(this);" />
                         		</span>
                            </span>                   
                            </span> 
                            
                            <span class="input_row">
                            <span class="input_grp">
                            	<input type="text"   class="item_companyName txt" name="companyName" id="companyName" placeholder="회사명">                          
                            </span>                   
                            </span>    
                                     
                            <span class="input_row">
                            <span class="input_grp">
                            	<h4>회사주소</h4>           
                            	<span class="span_zipcode">
                            	<input type="text" class="txtZipcode" id="zipcode" name="zipcode" placeholder="우편번호">
                            	<input type="button" class="txtBnt btn_nor" onclick="sample5_execDaumPostcode()" value="주소 검색">
                            	</span>
                      	        <input type="text" class="txt" id="roadAddress" name="roadAddress" placeholder="도로명">
                      	        <input type="text" class="txt" id="jibunAddress" name="jibunAddress" placeholder="지번">
                      	        <input type="text" class="txt" id="extraAddress" name="extraAddress" placeholder="상세주소" >
                         
                  	     
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
                        	  <input type="number" class="txt" id="companyNum" placeholder="회사 전화	번호(숫자만 입력)" name="companyNum" maxlength="11">
                        </span>                   
                        </span>   
                                 
                        <span class="input_row">
                        <span class="input_grp">
                        	<h4>회사 소개</h4>
                        	<textarea rows="5" class="txt_textarea" cols="60" name="companyInfo" id="companyInfo"></textarea>          
                        </span>                   
                        </span>   
                        
                        <span class="input_row">
                        <span class="input_grp">
                        	<h4>편의 시설</h4>
                        	<textarea rows="5" class="txt_textarea" cols="60" name="Facilities" id="Facilities"></textarea>          
                        </span>                   
                        </span>  
                        <span class="input_row">
                        <span class="input_grp">
                        	<h4>유의 사항</h4>
                        	<textarea rows="5" class="txt_textarea" cols="60" name="companyNotice" id="companyNotice"></textarea>          
                        </span>                   
                        </span>  
                                  
                                  	
	                        </div>
	                        <div class="agreement">
	                            <label for="a"><input type="checkbox" id="check_a" > (선택)개인정보 수집 및 이용 동의</label><br>
	                            <label for="b"><input type="checkbox" id="check_b"> (선택)마케팅 정보 수신동의 </label>
	                         </div>
	                       
	                        <div class="btn_block">
	                            <input type="button" class="btn_block_input" onclick="join(this.form)" value="가입하기" /> 
	                            <input class="btn_block_input" type="reset" value="다시입력"/>
	                        </div>
                        </form>
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
				 $("#phone").attr("autofocus",true);
        	}else{	        		
        		$("#phone2").attr("disabled",false);
        		$("#phoneChk3").css("display","inline-block");
        		$("#phone").attr("readonly",true);
        		code2 = data;
        	}
        }
    });
});
	
 //휴대폰 인증번호 대조
$("#smsCheckBtn").click(function(){
	if($("#phone2").val() == code2){
		$(".successPhoneChk").text("인증번호가 일치합니다.");
		$(".successPhoneChk").css("color","green");
	}else{
		$(".successPhoneChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
		$(".successPhoneChk").css("color","red");
	}
});
</script>   
</body>
</html>