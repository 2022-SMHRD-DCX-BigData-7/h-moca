var metacontext = document.getElementById("meta"); // myChart라는 id를 가진 태그를 찾아서
	var videocontext = document.getElementById("Chart_video");
	var thumbcontext = document.getElementById("Chart_thumb");
	
	var metaChart = new Chart(metacontext,{ // (context,{chart내용})
		type: 'bar', // 차트 형태
		data: { // 차트에 들어갈 데이터
			labels : [
				// x축
				'조회수', '댓글수','좋아요수','영상길이'
			],
			datasets: [
				{// 데이터
					label : 'data', //차트 제목
					fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
					data:[
						50,65,63,49 // x축 label에 대응되는 값
					],
					backgroundColor:[
						'rgba(255, 99, 132, 0.2)',
	                    'rgba(54, 162, 235, 0.2)',
	                    'rgba(255, 206, 86, 0.2)',
	                    'rgba(75, 192, 192, 0.2)',
					],
					borderColor : [
						 'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
					],
					borderWidth: 1 // 경계선 굵기
				}
			]
		},
		options: {
			plugins:{
				legend:{
					display:false
				}
			}, // 라벨 숨기기
			scales: {
				yAxes :[
					{
						ticks:{
							beginAtZero:true
						}
					}
				]
			}
		}
	});
	
	var videoChart = new Chart(videocontext,{ // (context,{chart내용})
		type: 'bar', // 차트 형태
		data: { // 차트에 들어갈 데이터
			labels : [
				// x축
				// '1','2','3','4','5','6','7'
				'제목점수', '메타데이터','썸네일(text)','썸네일(Image)'
			],
			datasets: [
				{// 데이터
					label : 'score', //차트 제목
					fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
					data:[
						50,65,63,49 // x축 label에 대응되는 값
					],
					backgroundColor:[
						'rgba(255, 99, 132, 0.2)',
	                    'rgba(54, 162, 235, 0.2)',
	                    'rgba(255, 206, 86, 0.2)',
	                    'rgba(75, 192, 192, 0.2)',
					],
					borderColor : [
						 'rgba(255, 99, 132, 1)',
                         'rgba(54, 162, 235, 1)',
                         'rgba(255, 206, 86, 1)',
                         'rgba(75, 192, 192, 1)',
					],
					borderWidth: 1 // 경계선 굵기
				}
			]
		},
		options: {
			plugins:{
				legend:{
					display:false
				}
			}, // 라벨 숨기기
			scales: {
				yAxes :[
					{
						ticks:{
							beginAtZero:true
						}
					}
				]
			}
		}
	});
	
	var thumbChart = new Chart(thumbcontext,{ // (context,{chart내용})
		type: 'bar', // 차트 형태
		data: { // 차트에 들어갈 데이터
			labels : [
				// x축
				// '1','2','3','4','5','6','7'
				'제목점수', '메타데이터','썸네일(text)','썸네일(Image)'
			],
			datasets: [
				{// 데이터
					label : 'score', //차트 제목
					fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
					data:[
						50,65,63,49 // x축 label에 대응되는 값
					],
					backgroundColor:[
						'rgba(255, 99, 132, 0.2)',
	                    'rgba(54, 162, 235, 0.2)',
	                    'rgba(255, 206, 86, 0.2)',
	                    'rgba(75, 192, 192, 0.2)',
					],
					borderColor : [
						 'rgba(255, 99, 132, 1)',
                         'rgba(54, 162, 235, 1)',
                         'rgba(255, 206, 86, 1)',
                         'rgba(75, 192, 192, 1)',
					],
					borderWidth: 1 // 경계선 굵기
				}
			]
		},
		options: {
			plugins:{
				legend:{
					display:false
				}
			}, // 라벨 숨기기
			scales: {
				yAxes :[
					{
						ticks:{
							beginAtZero:true
						}
					}
				]
			}
		}
	});