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
	// 댓글
	$(document).ready(function(){
		commentList();
	});

	function commentList(){
		$.ajax({
			url: "${cpath}/cmt",
			type: "get",
			dataType: "json",
			success: callBack,
			error: function(){
				alert("댓글 불러오기 실패");
			}
		});
	}
	
	function callBack(data){
		console.log(data);
		
		var cList = "<div>";
		$.each(data, function(index, obj){
			// 게시글 번호랑 댓글에 저장된 게시글 번호랑 일치하면 출력
			if(${vo.post_idx}==obj.post_idx){
				cList += "<ul>";
				cList += "<li>"+obj.user_id+"</li>";
				cList += "<li>"+obj.cmt_content+"</li>";
				cList += "<li>"+obj.created_at+"</li>";
				if("${loginUser.user_id}" == obj.user_id){
					cList += "<button onclick='goDel("+obj.cmt_idx+")'>삭제</button>"
				}
				cList += "</ul>";
				
			}//출력끝
			else{
				cList += " "
				
			}
		});
		cList += "</div>";
		
		$("#cmtList").html(cList);
	}
	
	// 댓글 등록
	function insertFn(){
		var fData = $("#frm").serialize(); // 직렬화...?
		console.log(fData);
		
		$.ajax({
			url : "${cpath}/cmt",
			type : "post",
			data : fData,
			success : commentList,
			error : function(){
				alert("ㅋ");
			}
		});
		
		$("#reset").trigger("click");
		
	}
	
	
	
	// 댓글 삭제

	function goDel(cmt_idx){
		$.ajax({
			url: "${cpath}/cmt/"+cmt_idx,
			type: "delete",
			success: commentList,
			error: function(){
				alert("댓글 삭제 실패");
			}
		})
	}
	
	
	// 게시글
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
				<div id="view" class="board_view_wrap">
					<div class="board_view">
						<div class="title">
							${vo.post_title}
						</div>
						<div class="info">
							<dl>
								<dt>번호</dt>
								<dd>${vo.post_idx}</dd>
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
					
					<!-- 댓글 -->
					
					<div class="cmt_wrap">
						<!-- 댓글 목록 -->
						<div id="cmtList" class="cmt_view">
						</div>
						<!-- 댓글추가 -->
						<div class="cmt_input">
							<form id="frm">
								<div class="cmt_writer">
									<c:choose>
										<c:when test="${not empty loginUser}">
											<input type="text" name="user_id" value="${loginUser.user_id}" readonly>
										</c:when>
										<c:otherwise>
											<input type="text" value="비회원" disabled="disabled">
										</c:otherwise>
									</c:choose>
								</div>
								<div class="cmt_text">
									<input type="text" name="cmt_content" placeholder="댓글 추가">
									<input type="text" name="post_idx" value="${vo.post_idx}" style="display:none">
									<button type="button" onclick="insertFn()">작성</button>
									<button type="reset" id="reset" style="display:none"></button>
								</div>
							</form>
						</div>
					</div>
					
					<!-- 게시물 버튼 -->
					<div class="btn_wrap">
						<c:choose>
							<c:when test="${not empty loginUser and loginUser.user_id eq user_id }">
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
	
<script src="${cpath}/resources/js/jquery.min.js"></script>
<script src="${cpath}/resources/js/browser.min.js"></script>
<script src="${cpath}/resources/js/breakpoints.min.js"></script>
<script src="${cpath}/resources/js/util.js"></script>
<script src="${cpath}/resources/js/main.js"></script>
	
</body>
</html>