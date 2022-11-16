<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="member" value="${member}"/>
<c:set var="sumSavePoint" value="${sumSavePoint}"/>
<c:set var="sumUsePoint" value="${sumUsePoint}" /> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
   	<link rel="stylesheet" href="/css/pointCoupon.css"/>
   	<link rel="stylesheet" href="/css/side.css"/>
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
            <div class="point">
                <h2 class="point_coupon_title">내 포인트</h2>
                <div class="mypage_my_point">
                    
                    <ul class="my_point_info"> 
                        <li style="text-align: center;">
                            <img src="/img/nj-point.png"><br>
                            ${member.userName}님의 <br>포인트
                            
                        </li>
                        <li class="my_point_list" style="background-color: rgb(235, 235, 235);">
                            총 적립 포인트
                            <span>${sumSavePoint} P</span>
                        </li>
                        <li class="my_point_list" style="background-color: rgb(235, 235, 235);">
                            사용한 포인트
                            <span>${sumUsePoint} P</span>
                        </li>
                        <li class="my_point_list" style="background-color: rgb(235, 235, 235);">
                            사용 가능한 포인트
                            <span>${member.userPoint} P</span>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="coupon">
                <h3 class="point_coupon_title">내 쿠폰 함</h3>
                <div class="mypage_my_coupon">
                    <ul>
                       <li>
                        <a href="#">사용 가능 한 쿠폰 (0건)</a>
                       </li> 
                       <li>
                        <a href="#">사용 완료 쿠폰 (0건)</a>
                       </li> 
                    </ul>
                    <div>
                        <div class="my_coupon_info">
                            <p>
                                총
                                <strong>0</strong>
                                건
                            </p>
                            <table class="tbl_coupon">
                                <colgroup>
                                    <col>
                                    <col>     
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="col">쿠폰명</th>
                                        <th scope="col">쿠폰 상세정보</th>
                                    </tr>

                                </thead>
                                <tbody>
                                    <tr>
                                        <td colspan="2">사용가능한 쿠폰이 없습니다.</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                    
                
            </div>

            </div>
        </div>
    </div>
</body>
</html>