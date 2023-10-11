<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<style>

	#banner {
		height: 300px;
		position: absolute;
 		padding: 35px 0 35px 0;
 	}	
	
	.bannerImg {
		display: flex;
		justify-content: center;
		overflow: hidden;
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
					<img src="resources/css/images/fact.png">
				</div>
			</div>
		</div>
	</div>
	
	

</body>
</html>