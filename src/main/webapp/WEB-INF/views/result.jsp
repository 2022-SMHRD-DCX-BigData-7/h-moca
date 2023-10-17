<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAKETUBE</title>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel="stylesheet" href="${cpath}/resources/css/main.css">
<style>
	#content {
		position: absolute;
		top: 100px;
		right: 0;
		left: 0;
	}
	
	#content h2 {
		font-size: 1.85em;
		color: #373f42;
		padding: 15px;
		margin: 0;
	}
	
	#content img {
		width : 500px;
		border-radius: 10px;
	}
	
	.url input{
		width: 600px;
		border: none;
		margin-left: 10px;
	}
	
	.url, .thumb, .simple, .detail {
		box-shadow: 0 2px 8px 1px rgba(223 223 223);
		border-color: rgba(223,225,229,0);
	}
	
	
	.thumb div {
		width: 500px;
		height: 400px;
	}
	
	.thumb div p {
		overflow: hidden;
		font-size: 1.2em;
	}
	
	.thumb div p:nth-child(2){
		padding: 0 10px;
	}
	
	.scrap {
		height: 30px;
		position: absolute;
		top: 90px;
		right: 105px;
		border: solid 1px #d6ddd8;
		border-radius: 5px;
		background-color: #d6ddd8;
		color: #373f42;
	}
	
	.scrap:hover {
		cursor: pointer;
	}
	
	.simple div{
		height: 400px;
	}
	
	.simple h1{
		font-size: 3rem;
		padding: 10px;
	}
	
	.simple h3 {
		font-size: 1.4rem;
		padding: 10px;
	} 
	
	
</style>
</head>
<body>

<div id="page-wrapper">

	<!-- Header -->
	<%@include file = "header.jsp" %>
		
	<!-- Content -->
	<section id="content">
		<div class="container">
			<div class="row">
				<div class="col-2">
					<h2>판별 결과</h2>
				</div>
				<div class="col-10">
					<button class="scrap" onclick="location.href='${cpath}/boardInsertForm1.do?${vo.dist_idx}'">스크랩</button>
				</div>
				<div class="col-12">
					<section class="url">
						url주소 :<input value="${vo.url_name}" readonly>
					</section>
				</div>
				<div class="col-7 col-12-medium">
					<!-- 썸네일 -->
					<section class="thumb">
						<div>
							<p><img src="${vo.video_thumb}"></p>
							<p>${vo.video_name}</p>
						</div>
					</section>
				</div>
				<div class="col-5 col-12-medium">
					<!-- 결과화면1 -->
					<section class="simple">
						<div>
							<h3>종합 점수</h3>
							<h1>${vo.video_score}</h1>
						</div>							
					</section>
				</div>
				<!-- 로그인하면 보여주는 페이지 -->
				<c:choose>
					<c:when test="${not empty loginUser}">
						<div class="col-12">
								<!-- 통계화면 -->
								<section class="detail">
									<div>
										<h3>통계화면 자리</h3>
										<div style="width:900px; height:900px;">
											<canvas id="myChart"></canvas>
										</div>
									</div>
								</section>
							</div>
					</c:when>
					<c:otherwise></c:otherwise>
				</c:choose>
			</div>
		</div>
	</section>
	
</div>

<!-- 차트 script -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script type="text/javascript">

	var context = document
		.getElementById("myChart") // myChart라는 id를 가진 태그를 찾아서
		.getContext('2d'); // getContext 속성을 통해 2d로 세팅
	var myChart = new Chart(context,{ // (context,{chart내용})
		type: 'bar', // 차트 형태
		data: { // 차트에 들어갈 데이터
			labels : [
				// x축
				'1','2','3','4','5','6','7'
			],
			datasets: [
				{// 데이터
					label : 'test1', //차트 제목
					fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
					data:[
						21,19,25,20,23,26,25 // x축 label에 대응되는 값
					],
					backgroundColor:[
						'rgba(255, 99, 132, 0.2)',
	                    'rgba(54, 162, 235, 0.2)',
	                    'rgba(255, 206, 86, 0.2)',
	                    'rgba(75, 192, 192, 0.2)',
	                    'rgba(153, 102, 255, 0.2)',
	                    'rgba(255, 159, 64, 0.2)'
					],
					borderColor : [
						 'rgba(255, 99, 132, 1)',
                         'rgba(54, 162, 235, 1)',
                         'rgba(255, 206, 86, 1)',
                         'rgba(75, 192, 192, 1)',
                         'rgba(153, 102, 255, 1)',
                         'rgba(255, 159, 64, 1)'
					],
					borderWidth: 1 // 경계선 굵기
				}
			]
		},
		options: {
			scales: {
				yAxes :[
					{
						ticks:{
							beginAtZero:true
						}
					}
				]
			}
		}
	});
</script>
	
<!-- Scripts -->
<script src="${cpath}/resources/js/jquery.min.js"></script>
<script src="${cpath}/resources/js/browser.min.js"></script>
<script src="${cpath}/resources/js/breakpoints.min.js"></script>
<script src="${cpath}/resources/js/util.js"></script>
<script src="${cpath}/resources/js/main.js"></script>
	
</body>
</html>