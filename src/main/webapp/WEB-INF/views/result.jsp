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
		
	<!-- Content -->
	<section id="content">
		<div class="container">
			<div class="row">
				<div class="col-8 col-12-medium">
					<!-- 썸네일 -->
					<section>
						
					</section>
				</div>
				<div class="col-4 col-6-medium col-12-small">
					<!-- 결과화면1 -->
					<section>
												
					</section>
				</div>
			</div>
			
			<!-- 로그인하면 보여주는 페이지 -->
			<div class="row">
				<div class="col-12">
					<!-- 통계화면 -->
					<section></section>
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