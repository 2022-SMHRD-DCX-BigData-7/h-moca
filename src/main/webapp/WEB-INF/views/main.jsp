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
</head>
<body>

<div id="page-wrapper">

	<!-- Header -->
	<%@include file = "header.jsp" %>
		
	<!-- Banner -->
	<div id="banner">
		<div class="container">
			<div class="row">
				<div class="col-6 col-12-medium imp-medium">
					<!-- Banner Image -->
					<a href="#" class="bordered-feature-image"><img src="resources/css/images/banner.jpg" alt="" /></a>
				</div>
				<div class="col-6 col-12-medium">
					<!-- Banner Copy -->
					<p>뭐하는 홈페이지인지에 대한 설명이 필요할거 같은데...?</p>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Content -->
	<section id="content">
		<div class="container">
			<div class="row aln-center">
				<div class="col-8 col-12-medium">
					<!-- Box #1 -->
					<section>
						<header>
							<h2>SEARCHING FOR FAKE TUBE</h2>
							<h3>ㅋㅋㅋ</h3>
						</header>
						<input type="text" class="urlbox" placeholder="URL을 입력하세요">
						<button class="button-large">검색</button>
					</section>
				</div>
				<div class="col-4 col-6-medium col-12-small">
					<!-- Box #2 -->
					<section>
						<header>
							<h2>주간 랭킹</h2>
							<h3>ㅋㅋㅋ</h3>
						</header>
						
					</section>
				</div>
			</div>
		</div>
	</section>
	
	<!-- Footer -->
	<section id="footer">
		<div class="container">
			<div class="row">
				<div class="col-8 col-12-medium">
				</div>
				<div class="col-4 col-12-medium imp-medium">
				</div>
			</div>
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