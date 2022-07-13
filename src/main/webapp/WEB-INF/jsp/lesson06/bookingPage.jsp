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

<%--부트스트랩--%>
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

<%--제이 쿼리--%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<%-- css --%>
<link rel="stylesheet" type="text/css"
	href="/css/lesson06/bookingPage.css">
</head>
<body>
	<div class="wrap container">
		<header>
			<h1>
				<center>통나무 펜션</center>
			</h1>
		</header>
		<nav class="bg-warning">
			<ul class="nav nav-fill">
				<li class="nav-item"><a href="#"
					class="nav-link text-white font-color-white"> 펜션소개</a></li>
				<li class="nav-item"><a href="#"
					class="nav-link text-white font-color-white"> 객실보기</a></li>
				<li class="nav-item"><a href="/lesson06/booking_page"
					class="nav-link text-white font-color-white"> 예약하기</a></li>
				<li class="nav-item"><a href="/lesson06/booking_list"
					class="nav-link text-white font-color-white"> 예약목록</a></li>
			</ul>
		</nav>
		<section class="contents">
			<h2 class="text-center font-weight-bold m-4">예약 하기</h2>
			<div class="input-box container col-4">
				<div class="form-group">
					<label for="office">이름</label><br> <input type="text"
						class="form-control" id="name">
				</div>
				<div class="form-group">
					<label for="date">예약날짜</label><br> <input type="text"
						class="form-control" id="date">
				</div>
				<div class="form-group">
					<label for="day">숙박일수</label><br> <input type="text"
						class="form-control" id="day">
				</div>
				<div class="form-group">
					<label for="headcount">숙박인원</label><br> <input type="text"
						class="form-control" id="headcount">
				</div>
				<div class="form-group">
					<label for="phoneNumber">전화번호</label><br> <input type="text"
						class="form-control" id="phoneNumber">
				</div>
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
	<script>
		$(document).ready(function() {
			//input을 datepicker로 선언
			$("#date").datepicker({
				dateFormat : 'yy-mm-dd' //달력 날짜 형태
				, minDate : "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
				, maxDate : "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
			});

			//예약하기 버튼
			$('.book-btn').on('click', function(e) {
				let name = $('#name').val().trim();
				let date = $('#date').val().trim();
				let day = $('#day').val().trim();
				let headcount = $('#headcount').val().trim();
				let phoneNumber = $('#phoneNumber').val().trim();

				//validation
				if (name == "") {
					alert("이름을 입력하세요");
					return;
				}

				if (date == "") {
					alert("날짜를 입력해주세요");
					return;
				}

				if (day == "") {
					alert("숙박일을 입력해주세요");
					return;
				}

				if (isNaN(day)) {
					alert("숙박일수는 숫자만 입력가능합니다.");
					return;
				}

				if (headcount == "") {
					alert("인원수를 입력해주세요");
					return;
				}

				if (phoneNumber == "") {
					alert("핸드폰 번호를 입력해주세요");
					return;
				}

				//ajax 통신
				$.ajax({

					//request
					type : "post"
					,url : "/lesson06/add_book_list"
					,data : {
						"name" : name,
						"date" : date,
						"day" : day,
						"headcount" : headcount,
						"phoneNumber" : phoneNumber
					}
				
					//response
					, success : function(data) {
						if (data.result == "success") {
							alert("입력 성공했습니다.");
							location.href = "/lesson06/booking_list";
						}
					}
					, error : function(e) {
						alert("e:" + e);
					}
					
				});
			});
		});
	</script>
</body>
</html>