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
			<h1>Home</h1>
			<h3>이름 : ${name}</h3>
			<c:forEach items="${auth}" var="item">
					<h3>권한 : ${item.roleCode}</h3>
					<h3>권한 설명 : ${item.roleDescription}</h3>
			</c:forEach>
		</div>
	</main>
	<script defer src="/resources/static/js/theme.js"></script>
</body>
</html>
