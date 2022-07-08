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
			<a href="/excel/members" class="excel-btn">엑셀 다운로드</a>
				<label> <input id="searchBar" type="text"
					placeholder="ID 또는 이름 입력..." onfocus="this.placeholder=''"
					onblur="this.placeholder='ID 또는 이름 입력...'" /> <input id="keyword"
					type="hidden" value="${search}">
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
								<c:when test="${fn:length(pageHelper.list)>0}">
									<c:forEach items="${pageHelper.list}" var="item">
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
						<c:if test="${pageHelper.hasPreviousPage}">
							<a onclick="getUserDataList(${pageHelper.pageNum-1},10)" href="#">Previous</a>
						</c:if>
						<c:forEach items="${pageHelper.navigatepageNums}" var="pageNum">
							<a id="pageNum${pageNum}"
								onclick="getUserDataList(${pageNum},10)"> ${pageNum}</a>
						</c:forEach>
						<c:if test="${pageHelper.hasNextPage}">
							<a onclick="getUserDataList(${pageHelper.pageNum+1},10)" href="#">Next</a>
						</c:if>
						<input id="nowPageNum" type="hidden" value="${pageHelper.pageNum}">
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
								<label>Password</label> <input type="password" class="input"
									id="password" placeholder="숫자,대문자,특수문자를 포함한 6글자 이상 입력..."
									onfocus="this.placeholder=''"
									onblur="this.placeholder='숫자,대문자,특수문자를 포함한 6글자 이상 입력...'" />
							</div>
							<div class="inputfield">
								<label>Confirm Password</label> <input type="password"
									class="input" id="confirmPassword" />
							</div>
							<p>
							<div class="alert" id="passwordStrength"></div>
							</p>
							<div class="inputfield" id="selectBoxDiv">
								<label>Authority</label>
								<div class="custom_select">
									<select>
										<option value="null">SELECT</option>
										<option value="root">ROOT</option>
										<option value="admin">ADMIN</option>
										<option value="admin">USER</option>
									</select>
								</div>
								<input id="userAuth" type="hidden" value="${auth.get(0).getRoleCode()}">
							</div>
							<div class="inputfield">
								<label>Email Address</label> <input type="text" class="input"
									id="email" />
							</div>
							<div class="inputfield">
								<label>Phone Number</label> <input type="text" class="input"
									id="phone" placeholder="'-'를 제외한 핸드폰번호를 입력하세요..."
									onfocus="this.placeholder=''"
									onblur="this.placeholder=''-'를 제외한 핸드폰번호를 입력하세요...'" />
							</div>
							<div class="inputfield" id="address">
								<label>Address</label>
								<textarea class="textarea" onclick="getPostCode()" id="address"></textarea>
							</div>
							<div class="inputfield">
								<label>Postal Code</label>
								<textarea type="text" class="input" id="postalCode"
									onclick="getPostCode()"></textarea>
							</div>
							<div class="inputfield">
								<label>Detail Address</label> <input type="text" class="input"
									id="detailAddress" placeholder="상세주소를 입력해주세요..."
									onfocus="this.placeholder=''"
									onblur="this.placeholder='상세주소를 입력해주세요...'" />
							</div>
							<div class="inputfield terms">
								<label class="check"> <input type="checkbox"
									checked="checked" id="checkbox" /> <span class="checkmark"
									id="checkbox"></span>
								</label>
								<p>Agreed to terms and conditions</p>
							</div>
							<div class="inputfield">
								<input type="submit" value="수정하기" class="btn"
									onclick="userUpdate()" /> \ <input id="userNoHidden"
									type="hidden" value="">
							</div>
						</div>
					</div>
				</div>
				<!--detail-data-container-->
			</div>
		</div>
	</main>
	<!-- jQuery cdn 최신 불러오기 start  -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!--  jQuery cdn 최신 불러오기 end -->
	<!-- 도로명 주소 CDN strat -->
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- 도로명 주소 CDN end -->
	<script type="module"
		src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule
		src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script defer src="/resources/static/js/theme.js"></script>
	<script type="text/javascript">
	passwordSecurity();// 비밀번호 보안 메소드 호출
	selectBoxDisplay();// userAuth 로그인 계정의 권한으로 selectBox 보여줄지 말지 정하는 함수
	
