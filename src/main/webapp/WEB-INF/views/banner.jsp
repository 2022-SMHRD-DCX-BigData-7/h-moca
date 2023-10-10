<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<script>

	// 상수 선언
	const article = document.querySelectorAll("article");
	
	// 이벤트 등록
	history.scrollRestoration = "manual";

	document.addEventListener("wheel", (event) => {
		const clientHeight = window.innerHeight;
		const baseElementTop = article[article.length - 1].getBoundingClientRect().top;
		if (event.deltaY > 0) {
			wheelDown(article, baseElementTop, clientHeight);
		}
		if (event.deltaY < 0) {
			wheelUp(article, baseElementTop, clientHeight);
		}
	});
	
	// 함수 생성
function wheelDown(article, baseElementTop, clientHeight) {
for (let i = 1; i < article.length; i++) {
if (baseElementTop === clientHeight * (article.length - i)) {
scrollTo({
top: clientHeight * i,
behavior: "smooth",
      });
    }
  }
}
function wheelUp(article, baseElementTop, clientHeight) {
  for (let i = 0; i < article.length - 1; i++) {
    if (baseElementTop === clientHeight * i) {
      scrollTo({
        top: clientHeight * (article.length - 2 - i),
        behavior: "smooth",
      });
    }
  }
}
</script>
</head>
<body>
	<div id="banner">
		<div class="container">
			<div class="row">
				<div class="col-6 col-12-medium imp-medium">
					<article>
						<h1>article1</h1>
					</article>
					<article>
						<h1>article2</h1>
					</article>
					<article>
						<h1>article3</h1>
					</article>	
				</div>
			</div>
		</div>
	</div>
	

</body>
</html>