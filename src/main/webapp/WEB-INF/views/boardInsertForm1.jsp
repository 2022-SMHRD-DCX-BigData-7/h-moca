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
<link rel="stylesheet" href="${cpath}/resources/css/boardstyle.css">
<style>
	.scrap {
		padding: 15px;
		border-bottom: solid 1px #97a197;
	}
	
	.scrap input{
		width: 82.5%;
		border-radius: 5px;
	}
</style>
<script>
	function checkField(){
		var inputs = document.inputForm;
		if(!inputs.post_title.value){
			alert("제목을 입력해주세요");
			return false;
		}
		if(!inputs.post_content.value){
			alert("내용을 입력해주세요");
			return false;
		}
	}
  	
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
								
				<!-- 게시판 작성 -->
					<form class="board_insert" action="${cpath}/boardInsert.do" name="inputForm" method="post" onsubmit="return checkField();">
					<!-- post_title, post_content, created_at, post_views, user_id, dist_idx -->
						<div class="title">
							<dl>
								<dt>제목</dt>
								<dd><input type="text" id="post_title" name="post_title" value="[스크랩]" placeholder="제목을 입력하세요."></dd>
							</dl>
						</div>
						<div class="info">
							<dl>
								<dt>작성자</dt>
								<dd><input type="text" id="user_id" name="user_id" readonly="readonly" value="${loginUser.user_id}"></dd>
							</dl>
							<dl style="display:none">
								<dt>판별고유번호</dt>
								<dd><input type="text" id="dist_idx" name="dist_idx" value="${vo.dist_idx}"></dd>
							</dl>
						</div>
						<div class="cont">
							<div id="scrap" class="scrap">
							<input type="text" value="📑[스크랩 첨부]No.${vo.dist_idx}">
							</div>
							<textarea id="post_content" name="post_content" placeholder="내용을 입력하세요."></textarea>
						</div>
						<div class="btn_wrap">
							<button type="submit" class="on" >등록</button>
							<button type="button" id="reset" onclick="window.location.href='${cpath}/boardList.do'">취소</button>
						</div>
					</form>
					
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