// 검색창 입력 값이 있으면 검색된 사용자를 보여줄지 전체 사용자를 보여줄지 함수
	function getUserDataList(pageNum, pageSize){
		var search = $('#keyword').val();
		var URL = '/member?pageNum='+pageNum+'&pageSize='+pageSize;
			if($('#keyword').val() != null){
				URL = '/member/search?search='+search+'&pageNum='+pageNum+'&pageSize='+pageSize; 
			}
				location.href = URL;
	}
	
	
// userAuth 로그인 계정의 권한으로 selectBox 보여줄지 말지 정하는 함수
// ex) root => selectBox (O) , admin or user => selectBox (X)
	function selectBoxDisplay(){
		var userAuth = $('#userAuth').val();
		if(userAuth !== "ROOT"){
			$('#selectBoxDiv').css("display","none")
		}
	}
	
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
					$('textarea#address').val(response.address);
					$('textarea#postalCode').val(response.postalCode);
					$('#detailAddress').val(response.detailAddress);
				}
			})
		}
	
// 특정 계정 수정하기
		function userUpdate(){
			var userNo = $('#userNoHidden').val().trim();
			var name = $('#name').val().trim();
			var userId = $('#userId').val().trim();
			var password = $('#password').val().trim();
			var userPassword = $('#confirmPassword').val().trim();
			var phone = $('#phone').val().trim();
			var email = $('#email').val().trim();
			var address = $('textarea#address').val().trim(); //textarea 값 가져오기
			var postalCode = $('textarea#postalCode').val().trim();
			var detailAddress = $('#detailAddress').val().trim();
			var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/; //핸드폰번호 확인 정규 표현식
			var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;//이메일 정규 표현식
			
			var jsonData = {
					userNo : userNo,
					name : name,
					userId : userId,
					userPassword : userPassword,
					phone : phone,
					email : email,
					address : address,
					postalCode : postalCode,
					detailAddress : detailAddress
					
			}
//특정 계정 수정 중 input값 체크 구간 start
			// 빈칸 여부 확인 start	
			if(name != "" && userId != "" && phone != "" && email != "" && address != "" && postalCode != ""){// 빈값 여부 확인
			}else{
				alert("정보를 입력해주세요!")
				return false;
			}// 빈칸 여부 확인 end	
		
			// 비밀번호 확인 start
			if(password == userPassword){
				$('#confirmPassword').css('color','green');
			}else{
				alert("비밀번호가 일치하지 않습니다.")
				$('#confirmPassword').css('color','red');
				$('#confirmPassword').focus();
				return false;
			} // 비밀번호 확인 end
			
			// 이메일 정규 표현식 start
			if (regEmail.test(email) === true) {// 이메일 정규 표현식.test(email) === true
		    	console.log("email OK!")
		   	}
			else{
				alert('이메일 형식이 아닙니다.');
				$('#email').focus();
			    return false;
			}// 이메일 정규 표현식 end
			
			// 휴대폰번호 정규 표현식 start
			if (regPhone.test(phone) === true) {// 휴대폰번호 정규 표현식
			   	console.log("휴대폰 OK!")
			}else{
			   alert('휴대폰번호 형식이 아닙니다.');
			   $('#phone').focus();
			   return false;
			}// 휴대폰번호 정규 표현식 end	
			
			// 체크 여부 확인 start
			if($('#checkbox').is(':checked')){ // 체크 여부 확인
			}else{
				alert("동의 항목을 체크해주세요!")
				return false;
			}// 체크 여부 확인 end
			
			if(confirm("수정하시겠습니까?")){
				//ajax start
				$.ajax({
					url : '/member/update',
					type : 'PATCH',
					contentType : 'application/json',//서버에 json타입으로 보낼 예정(요청).
					dataType : 'json', //서버결과를 json으로 응답받겠다.
					data : JSON.stringify(jsonData),
					success: function(response){
						if(response > 0){
							console.log(response)
							}
						}
					}) //ajax end
				alert("수정되었습니다.")
			}
//특정 계정 수정 중 input값 체크 구간 end
		}//userUpdate() end
		
