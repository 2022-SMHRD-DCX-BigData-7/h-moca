
	// ajax -> distCon에 있는 result.do 실행하고 Dist vo를 받아옴
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
		// data : ajax 통신의 결과를 가지고 있음
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
		resultpage += '</div>';
		resultpage += '<div class="col-7 col-12-medium">';
		
		// 썸네일
		resultpage += '<section class="thumb">';
		resultpage += '<div>';
		resultpage += "<p><img src='"+obj.video_thumb+"'></p>";
		resultpage += '<p>'+obj.video_name+'</p>';
		resultpage += '</div>';
		resultpage += '</section>';
		resultpage += '</div>';
		
		});
		
		
		resultpage += '<div class="col-5 col-12-medium">';
		// 결과화면1
		resultpage += '<section class="simple">';
		resultpage += '<h3>종합 점수</h3>';
		resultpage += '<div>';
		resultpage += '<div style="width: 400px; height: 350px">';
		resultpage += '<canvas id="totalscore"></canvas>';
		resultpage += '<span id="data-label"></span>';
		resultpage += '</div>';
		resultpage += '</div>';
		resultpage += '</section>';
		resultpage += '</div>';
		
		// 로그인 하면 보여주는 페이지
		resultpage += '<div class="col-12 on">';
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
		resultpage += '<div style="width: 50%;">';
		resultpage += '<canvas id="Chart_meta" style="height:40vh; width:30vw"></canvas>';
		resultpage += '</div>';
		resultpage += '<div style="width: 50%;">';
		resultpage += '<canvas id="Chart_video" style="height:40vh; width:30vw"></canvas>';
		resultpage += '</div>';
		resultpage += '</div>';
		resultpage += '<h3>썸네일 점수</h3>';
		resultpage += '<div>';
		resultpage += '<div style="width: 100%;">';
		resultpage += '<canvas id="Chart_thumb"  style="height:50vh; width:50vw"></canvas>';
		resultpage += '</div>';
		resultpage += '</div>';
		resultpage += '</section>';
		resultpage += '</div>';
		
		resultpage += "</div>";
		resultpage += "</div>";
		
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