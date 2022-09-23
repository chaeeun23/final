<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2유2김</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/mainImg/favicon.png">
<link rel="stylesheet" href="${pageContext.request.contextPath}/style/slider.css">
</head>
<body>
	<!-- header(로고, 네비게이션바) -->
	<div>
		<c:import url="/WEB-INF/resource/inc/header.jsp"></c:import>
		<br><br><br>
	</div>
	
	<!-- 프로그램안내 - 테니스 -->
	<div class="container">
		<h3>테니스</h3>
		<hr>
		<div class="slider">
			<input type="radio" name="slide" id="slide1" checked> 
			<input type="radio" name="slide" id="slide2"> 
			<input type="radio"	name="slide" id="slide3"> 
			<input type="radio" name="slide" id="slide4">
			<ul id="imgholder" class="imgs">
				<li><img src="${pageContext.request.contextPath}/style/img/tennis1.jpg"></li>
				<li><img src="${pageContext.request.contextPath}/style/img/tennis2.jpg"></li>
				<li><img src="${pageContext.request.contextPath}/style/img/tennis3.jpg"></li>
				<li><img src="${pageContext.request.contextPath}/style/img/tennis4.jpg"></li>
			</ul>
			<div class="bullets">
				<label for="slide1">&nbsp;</label> <label for="slide2">&nbsp;</label>
				<label for="slide3">&nbsp;</label> <label for="slide4">&nbsp;</label>
			</div>
		</div>
		<hr>
		<div>
			<h3>▶국내 최대 시설에서 최고의 지도자가 강습</h3>
			19면의 하드코트(메인코트 1면, 실외코트 14면, 실내코트 4면)를 비롯해 국내 최대의 넓고 쾌적한 운동 환경을 갖춘
			사회체육센터는 테니스 지도경력 20년 이상의 역량 있는 전문 지도강사를 다수 투입해 초급, 중급, 상급과정을 운영하고
			있습니다. 특히 개인지도와 소수정예 그룹지도를 통하여 수준별 맞춤 강습을 제공하고 있어 꾸준한 연습이 뒷받침된다면 초보자도
			쉽게 테니스를 배울 수 있습니다. <br><br><br>
			
			<h3>▶시간당 칼로리 소모량 400~500Kcal의 전신운동</h3>
			테니스는 시간당 칼로리 소모량이 400~500Kcal에 달할 만큼 강도가 높은 유산소 운동으로, 꾸준히 지속할 경우 체지방
			감량 및 심혈관질환 예방에 매우 탁월한 효과를 지닌 운동입니다. 또한 테니스의 기본자세는 허벅지를 비롯해 하체 근력을
			길러주며 뼈에 자극을 주기 때문에 골다공증 예방 효과가 있으며, 공을 끝까지 주시해야 정확하게 칠 수 있으므로 집중력 향상
			등 정신건강에도 매우 이로운 스포츠입니다.
		</div>
		<br>
		<br>
	</div>
	
	<!-- footer -->
	<div>
		<c:import url="/WEB-INF/resource/inc/footer.jsp"></c:import>
	</div>
</body>
</html>