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
   		height: 66vh;
   		background: url("resources/css/images/back.jpg");
   		opacity: 0.8;
   		background-size: cover;
   		background-position: center center;
   		/* font-size: 2.5rem;
   		font-weight: bold;
   		color: #373f42; */
   		text-align: center;
   		
   	}
   	
   	#text{
   		position: relative;
   		top: 20vh;
   		width: 100%;
   		height: 40vh;
   		text-align: center;
   		background: #fff;
   		opacity: 0.5;
   	}
   	
   	
   	#text h1{
   		position: relative;
   		top: 45%;
   		right: 0;
   		left: 0;
   		/* margin-top: 35px; */
   		font-size: 8rem;
   		font-weight: 600;
   		color: #000;
   	}
   	
   	#text h2{
   		position: relative;
   		top:25vh;
   		font-size: 3rem;
   	}
   	
   	h3{
   		color: red;
   		text-align: right;
   	}
	
	@media screen and (max-width: 980px) {
		#text{
	   		position: relative;
	   		top: 13vh;
	   		width: 100%;
	   		height: 45vh;
	   		text-align: center;
	   		background: #fff;
	   		opacity: 0.5;
   		}
   	
		#text h1{
	   		position: relative;
	   		top: 45%;
	   		right: 0;
	   		left: 0;
	   		/* margin-top: 35px; */
	   		font-size: 5rem;
	   		font-weight: 600;
	   		color: #000;
	   	}
   	
	   	#text h2{
	   		position: relative;
	   		top:25vh;
	   		font-size: 2rem;
	   	}
	}
	   	
    </style>
    <script>
    	var banner = document.getElementById("banner");
    	var text = document.getElementById("text");
    	var text2 = document.getElementById("text2");
    	var text3 = document.getElementById("text3");
    	
    	banner.addEventListener('scroll', function(e){
    		var scrolled = banner.scrollTop;
    		if (scrolled > 30) {
    			text.style.fontSize = '4rem';
    			text2.style.display = 'block';
    			text3.style.display = 'block';
    		} else {
    			text.style.fontSize = '5rem';
    			text2.style.display = 'none';
    			text3.style.display = 'none';
    		}
    	});
    </script>
</head>
<body>

	<div id="banner" class="page">
			<div id="text">
				<h1>FAKE? FACT!</h1>
				<h2>url검색으로 가짜에 가려진 진실을 찾아보세요!</h2>
			</div>
	</div>
	<h3>스포츠 정보 분야에 특화되어 있으며 다른 분야도 가능하지만 정확성이 떨어질 수 있습니다 </h3>
	
</body>
</html>