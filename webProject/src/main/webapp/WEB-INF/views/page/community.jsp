<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="boardAsc" value="${boardAscMap.boardAsc}" />
<c:set var="boardCnt" value="${boardCntMap.boardCntList}" />
<c:set var="hotArticle" value="${hotArticle.hotArticle}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>searchTool</title>
    <link type="text/css" rel="stylesheet" href="/css/community.css" />
    <link rel="stylesheet" href="/css/jquery.datetimepicker.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <script type="text/javascript" src="/js/jquery.datetimepicker.full.min.js"></script>

    <script type="text/javascript">

        $(document).ready(function () {
            fn_egov_init_date();
            
            $(".hotArticleWrap").on("click", function(){

          	  let articleNO = $(this).children("input").val();
          	  let form = document.getElementById("articleInfo"+articleNO);
          	  
          	  form.action = "${contextPath}/board/viewBoard.do";
          	  form.submit();
          	  
            });
        })

        // 선택 날짜를 최대 최소값으로 설정해 그 외의 날짜 선택 비활성화
        function fn_egov_init_date() {
            var $startDate = $('#startDate');
            var $endDate = $('#endDate');
            $startDate.datetimepicker({
                timepicker: false,
                lang: 'ko',
                format: 'Y-m-d',
                scrollMonth: false,
                scrollInput: false,
                onShow: function (ct) {
                    this.setOptions({
                        maxDate: $endDate.val() ? $endDate.val() : false
                    })
                },
            });

            $endDate.datetimepicker({
                timepicker: false,
                lang: 'ko',
                format: 'Y-m-d',
                scrollMonth: false,
                scrollInput: false,
                onShow: function (ct) {
                    this.setOptions({
                        minDate: $startDate.val() ? $startDate.val() : false
                    })
                }
            });

        }
        
        function summernoteFalse() {
        	alert("회원만 가능합니다!");
        	return false;
        }
    </script>
    </head>
