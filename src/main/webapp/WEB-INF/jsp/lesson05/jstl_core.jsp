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
	
	<c:set var="first_num" value="36"/>
	<c:set var="second_num" value="6"/>
	
	첫번째 숫자 : ${first_num}<br>
	두번째 숫자 : ${second_num}<br>
	
	<hr>
	
	더하기 : ${first_num + second_num}<br>
	빼기 : ${first_num - second_num}<br>
	곱하기 : ${first_num * second_num}<br>
	나누기 : ${first_num / second_num}<br>
	
	<hr>
	
	<c:out value="<title>core out</title>"/>
	
	<hr>
	
	<c:if test="${first_num + second_num/2 >10}">
		<h1>${first_num + second_num/2}</h1>
	</c:if>
	<c:if test="${first_num + second_num/2 <10}">
		<h3>${first_num + second_num/2}</h3>
	</c:if>
	
	<hr>
	
	<c:if test="${first_num * second_num > 100}">
		<c:out value="<script>alert('너무 큰 수 입니다.')</script> " escapeXml="false"/>
	</c:if>
	
	<hr>
</body>
</html>