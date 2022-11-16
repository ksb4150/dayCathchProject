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
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
  <link rel="stylesheet" href="/css/side.css"/>
  <style>
	#goodsNames{
		line-height: 30px;
		background-color: whitesmoke;
		padding: 10px;
		border-radius: 10px;
	}
	
	.goodName {
		width: 400px;
		display: inline-block;
		margin: auto;
		border-bottom: 1px solid #fff;
		padding-left: 20px;
	}

	.contents .caption {
		width: 100%;
		text-align: center;
	    margin-left: 50px;
	    margin-bottom: 10px;
	    font-size: 24px;
	    color: rgb(49, 49, 49);
	    font-weight: 300;
	}
  </style>
</head>
<body>
<div class="contents_area">
	<div class="soon">
		<section class="mypagesidebar0" style="margin-top: 28px;">
		    <div>
			    <ul class="mypagesidebar_ul">
			        <li class="sidebardiv1">
			        	<a class="mypage_sidebar_a" href="${contextPath}/mypage/businessPage.do"><h3>사업자 페이지</h3></a>
			        </li>
			        <li>
			            <a class="mypage_sidebar_a" href="${contextPath}/mypage/businessModMemberPage.do"><h3>개인정보수정</h3></a>
			        </li>
			                <hr>
			        <li>
			            <a class="mypage_sidebar_a" href="${contextPath}/order/bOrderCheck.do"><h3>예약 현황</h3></a> 
			        </li>
			                <hr>
			        <li>
			            <details>
			                <summary><h3>상품 관리</h3></summary>
			                <hr>
			                <a class="mypage_sidebar_b" href="${contextPath}/goods/goodsWrite1.do"><h4>숙소 등록</h4></a>
			                <hr>
			                <a class="mypage_sidebar_b" href="${contextPath}/goods/goodsWrite2.do"><h4>투어&티켓 등록</h4></a>
			                <hr>
			                <a class="mypage_sidebar_b" href="${contextPath}/goods/goodsList.do"><h4>상품 목록</h4></a>
			                <hr>
			                <a class="mypage_sidebar_b" href="#"><h4>상품 리뷰</h4></a>
			            </details>
			        </li>
			            <hr>
			        <li>
			        <li>
			        	<a class="mypage_sidebar_a" href="${contextPath}/order/bSalesStatusPage.do"><h3>매출 관리</h3></a>
			        </li>
			    </ul>
			</div>
		</section>
		<div class="contents">
			<div class="caption"> 매출 현황</div>
			<canvas id="myChart"></canvas>
			<div id="goodsNames"></div>
		</div>
	</div>
</div>
<script>
	$(document).ready(function () {
		$.ajax({
			type : "POST",
			contentType : false,
			processData : false,
			tranditional: true,
			dataType:'json',
			url : "${contextPath}/order/bSalesStatus.do",
			success: function(result) {
				if(result.re === "loginPlese") {
					alert("로그인 해주세요!");
					location.href = "${contextPath}/member/loginForm.do";
				} else if (result.re === "notSales") {
					alert("조회 결과가 없습니다.");
					location.href = "${contextPath}/page/mainPage.do";
				} else {
					let keys = Object.keys(result);
					
					let ctx = document.getElementById('myChart').getContext('2d');
					let total = Object.values(result.total); // total의 배열 저장됨
					let TF1 = delete result.total; //true, false 반환
					let goodsName = result.goodsName;
					console.log(goodsName);
					let TF2 = delete result.goodsName; //true, false 반환
					let goodsData = result;
					let goodsId = Object.keys(goodsData);
					
					if(myChart != undefined) {
						myChart.destroy();
					}
					
					var myChart = new Chart(ctx, {
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
						for(let i=0; i<goodsId.length; i++) {
							let goodId = goodsId[i];
							let RGB1 = Math.floor(Math.random() * (255+1));
							let RGB2 = Math.floor(Math.random() * (255+1));
							let RGB3 = Math.floor(Math.random() * (255+1));
							
							chart.data.datasets.push({
								type: 'line',
								label: goodId,
								data: goodsData[goodId],
								lineTension: 0,
								borderColor : 'rgba('+RGB1+','+RGB2+','+RGB3+')',
								backgroundColor: 'rgba(255,255,255, 0)'
							});
							
							let goodName =  goodsName[goodId];
							console.log(goodName);
							let divName = document.getElementById('goodsNames');
							let childDiv = document.createElement('div');
								childDiv.classList.add('goodName');
							const info = goodId+' : '+ goodName;
							childDiv.innerHTML = info;
							divName.appendChild(childDiv);
						}
						chart.update();
					}
					addData(myChart, goodsId, goodsData, goodsName);
					
				} //end else
			}, //end success
			error: function(request, status, error) {
	          alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	      },
			complete: function() {
	      }
		});	
	})
</script>
</body>
</html>
