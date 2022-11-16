<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%
	request.setCharacterEncoding("utf-8");
%>
<html>
<head>
  <meta charset="UTF_8">
  <meta name="viewport" content="width=device_width, initial_scale=1.0">
  <meta http_equiv="X_UA_Compatible" content="ie=edge">
  <title>아이디찾기</title>
  <link rel="stylesheet" href="/css/findId.css"/>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script type="text/javascript" src="/js/memberModify.js"></script>
 <script>
 
 function findid(frmObj){
	 var flag = false; // @ 안시킨 아이디
 		 
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
  frmObj.action="${contextPath}/member/findingId";
  frmObj.submit();
}


</script>

</head>
<body>


<form name="findidform" action="${contextPath }/member/findingId" method = "POST">
   <div class="ly_container hub">
            <div class="ly_body">
                <div class="container" id="contents"> 
                  
                   <div class="login_wrap">
                        <h2>날잡아</h2>
                        <fieldset>
                            <legend>ID/PW 찾기</legend>
                            <div class="tab_wrapper">
                                <ul class="tab_list tablist col2">
                                    <li data_tab_header="0" data_tab_content="#tab1">
                                        <a href="${contextPath}/member/findId.do" style="font-weight:800">아이디 찾기</a>
                                    </li>
                                    <li data_tab_header="1" data_tab_content="#tab2">
                                        <a href="${contextPath}/member/findPw.do">비밀번호 찾기</a>
                                    </li>
                                </ul>
                                    <div class="tab_container">
                                        <div id="tab1">
                                       <span class="input_row"> 
                                        <span class="input_grp">
                                            <div class="find_id_pwd">
                                                <label for="inp_name01">이름</label>
                                                <input type="text" class="inp_name01" id="name" name="userName" class="input text_uppercase" placeholder="성명" title="성명(한글) 입력" required>
                                                <p class="txt_check" id="nameChk1" style=font-size:9px;>- 이름은 2글자 이상 입력</p>
	                            				<p class="txt_check" id="nameChk2" style=font-size:9px;>- 이름은 한글 영어만 입력 가능합니다.</p>
    										 </span>
                                          </span>
                                          <span class="input_row"> 
                                        <span class="input_grp">
                                               <label for="inp_name01">휴대폰번호</label>            
                                                <div class="input_type_phone" id="phoneContainer1">
                                                    <input type="text" class="inp_phone01" id="phone" name="userPhoneNumber" class="input" placeholder="회원가입시 등록한 휴대폰번호 입력" title="휴대폰번호" required>
                                                    <input type="button" id="inp_bt" class="inputbt" value="인증번호전송" ><br>
                                                    <span class="successPhoneChk" style=font-size:9px;>휴대폰 번호 입력후 인증번호 전송을 해주십시오.</span>
                                                </div>
                                                </span>
                                              </span>  
                                              
                                              <span class="input_row" id="inputCert">
	                            				<span class="input_grp">
                                                <p class="txt_check" id="phoneChk1" style=font-size:9px;>- 휴대폰 번호를 정확히 입력해주세요.</p>
                                               </span>
                                                <label for="inp_name02">인증번호입력</label>            
                                                <div class="input_type_phone2" id="phoneContainer2">
                                                    <input type="text" id="phone2" class="inp_phone02" name="confirm" class="input2" placeholder="인증번호 입력" title="인증번호" required>
                                                    <input type="button" id="inp_bt2" class="inputbt2" value="확인" ><br>
                                                    <p class="txt_check" id="phoneChk2" style=font-size:9px;>- 휴대폰 번호를 인증해주세요.</p>
                                                     </span>
	                       						 </div>
                                            </div>
                                        </div>
                                    </div>
                                <div class="btn_block">
                                <button class="loginSubmit" id="findId" value="check" onclick="findid(this.form)">아이디 찾기</button>
                                </div>
                                
                                <!-- 이름과 전화번호가 일치하지 않을 때 -->
                                <c:if test="${check == 1 }">
                                	<script>
                                		opener.document.findidform.name.value="";
                                		opener.document.findidform.phone.value="";
                                		
                                	</script>
                                	<label style='text-align:center;'> 일치하는 정보가 존재하지 않습니다. </label>
                                </c:if>
                                <!-- 일치할 때 -->
                                <c:if test="${check ==0 }">
                                <div class="form-label-group">
                                <label style="text-align:center;">회원님의 아이디는 ' ${id}'입니다.
                                <input type="button" id="okbt" value="OK" onclick="location.href='/member/loginForm.do'">
                                </label>
                                </div>
                                </c:if>
                        </fieldset>
                    </div>
                </div>
            </div>
        </div>
    
    
     <script>
 
     
	//휴대폰 번호 인증
    var code2 = "";
    $("#inp_bt").click(function(){
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
            		$("#phoneChk2").css("display","inline-block");
            		$("#phone").attr("readonly",true);
            		code2 = data;
            	}
            }
        });
    });
    	
     //휴대폰 인증번호 대조
    $("#inp_bt2").click(function(){
    	if($("#phone2").val() == code2){
    		$(".successPhoneChk").text("인증번호가 일치합니다.");
    		$(".successPhoneChk").css("color","green");
    	}else{
    		$(".successPhoneChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
    		$(".successPhoneChk").css("color","red");
    	}
    });
    </script>   
  </form>
</body>
</html>