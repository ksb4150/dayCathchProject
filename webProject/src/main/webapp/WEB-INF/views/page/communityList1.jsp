<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<c:set var="communityList" value="${communityList}"/>
<c:set var="pm" value="${pm}"/>
<c:set var="category" value="${category}"/> 

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>커뮤니티 게시판</title>
    <link type="text/css" rel="stylesheet" href="/css/communityList1.css" />
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<style>
    
</style>

<body>


    <div class="mainboard">
    <div class="main_tit">
        <h2>커뮤니티 게시판</h2>
        </div>
<br>
<div class="button_list">
<ul class="community_ul">

<li id="community_li1" class="community_li"><a href="${contextPath}/page/communityList1.do">최신</a></li>
<li id="community_li2" class="community_li"><a href="${contextPath}/page/communityList1.do?search=인기">인기</a></li>
<li id="community_li3" class="community_li"><a href="${contextPath}/page/communityList2.do?search=계획">계획</a></li>
<li id="community_li4" class="community_li"><a href="${contextPath}/page/communityList2.do?search=후기">후기</a></li>
<li id="community_li5" class="community_li"><a href="${contextPath}/page/communityList2.do?search=자유">자유</a></li>

</ul>
</div>

		
	
		<c:forEach items="${communityList}" var="list">
       <div class="board1">
            <div class="board_img">
                <!--썸네일-->
                 <c:choose>
                <c:when test="${list.mainImageFileName != ''}">
                <img class ="boardthumimg" src="${contextPath}/bThumbDownload.do?articleNO=${list.articleNO}&mainImageFileName=${list.mainImageFileName}" alt="${list.articleNO}" style="height: 100px; width: 100;"/>
                </c:when>
                <c:otherwise> 
                이미지 없음
                 </c:otherwise>
                 </c:choose>
            </div>
			
            <div class="boardcontent">
            <form id="articleInfo${list.articleNO}" method="post">
            <input type="hidden" name="articleNO" value="${list.articleNO}"/>
                <div class="cartegory">
                    <!--카테고리-->
                <b style="color: rgb(111, 167, 250);">${list.articleCategory}</b>
                 </div>
                 <!--제목 클릭시 게시글 이동-->
                <b class="board_title">
                ${list.title}&nbsp; (${list.commentCnt})
                <input type="hidden" name="articleNO" value="${list.articleNO}"/>
                </b>
                
               <br><br>
               
                <p class="userName">${list.userName} &nbsp; ${list.writeDate} &nbsp; ♥<b>(${list.likecount})</b> &nbsp; [조회수: ${list.viewCnt}]</p>
                
            </form>
            </div>
			
        </div>
        </c:forEach>
        <br>
        <div class="community_bottom_div">
        
        <form action="/page/findArticleList.do" method="post" class="findArticleform">
				<input type="text" name="search"> <input type="submit"
			value="검색">
		</form>
        
        <div class="paging">
        <div class="pageInfo_wrap">
								<div class="pageInfo_area">
									<ul id="pageInfo" class="pageInfo">
	
										<!-- 이전페이지 버튼 -->
										<c:if test="${pm.prev}">
											<li class="pageInfo_btn previous"><a
												href="${pm.startPage-1}">Previous</a></li>
										</c:if>
	
										<!-- 각 번호 페이지 버튼 -->
										<c:forEach var="num" begin="${pm.startPage}"
											end="${pm.endPage}">
											<li class="pageInfo_btn ${pm.cri.pageNum == num ? "active":"" }"><a
												href="${num}">${num}</a></li>
										</c:forEach>
	
										<!-- 다음페이지 버튼 -->
										<c:if test="${pm.next}">
											<li class="pageInfo_btn next"><a
												href="${pm.endPage + 1 }">Next</a></li>
										</c:if>
	
									</ul>
								</div>
							</div>
							


							<form id="moveForm" method="get">
								<input type="hidden" name="pageNum" value="${pm.cri.pageNum }">
								<input type="hidden" name="amount" value="${pm.cri.amount }">
								<input class="search_for_category" type="hidden" name="search" value="${category}">
							</form>
							
	
						</div>
						
						<button id="write_button"><a href="${contextPath}/board/summernote.do" style="color: white; text-decoration: none;">글쓰기</a></button>
						
 </div>
 
 </div>
 
   <script>
    
    //페이징 관련
let moveForm = $("#moveForm");
let search = $(".search_for_category").val();

$(".pageInfo a").on("click", function(e){
e.preventDefault();

if(search == "인기" || search == ""){

moveForm.find("input[name='pageNum']").val($(this).attr("href"));
moveForm.attr("action", "/page/communityList1.do");	

}else if(search == "계획" || search == "후기" || search == "자유"){
moveForm.find("input[name='pageNum']").val($(this).attr("href"));
moveForm.attr("action", "/page/communityList2.do");	
	
} else {
	moveForm.find("input[name='pageNum']").val($(this).attr("href"));
	moveForm.attr("action", "/page/findArticleList.do");	
}

moveForm.submit();
});	


//게시글 제목 클릭시
$(".board_title").on("click", function(){

	  let articleNO = $(this).children("input").val();
	  let form = document.getElementById("articleInfo"+articleNO);
	  
	  form.action = "${contextPath}/board/viewBoard.do";
	  form.submit();
	  
  });


    </script>
 
 </body>
 </html>

        