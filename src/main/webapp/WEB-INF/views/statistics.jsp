<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="include/header.jsp"></jsp:include>
<body>

	<jsp:include page="include/nav.jsp"></jsp:include>

	<main>
		<div class="container">
			<h1>Statistics</h1>
			<div class="statistics-container">
				<!-- 구별 평균 매매 가격, 최근 매매율이 높은 지역 -->
				<div class="dashboard-graph">
					<div class="dashboard-graph-circle">
						<h3>구별 매매 평균 가격</h3>
						<p style="font-size : x-small">(단위 : 만원)</p>
						<div class="border black">
							<canvas id="myChart"></canvas>
						</div>
					</div>
					<div class="dashboard-graph-circle">
						<h3>매매율이 높은 지역</h3>
							<p style="font-size : x-small" >(단위 : 건)</p>
						<div class="border black">
							<canvas id="myChart2">
							</canvas>
						</div>
					</div>
				</div>
				<!-- 최근 3개월 대전 매매 시세 -->
				<div class="dashboard-graph">
					<div class="dashboard-graph-bar">
						<h3 style="text-align: center">최근 6개월 대전 평균 매매 시세</h3>
						<div class="border black">
							<canvas id="myChart3"></canvas>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script>
		// 최근 6개월 대전 매매 시세 그래프 start
		$.ajax({
			url : "/statistics/sixmonth/contract",
			data : "GET",
			dataType : "json",
			success : function(response) {
				console.log(response);
				//그래프 로직 작성~
				const labelArray = [];
				const dataArray = [];
				// 배열.push : 결과의 정보들을 배열 순서대로 넣어주기 
				// 가져온 결과 : 0 1 2 3 4 5 / var arr = [] 
				// arr.push(추가할 정보 for문으로 정보입력)
				// result ===> [0,1,2,3,4,5]
				for (var i = 0; i < response.length; i++) {
					labelArray.push(response[i].month);
					dataArray.push(response[i].monthAvgAmount);
				}
				const datas = {
					labels : labelArray,
					datasets : [ {
						label : "대전 매매 가격",
						backgroundColor : "rgb(255, 99, 132)",
						borderColor : "rgb(255, 99, 132)",
						data : dataArray,
					}, ],
				};
				console.log(datas);

				const config = {
					type : "line",
					data : datas,
					options : {},
				};

				// $("myChart3")에 config데이터 chart형식으로 추가하기
				const myChart = new Chart(document.getElementById("myChart3"),
						config);
			}
		});
		// 최근 6개월 대전 매매 시세 그래프 end

		const monthAvgAmount = [];
		const countMonthSales = [];
		const gu = [];
		$.ajax({
			url : "/statistics/sixmonth/trade/sale",
			data : "GET",
			dataType : "json",
			success : function(response) {
				for (var i = 0; i < response.length; i++) {
					monthAvgAmount.push(response[i].monthAvgAmount)
					countMonthSales.push(response[i].countMonthSales)
					gu.push(response[i].gu);
				}
				
		// 구별 매매 평균 가격
				const DATA_SETTINGS = {
					labels: gu,
					datasets : [
							{
								label : "대전 구별 데이터",
								data : monthAvgAmount,
								backgroundColor : [ 
									'rgba(255, 99, 132)',
					                'rgba(54, 162, 235)',
					                'rgba(255, 206, 86)',
					                'rgba(75, 192, 192)',
					                'rgba(153, 102, 255)',
					                'rgba(255, 159, 64)' ],
							}, ],
				};
				console.log(DATA_SETTINGS.datasets[0].data)
				const MY_CHART_DATA = {
					type : "doughnut",
					data : DATA_SETTINGS,
					 options: {
					        plugins: {
					            legend: {
					                labels: {
					                    font: {
					                        size: 8
					                    }
					                }
					            }
					        }
					    }
				};
				new Chart(document.getElementById("myChart"), MY_CHART_DATA);

		// 매매율이 높은 지역(건수)
				const DATA_SETTINGS2 = {
					labels: gu,
					datasets : [
							{
								label : "대전 구별 데이터",
								data : countMonthSales,
								backgroundColor : [ 
									'rgba(255, 99, 132)',
					                'rgba(54, 162, 235)',
					                'rgba(255, 206, 86)',
					                'rgba(75, 192, 192)',
					                'rgba(153, 102, 255)',
					                'rgba(255, 159, 64)' ],
							}, ],
				};
				console.log(DATA_SETTINGS2.datasets[0].data)
				const MY_CHART_DATA2 = {
					type : "doughnut",
					data : DATA_SETTINGS2,
					 options: {
					        plugins: {
					            legend: {
					                labels: {
					                    font: {
					                        size: 8
					                    }
					                }
					            }
					        }
					    }
				};
				new Chart(document.getElementById("myChart2"), MY_CHART_DATA2);
			}
		});

		/*
		// 구별 매매 평균 가격
		const DATA_SETTINGS = {
			datasets : [
					{
						label : "대전 구별 데이터",
						data : [ 20, 80, 10, 30, 40 ],
						backgroundColor : [ "rgb(245, 245, 245)",
								"rgb(255, 205, 86)" ],
					}, ],
		};
		console.log(DATA_SETTINGS)
		const MY_CHART_DATA = {
			type : "doughnut",
			data : DATA_SETTINGS,
		};
		new Chart(document.getElementById("myChart"), MY_CHART_DATA);

		// 매매율이 높은 지역(건수)
		const DATA_SETTINGS2 = {
			datasets : [
					{
						label : "대전 구별 데이터",
						data : [ 20, 80, 10, 30, 40 ],
						backgroundColor : [ "rgb(245, 245, 245)",
								"rgb(255, 205, 86)" ],
					}, ],
		};
		const MY_CHART_DATA2 = {
			type : "doughnut",
			data : DATA_SETTINGS2,
		};
		new Chart(document.getElementById("myChart2"), MY_CHART_DATA2);
		*/
	
		// 최근 6개월 대전 매매 시세 라인 그래프 가라 데이터!      
		/* 
		const labels = [
		  "2022-01",
		  "2022-02",
		  "2022-03",
		  "2022-04",
		  "2022-05",
		  "2022-06",
		];
		const data = {
		  labels: labels,
		  datasets: [
		    {
		      label: "대전 매매 가격",
		      backgroundColor: "rgb(255, 99, 132)",
		      borderColor: "rgb(255, 99, 132)",
		      data: [0, 10, 5, 2, 20, 30, 45],
		    },
		  ],
		};

		const config = {
		  type: "line",
		  data: data,
		  options: {},
		};
		const myChart = new Chart(document.getElementById("myChart3"), config);
		 */
	</script>
</body>
</html>
