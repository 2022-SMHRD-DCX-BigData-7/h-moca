<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<section id="header">
				<div class="container">
					<div class="row">
						<div class="col-12">
							<!-- Logo -->
							<h1><a href="#" id="logo"><img class="logoimg" src="resources/css/images/logo.png">MOCA</a></h1>
							<!-- Nav -->
							<nav id="nav">
								<a href="#">MENU1</a>
								<a href="#">MENU2</a>
								<a href="#">MENU3</a>
							</nav>
							<!-- 로그인 메뉴 -->
							<!-- 로그인X -->
							<!-- 로그인하면 로그아웃, 마이페이지 -->
							<c:choose>
								<c:when test="${not empty loginmember}">
									<div class="loginmenu">
										<a href="#">Mypage</a>
										<a href="#">Logout</a>
									</div>
								</c:when>
								<c:otherwise>
									<div class="loginmenu">
										<a href="#">Log in</a>
										<a href="#" class="signup">Sign up</a>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</section>
	

</body>
</html>