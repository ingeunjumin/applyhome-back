var isRecaptchachecked = false;
function recaptchaCallback(){// 리캡챠 체크 박스 클릭시 isRecaptchachecked 값이 true로 변경
  isRecaptchachecked = true;
}

$('#loginBtn').click(function() {
	if (isInputData()) {
		doVaildRecaptcha();
	}
});

$("#userPassword").keyup(function(key) {
	if (key.keyCode == 13) {
		if (isInputData()) {
			doVaildRecaptcha();
		}
	}
});

function isInputData() {
	var userId = $('#userId').val();
	var userPassword = $('#userPassword').val();
	if (userId == '') {
		alert('아이디를 입력하세요~');
		$('#userId').focus();
		return false;
	}
	if (userPassword == '') {
		alert('비밀번호를 입력하세요~');
		$('#userPassword').focus();
		return false;
	}
	if(!isRecaptchachecked){
		alert('리캡차 인증 체크를 해주세요.');
		$("#recaptcha").focus();
		return false;
	}
	return true;
}

function doVaildRecaptcha(){	
	var formData= $("#loginForm").serialize();
		$.ajax({
	    	type: 'POST',
	    	contentType: "application/x-www-form-urlencoded",
	    	url:'/valid-recaptcha',	    		    		
			data: formData,		
			dataType: 'text', 
			cache : false,
			success: function(response){
				if(response){        
					$('#loginForm').submit(); //시큐리티에 전송
				}
		 		else{
					alert('인증되지 않은 주소입니다.');
				}      
			},
	        error:function(xhr,status,error){
	           	console.log(error);
	        }
		});	
}
