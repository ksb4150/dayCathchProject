 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>  
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>예약 확인창</title>
  <link rel="stylesheet" href="//cdn.jsdelivr.net/chartist.js/latest/chartist.min.css">
  <link type="text/css" rel="stylesheet" href="/css/aSalesStatus.css"/>
  <link type="text/css" rel="stylesheet" href="/css/adminside.css"/>
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
</head>
<body>
<div class="contents_area">
	<div class="soon">
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
			<div class="caption"> 매출 현황</div>
			<canvas id="myChart" height="120"></canvas>
			<div class="company_info_wrap">
				<div class="flex_box">
					<div>
						<select name="searchInfo" id="searchInfo">
							<option value="search">검색</option>
							<option value="all" selected> 전체보기 </option>
						</select>
						<input id="search" type="text" name="search"/>
						<input class="admin_btn" type="button" onclick="ajaxStart()" value="검색"/>
					</div>
				</div>
				<div id="label_info">
				</div>
				<!-- 판매현황 페이징 영역 -->
			    <div class="pageInfo_wrap" >
					<div class="pageInfo_area">
						<ul id="pageInfo" class="pageInfo">
							
						</ul>
					</div>
				</div>
				
				<form id="moveForm" method="get">	
					<input type="hidden" id="pageNum" name="pageNum" value="1"/>
					<input type="hidden" id="amount" name="amount" />
				</form>
			</div>
		</div>
	</div>
