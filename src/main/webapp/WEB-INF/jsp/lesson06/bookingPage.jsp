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

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script> 

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

<script>
   $(function() {
       //input을 datepicker로 선언
       $("#datepicker").datepicker({
           dateFormat: 'yy-mm-dd' //달력 날짜 형태
           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
           ,changeYear: true //option값 년 선택 가능
           ,changeMonth: true //option값  월 선택 가능                
           ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
           ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
           ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
           ,buttonText: "선택" //버튼 호버 텍스트              
           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
           ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
           ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
       });                    
       
       //초기값을 오늘 날짜로 설정해줘야 합니다.
       $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
   });
</script>
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
				<li class="nav-item"><a href="/lesson06//booking_list"
					class="nav-link text-white font-color-white"> 예약목록</a></li>
			</ul>
		</nav>
		<section>
			<center>
				<h3>예약하기</h3>
			</center>
			<div class="container">
				<div class="form-group">
					<label for="office">이름</label><br><input type="text"
						id="name">
				</div>
				<div class="form-group">
					<label for="date">예약날짜</label><br> <input type="text"
						id="datepicker">
				</div>
				<div class="form-group">
					<label for="day">숙박일수</label><br> <input type="text" id="day">
				</div>
				<div class="form-group">
					<label for="headcount">숙박인원</label><br> <input type="text"
						id="headcount">
				</div>
				<div class="form-group">
					<label for="phoneNumber">전화번호</label><br> <input type="text"
						id="phoneNumber">
				</div>
				<button type="button" class="book-btn btn btn-warning">예약하기</button>
			</div>
		</section>
		<footer class="d-flex">
			<div id="fright" class="text-align-center">
				<small class="text-secondary"> <span id="bottom">
						제주특별자치 제주시 애월읍<br> 사업자등록번호:111-22-255222/농어촌민박사업자지정/대표:김통목<br>
						Copyright 2025 tongnamu All right reserved.
				</span>
				</small>
			</div>
		</footer>
	</div>
	
<script>
$(document).ready(function(){
	
	//예약확인 버튼
	$('.book-btn').on('click', function(e) {
		alert("제목을 입력하세요");
		let name = $('#name').val().trim();
		let datepicker = $('#datepicker').val().trim();
		let day = $('#day').val().trim();
		let headcount = $('#headcount').val().trim();
		let phoneNumber = $('#phoneNumber').val().trim();
		
		//validation
		if (name.length < 1 && name = "") {
			alert("제목을 입력하세요");
			return;
		}
		
		if(day == ""){
			alert("기간을 입력해주세요");
			return;
		}
		
		if(headCount == ""){
			alert("인원수를 입력해주세요");
			return;
		}
		
		if(phoneNumber == ""){
			alert("핸드폰 번호를 입력해주세요");
			return;
		}
		
		//ajax 통신
		$.ajax({
		
			//request
			type : "post"
			, url : "/lesson06/add_book_list"
			, data : {"name":name, "date":datepicker, "day":day, "headcount":headcount, "phoneNumber":phoneNumber}
		
			//response
			, success : function(data){
				if(data.result == "success"){
					alert("입력 성공했습니다.");
					location.href = "/lesson06/booking_list";
				}
			}
			, error: function(e){
				alert("e:" + e);
			}
		});
	});	
});
</script>
</body>
</html>