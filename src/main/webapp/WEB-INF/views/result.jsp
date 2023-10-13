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
	
	.thumb div {
		width: 500px;
	}
	
	.thumb div p {
		overflow: hidden;
		font-size: 1.2em;
	}
	
	.thumb div p:nth-child(2){
		padding: 0 10px;
	}
	
	.scrap {
		height: 25px;
		position: absolute;
		top: 80px;
		right: 70px;
		border: solid 1px #d6ddd8;
		border-radius: 5px;
		background-color: #d6ddd8;
		color: #373f42;
	}
	
	.scrap:hover {
		cursor: pointer;
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
					<button class="scrap">스크랩</button>
				</div>
				<div class="col-7 col-12-medium">
					<!-- 썸네일 -->
					<section class="thumb">
						<div>
							<p><img src="https://i.ytimg.com/vi/eWoC1PtZnww/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLDA6wgqJuHiwURqpdVNQBzfUo4nAA"></p>
							<p>내 과몰입 버튼 = 오정세 자기님의 연기! 오디션 썰 부터 대작 이야기까지</p>
						</div>
					</section>
				</div>
				<div class="col-5 col-12-medium">
					<!-- 결과화면1 -->
					<section class="simple">
						<div>
							<h3>그래프자리</h3>
						</div>							
					</section>
				</div>
			</div>
			
			<!-- 로그인하면 보여주는 페이지 -->
			<c:choose>
				<c:when test="${not empty loginUser}">
					<div class="col-12">
							<!-- 통계화면 -->
							<section class="detail">
								<div>
									<h3>통계화면 자리</h3>
								</div>
							</section>
						</div>
				</c:when>
				<c:otherwise></c:otherwise>
			</c:choose>
		</div>
	</section>
		
</div>
	
<!-- Scripts -->
<script src="${cpath}/resources/js/jquery.min.js"></script>
<script src="${cpath}/resources/js/browser.min.js"></script>
<script src="${cpath}/resources/js/breakpoints.min.js"></script>
<script src="${cpath}/resources/js/util.js"></script>
<script src="${cpath}/resources/js/main.js"></script>
	
</body>
</html>