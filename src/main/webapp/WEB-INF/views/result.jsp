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
		margin: 0 50px;
		position: absolute;
		top: 250px;
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
	
	.simple>div{
		height: 400px;
		text-align: -webkit-center;
	}
	
	.simple h1{
		font-size: 3rem;
		padding: 10px;
	}
	
	.simple h3 {
		font-size: 1.4rem;
		padding: 10px;
	} 
	
	.detail {
		text-align: -webkit-center;
	}
	
	.detail>div{
		height: 450px;
		padding-top: 30px;
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
					<button class="scrap" onclick="location.href='${cpath}/boardInsertForm1.do'">스크랩</button>
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
							<div style="width: 400px; height:350px">
								<canvas id="totalscore"></canvas>
							</div>
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
										<h3>영상 데이터</h3>
										<div style="width:700px; height:700px;">
											<canvas id="meta"></canvas>
										</div>
									</div>
									<div>
										<h3>영상 점수</h3>
										<div style="width:700px; height:700px;">
											<canvas id="Chart_video"></canvas>
										</div>
									</div>
									<div>
										<h3>썸네일 점수</h3>
										<div style="width:700px; height:700px;">
											<canvas id="Chart_thumb"></canvas>
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
<script src="${cpath}/resources/js/chart.js"></script>
<script type="text/javascript">
	const context = document.getElementById('totalscore');
	
	new Chart(context, {
		type: 'doughnut',
		data: {
			labels: ['진실', '거짓'],
			datasets: [{
				label: 'total',
				data: [25, 75],
				backgroundColor:[
					'rgb(54, 162, 235, 0.5)',
					'rgb(255,205,86, 0.5)'
				],
				hoverOffset:4
			}]
		},
		options:{
			cutout: '75%', // 도넛 차트의 중앙 부분이 뚜렷하게 보이도록
			plugins:{
				legend:{
					display: false
				},
				tooltip:{
					enabled: false
				},
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