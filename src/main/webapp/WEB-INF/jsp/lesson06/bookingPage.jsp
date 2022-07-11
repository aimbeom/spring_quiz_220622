<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>booking page</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script> 

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

<%-- css --%>
<link rel="stylesheet" type="text/css" href="/css/lesson06/bookingPage.css">
</head>
<body>
	<div class="wrap container">
		<header><h1><center>통나무 펜션</center></h1></header>
		<nav class="bg-warning">
			<ul class="nav nav-fill">
				<li class="nav-item"><a href="#" class="nav-link text-white font-color-white">
				펜션소개</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-white font-color-white">
				객실보기</a></li>
				<li class="nav-item"><a href="/lesson06/booking_page" class="nav-link text-white font-color-white">
				예약하기</a></li>
				<li class="nav-item"><a href="/lesson06//booking_list" class="nav-link text-white font-color-white">
				예약목록</a></li>
			</ul>
		</nav>
		<section>
			<center><h3>예약하기</h3></center>
			<div class="list-box justify-content-center">
			<span id="name">이름</span>
			<input type="text" id="name"><br>
			예약날짜
			<input type="text" id="date"><br>
			숙박일수
			<input type="text" id="dateCount"><br>
			숙박인원
			<input type="text" id="headCount"><br>
			전화번호
			<input type="text" id="phoneNumber"><br>
			<button type="button" class="book-btn btn btn-warning">예약하기</button>
			</div>
		</section>
		<footer class="d-flex">
			<div id="fright" class="text-align-center">
				<small class="text-secondary">
					<span id="bottom">
					제주특별자치 제주시 애월읍<br>
					사업자등록번호:111-22-255222/농어촌민박사업자지정/대표:김통목<br>
					Copyright 2025 tongnamu All right reserved.
					</span>
				</small>
			</div>
		</footer>
	</div>
</body>
<script>
$(document).ready(function(){
	$('.book-btn').on('click', function() {
		let id = $('#id').trim().val();
		let date = $('#date').trim().val();
		let dateCount = $('#dateCount').trim().val();
		let headCount = $('#headCount').trim().val();
		let phoneNumber = $('#phoneNumber').trim().val();
		
});
</script>







</html>