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
				
				<!-- 게시판 수정 -->
				<div class="board_insert_wrap">
					<form class="board_insert" action="${cpath}/boardUpdate.do" method="post">
						<input type="hidden" name="post_idx" value="${vo.post_idx}">
						<div class="title">
							<dl>
								<dt>제목</dt>
								<dd><input type="text" id="post_title" name="post_title" value="${vo.post_title}"></dd>
							</dl>
						</div>
						<div class="info">
							<dl>
								<dt>작성자</dt>
								<dd><input type="text" id="user_id" name="user_id" readonly="readonly" value="${loginUser.user_id}"></dd>
							</dl>
							<dl>
								<dt>판별고유번호</dt>
								<dd><input type="text" id="dist_idx" name="dist_idx" value="${vo.dist_idx}"></dd>
							</dl>
						</div>
						<div class="cont">
							<textarea id="post_content" name="post_content">${vo.post_content}</textarea>
						</div>
						<div class="btn_wrap">
							<button type="submit">수정</button>
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