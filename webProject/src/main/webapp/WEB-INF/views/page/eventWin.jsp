<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/css/eventWin.css" />
<link rel="stylesheet" href="/css/notice.css" />
<title>event page</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<div id="container">
		<div class="inr">
			<div id="lnb" class="lnb">
				<div class="inr">
					<dl>
						<dt class="type">
							<a href="#">이벤트</a>
						</dt>
						<dd>
							<ul class="list_lnb">
								<li id="EM00000245" class="off"><a
									href="${contextPath }/page/eventList.do">진행중인 이벤트</a></li>
								<li id="EM00000246" class="on"><a
									href="${contextPath}/page/eventWin.do">당첨자 발표</a></li>
							</ul>
						</dd>
					</dl>
					<!---->
					<!---->
				</div>
			</div>
			<div class="contents">
				<div id="mainWrapper">
					<div name="uid" hidden></div>

					<!-- 게시판 제목 -->
					<h3>당첨자 발표</h3>

					<!-- 게시판 목록  -->
					<ul id="table">
						<ul id="ulTable">
							<li>
								<ul id="title">
									<li>카테고리</li>
									<li>이벤트명</li>
									<li>발표일</li>

								</ul>
							</li>

							<!-- 게시물이 출력될 영역 -->
							<%-- <c:choose>
								<c:when test="${noticeList == null}">
									<ul height="10">
										<li colspan="3">
											<p align="center">
												<span style="font-size: 12px"> 등록된 글이 없습니다. </span>
											</p>
										</li>
									</ul>
								</c:when>
								<c:when test="${noticeList != null}">
									<c:forEach var="notice" items="${noticeList}">
										<li>
											<ul class="nw">
												<li>${notice.notice_category}</li>
												<li class="left"><a
													href="${contextPath}/page/eventWin.do?noticeNO=${notice.noticeNO}">${notice.title}</a></li>
												<li>${notice.regDate}</li>

											</ul>
										</li>
									</c:forEach>
								</c:when>
							</c:choose> --%>
							<li>
								<ul class="nw">
									<li>이벤트</li>
									<li class="left">테스트입니다.</li>
									<li>2022.11.08</li>

								</ul>
							</li>
						</ul>
					</ul>


				</div>
			</div>
		</div>
	</div>

</body>
</html>