<body>
    <div class="contents_area">
        <div class="backgroundImg">
        </div>
        <div class="contents">    
           <div class="searchBox">
           <div class="iconBar">
           <ul>
               <li>
                   <a href="${contextPath}/page/goodsPage.do">
                       <p class="iconHotel">
                           <img src="/img/hotel.png" />
                       </p>
                       <p class="iconFont">숙소</p>
                   </a>
               </li>
               <li>
                   <a href="${contextPath}/page/goodsPage2.do">
                       <p class="iconTourism">
                           <img src="/img/tourism.png" />
                       </p>
                       <p class="iconFont">투어&티켓</p>
                   </a>
               </li>
               <li>
                   <a href="${contextPath}/page/airport.do">
                       <p class="iconAirpalne">
                           <img src="/img/airplane.png" />
                       </p>
                       <p class="iconFont">항공</p>
                   </a>
               </li>
               <li>
               	<a href="${contextPath }/page/festivalPage.do">
                       <p class="iconFestival">
                           <img src="/img/festival.png" />
                       </p>
                   </a>
                   <p class="iconFont">즐길거리</p>
               </li>
               <li> <a href="${contextPath}/page/community.do" >
                       <p class="iconCommunity">
                           <img src="/img/communityColor.png" />
                       </p>
                       <p class="iconFont">커뮤니티</p>
                   </a>
               </li>
               <li>
                   <a href="${contextPath}/page/eventList.do">
                       <p class="iconEvent">
                           <img src="/img/event.png" />
                       </p>
                       <p class="iconFont">이벤트</p>
                   </a>

               </li>
          </ul>
       </div>
                <form id="search" action="#">
	                <div class="destination">
		                <p>관련 게시글 검색</p>
		                <input type="text" name="goodsSubCategory" id="goodsSubCategory" placeholder="원하는 지역을 입력해주세요." />
		            </div>
		            <div class="searchFormButton">
		                <input type="submit" id="searchSubmit" value="검색">
		            </div>
                </form>
            </div>
            <div class="newBoardWrap">
                <div class="newStory">
                    <div class="communityCategory">
                        <h4>오늘의 스토리</h4> 
                    </div>
                    <div class="newArticle">
                        <div class="newArticleImg">
                            <img src="${contextPath}/bThumbDownload.do?articleNO=${hotArticle.articleNO}&mainImageFileName=${hotArticle.mainImageFileName}"/>
                            <a href="#">
                                <div class="see">
                                    보러가기
                                </div>
                            </a>
                        </div>
                        <div class="articleTitle">
                            ${hotArticle.title}
                        </div>
                    </div>
                </div>
                <div class="newEvent">
                    <div class="communityCategory">
                        <h4>오늘의 이벤트</h4>
                    </div>
                     <div class="newEventImg">
                        <div class="slider">
                            <div><img src="/img/1yearEvent.JPG"></div>
                            <div><img src="/img/thankEvent.JPG"></div>
                            <div><img src="/img/bestEvent.JPG"></div>
                        </div>
                     </div>
                     <!-- <main class="jsd">
                        <section class="card1 jsd-card--fixed">
                            <div class="inner">
                                <h1>Event 1</h1>
                                <div>
                                    <img src="img/1yearEvent.JPG"/>
                                </div>
                            </div>
                        </section>
                        <section class="card2 jsd-card--next">
                            <div class="inner">
                                <h1>Event 2</h1>
                                <div>
                                    <img src="img/thankEvent.JPG"/>
                                </div>
                            </div>
                        </section>
                        <section class="card3 jsd-card">
                            <div class="inner">
                                <h1>Event 3</h1>
                                <div>
                                    <img src="img/bestEvent.JPG"/>
                                </div>
                            </div>
                        </section>
                     </main> -->
                </div>
            </div>

            <div class="hotBoardWrap">
                <div class="hot_board_category">
                    <ul>
                        <li><a href="${contextPath}/page/communityList1.do"><h4>최신순</h4></a></li>
                        <li><h4>|</h4></li>
                        <li><a href="${contextPath}/page/communityList1.do?search=인기"><h4>인기순</h4></a></li>
                       <li><h4>|</h4></li>
                        <li><a href="${contextPath}/page/communityList1.do?search=인기"><h4>조회순</h4></a></li>
                        <button class="btn" style="float:right;"><a href="${contextPath}/page/communityList1.do"><h4>더보기</h4></a></button>
                    </ul>
                    
                </div>
                <div class="hotArticlesWrap">
	            	<c:if test="${not empty boardCnt && boardCnt != 'null'}">
	            		<c:forEach var="boardCnt" items="${boardCnt}" varStatus="status" >
	            			<form id="articleInfo${boardCnt.articleNO}" method="post">
		            			<div class="hotArticleWrap">
		            				<input type="hidden" name="articleNO" value="${boardCnt.articleNO}"/>
			                        <div class="hot_plan_img">
			                            <img src="${contextPath}/bThumbDownload.do?articleNO=${boardCnt.articleNO}&mainImageFileName=${boardCnt.mainImageFileName}" alt="${boardCnt.articleNO}"/>
			                        </div>
			                        <div class="hot_plan_tit hot_tit">
			                            [${boardCnt.articleCategory}] ${boardCnt.title}
			                        </div>
			                        <div class="hot_plan_user hot_user">
			                            ${boardCnt.userName} / ${boardCnt.viewCnt}
			                        </div>
		                        </div>
	            			</form>
	            		</c:forEach>
	            	</c:if>
            	</div>
            </div> 

            <div class="hotBoardWrap">
	            <div class="hot_board_category">
	                <ul>
	                    
	                    <c:choose>
	                    	<c:when test="${isLogOn == true && member != null }">
	                    	 	<button class="btn" style="float:right;"><a href="${contextPath}/board/summernote.do"><h4>글쓰기</h4></a></button>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<button class="btn" style="float:right;"><a onclick="summernoteFalse()"><h4>글쓰기</h4></a></button>
	                    	</c:otherwise>
	                    </c:choose>
	                   
	                </ul>
	            </div>
	            <div class="hotArticlesWrap">
	            	<c:if test="${not empty boardAsc && boardAsc != 'null'}">
	            		<c:forEach var="boardAsc" items="${boardAsc}" varStatus="status" >
	            			<form id="articleInfo${boardCnt.articleNO}" method="post">
		            			<div class="hotArticleWrap">
		            				<input type="hidden" name="articleNO" value="${boardAsc.articleNO}"/>
			                        <div class="hot_plan_img">
			                            <img src="${contextPath}/bThumbDownload.do?articleNO=${boardAsc.articleNO}&mainImageFileName=${boardAsc.mainImageFileName}" alt="${boardAsc.articleNO}"/>
			                        </div>
			                        <div class="hot_plan_tit hot_tit">
			                            [${boardAsc.articleCategory}] ${boardAsc.title}
			                        </div>
			                        <div class="hot_plan_user hot_user">
			                            ${boardAsc.userName} / ${boardAsc.viewCnt}
			                        </div>
		                        </div>
	            			</form>
	            		</c:forEach>
	            	</c:if>
	            </div>
	        </div> 
	        <div class="area_info">
		        <div class="container">
		            <div class="area_cs_info">
		                <div class="cs_info">
		                    <ul>
		                        <li>
		                            <h1 class="area_cs_number"><img src="/img/csicon1.png" alt=""><br>상담전화 <br>1999-1999
		                            </h1>
		                        </li>
		                        <li>
		                            <h2 class="area_cs_time">평 일 09:00 ~ 19:00 <br>주말 및 공휴일 휴무</h2>
		                        </li>
		                    </ul>
		                </div>
		                <div class="mypage_info">
			                <ul>
			                    <li><button class="mypage_info_btn" onclick="location.href='${contextPath}/mypage/guidelineReservation.do'">예약안내</button> </li>
			                    <li><button class="mypage_info_btn" onclick="location.href='${contextPath}/mypage/guidelinePay.do'">결제방법</button> </li>
			                    <li><button class="mypage_info_btn" onclick="location.href='${contextPath}/mypage/guidelinePointcoupon.do'">포인트</button> </li>
			                    <c:choose>
					                <c:when test="${isLogOn == true && member != null }">
					                	<li><button class="mypage_info_btn" onclick="location.href='${contextPath }/mypage/mypage.do'">마이페이지</a></li>
					                </c:when>
					                <c:otherwise>
					                	<li><button class="mypage_info_btn" onclick="nonMember()">마이페이지</button> </li>
					                </c:otherwise>
				                </c:choose>
			                    <li><button class="mypage_info_btn" onclick="location.href='${contextPath}/mypage/notice.do'">공지사항</button> </li>
			                    <li><button class="mypage_info_btn" onclick="location.href='${contextPath}/page/eventList.do'">이벤트</button> </li>
			                </ul>
			            </div>
		            </div>
		       </div>
	        </div>
        </div>
    </div>
</body>
</html>