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
		font-size: 20px;
		position: absolute;
	}
	
	canvas {
		padding: 20px;
	}
</style>
<script type="text/javascript">
	function scrap(){
		location.href='${cpath}/boardInsertForm1.do?dist_idx=${vo.dist_idx}'
	}
	
/* 	$(document).ready(function(){
		// ajax -> distCon에 있는 result.do 실행하고 Dist vo를 받아옴
		
		// 여기에서 태그를 만들어서 뿌려줘야함
		
		let data = "";
		data += "<h1></h1>";
		
		div태그가져와서.html(data)
		
	}); */
	
	$(document).ready(function(){
		// ajax -> distCon에 있는 result.do 실행하고 Dist vo를 받아옴
	function resultvo(){
  		$.ajax({
  			url : "${cpath}/result/" + distIdx,
  			type : "get",
  			// data : 보내줄 데이터가 없으므로 주석 처리 !
  			dataType : "json",
  			// 응답이 성공했을때 callBack()함수 호출하는데
  			// ajax 안에서 함수 실행 할 때는 ()를 적지 않는다 !!!
  			// 소괄호 사용하면 함수가 실행이 안됨 
  			success : callBack,
  			error : function(){
  				alert("결과페이지 통신 실패");
  			}
  				
  		}); // ajax 끝
  	  	function callBack(data){
  	  		// data : ajax 통신의 결과를 가지고 있음
  	  		console.log(data);
		// 여기에서 태그를 만들어서 뿌려줘야함
		var data = "<table class='resultvo'>";

		// let data = "";
		
		// 타이틀 및 스크랩 버튼 추가
	    data += "<div class='col-2'><h2>판별 결과</h2></div>";
	    data += "<div class='col-10'><button class='scrap' onclick='scrap()'>스크랩</button></div>";

	    // URL 주소 추가
	    data += "<section class='url'>url주소 :<input value='" + data.url_name + "' readonly></section>";

	    // 썸네일 섹션 추가
	    data += "<section class='thumb'>";
	    data += "<div><p><img src='" + data.video_thumb + "'></p><p>" + data.video_name + "</p></div>";
	    data += "</section>";

	    // 결과화면 추가
	    data += "<section class='simple'>";
	    data += "<h3>종합 점수</h3>";
	    data += "<div><div style='width: 400px; height: 350px'><canvas id='totalscore'></canvas><span id='data-label'></span></div></div>";
	    data += "</section>";

	    // 로그인 사용자에게 보여지는 부분 추가
	    let loginUser = data.loginUser;
	    if (loginUser) {
	    	data += "<section class='detail'>";
	    	data += "<h3>영상 데이터</h3>";
	    	data += "<div><div><canvas id='meta'></canvas></div>";
	    	data += "<h3>영상 점수</h3>";
	    	data += "<div><div style='width: 50%;'><canvas id='Chart_meta' style='height:40vh; width:30vw'></canvas></div>";
	    	data += "<div style='width: 50%;'><canvas id='Chart_video' style='height:40vh; width:30vw'></canvas></div>";
	    	data += "<h3>썸네일 점수</h3>";
	    	data += "<div><div style='width: 100%;'><canvas id='Chart_thumb'  style='height:50vh; width:50vw'></canvas></div></div>";
	    	data += "</section>";
	    }

	    // 결과를 표시할 div 요소 가져오기
	    //let resultDiv = document.getElementById("result-container");
	    
	    $("#content").html(data);
	    
	    // 동적으로 생성한 HTML을 div에 할당
	    //resultDiv.innerHTML = data;
		
	    /* data += "<h1></h1>";
		
		div태그가져와서.html(data) */
		
  		};
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

<!-- 차트 script -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="${cpath}/resources/js/myChart.js"></script>

	
<!-- Scripts -->

<script src="${cpath}/resources/js/browser.min.js"></script>
<script src="${cpath}/resources/js/breakpoints.min.js"></script>
<script src="${cpath}/resources/js/util.js"></script>
<script src="${cpath}/resources/js/main.js"></script>
	
</body>
</html>