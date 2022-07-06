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
        <h1>Crawling data</h1>
        <div class="row">
          <div class="data-container">
					<table class="content-table">
						<thead>
							<tr>
								<th>No</th>
								<th>Name</th>
								<th>Address</th>
								<th>Date</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${fn:length(pageHelper.list) > 0}">
									<c:forEach items="${pageHelper.list}" var="item">
										<tr id="aptNumber${item.subscriptionNo}"
											onclick="getApartmentsWrapper(${item.subscriptionNo})">
											<td>${item.subscriptionNo}</td>
											<td>${item.apartmentsName}</td>
											<td>${item.apartmentsAddress}</td>
											<td>${item.ASapartmentsSubscriptionDate}</td>
										</tr>
									</c:forEach>
								</c:when>

								<c:otherwise>
									<tr>
										<td colspan="4">데이터가 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
							<!--<tr>
                  <td>1</td>
                  <td>대주파크빌</td>
                  <td>대전 충정로 136</td>
                  <td>동구</td>
                  <td>34,500</td>
                  <td>2022-06-27</td>
                </tr>
                <tr class="active-row">
                  <td>1</td>
                  <td>대주파크빌</td>
                  <td>대전 충정로 136</td>
                  <td>동구</td>
                  <td>34,500</td>
                  <td>2022-06-27</td>
                </tr>
                <tr>
                  <td>1</td>
                  <td>대주파크빌</td>
                  <td>대전 충정로 136</td>
                  <td>동구</td>
                  <td>34,500</td>
                  <td>2022-06-27</td>
                </tr>  -->
						</tbody>
					</table>
					<div class="pagination">
						<c:if test="${pageHelper.hasPreviousPage}">
							<a onclick="getSubscriptionDataList(${pageHelper.pageNum-1},10)" href="#">Previous</a>
						</c:if>
						<c:forEach items="${pageHelper.navigatepageNums}" var="pageNum">
							<a id="pageNum${pageNum}"
								onclick="getSubscriptionDataList(${pageNum},10)"> ${pageNum}</a>
						</c:forEach>
						<c:if test="${pageHelper.hasNextPage}">
							<a onclick="getSubscriptionDataList(${pageHelper.pageNum+1},10)" href="#">Next</a>
						</c:if>
						<input id="nowPageNum" type="hidden" value="${pageHelper.pageNum}">
					</div>
					<div class="pagination">
            <!--
              <a href="#">Previous</a>
              <a href="#">1</a>
              <a href="#">2</a>
              <a href="#">3</a>
              <a href="#">4</a>
              <a href="#">5</a>
              <a href="#">Next</a>-->
            </div>
          </div>
          <!--data-container end-->
          <div class="detail-data-container">
            <div class="wrapper">
              <div class="title">위치 정보</div>
              <input id="info" type="hidden" value="" />
              <div class="form">
                <div class="inputfield">
                <div id="map" style="width: 100%; height: 300px;"></div>
                </div>
              </div>
            </div>
          </div>
          <!--detail-data-container-->
        </div>
      </div>
    </main>
    <script defer src="/resources/static/js/theme.js"></script>
    <script
    src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
    crossorigin="anonymous"
	></script>
	<script
	   type="text/javascript"
	   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0fd0f8b5a2dc48f454d8049f912ec8b2"
	></script>
    <script>
    function getSubscriptionDataList(pageNum,pageSize){
    	location.href = "/data?pageNum="+pageNum+"&pageSize="+pageSize
    }
    
    function getApartmentsWrapper(subscriptionNo){
    	$('#map').children().remove();
    	var info = $('#info').val(subscriptionNo);
    	var latitude = null;
    	var longitude = null;
    	$.ajax({
    		url : "/data/"+subscriptionNo ,
			type : 'GET',
			dataType: "json",
			success : function(response) {
				console.log(response)
				latitude = response.latitude;
				longitude = response.longitude;
				
				//카카오맵
			    var mapContainer = document.getElementById("map"), // 지도를 표시할 div
			    mapOption = {
			        center: new kakao.maps.LatLng(latitude, longitude), // 지도의 중심좌표
			        level: 3, // 지도의 확대 레벨
			    };
			    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			 	// 마커가 표시될 위치입니다
			    var markerPosition = new kakao.maps.LatLng(latitude, longitude);       
			    // 마커를 생성합니다
			    var marker = new kakao.maps.Marker({
			      position: markerPosition,
			    });
			    // 마커가 지도 위에 표시되도록 설정합니다
			    marker.setMap(map);
			}
    	})
    }
     
    </script>
  </body>
</html>
