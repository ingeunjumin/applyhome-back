<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="/resources/static/css/login.css">
    <title>게시판 로그인</title>
  </head>
  <body>
    <div class="container">
      <h1>Login</h1>
      <div class="login-form">
       <form id="loginForm" method="post" action="/login">
        <div class="txt-field">
          <input id="userId" name="userId" type="text" required />
          <label>이름</label>
        </div>
        <div class="txt-field">
          <input id="userPassword" name="userPassword" type="password" required />
          <label>비밀번호</label>
        </div>
        <div
            id="captcha"
            class="g-recaptcha"
            data-sitekey="${getSite}"
            data-callback="recaptchaCallback"
         ></div>
        <input id="loginBtn" class="login-btn" type="butten" value="로그인"/>
       </form>
      </div>
    </div>
    <script
      src="https://code.jquery.com/jquery-3.6.0.min.js"
      integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
      crossorigin="anonymous"
    ></script>
	<script type="text/javascript" src="/resources/static/js/login.js"></script>
	<script src="https://www.google.com/recaptcha/api.js"></script>
  </body>
</html>