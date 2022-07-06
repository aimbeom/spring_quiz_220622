<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AddPage</title>


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
 <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
<link rel="stylesheet" type="text/css" href="/css/lesson05/addWeather.css">
</head>
<body>
	<div id="wrap">
		<div class="contents d-flex">
			<nav>
				<img class="text-align-center" id="logo" src="https://cdn.imweb.me/upload/S2022041808592a25349f5/2d281f46f2dd2.png">
				<ul>
					<li>날씨</li>
					<li>날씨입력</li>
					<li>테마날씨</li>
					<li>관측기후</li>
				</ul>
			</nav>
			<form method="post" action="/lesson05/quiz05_addWeather">
			<section class="right">
				<h1>날씨 입력</h1>
				<div class="d-flex justify-content-between">
					<label>날짜<input type="text" id="datepicker" name="date"></label>
					
					<label>날씨<select name="weather">
						<option value="맑음" selected	>맑음</option>
						<option value="비">비</option>
						<option value="흐림">흐림</option>
						<option value="구름조금">구름조금</option>	
						</select></label>
						
					<label>미세먼지<select name="microDust">
						  	<option value="좋음" selected>좋음</option>										
						  	<option value="보통" selected>보통</option>										
						  	<option value="나쁨" selected>나쁨</option>
						  </select></label>										
				</div>
				<div class="input-group d-flex justify-content-between">
					<label id="temp">기온<input type="text" id="temperature" name="temperature"><span>℃</span></label>
					<label id="prec">강수량<input type="text" id="precipitation" name=precipitation ><span>mm</span></label>
					<label id ="wind">풍속<input type="text" id="windSpeed" name="windSpeed"><span>km/h</span></label>
				</div>
				<div class="d-flex justify-content-end">
					<button type=submit id="save" class="btn"><a href="/lesson05/quiz05/1">저장</a></button>
				</div>
			</section>
			</form>
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