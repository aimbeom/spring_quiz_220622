<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 추가</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>회원 정보 추가</h1>
		<form method="post" action="/lesson06/quiz01/addView">
			<div class="form-group">
				<label for="name">제목</label>
				<input type="text" id="name" class="form-control" placeholder="다음">
			</div>
			<div class="form-group">
				<label for="url">url</label>
				<input type="text" id="url" class="form-control" placeholder="http://daum.net">
			</div>
			
			<input type="button" id="addBtn" class="btn btn-success form-control" value="추가">
		</form>
	</div>
	
	<script>
	$(document).ready(function(){
		$('#addBtn').on('click', function() {
			alert("추가되었습니다");

			// validation (유효성 체크, 값이 잘 들어있나 확인)
			let name = $('#name').val().trim();
			//alert(name);
			if (name == "") {
				alert("제목을 입력하세요");
				return; //submit을 안하고 끝내버리겠다는 의미
			}
			
			let url = $('#url').val().trim();
			if (url == "https" || url == "http") {
				alert("url을 제대로 입력해주세요");
				return;
			}
			
			//AJAX: 폼태그와 상관없이 비동기로 별도 요청(request)
			$.ajax({
				// request
				type:"POST"		//Request Method
				, url:"/quiz01/add"	//Action URL
				, data: {"name": name, "url":url} //key와 value
				 
				// response
				, success: function(data){
					alert(data);
				}
				, complete: function(data) {
					alert("완료");
				}
				, error: function(e){
					alert("error" + e);
				}
			}); 
			
		});
	});
	</script>
	
	
	
	
	
</body>
</html>