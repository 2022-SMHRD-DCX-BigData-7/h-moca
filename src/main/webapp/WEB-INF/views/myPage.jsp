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
<script>
	// 마이페이지 내가 쓴 게시물 내용으로 수정 !!!
/* 	$(document).ready(function(){
		Mypostcontent();
	}); */

	//function Mypostcontent(){
	//	$.ajax({
	//		url: "${cpath}/mycontent",
	//		type: "get",
	//		dataType: "json",
	//		success: callBack,
	//		error: function(){
	//			alert("내 게시물 불러오기 실패");
	//		}
	//	});
	//}
	
/* 	function callBack(data){
		console.log(data);
		
	} */
	</script>
	
<style>
	
	#content.mycontent {
		position: absolute;
		top: 200px;
		width: 100%;
		text-align: center;
		padding: 0;
	}
	
	.tab-link {
		padding: 10px;
	}
	
	ul.tabs {
		margin: 0px;
		padding: 0px;
		list-style: none;
	}
	
	ul.tabs li {
		cursor: pointer;
	}
	
	ul.tabs li:hover {
		color: #97a197;
	}
	
	ul.tabs li.current {
		color: #97a197;
		text-decoration: underline;
	}
	
	.tab-content {
		display: none;
		padding: 12px 80px;
		height: 80vh;
		border-left: solid 1px #97a197;
	}
	
	.tab-content.current {
		display: inherit;
	}
	
	/* 리스트 */
	.board_list {
		width: 100%;
		border-top: solid 1px #373f42;
	}
	
	.board_list>div{
		width : 100%;
		border-bottom: solid 1px #d6ddd8;
		font-size: 1rem;
	}
	.board_list>div.top {
		border-bottom: solid 1px #d6ddd8;
	}
	
	.board_list>div>div {
		display: inline-block;
		vertical-align: middle;
		text-align: center;
		padding: 5px;
	}
	
	.board_list>div.top>div{
		font-weight: 600; 
		text-align: center;
	}
	
	.board_list .num{
		width: 7%;
	}
	
	.board_list .title {
		width: 55%;
		text-align: left;
	}
	
	.board_list a {
		text-decoration: none;
		color: #373f42;
	}
	
	.board_list a:hover{
		color: #97a197;
	}
	
	.board_list .top .title{
		width: 55%;
		text-align: center;
	}
	
		
	.board_list .writer {
		width: 10%;
	}
	
	.board_list .date {
		width: 15%;
	}
	
	.board_list .count{
		width: 10%;
	}
	
	.board_list .dist_title {
		width: 70%;
		text-align: left;
	}
	
	.board_list .score {
		width: 25%;
	}
	
		
	.t1 {
		text-align: right;
		width: 15%;
	}
	
	.t2 {
		text-align: left;
		width: 70%;
	}
	
	.t2::before{
		content: "|";
		padding-right: 15px;
	}
	
	#tab-3 input {
		border: none;
		border-bottom: solid 1px;
		width: 60%;
	}	
	
	#tab-3 button {
		position: relative;
		left: 160px;
		width: 50px;
	    height: 35px;
	    border: solid 1px #97a197;
	    border-radius: 5px;
	    cursor: pointer;
	}
</style>
	
</head>
<body>

<div id="page-wrapper">

	<!-- Header -->
	<%@include file = "header.jsp" %>
			
	<!-- Content -->
	<section id="content" class="mycontent">
		<div class="container">
			<div class="row">
				<div class="col-3 col-12-medium" >
					<!-- 탭 메뉴 상단 -->
					<ul class="tabs">
						<li class="tab-link current" data-tab="tab-1">내게시글</li>
						<li class="tab-link" data-tab="tab-2">판별결과</li>
						<li class="tab-link" data-tab="tab-3">회원정보</li>
					</ul>
				</div>
				<div class="col-9 col-12-medium">
					<!-- 게시글 내용 시작 -->
					<div id="tab-1" class="tab-content current">
						<div id="blist" class="board_list wrap">
							<div class="board_list">
								<div class="top">
									<div class="num">번호</div>
									<div class="title">제목</div>
									<div class="writer">작성자</div>
									<div class="date">작성일</div>
									<div class="count">조회수</div>
								</div>
								<div>
									<c:forEach items="${list}" var="vo">
										<c:url var="contentLink" value="boardContent.do/${vo.post_idx}"/>
										<div class="num">${vo.post_idx}</div>
										<div class="title"><a href="${contentLink}">${vo.post_title}</a></div>
										<div class="writer">${vo.user_id}</div>
										<div class="date">${fn:split(vo.created_at," ")[0]}</div>
										<div class="count">${vo.post_views}</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
					<!-- 판별결과 내용 시작 -->
					<div id="tab-2" class="tab-content">
						<div id="dlist" class="board_list wrap">
							<div class="board_list">
								<div class="top">
									<div class="dist_title">제목</div>
									<div class="score">영상 판별 점수</div>
									
								</div>
							    <div>
									<c:forEach items="${mylist}" var="vo">
										<div class="dist_title"><a href="#">${vo.video_name}</a></div>
										<div class="score">${vo.video_score*100}</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
					<!-- 회원정보 내용 시작 -->
					<div id="tab-3" class="tab-content">
						<form action="${cpath}/UserUpdate.do" method="post">
								<input type="hidden" name="user_id" value="${loginUser.user_id}" />
						<table>
						<%-- <div class="cmt_writer">
							<c:choose>
								<c:when test="${not empty loginUser}">
									<input type="text" name="user_id" value="${loginUser.user_id}" readonly>
								</c:when>
							</c:choose>
							
						</div> --%>
						
							<tr>
								<td class="t1">아이디</td>
								<td class="t2">${loginUser.user_id}</td>
							</tr>
							<tr>
								<td class="t1">비밀번호</td>
								<td class="t2"><input type="password" name="user_pw" placeholder="변경할 비밀번호를 입력하세요."></td> <!-- value="${loginUser.user_pw}" -->
							</tr>
							<tr>
								<td class="t1">이름</td>
								<%-- <dd><input type="text" id="user_name" name="user_name" readonly="readonly" value="${loginUser.user_name}"></dd> --%>
								<td class="t2">${loginUser.user_name}</td>
								
							</tr>
							<tr>
								<td class="t1">닉네임</td>
								<%-- <dd><input type="text" id="user_nick" name="user_nick" readonly="readonly" value="${loginUser.user_nick}"></dd> --%>
								<td class="t2"><input type="text" name="user_nick" placeholder="변경할 닉네임을 입력하세요."></td> <!-- value="${loginUser.user_nick}" -->
								
								
							</tr>
							<tr>
								<td class="t1">전화번호</td>
								<%-- <dd><input type="text" id="user_phone" name="user_phone" readonly="readonly" value="${loginUser.user_phone}"></dd> --%>
								<td class="t2">${loginUser.user_phone}</td>

							</tr>
							<tr>
								<td class="t1">이메일</td>
								<%-- <dd><input type="text" id="user_email" name="user_email" readonly="readonly" value="${loginUser.user_email}"></dd> --%>
                				<td class="t2">${loginUser.user_email}</td>
							
							</tr>
							<tr>
								<td colspan="2">
								<button type="submit">수정</button> 
								</td>
							</tr>
							</form>
							
						</table>
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
<script src="${cpath}/resources/js/tabmenu.js"></script>	
</body>
</html>