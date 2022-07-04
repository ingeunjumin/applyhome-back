$('#loginBtn').click(function() {
	if (isInputData()) {
		$('#loginForm').submit();
	}
});

$("#userPassword").keyup(function(key) {
	if (key.keyCode == 13) {
		if (isInputData()) {
			$('#loginForm').submit();
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
	
	doVaildRecaptcha()
	
	return true;
}

var isRecaptchachecked=false;

function recaptchaCallback(){// 리캡챠 체크 박스 클릭시 isRecaptchachecked 값이 true로 변경

  isRecaptchachecked = true;

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
		if(data == 'success'){        
			console.log('리캡챠 성공!');
			$('#loginForm').submit(); //리캡쳐 성공후 로그인 id,pw 체킹 (security 사용)
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
