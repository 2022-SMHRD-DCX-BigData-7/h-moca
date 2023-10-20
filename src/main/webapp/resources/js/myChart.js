$(document).ready(function(){
		getGraph();
	});	
	
	// 리스트(y값)
	var totalScore = []; // 총점
	var metaData = []; // 메타데이터 => 좋아요수, 댓글수, 조회수
	var videoScore = []; // 영상 판별 점수 (제목)
	var metaScore = []; // 메타데이터 점수
	var thumbScore = []; // 썸네일 점수
	
	function getGraph(){

		$.ajax({
			url: "${cpath}/distScore.do",
			type: "get",
			data: {dist_idx:'${vo.dist_idx}'},
			dataType: "json",
			success: callBack,
			error: function(){
				alert("실패");
			}
		}); // ajax 끝
	}// getGraph 함수 끝	
	
	function callBack(data){
		console.log(data);
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