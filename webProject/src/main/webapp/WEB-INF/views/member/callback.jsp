<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>Insert title here</title>
   <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
<input type="hidden" id="userType" name="userType" value="1"/ >
   <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
   <script>
         var naverLogin = new naver.LoginWithNaverId(
         {
            clientId: "wjpqIKoyLWVBkhXybSoM",
            callbackUrl: "http://localhost:8080/page/mainPage.do",
            isPopup: false,
            callbackHandle: true
         }
      );
      naverLogin.init();
      
      window.addEventListener('load', function () {
         naverLogin.getLoginStatus(function (status) {
            
        	 if (status) {
               var name = naverLogin.user.getName();
               var email = naverLogin.user.getEmail();
                                                           
               console.log(name);
               console.log(email);
               
                                         
                $.ajax({
                   url: '/member/naverSave',
                   type: 'post',
                   dataType: 'text',
                   data: ({'n_name':name,'n_email':email, 'userType':1}),
                   success: function(result) {
                	   if(result=='ok') {
	                	   alert("성공")
	                	   location.replace("${contextPath}/page/mainPage.do")                		   
                	   } else if(result=='no'){
	                	   alert("실패")
	                	   location.replace("${contextPath}/member/loginForm.do")                		   
                	   }
                   },
                   error: function(result) {
                	   alert("오류발생")
                   }
               })
                              
            } else {
               console.log("callback 처리에 실패하였습니다.");
            }
         });
      });
   </script>
</body>
</html>