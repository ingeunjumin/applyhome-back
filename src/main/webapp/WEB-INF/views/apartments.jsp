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
			<h1>Apartments</h1>
			<!-- search -->
			<div class="search">
				<label> <input id="searchBar" type="text"
					placeholder="검색어 입력..." />
				<input id="searchBarHidden" type="hidden" value="${search}" />
				</label>
			</div>
			<div class="row">
				<div class="data-container">
					<table class="content-table">
						<thead>
							<tr>
								<th>아파트 코드</th>
								<th>아파트 명</th>
								<th>도로명 주소</th>
								<th>구</th>
								<th>아파트 가격</th>
								<th>건축년도</th>
							</tr>
						</thead>
						<tbody>
						
							<c:choose>	 		
					 			<c:when test="${fn:length(pageHelper.list) > 0}">
					 				<c:forEach items="${pageHelper.list}" var="item">	
						 				<tr id="aptNumber${item.apartmentsNo}" onclick="getApartmentsWrapper(${item.apartmentsNo})">
								    		<td>${item.apartmentsNo}</td>
								    		<td>${item.apartmentsName}</td>
								    		<td>${item.addr}</td>
								    		<td>${item.gu}</td>
								    		<td>${item.price}</td>
								    		<td>${item.createAt}</td>			    							    			
				  						</tr>
									</c:forEach>
					 			</c:when>
					 			
					 			<c:otherwise>
					 				<tr>
					 					<td colspan="6">데이터가 없습니다.</td>
					 				</tr>
					 			</c:otherwise>
					 		</c:choose>
					 		
							<!-- <tr>
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
							</tr> -->
						</tbody>
					</table>
					<div class="pagination">
						<c:if test="${pageHelper.hasPreviousPage}">
				          	<a onclick="getApartmentsList(${pageHelper.pageNum-1},10)">Previous</a>
				          </c:if>
				          <c:forEach begin="${pageHelper.navigateFirstPage}" end="${pageHelper.navigateLastPage}"  var="pageNum">
				          	<a id="pageNum${pageNum}"  onclick="getApartmentsList(${pageNum},10)">${pageNum}</a>
				          </c:forEach>
				          <c:if test="${pageHelper.hasNextPage}">
				          	<a onclick="getApartments(${pageHelper.pageNum+1},10)">Next</a>
				          </c:if>
				          
				          <input id="nowPageNum" type="hidden" value="${pageHelper.pageNum}">
						<!--  <a href="#">Previous</a> <a href="#">1</a> <a href="#">2</a> <a
							href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">Next</a>-->
					</div>
				</div>
				<!--data-container end-->
				<div class="detail-data-container">
					<div class="wrapper">
						<div class="title">아파트 정보</div>
						<div class="form">
							<div class="inputfield">
								<label>아파트 이름 :</label> <input id="apartmentsName" type="text" class="input" />
							</div>
							<div class="inputfield">
								<label>도로명 주소 :</label> <input id="addr" type="text" class="input" />
							</div>
							<div class="inputfield">
								<label>최근 매매 가격 :</label> <input id="price" type="text" class="input" readonly />
							</div>
							<div class="inputfield">
								<label>난방방식 :</label> <input type="password" class="input" />
							</div>
							<div class="inputfield">
								<label>건축 년도 :</label> <input id="createAt" type="text" class="input" readonly/>
							</div>
							<div class="inputfield">
								<label>동 수 :</label> <input type="text" class="input" />
							</div>
							<div class="inputfield">
								<label>세대 수 :</label> <input type="text" class="input" />
							</div>
							<div class="inputfield">
								<label>관리방식 :</label> <input type="text" class="input" />
							</div>
							<div class="inputfield">
								<label>주거전용면적 :</label> <input type="text" class="input" />
							</div>
							<div class="inputfield">
								<label>홈페이지주소 :</label> <input type="text" class="input" />
							</div>
							<div class="inputfield">
								<div id="map" style="width: 100%; height: 230px;"></div>
							</div>
							<div class="inputfield">
								<input id="apartmentsHidden" type="hidden" />
								<input id="apartmentsUpdateHidden" type="hidden" />
								<input id="apartmentsUpdate" type="submit" value="수정하기" class="btn" />
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
	
	<script type="text/javascript">
	
	
	function getApartmentsList(pageNum, pageSize) {
	    var search = $("#searchBarHidden").val();
		var controllUrl =
			"/apartments/search?name="+search+"&pageNum="+pageNum+"&pageSize="+pageSize;
	    if (search != "null") {
	    	controllUrl = 
	    		"/apartments/search?name="+search+"&pageNum="+pageNum+"&pageSize="+pageSize;
	    }
		location.href = controllUrl
	}
	
	function getApartmentsWrapper(apartmentsNo){
		$("#apartmentsHidden").val("aptNumber"+apartmentsNo);
		$('#apartmentsUpdateHidden').val(apartmentsNo);
		$('#map').children().remove();
		
		$.ajax({
			url : "/apartments/"+ apartmentsNo ,
			type : 'GET',
			dataType: "json",
			success : function(response) {
				$('#apartmentsName').val(response.apartmentsName);
				$('#addr').val(response.addr);
				$('#price').val(response.price);
				$('#createAt').val(response.createAt);
		        var longitude = response.longitude;
				var latitude = response.latitude;
				
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
		});
	}
	
		$('.content-table tbody tr').on('click',function(){
			var element = $("#apartmentsHidden").val();
			$('.content-table tbody tr').each(function(index, item){
				var itemId = item.id
				if(element === itemId){
					$('#'+itemId).css('font-weight', 'bold')

				}
				if(element !== itemId){
					$('#'+itemId).css('font-weight', 'normal')
				}
          	})
		});

	
	
	
	$("#apartmentsUpdate").click(function (){
		if (confirm("정말로 수정 하시겠습니까?")) {
			var apartmentsNo = $("#apartmentsUpdateHidden").val();
			var apartmentsName = $('#apartmentsName').val();
			var addr = $('#addr').val();
			var jsonData = {
					apartmentsName : apartmentsName,
					addr : addr,
			}
			$.ajax({
				url : "/apartments/"+ apartmentsNo ,
				type : 'PATCH',
				contentType: "application/json",
				dataType: "json",
				data: JSON.stringify(jsonData),
				success : function(response){
					 if (response > 0) {
						 if(apartmentsName ===''){
							 alert("데이터를 입력해주세요");
							 $('#apartmentsName').focus()
							 return false;
						 }
						 if(addr === ''){
							 alert("데이터를 입력해주세요");
							 $('#addr').focus()
							 return false;
						 }
						 alert("수정 완료");
						 var pageNum = $('#nowPageNum').val();
						 getApartmentsList(pageNum,10);
					 }
				}
			})
		}
	})
	
	$('#searchBar').keyup(function(key) {
		var pageSize = 10;
		var pageNum = $('#nowPageNum').val();
		if (key.keyCode == 13) {
			var search = $('#searchBar').val().trim();//input에 작성한 작성자를 가져옴
			if (search != '') {
				location.href="/apartments/search?writer="+search+"&pageNum="+pageNum+"&pageSize="+pageSize
			}
		}
	});
	</script>
</body>
</html>