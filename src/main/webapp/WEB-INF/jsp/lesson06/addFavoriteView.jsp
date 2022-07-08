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

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script> 

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
		<h1>즐겨찾기 추가하기</h1>
		
		<div class="form-group">
			<label for="name">제목</label>
			<input type="text" class="form-control" id="name" placeholder="다음">
		</div>
		
		<div class="form-group">
			<label for="url">URL 주소</label>
			<div class="d-flex">
			<input type="text" class="form-control" id="url" placeholder="http://daum.net">
			<button type="button" class="btn btn-info" id="chkBtn">중복확인</button>
			</div>
			<small id="warningMessage" class="text-danger d-none">중복된 url 입니다</small>
			<small id="availableUrlText" class="text-success d-none">저장 가능한 url 입니다</small>
		</div>
		<button type="button" id="addBtn" class="btn btn-success btn-block">추가</button>
	</div>
	
<script>
$(document).ready(function() {
	
	$('#addBtn').on('click', function(e) {
		let name = $('#name').val().trim();
		let url = $('#url').val().trim();
		
		// validation
		if (name.length < 1) {
			alert("제목을 입력하세요");
			return;
		}
		
		if (url == "") {
			alert("주소를 입력하세요");
			return;
		}
		
		// http 도 아니고(그리고) https도 아닐 때 => alert
		if (url.startsWith("http") == false && url.startsWith("https") == false) {
			alert("주소 형식이 잘못되었습니다.");
			return;
		}
		
		// url 중복확인 체크
		// '저장 가능한 url입니다.' 문구가 숨겨져 있을 때 alert을 띄운다
		// d-none이 있을 때
		if($('#availableUrlText').hasClass('d-none')) {
			alert("url 중복확인을 다시 해주세요");
			return;
		}
		
		// ajax 통신 - insert - list 페이지 이동
		$.ajax({
			
			// request
			type:"POST"
			, url:"/lesson06/add_favorite"
			, data:{"name":name, "url":url}
			
			// response    "{"result":"success"}"
			, success: function(data) { // json str을 object로 변환해줌
				if (data.result == "success") {
					alert("입력 성공했습니다.");
					location.href = "/lesson06/favorite_list_view";
				}
			}	
			, error: function(e) {
				alert("e:" + e);
			}	
		});
	});
	
	// url 중복확인
	$('#chkBtn').on('click', function(e){
		let url = $('#url').val().trim();
		if(url==''){
			alert("url을 입력하세요.");
			return;
		}
		
		// ajax selet-중복체크
		$.ajax({
			
			//request
			type : "POST"
			, url : "/lesson06/is_duplication" // upi를 요청하는 것이기에 view는 붙이지 않는다
			, data : {"url":url}
			
			//response
			, success : function(data){	//json인 경우 object로 내려온것을 string으로 자동변환 해준다
				if(data.is_duplication){
					//중복일 때
					//1. 강사님 코드 (강사님 코드는 어제 예제와 다른 방식으로 원래 숨겨져있던 글자를 나타내는 방식)
					$('#warningMessage').removeClass('d-none');
					$('#availableUrlText').addClass('d-none');
					//$('#warningMessage').append('<span class="text-danger">중복된 url 입니다</span>');
				} else{
					//사용가능
					$('#availableUrlText').removeClass('d-none');
					$('#warningMessage').addClass('d-none');
				}	
			}
			, error : function(e, a){
				alert("중복확인 실패");
			}
		});
	});
});
</script>
</body>
</html>