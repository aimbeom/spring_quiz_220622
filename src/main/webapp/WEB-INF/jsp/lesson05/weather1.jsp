<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Page</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

<%-- css --%>
<link rel="stylesheet" type="text/css" href="/css/lesson05/weather.css">
</head>
<body>
	<div id="wrap">
		<div class="contents d-flex">
			<nav>
				<img class="text-align-center" id="logo" src="https://cdn.imweb.me/upload/S2022041808592a25349f5/2d281f46f2dd2.png">
				<ul>
					<li>날씨</li>
					<li><a href="/lesson05/quiz05/2">날씨입력</a></li>
					<li>테마날씨</li>
					<li>관측기후</li>
				</ul>
			</nav>
			<section class="right">
				<h1>과거 날씨</text></h3>
				<table class="table text-center">
					<thead>
						<tr>
							<th>날짜</th>
							<th>날씨</th>
							<th>기온</th>
							<th>강수량</th>
							<th>미세먼지</th>
							<th>풍속</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="weather" items="${weatherList}" varStatus="status">
							<tr>
								<td><fmt:parseDate value="${weather.date}" pattern="yyyy-MM-dd" var="date"/>
									<fmt:formatDate value="${date}" pattern="yyyy년 M월 d일"/>
								</td>
								<td>
									<c:choose>
										<c:when test="${weather.weather == '비'}">
										<img src="/img/cloudy.jpg">
										</c:when>
										<c:when test="${weather.weather == '흐림'}">
										<img src="/img/partlyCloudy.jpg">
										</c:when>
										<c:when test="${weather.weather == '맑음'}">
										<img src="/img/rainy.jpg">
										</c:when>
										<c:otherwise>
										<img src="/img/sunny.jpg">
										</c:otherwise>
									</c:choose>	
								</td>
								<td>${weather.temperatures} ℃</td>
								<td>${weather.precipitation}mm</td>
								<td>${weather.microDust }</td>
								<td>${weather.windSpeed }km/h</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</section>
		</div>
		<footer class="d-flex">
			<div id="fleft" class="bg-warning">
				<small class="text-secondary">
					<img id="logo2" src="https://www.weather.go.kr/w/resources/image/photo/img_flower_photo_none.gif">
				</small>
			</div>
			<div id="fright" class="text-align-center">
				<small class="text-secondary">
					<span id="bottom">
					(07062) 서울시 동작구 여의대방로 16길 61<br>
					Copyright@2020 KMA. All Rights RESERVED
					</span>
				</small>
			</div>
		</footer>
	</div>

</body>
</html>