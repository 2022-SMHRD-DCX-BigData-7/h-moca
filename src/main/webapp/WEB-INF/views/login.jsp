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
<link rel="stylesheet" href="${cpath}/resources/css/main.css">
<style>
	.input-group{
		margin: 20px 20px;
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

	#login h2{
		text-align: center;
	}

	#login a{
		color: #373f42;
		font-size: 15px;				
	}

	.notyet {
		text-align: right;
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
						<section id="login">
							<header>
								<h2>로그인</h2>
							</header>
							<form action="#">
								<div class="input-group">
									<p>아이디</p>
									<input type="text" id="user_id" name="user_id" class="form-control" placeholder="아이디를 입력하세요.">
								</div>
								<div class="input-group">
									<p>비밀번호</p>
									<input type="password" id="user_pw" name="user_pw" class="form-control" placeholder="비밀번호를 입력하세요.">
								</div>
								<div class="input-group">
									<input type="submit" value="로그인">
								</div>
							</from>
							<div class="notyet">
								<a href="#">아직 회원이 아니신가요?</a>
							</div>
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