</div>
<script>
	$(document).ready(function () {
		$("#searchInfo").change(function() {
			let value = $(this).val();
			console.log(value);
			if(value === "all") {
				$('#search').val("");
				ajaxStart();
			}
		}); //검색 카테고리 변화 시 발생 이벤트 확인
		
		pm = null; //page 정보를 가져오기 위한 전역 변수
		
		var myChart = null;
		ajaxStart = function() {
			let data = new FormData();
			let moveForm = $("#moveForm");
				data.append("pageNum", moveForm.find("input[name='pageNum']").val());
				data.append("search", $('#search').val());
			
			$.ajax({
				type : "POST",
				contentType : false,
				processData : false,
				tranditional: true,
				data: data,
				dataType:'json',
				url : "${contextPath}/admin/aSalesStatus.do",
				success: function(result) {
					if(result.re === "loginPlese") {
						alert("로그인 해주세요	!");
						location.href = "${contextPath}/member/loginForm.do";
					} else if (result.re === "notSales") {
						alert("조회 결과가 없습니다.");
						location.href = "${contextPath}/page/mainPage.do";
					} else if (result.re === "notSartchSales") {
						alert("검색 결과가 없습니다.");
						location.href = "${contextPath}/admin/aSalesStatusPage.do";
					} else if(result.re === "allUserSales"){ // 모든 사업자의 매출 현황
						let keys = Object.keys(result); //total, uid1, uid2 
							console.log(keys);
						let ctx = document.getElementById('myChart').getContext('2d');
						let total = Object.values(result.total); // total의 배열 저장됨
						let TF1 = delete result.total; //true, false 반환
						let TF3 = delete result.re; //true, false 반환
						let bCompanyNames = result.bCompanyName; // uid, companyName
							console.log(bCompanyNames);
						let TF2 = delete result.bCompanyName; //true, false 반환
							pm = result.pm; //페이지 들어있음, 전역 변수
						let TF4 = delete result.pm; //true, false 반환
							console.log(pm)
						let bUserData = result;
						let buids = Object.keys(bUserData);
						
						if(myChart != undefined) {
							myChart.destroy();
						}
						
						myChart = new Chart(ctx, {
						        type: 'bar',
						        data: {
						        	labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
						        	datasets: [{
						        		type: 'bar',
						        		label: '총액',
						        		data: total,
						        		borderColor: '#444',
						        		borderWidth: 2
						        	}]
						        },
							    options: {
						    		legend: {
						    			position: 'right',
						    			labels: {
						    				fontSize: 15
						    			}
						    		},
							        scales: {
							        	xAxes: [{
							        		scaleLabel: {
							        			display: true,
							        			labelString: 'Month'
							        		}
							        	}],
							        	yAxes: [{
							        		display: true,
							        		scaleLabel: {
							        			display: true,
							        			labelString: 'Money'
							        		},
							        		ticks: {
							        			stepSize: 100000
							        		}
							        	}]
							        }
							    }
						});
						
						function addData(chart, buids, bUserData, bCompanyNames) {
							console.log(bCompanyNames)
							let divName = document.getElementById('label_info');
							$("#label_info").children().remove();
							
							for(let i=0; i<buids.length; i++) {
								let buid = buids[i];
								let RGB1 = Math.floor(Math.random() * (255+1));
								let RGB2 = Math.floor(Math.random() * (255+1));
								let RGB3 = Math.floor(Math.random() * (255+1));
								
								chart.data.datasets.push({
									type: 'line',
									label: buid,
									data: bUserData[buid],
									lineTension: 0,
									borderColor : 'rgba('+RGB1+','+RGB2+','+RGB3+')',
									backgroundColor: 'rgba(255,255,255, 0.3)'
								});
								
								let bCompanyName =  bCompanyNames[buid];
								console.log(bCompanyName);
								let childDiv = document.createElement('div');
									childDiv.classList.add('labels');
								const info = buid+' : '+ bCompanyName;
									childDiv.innerHTML = info;
									divName.appendChild(childDiv);
								
							}
						
							chart.update();
						
						}
						addData(myChart, buids, bUserData, bCompanyNames); //차트에 데이터 넣어주기
						
						pageNumFunc(pm); //페이지 정보 만들기 함수 호출
						
					} else if(result.re === "selectUserSales") { // 검색한 결과의 매출
						let keys = Object.keys(result);
						
						let ctx = document.getElementById('myChart').getContext('2d');
						let total = Object.values(result.total); // total의 배열 저장됨
						let TF1 = delete result.total; //true, false 반환
						let TF3 = delete result.re; //true, false 반환
						let goodsName = result.goodsName;
						console.log(goodsName);
						let TF2 = delete result.goodsName; //true, false 반환
							pm = result.pm; //페이지 들어있음, 전역 변수
						let TF4 = delete result.pm; //true, false 반환
							console.log(pm)
						let goodsData = result;
						console.log(goodsData);
						let goodsId = Object.keys(goodsData);
						
						if(myChart != undefined) {
							myChart.destroy();
						}
						
						myChart = new Chart(ctx, {
						        type: 'bar',
						        data: {
						        	labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
						        	datasets: [{
						        		type: 'bar',
						        		label: '총액',
						        		data: total,
						        		borderColor: '#444',
						        		borderWidth: 2
						        	}]
						        },
							    options: {
						    		legend: {
						    			position: 'right'
						    		},
							        scales: {
							        	xAxes: [{
							        		scaleLabel: {
							        			display: true,
							        			labelString: 'Month'
							        		}
							        	}],
							        	yAxes: [{
							        		display: true,
							        		scaleLabel: {
							        			display: true,
							        			labelString: 'Money'
							        		},
							        	}]
							        }
							    }
						});
						
						function addData(chart, goodsId, goodsData, goodsName) {
							let divName = document.getElementById('label_info');
							$("#label_info").children().remove();
							
							for(let i=0; i<goodsId.length; i++) {
								let goodId = goodsId[i];
								console.log(goodsId);
								let RGB1 = Math.floor(Math.random() * (255+1));
								let RGB2 = Math.floor(Math.random() * (255+1));
								let RGB3 = Math.floor(Math.random() * (255+1));
								
								chart.data.datasets.push({
									type: 'line',
									label: goodId,
									data: goodsData[goodId], //[0, 0, 0, 0, 100000, 0, 230000, ...]
									lineTension: 0,
									borderColor : 'rgba('+RGB1+','+RGB2+','+RGB3+')',
									backgroundColor: 'rgba(255,255,255, 0.3)'
								});
								
								let goodName =  goodsName[goodId];
								console.log(goodName);

								let childDiv = document.createElement('div');
									childDiv.classList.add('labels');
								const info = goodId+' : '+ goodName;
								childDiv.innerHTML = info;
								divName.appendChild(childDiv);
							}
							chart.update();
						}
						addData(myChart, goodsId, goodsData, goodsName);
						
						pageNumFunc(pm);
					} //end else
					
				}, //end success
				error: function(request, status, error) {
		          alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		      },
				complete: function() {
		      }
			});	
		} // end ajaxStart
		
		ajaxStart(); // 데이터를 가져오는 ajaxStart 함수 실행
		
		pageNumFunc = function(pm) {
			let pageInfoUl = document.getElementById('pageInfo');
			$("#pageInfo").children().remove();
			
			console.log("pm : "+pm);
			
			if(pm == "null") {
				$("#pageInfo").children().remove();
			} else {
			
				if(pm.prev) {
					var childPreLi = document.createElement('li');
					    childPreLi.classList.add('pageInfo_btn', 'previous');
					var childPreA = document.createElement('a');
						childPreA.setAttribute("href",pm.startPage-1);
						childPreA.innerHTML = "Previous";
						
						childPreLi.appendChild(childPreA);
						pageInfoUl.appendChild(childPreLi);
				}
				
				for(let i = pm.startPage; i <= pm.endPage; i++) {
					var childNumLi = document.createElement('li');
					if(pm.cri.pageNum == i) {
						childNumLi.classList.add('pageInfo_btn', 'active');
						
					} else {
						childNumLi.classList.add('pageInfo_btn');
					}
					var childNumA = document.createElement('a');
						childNumA.setAttribute("href", i);
						childNumA.innerHTML = i;
						
						pageInfoUl.appendChild(childNumLi);
						childNumLi.appendChild(childNumA);
				}
				
				if(pm.next) {
					var childNexLi = document.createElement('li');
						childNexLi.classList.add('pageInfo_btn', 'next');
					var childNexA = document.createElement('a');
						childNexA.setAttribute("href",pm.endPage+1);
						childNexA.innerHTML = "Next";
				
						pageInfoUl.appendChild(childNexLi);
						childNexLi.appendChild(childNexA);
				}
				
				$(".pageInfo a").on("click", function(e){
					let moveForm = $("#moveForm");
					e.preventDefault();
					moveForm.find("input[name='pageNum']").val($(this).attr("href"));
					ajaxStart();
				}); // 페이지 이동 클릭 시 
				
				$("#pageNum").val(pm.cri.pageNum);
				$("#amount").val(pm.cri.amount);
			}
			
		} //페이징 넘버 만들기
				
	});
</script>
</body>
</html>
