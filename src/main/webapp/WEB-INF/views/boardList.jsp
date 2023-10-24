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
<script>
	function goForm(){
		location.href="${cpath}/boardInsertForm.do";
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
				
				<!-- 게시판목록 -->
				<div id="list" class="board_list_wrap">
					<div class="board_list">
						<div class="top">
							<div class="num">번호</div>
							<div class="title">제목</div>
							<div class="writer">작성자</div>
							<div class="date">작성일</div>
							<div class="count">조회수</div>
						</div>
						<div>
							<c:forEach items="${list}" var="vo" varStatus="loop">
								<c:url var="contentLink" value="boardContent.do/${vo.post_idx}" />
								<div class="num">${list.size() - loop.index}</div>
								<div class="title"><a href="${contentLink}">${vo.post_title}</a></div>
								<div class="writer">${vo.user_id}</div>
								<div class="date">${fn:split(vo.created_at," ")[0]}</div>
								<div class="count">${vo.post_views}</div>
							</c:forEach>
						</div>
					</div>
					
					<div class="board_page">
						<a href="boardList.do?curPage=1" class="btn first"><<</a>
						<a href="boardList.do?curPage=${paging.curPage-1}" class="btn prev"><</a>
						<c:forEach begin="${paging.firstPage}" end="${paging.lastPage}" var="i">
							<c:choose>
								<c:when test="${i eq paging.curPage}">
									<a href="boardList.do?curPage=${i}" class="num on">${i}</a>
								</c:when>
								<c:otherwise>
									<a href="boardList.do?curPage=${i}" class="num">${i}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<a href="boardList.do?curPage=${paging.curPage+1}" class="btn next">></a>
						<a href="boardList.do?curPage=${paging.totalPageCount}" class="btn last">>></a>
					</div>
					
					<div class="btn_wrap">
						<c:choose>
							<c:when test="${not empty loginUser}">
								<a href="#" onclick="goForm()" class="on">글쓰기</a>
							</c:when>
							<c:otherwise>		
							</c:otherwise>
						</c:choose>
						
					</div>
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