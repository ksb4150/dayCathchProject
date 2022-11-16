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
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="/css/findPw.css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="/js/find.js"></script>
<script>
	
	$(function findPwd(obj){
		$("#inp_bt").click(function(){
			$.ajax({
				url : "${contextPath}/member/findingPwd",
				type : "POST",
				data : {
					userId : $("#id").val(),
					userPhoneNumber : $("#phone").val()
				},
				success : function(result) {
					alert(result);
				},
			})
		});
		Obj.action="${contextPath}/member/loginForm.do";
        Obj.submit();
	})
	 



</script>

</head>
<body>
	<form method="post" action="${contextPath}" name="findform">
		<div class="ly_container hub">
			<div class="ly_body">
				<div class="container" id="contents">
					<!-- s: 아이디, 비밀번호 찾기 -->
					<div class="login_wrap">
						<h2>날잡아</h2>
						<fieldset>
							<legend>ID/PW 찾기</legend>
							<div class="tab_wrapper">
								<ul class="tablist col2">
									<li data_tab_header="0" data_tab_content="#tab1"><a
										href="${contextPath}/member/findId.do">아이디 찾기</a></li>
									<li data_tab_header="1" data_tab_content="#tab2"><a
										href="${contextPath}/member/findPw.do"
										style="font-weight: 800">비밀번호 찾기</a></li>
								</ul>
								<div class="find_id_pwd">
									<label for="inp_id">ID</label> <input type="text" id="id"
										class="input" name="userId" placeholder="이메일 형식 ID를 입력하세요."
										title="ID입력" maxlength="50" required>

									<div id="emailcheck"></div>
								</div>
								<div class="find_id_pwd">
									<label for="inp_id">휴대폰번호</label>
									<div class="input_type_phone" id="phoneContainer1">
										<input type="text" class="inp_phone01" id="phone"
											name="userPhoneNumber" class="input"
											placeholder="회원가입시 등록한 휴대폰번호를 입력하세요." title="휴대폰번호" required>
									</div>
								</div>
								<div class="find_id_pwd">
									<button type="button" id="inp_bt" class="inputbt">임시번호전송</button>
									<button type="button" id="loginSubmit2" onclick="location.href='/member/loginForm.do'">로그인으로</button>
								</div>
							</div>
						</fieldset>
					</div>

				</div>
			</div>
		</div>
	</form>
</body>
</html>