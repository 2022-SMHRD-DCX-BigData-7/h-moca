<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<style>
	#header {
		background: none;
	}
	#banner {
		width: 100%;
		/* height: 300px; */
		position: absolute;
		top: 0;
		right: 0;
		left: 0;
		z-index: -2;
 		/* padding: 35px 0 35px 0; */
 	}	
	
	.bannerImg {
		display: flex;
		justify-content: center;
		overflow: hidden;
	}
	
	.bannerImg img{
		width: 100%;
	}

</style>
<script>


</script>

</head>
<body>

	<div id="banner">
		<div class="container">
			<div class="row aln-center">
				<div class="col-12 bannerImg">
					<img src="resources/css/images/bluefact.jpg">
				</div>
			</div>
		</div>
	</div>
	
	

</body>
</html>