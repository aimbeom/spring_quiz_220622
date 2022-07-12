<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking List</title>
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
<link rel="stylesheet" type="text/css" href="/css/lesson06/bookingList.css">
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
				<li class="nav-item"><a href="#" class="nav-link text-white font-color-white">
				예약목록</a></li>
			</ul>
		</nav>
		
		<section class="form-group">
		<center class="list-title"><h3>예약 목록 보기</h3></center>
		<table class="table text-center">
					<thead>
						<tr>
							<th>이름</th>
							<th>예약날짜</th>
							<th>숙박일수</th>
							<th>숙박인원</th>
							<th>전화번호</th>
							<th>예약상태</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="book" items="${bookingList}" varStatus="status">
							<tr>
								<td>${book.name }</td>
								<td>
									<fmt:formatDate value="${book.date}" pattern="yyyy년 M월 d일"/>
								</td>
								<td>${book.day }</td>
								<td>${book.headcount }</td>
								<td>${book.phoneNumber }</td>
								<td>
									<c:choose>
										<c:when test="${book.state == '대기중'}">
										<span class="text-info">${book.state}</span>
										</c:when>
										<c:otherwise>
										<span class="text-danger">${book.state}</span>
										</c:otherwise>
									</c:choose>	
								</td>
								<td>
									<button type="button" class="del-btn btn btn-danger" data-book-id="${book.id}">삭제</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
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
$(document).ready(function() {
	$('.del-btn').on('click', function() {
		// this = 내가 누른 하나의 버튼에 대한 값
		let bookId = $(this).data('book-id');
		//alert(favoriteId);
		
		/* $.ajax({
			// request
			type:"post"
			, url:"/lesson06/del_list"
			, data: {"id" : bookId}
			
			// response
			, success: function(data) {
				// {"result":"success"}
				if (data.result == "success") {
					location.reload(true); // 새로고침
				} else {
					alert("삭제하는데 실패했습니다. 관리자에게 문의해주세요.");
				}
			}
			, error: function(e) {
				alert("통신에 실패했습니다.");
			}
		}); */
		
		$.ajax({
			//request
			type: "post"
			, url: "/lesson06/del_list"
			, data: {"id":bookId}
			
			//response
			, success: function(data){
				if(data.result == "success"){
					alert("삭제 되었습니다");
					location.reload(true); // 새로고침
				}
			}
			, error: function(e){
				alert("통신에 실패했습니다");
			}
		})
	});
});

</script>
</html>