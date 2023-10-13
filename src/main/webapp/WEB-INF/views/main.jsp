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
		top: 80px;
		right: 0;
		left: 0;
	}
	
	#search {
		text-align: center;
	}
	
	/* 검색창 */
	.search-box {
		display: inline-flex;
		height: 2em;
		border: solid 1px #d6ddd8;
	}
	
	.search-box input {
		width : 500px;
		border : none;
		outline : none;
		background-color: #fff;
		transition : background-color 300ms;
		
	}
	
	.search-box button {
		width: 60px;
		background-color: #d6ddd8;
		color: #373f42;
		font-weight: 600;
		font-size: 13pt;
		border: none;
		
	}
		
	
	/* 검색순위 */
	.ranklist {
		width: 438px;
		border: solid 1px #97a197;
		border-radius: 5px;
		text-align: center;
		border-spacing: 10px;
	}
	
	.ranklist tr:first-child{
		height: 10px;
	}
	
	.ranklist tr td:first-child {
		vertical-align: top;
	}
	
	.ranklist img {
		width: 250px;
		border-radius: 3px;
	}
	
	.rank {
		width: 15%;
		border-bottom: solid 1px #f0f0f0;
	} 
	
	.title {
		width: 85%;
		border-bottom: solid 1px #f0f0f0;
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
		
		var rList = "<table class='ranklist'>";
		rList += "<tr>";
		rList += "<td class='rank'>순위</td>";
		rList += "<td class='title'>영상</td>";
		rList += "</tr>";
		
		$.each(data, function(index, obj){
			
			rList += "<tr>";
			rList += "<td>"+(index+1)+"</td>";
			rList += "<td>"
			rList += "<p><img src='"+obj.video_thumb+"'></p>"
			rList += "<p>"+obj.video_name+"</p>"
			rList += "</td>"
			rList += "</tr>";
		})
		
		
		$("#list").html(rList);
		
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
				<div class="col-12 col-12-medium">
					<!-- Box #1 -->
					<section id="search">
						<form class="search-box">
							<input type="search" class="url-box" placeholder="URL을 입력하세요">
							<button type="button" class="search-btn" onclick="location.href='${cpath}/result.do'">검색</button>
						</form>
					</section>
				</div>
				<div class="col-6 col-8-medium col-12-small">
					<!-- Box #2 -->
					<section>
						<header>
							<h2>검색 순위</h2>
							<div id="list">
								<!-- 검색순위 들어갈 부분 -->
							</div>
						</header>
					</section>
				</div>
				<div class="col-6 col-8-medium col-12-small">
					<!-- Box #2 -->
					<section>
						
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