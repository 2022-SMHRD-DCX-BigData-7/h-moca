<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<style>
    	.main{ 
		    width:100vw; 
		    height:100vh; 
		    background:#fff; 
		    overflow:hidden; 
		}
		.main .cont{ 
		    position:relative; 
		    height:100%; 
		}
		.main1,.main2{ 
		    position:absolute; 
		    left:0; top:50%; 
		    transform: translateY(-50%); 
		    font-size: 3rem; 
		    line-height: 1; 
		    transition: color 0.3s; 
		    -webkit-text-stroke: 1px #fff; 
		}
		.main1{ 
		    width:100%; 
		    mix-blend-mode:screen; 
		    z-index: 3; 
		 }
		.main2{ 
		    width:100%; 
		    color:#141150;
		    z-index: 1; 
		}
		.photozone{ 
		    position:absolute; 
		    width:50vw; 
		    height:50vh; 
		    left:50%; top:50%; 
		    transform: translate(-50%,-50%); 
		    background:#fff; 
		    background-size: 100vw; 
		    transition:0.5s; overflow:hidden; 
		    z-index: 2; 
		}
		.photozone.on{ 
		    opacity:0.8; 
		    transition:all 1s; 
		}
		.photozone.on::after{ 
		    content:""; 
		    display:inline-block; 
		    width:100%; 
		    height:100%; 
		    position:absolute; 
		    top:0; left:0; 
		    backdrop-filter:blur(10px); 
		}
		.photozone img{ 
		    position:absolute; 
		    top:50%; left:50%; 
		    transform:translate(-50%,-50%); 
		}
    </style>
    
</head>
<body>
	<div id="contents">
		<div class="stn main">
			<div class="cont">
				<div class="main1">
					<p>정보의 가치를 다시 찾다</p>
				</div>
				<div class="main2">
					<p>가짜 뉴스 필터링 서비스로 안전한 정보를 얻으세요.</p>
					<p>정확한 정보로 현명한 결정을 내릴 수 있도록 도와드립니다.</p>
				</div>
				<div class="photozone">
					<img src="resources/css/images/fact.png" />
				</div>
			</div>
		</div>
		<div class="stn profile main-page"></div>
	</div>
	
	<script>
	var num = 0; 
	// 첫 페이지에서 스크롤 되는 횟수
	// num으로 인해 첫 페이지의 동영상 크기가 변하게 하기 위함
	var idx = 0;
	// 첫 페이지에서 다음 페이지로 넘어갈 때부터 카운트 되는 스크롤 횟수
	// 페이지 이동을 작동시키기 위한 변수
	var delta;
	const mainImg = document.querySelector(".photozone");
	const mainTit = document.querySelector(".main1");
	const elMainCon = document.querySelectorAll(".main-page");

	$(window).on('mousewheel DOMMouseScroll', function (e) {
	    delta = e.originalEvent.wheelDelta || e.originalEvent.detail * -1;
	    if (delta < 0) {
	        if (!(num == 12)) {
	            num++;
	            if (num <= 11) {
	                mainImg.style = `width:${(num * 5) + 50}vw; height:${(num * 5) + 50}vh;`;
	            }
	        }
	        if ((num == 12) && (idx < elMainCon.length)) {
	            idx++;
	        }
	    } else {
	        if (!(idx == 0)) {
	            idx--;
	        }
	        if ((num > 0) && (idx == 0)) {
	            num--;
	            mainImg.style = `width:${(num * 5) + 50}vw; height:${(num * 5) + 50}vh;`;
	        }
	    }
	    
	    if (num >= 10) {
	        mainTit.style = `color:#fff;`;
	        mainImg.classList.add("on");
	    } else {
	        mainTit.style = `color:#000;`;
	        mainImg.classList.remove("on");
	    }

	    $('html,body').stop().animate({
	        scrollTop: ($(window).height()) * idx
	    }, 600)
	})
	
	
	
	</script>
	
</body>
</html>