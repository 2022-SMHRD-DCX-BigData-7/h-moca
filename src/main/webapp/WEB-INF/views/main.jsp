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
		top: 100vh;
		right: 0;
		left: 0;
	}
</style>

<script>
	$(document).ready(function(){
		// 함수 호출
		rankList();
	});
	
	function rankList(){
  		$.ajax({
  			url : "${cpath}/rank",
  			type : "get",
  			// data : 보내줄 데이터가 없으므로 주석 처리 !
  			dataType : "json",
  			// 응답이 성공했을때 callBack()함수 호출하는데
  			// ajax 안에서 함수 실행 할 때는 ()를 적지 않는다 !!!
  			// 소괄호 사용하면 함수가 실행이 안됨 
  			success : callBack,
  			error : function(){
  				alert("랭킁 목록 통신 실패ㅠ0ㅠ");
  			}
  		}); // ajax 끝
	}
	
	function callBack(data){
		
		console.log(data);
		// data.url_count
		
	}
</script>
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
							<div id="list">
								<!-- 검색순위 들어갈 부분 -->
							</div>
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