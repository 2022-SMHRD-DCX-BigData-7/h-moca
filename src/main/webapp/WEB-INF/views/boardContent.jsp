<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<%
	// jstl fn 에서는 \n 기호를 읽어들일 수 없음
	// 페이지 영역에서 \n을 변수로 저장해놓고 변수를 이용해서
	// \n을 <br>로 변환해서 출력해주고자 함
	pageContext.setAttribute("newLine", "\n");
%>
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
	function goUpdate() {
		location.href="${cpath}/boardUpdateForm.do?post_idx=${vo.post_idx}"
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
								
				<!-- 게시글 내용 -->
				<div id="view" class="board_view_wrap" style="display:none;"></div>
					<div class="board_view">
						<div class="title">
							${vo.post_title}
						</div>
						<div class="info">
							<dl>
								<dt>번호</dt>
								<dd>번호</dd>
							</dl>
							<dl>
								<dt>작성자</dt>
								<dd>${vo.user_id}</dd>
							</dl>
							<dl>
								<dt>작성일</dt>
								<dd>${fn:split(vo.created_at, " ")[0]}</dd>
							</dl>
							<dl>
								<dt>조회수</dt>
								<dd>${vo.post_views}</dd>
							</dl>
						</div>
						<div class="cont">
							${fn:replace(vo.post_content, newLine, "<br>")}
						</div>
					</div>	
					<div class="btn_wrap">
						<c:choose>
							<c:when test="${not empty loginUser and loginuser.user_id eq user_id }">
								<a href="<c:url value='/boardList.do' />" class="on">목록</a>
								<a href="#" onclick="goUpdate()">수정</a>
								<a href="<c:url value='/boardDelete.do/${vo.post_idx}' />" class="on">삭제</a>
							</c:when>
							<c:otherwise>
								<a href="<c:url value='/boardList.do' />" class="on">목록</a>
							</c:otherwise>
						</c:choose>
						
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