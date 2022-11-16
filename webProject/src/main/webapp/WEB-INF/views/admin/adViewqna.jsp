<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="viewqna" value="${viewqna}"/>
<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link type="text/css" rel="stylesheet" href="/css/viewqna.css"/>
        <link type="text/css" rel="stylesheet" href="/css/header.css"/>
        <link type="text/css" rel="stylesheet" href="/css/adminside.css"/>
		<title>글 보기</title>
	
	<style>
		#tr_btn_modify {
			display: none;
		}
	</style>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
		function backToList(obj) {
			obj.action="${contextPath}/admin/adQnaboard.do";
			obj.submit();
		}	
		
		
		function fn_removeqna(url, csNO) {
			alert('글을 삭제하시겠습니까?');
			var form = document.createElement("form");
			    form.setAttribute("method", "post");
			    form.setAttribute("action", url);
		    var csNOInput = document.createElement("input");
			    csNOInput.setAttribute("type","hidden");
			    csNOInput.setAttribute("name","csNO");
			    csNOInput.setAttribute("value", csNO);
			
				
				form.appendChild(csNOInput);
				document.body.appendChild(form);
				form.submit();
		}
			
		function fn_reply_form(url,originNo) {
			alert('답글을 작성하시겠습니까?');
			var form = document.createElement("form");
				form.setAttribute("method", "post");
				form.setAttribute("action", url);
			var originNoInput = document.createElement("input");
				originNoInput.setAttribute("type", "hidden");
				originNoInput.setAttribute("name", "csNO");
				originNoInput.setAttribute("value", originNo);
				
				form.appendChild(originNoInput);
				document.body.appendChild(form);
				form.submit();
		}
			
		
		
		
		
	</script>
</head>
<body>
<br>
		<div class="contents_area">
		<div class="soon">
			<div class="userListDiv1">
			<section class="mypagesidebar0">
			<div>
				<ul class="mypagesidebar_ul">
					<li class="sidebardiv1"><a class="mypage_sidebar_a"
						href="${contextPath}/admin/adminMain.do"><h3>관리자 페이지</h3></a></li>
					<li><a class="mypage_sidebar_a"
						href="${contextPath}/admin/aSalesStatusPage.do"><h3>매출	현황</h3></a></li>
					<hr>
					<li><a class="mypage_sidebar_a"
						href="${contextPath }/admin/adminOrderList"><h3>주문 취소 현황</h3></a>
					</li>
					<hr>
					<li><details>
							<summary>
								<h3>회원 관리</h3>
							</summary>
							<hr>
							<a class="mypage_sidebar_b"
								href="${contextPath}/admin/userList.do"><h4>사용자회원 목록</h4></a>
							<hr>
							<a class="mypage_sidebar_b"
								href="${contextPath}/admin/buserList.do"><h4>사업자회원 목록</h4></a>

						</details></li>
					<hr>
					<li><details>
							<summary>
								<h3>상품 관리</h3>
							</summary>
							<hr>
							<a class="mypage_sidebar_b"
								href="${contextPath}/admin/adminGoodsList.do"><h4>상품
									목록</h4></a>
							<hr>
							<a class="mypage_sidebar_b"
								href="${contextPath}/admin/adminGoodsList2.do"><h4>상품
									승인</h4></a>
						</details></li>

					<hr>

					<li><a class="mypage_sidebar_a" href="${contextPath}/admin/adminPointHistory.do"><h3>포인트
								내역 조회</h3></a></li>
					<hr>
					<li><details>
							<summary>
								<h3>고객센터 관리</h3>
							</summary>
							<hr>
							<a class="mypage_sidebar_b"
								href="${contextPath}/admin/adNotice.do"><h4>공지사항</h4></a>
							<hr>
							<a class="mypage_sidebar_b"
								href="${contextPath}/admin/adQnaboard.do"><h4>1대1문의</h4></a>
							<hr>
							<a class="mypage_sidebar_b"
								href="${contextPath}/admin/adFaqList.do"><h4>자주하는 질문</h4></a>
						</details></li>
					<hr>
					<li>
						<details>
							<summary>
								<h3>커뮤니티 관리</h3>
							</summary>
							<hr>
							<a class="mypage_sidebar_b" href="${contextPath}/admin/adminCommunityList.do"><h4>게시글 관리</h4></a>
							<hr>
							<a class="mypage_sidebar_b" href="${contextPath}/admin/adminCommentList.do"><h4>댓글 관리</h4></a><hr>
							<a class="mypage_sidebar_b"	href="${contextPath}/admin/adminReviewList.do"><h4>리뷰 관리</h4></a>
						</details>
					</li>
				</ul>
			</div>
		</section>
				<div class="contents">
				<form name="frmqnaView" method="post" action="${contextPath}" enctype="multipart/form-data">
                <!-- 제목 -->
                 <h2>나의 문의 내역</h2>
                <table align="center">
                    <tr align="center">
                        <td align="center" id="inp_csNO" bgcolor="#FFFFFF"> 글번호 </td>
                        <td>
                            <input type="text" name="csNO" id="inp_csNO2" value="${viewqna.csNO}" disabled />
                            <input type="hidden" name="originNo" id="inp_csNO2" value="${viewqna.originNo}" disabled />
                            
                            
                        </td>
                    </tr>
                    <tr align="center">
                        <td align="center" id="inp_writer" bgcolor="#FFFFFF"> 작성자 </td>
                        <td>
                            <input type="text" value="${viewqna.writer}" id="inp_writer2" name="userName" disabled />
                        </td>
                    </tr>
                    <tr align="center">
                            <td align="center" id="inp_title" bgcolor="#FFFFFF"> 제목 </td>
                            <td>
                                <input type="text" id="i_title" value="${viewqna.title}"  name="title"  disabled />
                            </td>
                    </tr>
                    <tr align="center">
                            <td align="center" id="inp_content" bgcolor="#FFFFFF"> 내용 </td>
                            <td>
                                <textarea id="i_content" name="txtContent"  disabled >
                                      ${viewqna.txtContent} 
                                </textarea>
                            </td>
                    </tr>
                    
            
                    <tr>
                        <td align="center" id="inp_writeDate" bgcolor="#FFFFFF"> 등록일자 </td>
                        <td>
                            <input type="text" id="inp_writeDate2" value="<fmt:formatDate value="${viewqna.writeDate}"/>" disabled />
                        </td>
                    </tr>
                    
                    
                    <tr id="tr_btn">
                        <td colspan="2" align="center">
                            <input type="button" value="삭제하기" onclick="fn_removeqna('${contextPath}/admin/RemoveQna.do', ${viewqna.csNO})" >
                            <input type="button" value="리스트로" onclick="backToList(this.form)" >
                            <input type="button" value="답글쓰기" onclick="fn_reply_form('${contextPath}/admin/qnaComment.do', ${viewqna.csNO})" > 
                        </td>
                    </tr>
                
                </table>
        </form>
        </div> 
        </div>
        </div>
       </div>
</body>
</html>