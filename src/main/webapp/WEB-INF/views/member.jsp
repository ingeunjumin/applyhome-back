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
			<h1>Members</h1>
			<!-- search -->
			<div class="search">
				<label> <input id="searchBar" type="text"
					placeholder="검색어 입력..." />
				</label>
			</div>
			<div class="row">
				<div class="data-container">
					<table class="content-table">
						<thead>
							<tr>
								<th>No</th>
								<th>Name</th>
								<th>ID</th>
								<th>Auth</th>
								<th>Join at</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${fn:length(usersData)>0}">
									<c:forEach items="${usersData}" var="item">
										<tr onclick="getUserData(${item.userNo})">
											<td>${item.userNo}</td>
											<td>${item.name}</td>
											<td>${item.userId}</td>
											<td>${item.roleName}</td>
											<td>${item.createAt}</td>
										</tr>
									</c:forEach>
								</c:when>
							</c:choose>
							<!-- <tr>
								<td>1</td>
								<td>현상원</td>
								<td>apple1</td>
								<td>ROOT</td>
								<td>2022-06-27</td>
							</tr>
							<tr class="active-row">
								<td>2</td>
								<td>현상원</td>
								<td>apple1</td>
								<td>ADMIN</td>
								<td>2022-06-27</td>
							</tr>
							<tr>
								<td>3</td>
								<td>현상원</td>
								<td>apple1</td>
								<td>USER</td>
								<td>2022-06-27</td>
							</tr> -->
						</tbody>
					</table>
					<div class="pagination">
						<a href="#">Previous</a> <a href="#">1</a> <a href="#">2</a> <a
							href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">Next</a>
					</div>
				</div>
				<!--data-container end-->
				<div class="detail-data-container">
					<div class="wrapper">
						<div class="title">사용자 정보</div>
						<div class="form">
							<div class="inputfield">
								<label>Name :</label> <input type="text" class="input" id="name" />
							</div>
							<div class="inputfield">
								<label>ID :</label> <input type="text" class="input" id="userId" />
							</div>
							<div class="inputfield">
								<label>Password</label> <input type="password" class="input" />
							</div>
							<div class="inputfield">
								<label>Confirm Password</label> <input type="password"
									class="input" />
							</div>
							<div class="inputfield">
								<label>Authority</label>
								<div class="custom_select">
									<select>
										<option value="null">SELECT</option>
										<option value="root">ROOT</option>
										<option value="admin">ADMIN</option>
										<option value="admin">USER</option>
									</select>
								</div>
							</div>
							<div class="inputfield">
								<label>Email Address</label> <input type="text" class="input"
									id="email" />
							</div>
							<div class="inputfield">
								<label>Phone Number</label> <input type="text" class="input"
									id="phone" />
							</div>
							<div class="inputfield" id="address">
								<label>Address</label>
								<textarea class="textarea" onclick="getPostCode()"></textarea>
							</div>
							<div class="inputfield">
								<label>Postal Code</label> <input type="text" class="input"
									id="postalCode" onclick="getPostCode()" />
							</div>
							<div class="inputfield terms">
								<label class="check"> <input type="checkbox" /> <span
									class="checkmark"></span>
								</label>
								<p>Agreed to terms and conditions</p>
							</div>
							<div class="inputfield">
								<input type="submit" value="수정하기" class="btn" /> <input
									id="userNoHidden" type="hidden" value="">
							</div>
						</div>
					</div>
				</div>
				<!--detail-data-container-->
			</div>
		</div>
	</main>
	<!-- 도로명 주소 CDN -->
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="module"
		src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule
		src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script defer src="/resources/static/js/theme.js"></script>
	<script type="text/javascript">
	//특정 계정 정보 가져오기
	function getUserData(userNo){
		$('#userNoHidden').val(userNo);
		$.ajax({
			url : "/member/"+userNo,
			data : "GET",
			dataType : "json",
			success : function(response){
				console.log(response);
				$('#name').val(response.name);
				$('#userId').val(response.userId);
				$('#email').val(response.email);
				$('#phone').val(response.phone);
				$('#address').val(response.address);
				$('#postalCode').val(response.postalCode);
			}
		})
	}
	
	//UPDATE @PatchMapping("/member/update/{userNo}")
	// var jsonData = { }
	/*
	var userNo = $('#userNoHidden').val();
	$.ajax({
         url : '/member/update/'+userNo,
         type : 'PATCH',
         contentType : 'application/json',//서버에 json타입으로 보낼 예정(요청).
         dataType : 'json', //서버결과를 json으로 응답받겠다.
         data : JSON.stringify(jsonData),
         success: function(response){
        	 if(response > 0){
        		 
        	 }
         }
	})
         */
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 도로명 주소 가져오는 메소드(Daum주소 찾기 팝업)
    function getPostCode(){
  	  new daum.Postcode({
  		  //oncomplete : 너가 enter를 눌렀다면 실행해줘 라는 함수
            oncomplete: function(data) {
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
                // 도로명 주소만 입력하고 싶을 때 사용코드
                //$(".textarea").val(fullRoadAddr);
                
                // 도로명 주소 + 우편 번호까지 입력하고 싶을 때 사용코드
                //$(".textarea").val(data.zonecode+', '+fullRoadAddr);
                $(".textarea").val(fullRoadAddr);
                $("#postalCode").val(data.zonecode);
                
                // 계정 클릭시 입력된 주소 clear, 데이터에 주소 들어가면 지우기
				$('tr').click(function(){
					$(".textarea").val("");
			        $("#postalCode").val("");
				})
            }
        }).open();
    }
	</script>
</body>
</html>
