<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<c:set var="myArticleList" value="${myArticleList}"/>
<c:set var="pm" value="${pm}"/>
<c:set var="category" value="${category}"/> 

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>커뮤니티 게시판</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
	
  
   
</head>
<style>
    
    .mainboard {
        width: 1000px;
        margin: 0 auto;
        text-align: center;
    }

    .board1 {
        display: flex;
        margin: 0;
        padding: 0;
        height: 100px;
        border: 1px solid gainsboro;
    }
    .board_img {
        background-size: cover;
        height: 100px;
        width: 100px;
        

    }
    .boardcontent {
        display: block;
        text-align: left;
        padding-left: 30px
         
    }
    .cartegory {
        font-size: small; 
    }

    .board_title {
        
        width:100px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;  
        font-size: small;
          
    }

    .boardmaintext {
        overflow: hidden;
        width: 700px;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 2; 
        -webkit-box-orient: vertical;
        margin: 3px;
        font-size: small;
    }
    
    .userName {
        font-size: small;
        margin: 3px;

    }

    .button_list {
        width: 1000px;
        flex-direction: row;
        
    }
    .community_ul {
        background-color: aliceblue;
        list-style-type: none;
        margin: 0;
        padding: 0;
        overflow: hidden;
    }
    .community_li {
    float: left;
    padding-right: 25px;
    padding-left: 5px;
    padding-top: 5px;
    padding-bottom: 5px;
    }

    .community_li a {
        display: block;
        background-color: aliceblue;
        color: black;
        text-decoration: none;
        text-align: center;
        font-weight: bold;
    }
    .community_li a:hover {
        
        color: white;
    }

.paging {
	margin-top : 30px;
}

.pageInfo{
  	list-style : none;
  	display: inline-block;
    margin: 50px 0 0 0;
    width: 100%;
  }
  
.pageInfo ul {
	padding: 0px;
	margin: 0px;
}

.pageInfo li{
	display: inline-block;  
  	width: 10px;
    font-size: 20px;
    margin: auto;
    padding: 7px;
    font-weight: 500;
    
  }
  
  .pageInfo li a{
   text-decoration: none;
   color:black;
  }
  
 .community_bottom_div {
 margin:0 auto;
 text-align: center;
 
 }

.boardthumimg {
width: 100px;
height: 100px;
}

 pageInfo li a:link {color:black; text-decoration: none; }
 pageInfo li a:visited {color:black; text-decoration: none;}
 pageInfo li a:hover {color:black; text-decoration: underline;}
  
  .active{
  	background-color: #cdd5ec;
  	
  	}
  	
  	 #write_button {
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	background: #E6E6FA;
	color: white;
	margin-left: 920px;
	padding: 0.5rem 1rem;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 0.9rem;
	font-weight: 400;
	text-align: center;
	text-decoration: none;
	border: none;
	border-radius: 4px;
	display: inline-block;
	width: auto;
	box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px
		rgba(0, 0, 0, 0.06);
	cursor: pointer;
	transition: 0.5s;
}

#write_button:active, #write_button:hover, #write_button:focus {
	background: rgb(221, 120, 252);
	outline: 0;
}

#write_button:disabled {
	opacity: 0.5;
}
  	
  	
</style>

<body>


    <div class="mainboard">
        <h2>내가 쓴 게시글</h2>
<br>
<div class="button_list">
<ul class="community_ul">

<li id="community_li1" class="community_li"><a href="${contextPath}/board/myArticleList1.do">최신</a></li>
<li id="community_li2" class="community_li"><a href="${contextPath}/board/myArticleList1.do?search=인기">인기</a></li>
<li id="community_li3" class="community_li"><a href="${contextPath}/board/myArticleList2.do?search=계획">계획</a></li>
<li id="community_li4" class="community_li"><a href="${contextPath}/board/myArticleList2.do?search=후기">후기</a></li>
<li id="community_li5" class="community_li"><a href="${contextPath}/board/myArticleList2.do?search=자유">자유</a></li>

</ul>
</div>

		
	
		<c:forEach items="${myArticleList}" var="list">
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
               
                <p class="userName">${list.userName} &nbsp; ${list.writeDate} &nbsp; [조회수: ${list.viewCnt}]</p>
                
            </form>
            </div>
			
        </div>
        </c:forEach>
        <br>
        <div class="community_bottom_div">
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
moveForm.attr("action", "/board/myArticleList1.do");	

}else{
moveForm.find("input[name='pageNum']").val($(this).attr("href"));
moveForm.attr("action", "/board/myArticleList2.do");	
	
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

        