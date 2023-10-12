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
	#header {
		background: none;
	}
	
	#content {
		position: absolute;
		top: 100vh;
		right: 0;
		left: 0;
	}
</style>
</head>
<body>

<div id="page-wrapper">

	<!-- Header -->
	<%@include file = "header.jsp" %>
		
	<!-- Banner -->
	<%@include file = "banner.jsp" %>
	
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
	
	
</div>
	
<!-- Scripts -->
<script src="${cpath}/resources/js/jquery.min.js"></script>
<script src="${cpath}/resources/js/browser.min.js"></script>
<script src="${cpath}/resources/js/breakpoints.min.js"></script>
<script src="${cpath}/resources/js/util.js"></script>
<script src="${cpath}/resources/js/main.js"></script>
	
</body>
</html>