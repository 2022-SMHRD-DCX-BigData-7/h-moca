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
<style>

	.scrap {
		display: flex;
		flex-wrap: wrap;
		background: #fbfbfb;
	}
	
	.url {
		width: 100%;
	}

	.url>input{
		width: 60%;
	}
	
	.thumb {
		width: 50%;
	}
	
	.thumb img {
		width: 100%;
	}
	
	.simple {
		text-align: -webkit-center;
		width: 40%;
	}
	
	.simple h3{
		text-align: left;
	}
	
	.detail {
		width: 100%;
	}
	
	.detail>div {
		display: flex;
	}
	
	canvas {
		padding: 20px;
	}
</style>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
	// 차트데이터, 댓글 불러오기
	$(document).ready(function(){
		
		if(${vo.dist_idx} != null){
			resultvo();
			getMeta();
		}
		commentList();
	});
	
	function getMeta(){
		$.ajax({
			url: "${cpath}/getMeta.do",
			type: "get",
			dataType: "json",
			seccess: metaBack,
			error: function(){
				alert("메타데이터 못가져옴");
			}
		});
	}
	
	function metaBack(data){
		console.log(data);
	}
	// 차트
	function resultvo(){
		$.ajax({
  			url : "${cpath}/distScore.do",
  			type : "get",
  			data : {dist_idx:'${vo.dist_idx}'},
  			dataType : "json",
  			// 응답이 성공했을때 callBack()함수 호출하는데
  			// ajax 안에서 함수 실행 할 때는 ()를 적지 않는다 !!!
  			// 소괄호 사용하면 함수가 실행이 안됨 
  			success : callBack,
  			error : function(){
  				alert("결과페이지 통신 실패");
  			}
  		}); // ajax 끝 - 데이터 받아옴
	}
	
	// 리스트(y값)
	var totalScore = []; // 총점
	var metaData = []; // 메타데이터 => 좋아요수, 댓글수, 조회수
	var videoScore = []; // 영상 판별 점수 (제목)
	var metaScore = []; // 메타데이터 점수
	var thumbScore = []; // 썸네일 점수
	
	function callBack(data){
		console.log(data);
		
		// 차트에 담을 값 리스트에 넣어주기
		for(var i=0; i<data.length; i++){
		totalScore.push(Number(data[i].video_score * 100));
		totalScore.push(Number((1-data[i].video_score) * 100));
		videoScore.push(Number(data[i].title_score*100));
		metaScore.push(Number(data[i].meta_score*100));
		thumbScore.push(Number(data[i].thumb_nm_score*100));
		thumbScore.push(Number(data[i].thumb_img_score*100));
		}
					
		console.log("총점",totalScore);
		console.log("데이터점수",metaScore);
		console.log("영상점수",videoScore);
		console.log("썸네일",thumbScore);
		
		// result 페이지 
		var resultpage = "<section class='url'>";
		
		
		$.each(data, function(index, obj){
			
		resultpage += 'url주소 :<input value="'+obj.url_name+'" readonly>';
		resultpage += '</section>';
		
		// 썸네일
		resultpage += '<section class="thumb">';
		resultpage += '<div>';
		resultpage += "<p><img src='"+obj.video_thumb+"'></p>";
		resultpage += '<p>'+obj.video_name+'</p>';
		resultpage += '</div>';
		resultpage += '</section>';
		
		});
		
		// 결과화면1
		resultpage += '<section class="simple">';
		resultpage += '<h3>종합 점수</h3>';
		resultpage += '<div>';
		resultpage += '<div style="width: 300px; height: 250px">';
		resultpage += '<canvas id="totalscore"></canvas>';
		resultpage += '<span id="data-label"></span>';
		resultpage += '</div>';
		resultpage += '</div>';
		resultpage += '</section>';
				
		// 통계화면
		resultpage += '<section class="detail">';
		resultpage += '<h3>영상 데이터</h3>';
		resultpage += '<div>';
		resultpage += '<div>';
		resultpage += '<canvas id="meta"></canvas>';
		resultpage += '</div>';
		resultpage += '</div>';
		resultpage += '<h3>영상 점수</h3>';
		resultpage += '<div>';
		resultpage += '<div style="width: 45%;">';
		resultpage += '<canvas id="Chart_meta" style="height:35vh; width:25vw"></canvas>';
		resultpage += '</div>';
		resultpage += '<div style="width: 45%;">';
		resultpage += '<canvas id="Chart_video" style="height:35vh; width:25vw"></canvas>';
		resultpage += '</div>';
		resultpage += '</div>';
		resultpage += '<h3>썸네일 점수</h3>';
		resultpage += '<div>';
		resultpage += '<div style="width: 100%;">';
		resultpage += '<canvas id="Chart_thumb"  style="height:40vh; width:40vw"></canvas>';
		resultpage += '</div>';
		resultpage += '</div>';
		resultpage += '</section>';
		
		$("#scrap").html(resultpage);
		
		getChart();
	}
	
	function getChart(){
		// 총점 도넛차트
		new Chart(document.getElementById("totalscore"),{
			type: 'doughnut',
			data: {
				labels: ['진실', '거짓'],
				datasets:[{
					label: 'total',
					data: totalScore,
					backgroundColor: [
						'rgba(82, 145, 255, 0.2)',
						'rgba(255, 82, 82, 0.2)'
					],
					borderColor: [
						'rgba(82, 145, 255, 0.8)',
						'rgba(255, 82, 82, 0.8)'
					],
					hoverOffset: 4
				}]
			},
			options:{
				cutout: '75%',
				plugins:{
					legend:{
						display: false
					},
					tooltip:{
						enabled: false
					},
				}
			}
		});
		
		// 메타데이터 통계(막대)
		
		// 메타데이터 판별 점수
		new Chart(document.getElementById("Chart_meta"),{
			type: 'bar',
			data: {
				labels: ['데이터점수'],
				datasets:[{
					barThickness: 100,
					label: 'metaScore',
					data: [40],
					backgroundColor: 'rgba(255, 189, 82, 0.2)',
					borderColor: 'rgba(255, 189, 82, 0.8)',
					borderWidth: 1
				}]
			},
			options:{
				responsive: false,
				plugins:{
					legend:{
						display:false
					}
				}, // 라벨 숨기기
				scales: {
					y: {
						min: 0,
						max: 100,
						ticks:{
							stepSize: 50
						}
					}
				}
			}
		});
		
		// 영상 제목 판별 점수(막대)
		new Chart(document.getElementById("Chart_video"),{
			type: 'bar',
			data: {
				labels: ['영상점수'],
				datasets:[{
					barThickness: 100,
					label: 'videoScore',
					data: videoScore,
					backgroundColor: [
						'rgba(82, 122, 255, 0.2)'
					],
					borderColor: [
						'rgba(82, 122, 255, 0.8)'
					],
					borderWidth: 1
				}]
			},
			options:{
				responsive: false,
				plugins:{
					legend:{
						display:false
					}
				}, // 라벨 숨기기
				scales: {
					y: {
						min: 0,
						max: 100,
						ticks:{
							stepSize: 50
						}
					}
				}
			}
		});
		
		// 썸네일 판별 점수(막대)
		new Chart(document.getElementById("Chart_thumb"),{
			type: 'bar',
			data: {
				labels: ['썸네일(text)','썸네일(image)','썸네일(평균)'],
				datasets:[{
					barThickness: 100,
					label: 'thumbScore',
					data: [thumbScore[0],thumbScore[1],((thumbScore[0]+thumbScore[1])/2)],
					backgroundColor: [
						'rgba(255, 99, 132, 0.2)',
						'rgba(255, 189, 82, 0.2)',
						'rgba(82, 122, 255, 0.2)'
					],
					borderColor: [
						'rgba(255, 99, 132, 0.8)',
						'rgba(255, 189, 82, 0.8)',
						'rgba(82, 122, 255, 0.8)'
					],
					borderWidth: 1
				}]
			},
			options:{
				responsive: false,
				plugins:{
					legend:{
						display:false
					}
				}, // 라벨 숨기기
				scales: {
					y: {
						min: 0,
						max: 100,
						ticks:{
							stepSize: 50
						}
					}
				}
			}
		});
		
	}
	
	// 댓글 불러오기
	function commentList(){
		$.ajax({
			url: "${cpath}/cmt",
			type: "get",
			dataType: "json",
			success: cmtBack,
			error: function(){
				alert("댓글 불러오기 실패");
			}
		});
	}
	
	function cmtBack(data){
		console.log(data);
		
		var cList = "<div>";
		$.each(data, function(index, obj){
			// 게시글 번호랑 댓글에 저장된 게시글 번호랑 일치하면 출력
			if(${vo.post_idx}==obj.post_idx){
				cList += "<ul>";
				cList += "<li>"+obj.user_id+"</li>";
				cList += "<li>"+obj.cmt_content+"</li>";
				cList += "<li>"+obj.created_at.split(' ')[0]+"</li>";
				if("${loginUser.user_id}" == obj.user_id){
					cList += "<button onclick='goDel("+obj.cmt_idx+")'>삭제</button>"
				};
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
							<div id="scrap" class="scrap"></div>
							${fn:replace(vo.post_content, newLine,"<br>")}
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
							<c:when test="${not empty loginUser && vo.user_id eq loginUser.user_id}">
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