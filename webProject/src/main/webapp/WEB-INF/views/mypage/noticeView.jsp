<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="viewNotice" value="${viewNotice}"/>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>게시판</title>
    <link rel="stylesheet" href="/css/side.css" />
    <link rel="stylesheet" href="/css/noticeView.css" />
    <link type="text/css" rel="stylesheet" href="/css/header.css"/>
	<style>
		#tr_btn_modify {
			display: none;
		}
	</style>
	
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
		
		function backToList(obj) {
			obj.action="${contextPath}/mypage/notice.do";
			obj.submit();
		}	
		
		function fn_enable(obj) {
			alert('글을 수정하시겠습니까?');
			document.getElementById("i_title").disabled=false;
			document.getElementById("i_content").disabled=false;
			document.getElementById("tr_btn_modify").style.display="block";
			document.getElementById("tr_btn").style.display="none";
		}
		
		function fn_modify_notice(obj) {
			
			obj.action = "${contextPath}/mypage/noticeMod.do";
			obj.submit();
		}
		
		function fn_removeNotice(url, noticeNO) {
			alert('삭제하기');
			var form = document.createElement("form");
			    form.setAttribute("method", "post");
			    form.setAttribute("action", url);
		    var noticeNOInput = document.createElement("input");
			    noticeNOInput.setAttribute("type","hidden");
			    noticeNOInput.setAttribute("name","noticeNO");
			    noticeNOInput.setAttribute("value", noticeNO);
			
				
				form.appendChild(noticeNOInput);
				document.body.appendChild(form);
				form.submit();
		} 
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
   
     <div class="container">
    <form name="frmNotice" method="post" action="${contextPath}" enctype="multipart/form-data">
        <table align="center">
        <div class="page-header">
           <h2 style="padding:30px; margin-bottom:30px; text-align:center; font-weight:300;">공지사항</h2>
        </div>
        <input id="notice_uid" type="hidden" value="${member.uid}" name="uid" />
       
        </tr>
			<tr align="center" >
				<td width=150 align="center" id="inp_noticeNO" bgcolor="#FFFFFF"> 글번호 </td>
				<td>
					<input type="text" name="noticeNO" id="inp_noticeNO2" value="${viewNotice.noticeNO}" disabled />
					<input type="hidden" name="noticeNO" value="${viewNotice.noticeNO}" disabled/>
				</td>
			</tr>
			
			<tr align="center">
				<td width="150" align="center" id="inp_hit" bgcolor="#FFFFFF"> 조회수 </td>
				<td>
					<input type="text" id="inp_hit2" value="${viewNotice.view_cnt}" name="view_cnt" disabled />
				</td>
			</tr>
			<tr align="center">
					<td width="150" align="center"  id="inp_title" bgcolor="#FFFFFF"> 제목 </td>
					<td>
						<input type="text" id="i_title" value="${viewNotice.title}" name="title"  disabled />
					</td>
			</tr>
			<tr align="center" >
					<td width="150" align="center" id="inp_content" bgcolor="#FFFFFF"> 내용 </td>
					<td>
						<textarea rows="20" cols="60" name="content" id="i_content" disabled>
						 ${viewNotice.content}
					</textarea>	
					</td>
			</tr>
			
	
			<tr>
				<td width="150" align="center" id="inp_date" bgcolor="#FFFFFF"> 등록일자 </td>
				<td>
					<input type="text" id="inp_date2" value="<fmt:formatDate value="${viewNotice.regDate}"/>" disabled />
				
				</td>
			</tr>
			
			<tr id="tr_btn">
				<td colspan="2" align="center">
				<c:choose>
				<c:when test="${member.userType==0}">
					<button type="button" ><a href="/mypage/modNotice.do?noticeNO=${viewNotice.noticeNO}">수정하기</a></button>  
					<input type="button" value="삭제하기" onclick="fn_removeNotice('${contextPath}/mypage/noticeRemove.do', ${viewNotice.noticeNO})" >
					</c:when>
					</c:choose>
					<input type="button" value="리스트로" onclick="backToList(frmNotice)" >
				</td>
			</tr>
		</table>
      </form>
    </div>
    </div>
    </div>
</body>
</html>
