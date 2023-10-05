<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>FAKETUBE</title>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${cpath}/resources/css/main.css">
<style>

	.input-group{
		margin: 0 20px;
	}

	.input-group>p{
		margin: 0 0 0 0;
	}

	.input-group>input{
		border-radius: 5px;
		border: solid 1px #373f42;
	}

	.form-control{
		width: 100%;
	}

	#join h2{
		text-align: center;
	}

	#join a{
		color: #373f42;
		font-size: 15px;				
	}

	.checkId {
		border: none;
		background-color: transparent;
		font-size: 14px;
		text-align: right;
		margin-right: 8px;
	}

	.submit-group{
		padding: 10px 0;
		text-align: right;
	}

	.submit-group>input {
		border-radius: 5px;
		border: solid 1px #373f42;
		margin-right: 19px;
	}
</style>
</head>
<body>

<div id="page-wrapper">

	<!-- Header -->
	<%@include file = "header.jsp" %>
		
	<!-- Content -->
	<section id="content">
		<div class="container">
			<div class="row aln-center">
				<div class="col-5 col-12-medium">
					<!-- Box #1 -->
						<section id="join">
							<header>
								<h2>회원가입</h2>
							</header>
							<form action="${cpath}/UserInsert.do" method="post"">
								<div class="input-group">
									<p>아이디</p>
									<input type="text" id="user_id" name="user_id" class="form-control">
								</div>
								<div class="checkId">
									<button id="checkId" class="checkId">중복확인</button>
								</div>
								<div class="input-group">
									<p>비밀번호</p>
									<input type="password" id="user_pw" name="user_pw" class="form-control">
								</div>
								<div class="input-group">
									<p>비밀번호 확인</p>
									<input type="password" id="ckuser_pw" name="ckuser_pw" class="form-control">
								</div>
								<div class="input-group">
									<p>이름</p>
									<input type="text" id="user_name" name="user_name" class="form-control">
								</div>
								<div class="input-group">
									<p>닉네임</p>
									<input type="text" id="user_nick" name="user_nick" class="form-control">
								</div>
								<div class="input-group">
									<p>이메일</p>
									<input type="email" id="user_email" name="user_email" class="form-control">
								</div>
								<div class="input-group">
									<p>전화번호</p>
									<input type="email" id="user_phone" name="user_phone" class="form-control">
								</div>
								<div class="submit-group">
									<input type="submit" value="회원가입">
								</div>
							</from>								
						</section>
				</div>
			</div>
		</div>
	</section>
	
	<!-- Footer -->
	<section id="footer">
		<div class="container">
			<div class="row">
				<div class="col-8 col-12-medium">
				</div>
				<div class="col-4 col-12-medium imp-medium">
				</div>
			</div>
		</div>
	</section>
</div>
	
<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/browser.min.js"></script>
<script src="assets/js/breakpoints.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
	
</body>
</html>