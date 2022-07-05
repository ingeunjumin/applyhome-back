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
        <div class="home-container">
          <h2>대전 부동산 데이터 (${today})</h2>
          <div class="rank-row">
            <div class="rank-item">
              <div class="item-header">
                <h6>중구 매매 순위</h6>
              </div>
              <div class="item-body">
                <table>
                  <tbody id ="Jung-gu">
                     <!--<tr> 
                      <td>1</td>
                      <td>대주파크빌</td>
                      <td>2.3억</td>
                    </tr>
                    <tr>
                      <td>2</td>
                      <td>대주파크빌</td>
                      <td>2.3억</td>
                    </tr>
                    <tr>
                      <td>3</td>
                      <td>대주파크빌</td>
                      <td>2.3억</td>
                    </tr>
                    <tr>
                      <td>4</td>
                      <td>대주파크빌</td>
                      <td>2.3억</td>
                    </tr>
                    <tr>
                      <td>5</td>
                      <td>대주파크빌</td>
                      <td>2.3억</td>
                    </tr>-->
                  </tbody>
                </table>
              </div>
            </div>
            <div class="rank-item">
              <div class="item-header">
                <h6>동구 매매 순위</h6>
              </div>
              <div class="item-body">
                <table>
                  <tbody id = "Dong-gu">
                   <!--  <tr>
                      <td>1</td>
                      <td>대주파크빌</td>
                      <td>2.3억</td>
                    </tr>
                    <tr>
                      <td>2</td>
                      <td>대주파크빌</td>
                      <td>2.3억</td>
                    </tr>
                    <tr>
                      <td>3</td>
                      <td>대주파크빌</td>
                      <td>2.3억</td>
                    </tr>
                    <tr>
                      <td>4</td>
                      <td>대주파크빌</td>
                      <td>2.3억</td>
                    </tr>
                    <tr>
                      <td>5</td>
                      <td>대주파크빌</td>
                      <td>2.3억</td>
                    </tr> -->
                  </tbody>
                </table>
              </div>
            </div>
            <div class="rank-item">
              <div class="item-header">
                <h6>대덕구 매매 순위</h6>
              </div>
              <div class="item-body">
                <table>
                  <tbody id = "Daedeok-gu">
                    <!--  <tr>
                      <td>1</td>
                      <td>대주파크빌</td>
                      <td>2.3억</td>
                    </tr>
                    <tr>
                      <td>2</td>
                      <td>대주파크빌</td>
                      <td>2.3억</td>
                    </tr>
                    <tr>
                      <td>3</td>
                      <td>대주파크빌</td>
                      <td>2.3억</td>
                    </tr>
                    <tr>
                      <td>4</td>
                      <td>대주파크빌</td>
                      <td>2.3억</td>
                    </tr>
                    <tr>
                      <td>5</td>
                      <td>대주파크빌</td>
                      <td>2.3억</td>
                    </tr> -->
                  </tbody>
                </table>
              </div>
            </div>
            <div class="rank-item">
              <div class="item-header">
                <h6>서구 매매 순위</h6>
              </div>
              <div class="item-body">
                <table>
                  <tbody id="Seo-gu">
                    <!--  <tr>
                      <td>1</td>
                      <td>대주파크빌</td>
                      <td>2.3억</td>
                    </tr>
                    <tr>
                      <td>2</td>
                      <td>대주파크빌</td>
                      <td>2.3억</td>
                    </tr>
                    <tr>
                      <td>3</td>
                      <td>대주파크빌</td>
                      <td>2.3억</td>
                    </tr>
                    <tr>
                      <td>4</td>
                      <td>대주파크빌</td>
                      <td>2.3억</td>
                    </tr>
                    <tr>
                      <td>5</td>
                      <td>대주파크빌</td>
                      <td>2.3억</td>
                    </tr> -->
                  </tbody>
                </table>
              </div>
            </div>
            <div class="rank-item">
              <div class="item-header">
                <h6>유성구 매매 순위</h6>
              </div>
              <div class="item-body">
                <table>
                  <tbody id="Yuseong-gu">
                    <!--  <tr>
                      <td>1</td>
                      <td>대주파크빌</td>
                      <td>2.3억</td>
                    </tr>
                    <tr>
                      <td>2</td>
                      <td>대주파크빌</td>
                      <td>2.3억</td>
                    </tr>
                    <tr>
                      <td>3</td>
                      <td>대주파크빌</td>
                      <td>2.3억</td>
                    </tr>
                    <tr>
                      <td>4</td>
                      <td>대주파크빌</td>
                      <td>2.3억</td>
                    </tr>
                    <tr>
                      <td>5</td>
                      <td>대주파크빌</td>
                      <td>2.3억</td>
                    </tr> -->
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          <!-- table end -->
          <div class="graph-container">
            <div class="bar-graph">
              <div class="graph-header">
                <h6>최근 6개월 대전 매매 평균시세</h6>
              </div>
              <div class="graph-body">
                <canvas id="myChart3"></canvas>
              </div>
            </div>
            <div class="dough-graph">
              <div class="graph-header">
                <h6>구별 매매 평균</h6>
              </div>
              <div class="graph-body">
                <canvas id="myChart"></canvas>
              </div>
            </div>
            <div class="dough-graph">
              <div class="graph-header">
                <h6>매매율이 높은 지역</h6>
              </div>
              <div class="graph-body">
                <canvas id="myChart2"></canvas>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
    <script defer src="/resources/static/js/theme.js"></script>
    	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
		// 최근 6개월 대전 매매 시세 그래프 start
		$.ajax({
			url : "/statistics/sixmonth/contract",
			data : "GET",
			dataType : "json",
			success : function(response) {
				const labelArray = [];
				const dataArray = [];
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

				const config = {
					type : "line",
					data : datas,
					options : {},
				};
				
				const myChart = new Chart(document.getElementById("myChart3"),config);
			}
		});
		
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
		
		getJungGuAptTopList()
		function getJungGuAptTopList(){
			var gu = "중구";
			$.ajax({
				url : "/home/aptTop/" + gu,
				type : 'GET',
				dataType: "json",
				success : function(response) {
					console.log(response)
					let html = " ";
					for(var i=0;i<response.length;++i){
						var price = response[i].price.toString(10);
						var StringPrice = response[i].price.toString(10).split("");
						if(StringPrice.length == 6){
							price = StringPrice[0]+StringPrice[1]+"."+StringPrice[2]+"억";
							if(StringPrice[2] === "0"){
								price = StringPrice[0]+StringPrice[1]+"억";
							}
						}
						if(StringPrice.length == 5){
							price = StringPrice[0]+"."+StringPrice[1]+"억";
							if(StringPrice[1] === "0"){
								price = StringPrice[0]+"억";
							}
						}
						if(StringPrice.length <= 4){
							StringPrice = price + "만";
							price = StringPrice
						}
						html = 
						"<tr><td>" +
						response[i].apartmentsName +
						"</td><td>"+
						price
						+"</td></tr>"
						$('#Jung-gu').append(html);
					}
				}
			})
		}
		
		getDongGuAptTopList()
		function getDongGuAptTopList(){
			var gu = "동구";
			$.ajax({
				url : "/home/aptTop/" + gu,
				type : 'GET',
				dataType: "json",
				success : function(response) {
					console.log(response)
					let html = " ";
					for(var i=0;i<response.length;++i){
						var price = response[i].price.toString(10);
						var StringPrice = response[i].price.toString(10).split("");
						if(StringPrice.length == 6){
							price = StringPrice[0]+StringPrice[1]+"."+StringPrice[2]+"억";
							if(StringPrice[2] === "0"){
								price = StringPrice[0]+StringPrice[1]+"억";
							}
						}
						if(StringPrice.length == 5){
							price = StringPrice[0]+"."+StringPrice[1]+"억";
							if(StringPrice[1] === "0"){
								price = StringPrice[0]+"억";
							}
						}
						if(StringPrice.length <= 4){
							StringPrice = price + "만";
							price = StringPrice
						}
						html = 
						"<tr><td>" +
						response[i].apartmentsName +
						"</td><td>"+
						price
						+"</td></tr>"
						$('#Dong-gu').append(html);
					}
				}
			})
		}
		getDaedeokGuAptTopList()
		function getDaedeokGuAptTopList(){
			var gu = "대덕구";
			$.ajax({
				url : "/home/aptTop/" + gu,
				type : 'GET',
				dataType: "json",
				success : function(response) {
					console.log(response)
					let html = " ";
					for(var i=0;i<response.length;++i){
						var price = response[i].price.toString(10);
						var StringPrice = response[i].price.toString(10).split("");
						if(StringPrice.length == 6){
							price = StringPrice[0]+StringPrice[1]+"."+StringPrice[2]+"억";
							if(StringPrice[2] === "0"){
								price = StringPrice[0]+StringPrice[1]+"억";
							}
						}
						if(StringPrice.length == 5){
							price = StringPrice[0]+"."+StringPrice[1]+"억";
							if(StringPrice[1] === "0"){
								price = StringPrice[0]+"억";
							}
						}
						if(StringPrice.length <= 4){
							StringPrice = price + "만";
							price = StringPrice
						}
						html = 
						"<tr><td>" +
						response[i].apartmentsName +
						"</td><td>"+
						price
						+"</td></tr>"
						$('#Daedeok-gu').append(html);
					}
				}
			})
		}
		getYuseongGuAptTopList()
		function getYuseongGuAptTopList(){
			var gu = "유성구";
			$.ajax({
				url : "/home/aptTop/" + gu,
				type : 'GET',
				dataType: "json",
				success : function(response) {
					console.log(response)
					let html = " ";
					for(var i=0;i<response.length;++i){
						var price = response[i].price.toString(10);
						var StringPrice = response[i].price.toString(10).split("");
						if(StringPrice.length == 6){
							price = StringPrice[0]+StringPrice[1]+"."+StringPrice[2]+"억";
							if(StringPrice[2] === "0"){
								price = StringPrice[0]+StringPrice[1]+"억";
							}
						}
						if(StringPrice.length == 5){
							price = StringPrice[0]+"."+StringPrice[1]+"억";
							if(StringPrice[1] === "0"){
								price = StringPrice[0]+"억"
							}
						}
						if(StringPrice.length <= 4){
							StringPrice = price + "만";
							price = StringPrice
						}
						html = 
						"<tr><td>" +
						response[i].apartmentsName +
						"</td><td>"+
						price
						+"</td></tr>"
						$('#Yuseong-gu').append(html);
					}
				}
			})
		}
		getSeoGuAptTopList()
		function getSeoGuAptTopList(){
			var gu = "서구";
			$.ajax({
				url : "/home/aptTop/" + gu,
				type : 'GET',
				dataType: "json",
				success : function(response) {
					console.log(response)
					let html = " ";
					for(var i=0;i<response.length;++i){
						var price = response[i].price.toString(10);
						var StringPrice = response[i].price.toString(10).split("");
						if(StringPrice.length == 6){
							price = StringPrice[0]+StringPrice[1]+"."+StringPrice[2]+"억";
							if(StringPrice[2] === "0"){
								price = StringPrice[0]+StringPrice[1]+"억";
							}
						}
						if(StringPrice.length == 5){
							price = StringPrice[0]+"."+StringPrice[1]+"억";
							if(StringPrice[1] === "0"){
								price = StringPrice[0]+"억";
							}
						}
						if(StringPrice.length <= 4){
							StringPrice = price + "만";
							price = StringPrice
						}
						html = 
						"<tr><td>" +
						response[i].apartmentsName +
						"</td><td>"+
						price
						+"</td></tr>"
						$('#Seo-gu').append(html);
					}
				}
			})
		}
	</script>
  </body>
</html>
