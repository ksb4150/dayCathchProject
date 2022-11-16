<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link type="text/css" rel="stylesheet" href="/css/qna.css"/>
    <link type="text/css" rel="stylesheet" href="/css/side.css"/>
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
        <div class="container">
            <!-- 1:1문의 -->
            <div class="qna_wrap">
            <form action="/mypage/qna" method="post">
              <h2 style="text-align:center;">1:1 문의</h2>
                  <div class="tab_wrapper">
                    <div class="tab_list_wrap">
                  <ul class="tab_list tablist col2">
                    <li data-tab-content="#tab1"><a href="${contextPath}/mypage/qna.do"> 문의글 작성 </a></li>
                    <li data-tab-content="#tab2"><a href="${contextPath}/mypage/qnaboard.do"> 나의 문의내역 </a></li>
                  </ul>
                </div>
                  <div class="tab_container">
                      <div id="tab1">
                      <div class="qna">
                        <div class="category" id="qnacategory" >
                            <label for="category">카테고리 분류</label>
                            <select class="select_category" class="input" id="category" title="category" name="csCategory" >
                              <option>숙박</option>
                              <option>항공</option>
                              <option>티켓</option>                          
                            </select>
                        </div>
                        <div class="input_uid" id="uid" value="${member.uid}" hidden></div>                                                     
                        <div class="input_uid" id="userType" value="${member.userType}" hidden></div>                                                     
                        <label for="inp_phone">휴대폰번호</label>
                        <div class="input_phone" id="phoneContainer1">
                            <input type="text" id="inp_phone" class="input" title="휴대폰번호" name="userPhoneNumber" >
                        </div>
    
                        <label for="inp_writer">작성자</label>
                        <div class="input_writer" id="writer" hidden></div>
                        <input type="text" id="inp_writer" class="input" title="email입력" name="writer" >
                      </div>
    
                      <label for="inp_id">주문예약번호</label>
                      <div class="input_order" id="ordernumber" hidden></div>
                       <input type="text" id="inp_order" class="ordernumber" name="ordersNO" >
                      </div>
                      
                      <label for="inp_title">제목</label>
                      <div class="input_title" id="title" hidden></div>
                       <input type="text" id="inp_title" class="title" name="title" >
                      </div>
                        
                        <div class="inp_content">
                            <label for="inp_content">내용</label>
                            <input type="textarea" id="inp_content" rows="10" class="inp_content" name="txtContent" placeholder="내용을 입력하세요" >
                            </div>
                      </div>
                      <button id="Submit" type="submit" onclick="${contextPath}/mypage/qnaboard">등록하기</button>
                </div>              
            </div>
            </form>
           </div>
        </div>
      </div>
    </div>
    </div>
    </div>
    </div>
</body>
</html>