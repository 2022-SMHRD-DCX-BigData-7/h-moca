<%@page import="com.hmoca.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% User loginUser = (User)session.getAttribute("loginUser"); %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAKETUBE</title>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
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
		width : 400px;
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
	
	.thumb {
		text-align: -webkit-center;
	}
	
	.thumb>div {
		width: 500px;
		height: 403.5px;
	}
	
	.thumb div p {
		overflow: hidden;
		font-size: 1.2em;
	}
	
	.thumb div p:nth-child(2){
		padding: 10px;
		text-align: left;
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
		height: 350px;
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
	
	.detail h3{
		padding: 45px;
		text-align: left;
	}
	
	.detail>div{
		width: 100%;
		padding-top: 30px;
		display: inline-flex;
	}
	
	#data-label {
		
		font-size: 3rem;
		position: relative;
		bottom: 25vh;
		color: darkgray;
	
	}
	
	canvas {
		padding: 20px;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script type="text/javascript">
	function scrap(){
		location.href='${cpath}/boardInsertForm1.do?dist_idx=${vo.dist_idx}'
	}
</script>
<script type="text/javascript">	
	
	$(document).ready(function(){
		resultvo();
	});
		// ajax -> distCon에 있는 result.do 실행하고 Dist vo를 받아옴
	function resultvo(){
  		$.ajax({
  			url : "${cpath}/distScore.do",
  			type : "get",
  			data : {dist_idx:'${vo.dist_idx}'},
  			dataType : "json",
  			// 응답이 성공했을때 callBack()함수 호출하는데
  			// ajax 안에서 함수 실행 할 때는 ()를 적지 않는다 !!!
  			// 소괄호 사용하면 함수가 실행이 안됨 
  			success : callBack,
  			error : function(){
  				alert("결과페이지 통신 실패");
  			}
  				
  		}); // ajax 끝 - 데이터 받아옴
	}	
	// 리스트(y값)
	var totalScore = []; // 총점
	var metaData = []; // 메타데이터 => 좋아요수, 댓글수, 조회수
	var videoScore = []; // 영상 판별 점수 (제목)
	var metaScore = []; // 메타데이터 점수
	var thumbScore = []; // 썸네일 점수
  		
	function callBack(data){
		// data : ajax 통신의 결과를 가지고 있음
		console.log(data);
					
		// 차트에 담을 값 리스트에 넣어주기
		for(var i=0; i<data.length; i++){
		totalScore.push(Number((data[i].video_score * 100).toFixed(2)));
		totalScore.push(Number(((1-data[i].video_score) * 100).toFixed(2)));
		videoScore.push(Number((data[i].title_score*100).toFixed(2)));
		metaScore.push(Number((data[i].meta_score*100).toFixed(2)));
		thumbScore.push(Number((data[i].thumb_nm_score*100).toFixed(2)));
		thumbScore.push(Number((data[i].thumb_img_score*100).toFixed(2)));
		}
					
		console.log("총점",totalScore);
		console.log("데이터점수",metaScore);
		console.log("영상점수",videoScore);
		console.log("썸네일",thumbScore);
		
		// 로그인 유저 세션에서 가져오기
		<%
		String user_id = (loginUser != null) ? loginUser.getUser_id() : "";%>  
		// String user_id = loginUser.getUser_id();%>
		  
		var loginUser = "<%=user_id%>";
		console.log(loginUser);
		
		
		// result 페이지 
		var resultpage = "<div class='container'>";
		resultpage += "<div class='row'>";
		
		$.each(data, function(index, obj){
			
		resultpage += "<div class='col-2'>";	
		resultpage += "<h2>판별 결과</h2>";
		resultpage += "</div>";
		
		if(loginUser != null){
			resultpage += '<div class="col-10">';
			resultpage += '<button class="scrap" onclick="scrap()">스크랩</button>';
			resultpage += '</div>';
		}
		
		resultpage += '<div class="col-12">';
			
		resultpage += '<section class="url">';
		resultpage += 'url주소 :<input value="'+obj.url_name+'" readonly>';
		resultpage += '</section>';
		resultpage += '</div>';
		resultpage += '<div class="col-7 col-12-medium">';
		// 썸네일
		resultpage += '<section class="thumb">';
		resultpage += '<div>';
		resultpage += "<p><img src='"+obj.video_thumb+"'></p>";
		resultpage += '<p>'+obj.video_name+'</p>';
		resultpage += '</div>';
		resultpage += '</section>';
		resultpage += '</div>';
		
		
		
		
		resultpage += '<div class="col-5 col-12-medium">';
		// 결과화면1
		resultpage += '<section class="simple">';
		resultpage += '<h3>종합 점수</h3>';
		resultpage += '<div>';
		resultpage += '<div style="width: 400px; height: 350px">';
		resultpage += '<canvas id="totalscore"></canvas>';
		// if 문으로 기준 넣기
		resultpage += '<span id="data-label">'+(obj.video_score*100)+'점</span>';
		resultpage += '</div>';
		resultpage += '</div>';
		resultpage += '</section>';
		resultpage += '</div>';
		
		// 로그인 하면 보여주는 페이지
		

		if(loginUser == null){
			$('#detail').css({
				'filter': 'blur(5px)'
			});
			resultpage += '<div><span>로그인하면 더 많은 정보를 확인할 수 있어요!</span></div>'
		}
		
		resultpage += '<div class="col-12 on">';
		// 통계화면
		resultpage += '<section id="detail" class="detail">';
		
		//resultpage += '<h3>영상 데이터</h3>';
		//resultpage += '<div>';
		//resultpage += '<div>';
		//resultpage += '<canvas id="meta"></canvas>';
		//resultpage += '</div>';
		//resultpage += '</div>';
		resultpage += '<h3>영상 점수</h3>';
		resultpage += '<div>';
		resultpage += '<div style="width: 50%;">';
		resultpage += '<canvas id="Chart_meta" style="height:40vh; width:30vw"></canvas>';
		resultpage += '</div>';
		resultpage += '<div style="width: 50%;">';
		resultpage += '<canvas id="Chart_video" style="height:40vh; width:30vw"></canvas>';
		resultpage += '</div>';
		resultpage += '</div>';
		resultpage += '<h3>썸네일 점수</h3>';
		resultpage += '<div>';
		resultpage += '<div style="width: 100%;">';
		resultpage += '<canvas id="Chart_thumb"  style="height:50vh; width:50vw"></canvas>';
		resultpage += '</div>';
		resultpage += '</div>';
		resultpage += '</section>';
		resultpage += '</div>';
		
		});
		
		resultpage += "</div>";
		resultpage += "</div>";
		
		$("#content").html(resultpage);
		
		getChart();
	}
	
	function getChart(){
		// 총점 도넛차트
		new Chart(document.getElementById("totalscore"),{
			type: 'doughnut',
			data: {
				labels: ['진실', '거짓'],
				datasets:[{
					label: 'total',
					data: totalScore,
					backgroundColor: [
						'rgba(82, 145, 255, 0.2)',
						'rgba(255, 82, 82, 0.2)'
					],
					borderColor: [
						'rgba(82, 145, 255, 0.8)',
						'rgba(255, 82, 82, 0.8)'
					],
					hoverOffset: 4
				}]
			},
			options:{
				cutout: '75%',
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
		
		// 메타데이터 통계(막대)
		
		// 메타데이터 판별 점수
		new Chart(document.getElementById("Chart_meta"),{
			type: 'bar',
			data: {
				labels: ['데이터점수'],
				datasets:[{
					barThickness: 80,
					label: 'metaScore',
					data: metaScore,
					backgroundColor: 'rgba(255, 189, 82, 0.2)',
					borderColor: 'rgba(255, 189, 82, 0.8)',
					borderWidth: 1
				}]
			},
			options:{
				responsive: false,
				plugins:{
					legend:{
						display:false
					}
				}, // 라벨 숨기기
				scales: {
					y: {
						min: 0,
						max: 100,
						ticks:{
							stepSize: 50
						}
					}
				}
			}
		});
		
		// 영상 제목 판별 점수(막대)
		new Chart(document.getElementById("Chart_video"),{
			type: 'bar',
			data: {
				labels: ['제목점수'],
				datasets:[{
					barThickness: 80,
					label: 'titleScore',
					data: videoScore,
					backgroundColor: [
						'rgba(82, 122, 255, 0.2)'
					],
					borderColor: [
						'rgba(82, 122, 255, 0.8)'
					],
					borderWidth: 1
				}]
			},
			options:{
				responsive: false,
				plugins:{
					legend:{
						display:false
					}
				}, // 라벨 숨기기
				scales: {
					y: {
						min: 0,
						max: 100,
						ticks:{
							stepSize: 50
						}
					}
				}
			}
		});
		
		// 썸네일 판별 점수(막대)
		new Chart(document.getElementById("Chart_thumb"),{
			type: 'bar',
			data: {
				labels: ['썸네일(text)','썸네일(image)','썸네일(평균)'],
				datasets:[{
					barThickness: 80,
					label: 'thumbScore',
					data: [thumbScore[0],thumbScore[1],((thumbScore[0]+thumbScore[1])/2)],
					backgroundColor: [
						'rgba(255, 99, 132, 0.2)',
						'rgba(255, 189, 82, 0.2)',
						'rgba(82, 122, 255, 0.2)'
					],
					borderColor: [
						'rgba(255, 99, 132, 0.8)',
						'rgba(255, 189, 82, 0.8)',
						'rgba(82, 122, 255, 0.8)'
					],
					borderWidth: 1
				}]
			},
			options:{
				responsive: false,
				plugins:{
					legend:{
						display:false
					}
				}, // 라벨 숨기기
				scales: {
					y: {
						min: 0,
						max: 100,
						ticks:{
							stepSize: 50
						}
					}
				}
			}
		});
		
	}
</script>

</head>
<body>

<div id="page-wrapper">

	<!-- Header -->
	<%@include file = "header.jsp" %>
		

	<!-- Content -->
	<section id="content">
		 <%--  <div class="container">
			<div class="row">
				<div class="col-2">
					<h2>판별 결과</h2>
				</div>
				<div class="col-10">
					<button class="scrap" onclick="scrap()">스크랩</button>
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
						<h3>종합 점수</h3>
						<div>
							<div style="width: 400px; height: 350px">
								<canvas id="totalscore"></canvas>
								<span id="data-label"></span>
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
									<h3>영상 데이터</h3>
									<div>
										<div>
											<canvas id="meta"></canvas>
										</div>
									</div>
									<h3>영상 점수</h3>
									<div>
										<div style="width: 50%;">
											<canvas id="Chart_meta" style="height:40vh; width:30vw"></canvas>
										</div>
										<div style="width: 50%;">
											<canvas id="Chart_video" style="height:40vh; width:30vw"></canvas>
										</div>
									</div>
									<h3>썸네일 점수</h3>
									<div>
										<div style="width: 100%;">
											<canvas id="Chart_thumb"  style="height:50vh; width:50vw"></canvas>
										</div>
									</div>
								</section>
							</div>
					</c:when>
					<c:otherwise></c:otherwise>
				</c:choose>
			</div>
		</div> --%>
	</section>
	
</div>

<!-- Scripts -->
<script src="${cpath}/resources/js/browser.min.js"></script>
<script src="${cpath}/resources/js/breakpoints.min.js"></script>
<script src="${cpath}/resources/js/util.js"></script>
<script src="${cpath}/resources/js/main.js"></script>
	
</body>
</html>