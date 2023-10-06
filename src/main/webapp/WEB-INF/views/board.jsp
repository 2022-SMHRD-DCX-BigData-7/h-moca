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
<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" href="resources/css/boardstyle.css">
<script>
	//지금 실행되는 html 문서가 실행이 되면 바로 돌아가도록
	$(document).ready(function(){
		// 함수 호출
		postList();
	});
	
	// ajax를 실행할 함수
  	function postList(){
  		$.ajax({
  			
  			url : "${cpath}/post",
  			type : "get",
  			// data : 보내줄 데이터 없음 
  			dataType : "json",
  			// 응답이 성공했을 때 callBack() 함수 호출하는데
  			// ajax 안에서 함수 실행할 때는 ()를 적지 않는다!! 
  			success : callBack,
  			error : function(){
  				alert("게시글 목록 통신 실패");
  			}
  				
  		}); // ajax 끝
  	} // boardList 함수 끝

 // boardList 의 ajax 통신이 완료되면(성공하면) 실행될 함수
  	function callBack(data){
  		// data : ajax통신의 결과를 가지고 있음
  		console.log(data);
  	
  		var bList = "<div class='board_list'>";
  		bList += "<div class='top'>";
  		bList += "<div class='num'>번호</div>";
  		bList += "<div class='title'>제목</div>";
  		bList += "<div class='writer'>작성자</div>";
  		bList += "<div class='date'>작성일</div>";
  		bList += "<div class='count'>조회수</div>";
  		bList += "</div>";
  		
  		// {idx: 6, title: 'ㅁㅁㅁ', content: '123', writer: '김슬기', indate: '2023-08-16 09:42:36.0', …}
  		// json에서 'ㅁㅁㅁ' 꺼내오려면 데이터요소.title
  		// $.each(데이터, 데이터를 처리할 수 있는 함수);
  		$.each(data, function(index, obj){
  			// index는 요소의 몇번째인지, obj는 요소가 담김
  			// obj.title ==> 'ㅁㅁㅁ'
  			bList += "<div>";
  			bList += "<div class='num'>" + obj.post_idx +"</div>";
  			// a태그를 누르면 다른 자바스크립트 함수로 이동
  			// javascript:함수이름
  			bList += "<div class='title'><a href='javascript:cview("+ obj.post_idx +")'>" + obj.post_title +"</a></div>";
  			bList += "<div class='writer'>" + obj.user_id +"</div>";
  			bList += "<div class='date'>" + obj.created_at +"</div>";
  			bList += "<div class='count' id='count"+obj.post_idx+"'>" + obj.post_views +"</div>";
  			bList += "</div>";
  				
  			
  		}); // each 끝
  		
  		// 글쓰기 버튼
  		bList += "<div class='btn_wrap'>";
  		bList += "<a href='#' class='on' onclick='goForm()'>글쓰기</a>"
  		bList += "</div>";
  		
  		bList += "</div>"; // 게시판 목록 끝부분
  		
  		$("#list").html(bList);
  	} // callBack 함수 끝

</script>
</head>
<body>

<div id="page-wrapper">

	<!-- Header -->
	<%@include file = "header.jsp" %>
		
	<!-- Content -->
	<section id="content">
		<div class="container">
		
		<!-- 게시판  -->
			<div class="board_wrap">
				<div class="board_title">
					<h1>게시판</h1>
				</div>
				
				<!-- 게시판목록 -->
				<div id="list" class="board_list_wrap" style="display:block;">
					<!-- 여기에 들어감 -->	
				</div>
				
				<!-- 내용 -->
				<div id="view" class="board_view_wrap"></div>
				
				<!-- 게시판 작성 -->
				<div id="wform" class="board_insert_wrap" style="display:none;">
					<form class="board_insert" id="frm">
						<div class="title">
							<dl>
								<dt>제목</dt>
								<dd><input type="text" id="post_title" name="post_title" placeholder="제목을 입력하세요."></dd>
							</dl>
						</div>
						<div class="info">
							<dl>
								<dt>작성자</dt>
								<dd><input type="text" id="user_id" name="user_id" readonly="readonly" value="${loginUser.user_id}"></dd>
							</dl>
							<dl>
								<dt>비밀번호</dt>
								<dd><input type="password" placeholder="비밀번호 입력"></dd>
							</dl>
						</div>
						<div class="cont">
							<textarea id="post_content" name="post_content"></textarea>
						</div>
					</form>
					<div class="btn_wrap">
						<a href="#" class="on" onclick="insertFn()">등록</a>
						<a href="#" id="reset">취소</a>
					</div>
				</div>
					
			</div>
		
		
		
		</div>
	</section>		
</div>
	
<!-- Scripts -->
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/browser.min.js"></script>
<script src="resources/js/breakpoints.min.js"></script>
<script src="resources/js/util.js"></script>
<script src="resources/js/main.js"></script>	
</body>
</html>