// select user search
		$('#searchBar').keyup(function(key) {// 키보드를 뗄 때 무엇을 눌렀다가 뗐는데 파라미터 key에 들어감.
			var pageNum = $('#nowPageNum').val();
			var pageSize = 10;
			// keycode = 13 은 enter를 의미
			if (key.keyCode == 13) {
				var search = $('#searchBar').val().trim(); 
				if (search != '') {
					location.href = '/member/search?search='+search+'&pageNum='+pageNum+'&pageSize='+pageSize
				}
				
			}
		});
	
// 이메일 정규 표현식
		function fn_submit(text) {
		      // var text = document.getElementById('text').value;
		      var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		      if (regEmail.test(text) === true) {
		          alert('입력된 값은 이메일입니다.');
		      }
	 	 }	
	 	 
// 핸드폰번호 정규 표현식
		function submitPhoneNum(phone) {
	// 정규 표현식이라는 의미 : 변수 앞에 reg
			var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
		    if (regPhone.test(phone) === true) {
		    	console.log("휴대폰 OK!")
		    }else{
		    	alert('휴대폰번호 형식이 아닙니다.');
		    	$('#phone').focus();
		    }
	  	}
// 번외 : 안전 비밀번호 정규 표현식 ex) 6글자 이상(영문,숫자,특수기호)
	function passwordSecurity() { // 비밀번호 보안 함수

	    $('#password, #confirmPassword').on('keyup', function(e) {

	        if($('#password').val() == '' && $('#confirmPassword').val() == '')
	        {
	            $('#passwordStrength').removeClass().html('');

	            return false;
	        }

	     if($('#passwordInput').val() != '' && $('#confirmPasswordInput').val() != '' && $('#passwordInput').val() != $('#confirmPasswordInput').val())
	        {
	            $('#passwordStrength').removeClass().addClass('alert alert-error').html('Passwords do not match!');
	            return false;
	        }

	        // Must have capital letter, numbers and lowercase letters
	        // 비밀번호 보안 강함
	        var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
			
	        // Must have either capitals and lowercase letters or lowercase and numbers
	        // 비밀번호 보안 중간
	        var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");

	        // Must be at least 6 characters long
	        // 비밀번호 보안 약함
	        var okRegex = new RegExp("(?=.{6,}).*", "g");

	        if (okRegex.test($(this).val()) === false) {
	            // If ok regex doesn't match the password
	            $('#passwordStrength').removeClass().addClass('alert alert-error').html('비밀번호는 6글자 이상으로 입력해주세요.');

	        } else if (strongRegex.test($(this).val())) {
	            // If reg ex matches strong password
	            $('#passwordStrength').removeClass().addClass('alert alert-success').html('보안이 강한 비밀번호 입니다.').css('color','Green');
	        } else if (mediumRegex.test($(this).val())) {
	            // If medium password matches the reg ex
	            $('#passwordStrength').removeClass().addClass('alert alert-info').html('대문자, 숫자, 특수문자를 추가하여 보안을 강화해주세요.').css('color','Orange');
	        } else {
	            // If password is ok
	            $('#passwordStrength').removeClass().addClass('alert alert-error').html('보안이 약한 비밀번호 입니다. 추가 입력해주세요.').css('color','Red');
	        }

	        return true;
	    });
	};	

	
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
