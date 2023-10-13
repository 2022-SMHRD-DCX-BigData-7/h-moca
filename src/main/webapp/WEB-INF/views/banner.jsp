<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<style>
  	#banner {
   		position: absolute;
   		top: 0;
   		right: 0;
   		left: 0;
   		height: 700px;
   		background-image: url("resources/css/images/background.png");
   		background-position: 50% 50%;
   		background-size: cover;
   	}
   	
   	#banner img {
   		width: 600px;
   		
   	}
   	
   	.item {
   		position: relative;
   		top: 200px;
   	}
   	
   	.item h1 {
   		font-size: 2.5rem;
   	}
   	
   	.item h2 {
   		font-size: 1.5rem;
   	}
	
	   	
    </style>
</head>
<body>

	<div id="banner">
		
		<div class="item">
			<div>
				<h1>정보의 가치를 다시 찾다.</h1>
			</div>
			<div>
				<h2>가짜 뉴스 필터링 서비스로 안전한 정보 얻기</h2>
			</div>
		</div>
		
	</div>
	







	
	
</body>
</html>