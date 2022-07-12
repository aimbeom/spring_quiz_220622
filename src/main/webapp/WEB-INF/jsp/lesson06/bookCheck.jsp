<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book check</title>

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
	
<link rel="stylesheet" type="text/css" href="/css/lesson06/bookCheckPage.css">	
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
			<section>
				<img src="/img/test06_banner1.jpg">
			</section>
			<article class="d-flex">
				<div id="one" class="col-4 bg-warning">
					<span id="left-text">실시간<br>
						예약하기</span>
				</div>
				
				<div id="two" class="col-4">
					<div class="form-group container">
						<span>예약확인</span><br>
						<label for="office">이름: </label><input type="text"
							id="name"><br>
						<label for="office">전화번호: </label><input type="text"
							id="phoneNumber">
					</div>
				 <button type="button" class="btn btn-success duplication-btn justify-content-end">조회하기</button>
				</div>
				<div id="three" class="col-4 bg-warning">
					<span id="right-text">예약문의:<br>
						010-<br>
						0000-1111
					</span>
				</div>
			</article>
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
$(document).ready(function() {
	
	//조회하기 버튼
	$('.duplication-btn').on('click', function(){
		alert("test");
		let name = $('#name').val().trim();
		let phoneNumber = $('#phoneNumber').val().trim();
		
		//validation
		if(name == "" && name.length < 1){
			alert("이름을 입력해주세요");
		}
		
		if(phoneNumber == "" && phoneNumber.length < 1){
			alert("전화번호를 입력해주세요");
		}
		
		// ajax
		$.ajax({
			//request
			type: "post"
			, url: "lesson06/is_duplication_book"
			, data: {"name":name, "phoneNumber":phoneNumber}
		
			//response
			, success: function(data){
				if(data.is_duplication == "true"){
					alert("이름 : " + name);
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