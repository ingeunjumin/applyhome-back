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
              <div class="border black">
                <canvas id="myChart"></canvas>
              </div>
            </div>
            <div class="dashboard-graph-circle">
              <h3>매매율이 높은 지역</h3>
              <div class="border black">
                <canvas id="myChart2"></canvas>
              </div>
            </div>
          </div>
          <!-- 최근 3개월 대전 매매 시세 -->
          <div class="dashboard-graph">
            <div class="dashboard-graph-bar">
              <h3>최근 6개월 대전 매매 시세</h3>
              <div class="border black">
                <canvas id="myChart3"></canvas>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script defer src="/resources/static/js/theme.js"></script>
    <script>
      const DATA_SETTINGS = {
        datasets: [
          {
            label: "대전 구별 데이터",
            data: [20, 80, 10, 30, 40],
            backgroundColor: ["rgb(245, 245, 245)", "rgb(255, 205, 86)"],
          },
        ],
      };
      const MY_CHART_DATA = {
        type: "doughnut",
        data: DATA_SETTINGS,
      };
      new Chart(document.getElementById("myChart"), MY_CHART_DATA);
      new Chart(document.getElementById("myChart2"), MY_CHART_DATA);

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
    </script>
  </body>
</html>
