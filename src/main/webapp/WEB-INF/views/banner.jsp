<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<style>
  	#banner {
   		position: relative;
   		margin: 0;
   		width: 100%;
   		height: 100vh;
   		background-image: url("resources/css/images/background.png");
   		-webkit-background-size: cover;
   		background-size: cover;
   		background-position: center center;
   		font-size: 2.5rem;
   		font-weight: bold;
   		color: #373f42;
   	}
   	
   	.banner-text {
   		opacity: 0;
   		transform: translateY(10%);
   		transition: all .5s ease-in-out;
   	}
   	
   	.banner-text.on {
   		opacity: 1;
   		transform: translateY(0);
   	}
	   	
    </style>
</head>
<body>

	<div id="banner" class="page">
		<div class="banner-text">
			<h1>다시 찾는 정보의 가치</h1>
		</div>
		<div class="banner-text">
			<h1>다시 찾는 정보의 가치</h1>
		</div>
		<div class="banner-text">
			<h1>다시 찾는 정보의 가치</h1>
		</div>
	</div>
	
	<script>
		
	</script>	
	
</body>
</html>