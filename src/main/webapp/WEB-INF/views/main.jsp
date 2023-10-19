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
		/* position: absolute;
		top: 100vh;
		right: 0;
		left: 0; */
		width: 95%;
		margin: auto;
		text-align: center;
	}
	
	.listsection {
		position: relative;
		top: 100px;
		text-align: -webkit-center;
	}
	
	#search {
		text-align: center;
	}
	
	/* 검색창 */
	.search-box {
		display: inline-flex;
		height: 2.5em;
		border: solid 3px #061b41ba;
		border-radius: 4px;
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
		background-color: #061b41ba;
		color: whitesmoke;
		font-weight: 300;
		font-size: 13pt;
		border: none;
	}
		
	.search-box button:hover {
		cursor: pointer;
	}	
	
	/* 검색순위 */
	.ranklist {
		width: 438px;
		border: solid 1px #061b41ba;
		border-radius: 5px;
		text-align: center;
		table-layout: fixed;
	}
	
	.ranklist tr{
		height: 60px;
	}
	
	.ranklist tr:first-child{
		height: 10px;
	}
	
	.ranklist tr:last-child td {
		border: none;
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
	
	.hidden {
		display: none;
	}
	
</style>

<script>
	$(document).ready(function(){
		$.ajax({
			url:"${cpath}/rank",
			type: "get",
			dataType: "json",
			success: ranklist,
			error: function(){
				alert("랭킁 목록 통신 실패ㅠ0ㅠ");
			}
		}); // 검색순위 ajax
		
		$.ajax({
			url : "${cpath}/postrank",
  			type : "get",
  			// data : 보내줄 데이터가 없으므로 주석 처리 !
  			dataType : "json",
  			// 응답이 성공했을때 callBack()함수 호출하는데
  			// ajax 안에서 함수 실행 할 때는 ()를 적지 않는다 !!!
  			// 소괄호 사용하면 함수가 실행이 안됨 
  			success : postranklist,
  			error : function(){
  				alert("게시판 목록 통신 실패ㅠ0ㅠ");
  			}
		}); // 게시글 순위 ajax
	}); 
	
	function ranklist(data){
		console.log(data);
		
		var rList = "<table class='ranklist'>";
		rList += "<tr>";
		rList += "<td class='rank'>순위</td>";
		rList += "<td class='title'>영상</td>";
		rList += "</tr>";
		
		$.each(data, function(idx, ob){
			
			rList += "<tr>";
			rList += "<td class='rank'>"+(idx+1)+"</td>";
			rList += "<td class='title'>"
			rList += "<p><img src='"+ob.video_thumb+"'></p>"
			rList += "<p>"+ob.video_name+"</p>"
			rList += "</td>"
			rList += "</tr>";
		})
		
		
		$("#list").html(rList);
		
		
	}

	function postranklist(data){
		console.log(data);
		
		// 게시물
		var bList = "<table class='ranklist'>";
		bList += "<tr>";
		bList += "<td class='rank'>순위</td>";
		bList += "<td class='title'>게시글</td>";
		bList += "</tr>";
		
		$.each(data, function(index, obj){
			bList += "<tr>";
			bList += "<td class='rank'>"+(index+1)+"</td>";
			bList += "<td class='title'><p>"+obj.post_title+"</p></td>";
			bList += "</tr>";
		})
		$("#blist").html(bList);
	}
	
</script>
</head>
<body>

<div id="page-wrapper" class="wrap">

	<!-- Header -->
	<%@include file = "header.jsp" %>
		
	<!-- Banner -->
	<%@include file = "banner.jsp" %>
	
	<!-- Content -->
	<section id="content" class="page">
		<div class="container">
			<div class="row aln-center">
				<div class="col-12 col-12-medium">
					<!-- Box #1 -->
					<section id="search">
						<form action="${cpath}/result.do" class="search-box" method="post">
							<input type="text" class="hidden" name="user_id" value="${loginUser.user_id}">
							<input type="search" class="url-box" name="url_name" placeholder="URL을 입력하세요">
							<input type="text" class="hidden" name="video_name" value="video_name"> 
							<input type="text" class="hidden" name="video_thumb" value="video_thumb">
							<input type="text" class="hidden" name="title_score" value="title_score">
							<input type="text" class="hidden" name="meta_score" value="meta_score">
							<input type="text" class="hidden" name="video_score" value="video_score">
							<input type="text" class="hidden" name="thumb_nm_score" value="thumb_nm_score">
							<input type="text" class="hidden" name="thumb_img_score" value="thumb_img_score">
							<button type="submit" name="search" class="search-btn">검색</button>
						</form>
					</section>
				</div>
				<div class="col-6 col-8-medium col-12-small">
					<!-- Box #2 -->
					<section class="listsection">
						<h2>검색 순위</h2>
						<div id="list">
							<!-- 검색순위 들어갈 부분 -->
						</div>
					</section>
				</div>
				<div class="col-6 col-8-medium col-12-small">
					<!-- Box #2 -->
					<section class="listsection">
						<h2>게시글 순위</h2>
						<div id="blist">
							<!-- 게시글 순위 들어감 -->
						</div>
					</section>
				</div>
			</div>
		</div>
	</section>
	
	
</div>
	
<!-- Scripts -->

<%-- <script src="${cpath}/resources/js/jquery.min.js"></script> --%>
<script src="${cpath}/resources/js/browser.min.js"></script>
<script src="${cpath}/resources/js/breakpoints.min.js"></script>
<script src="${cpath}/resources/js/util.js"></script>
<script src="${cpath}/resources/js/main.js"></script>
	
</body>
</html>