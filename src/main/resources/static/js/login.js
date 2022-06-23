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
	return true;
}