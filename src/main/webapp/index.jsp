<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<%
	// response.sendRedirect("${cpath}/boardList.do");
	// 와 같은 코드를 더 간단히 jstl로 작성해보려고 해요!
	// jstl을 이용해서 요청을 보내는 경우에는 
	// 항상 프로젝트 내에서 이동을 지시하므로 cpath를 적을 필요가 없다.
%>
<c:redirect url="Main.do"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <link rel="stylesheet" href="${cpath}/resources/css/main.css">
</head>
<body>
 
<div class="container">
  
</div>

</body>
</html>
