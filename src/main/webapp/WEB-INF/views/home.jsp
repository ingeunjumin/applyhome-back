<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>HOME</title>
  </head>
  <body>
    Hello World!
    <c:forEach items="${auth}" var="item">
    	<h3>권한 : ${item.roleCode}</h3>
    	<h3>권한 설명 : ${item.roleDescription}</h3>
    </c:forEach>
    
	<h3>사용자 이름 : ${name}</h3>
  </body>
</html>