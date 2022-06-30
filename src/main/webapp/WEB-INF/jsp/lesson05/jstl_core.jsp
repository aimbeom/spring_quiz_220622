<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<hr>
	
	<c:set var="첫번째 숫자" value="36"/>
	<c:set var="두번째 숫자" value="6"/>
	
	첫번째 숫자 : ${첫번째 숫자}<br>
	두번째 숫자 : ${두번째 숫자}<br>
	
	<hr>
	
	더하기 : ${첫번째 숫자 + 두번째 숫자}<br>
	빼기 : ${첫번째 숫자 - 두번째 숫자}<br>
	곱하기 : ${첫번째 숫자 * 두번째 숫자}<br>
	나누기 : ${첫번째 숫자 / 두번째 숫자}<br>
	
	<hr>
	
	<c:out value="<title>core out</title>"/>
	
	<hr>

	<c:if test="${첫번째 숫자 + 두번째 숫자/2 >10}">
		<h1>${첫번째 숫자 + 두번째 숫자/2}</h1>
	</c:if>
	<c:if test="${첫번째 숫자 + 두번째 숫자/2 <10}">
		<h3>${첫번째 숫자 + 두번째 숫자/2}</h3>
	</c:if>
	
	<hr>
	
	<c:if test="${첫번째 숫자 * 두번째 숫자 > 100}">
		<c:out value="<script>너무 큰 수 입니다.</script>"/>
	</c:if>
	
	<hr>
</body>
</html>