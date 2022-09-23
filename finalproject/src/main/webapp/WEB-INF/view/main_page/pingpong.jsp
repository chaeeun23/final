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
	
	<!-- 프로그램안내 - 탁구 -->
	<div class="container">
		<h3>탁구</h3>
		<hr>
		<div class="slider">
			<input type="radio" name="slide" id="slide1" checked> 
			<input type="radio" name="slide" id="slide2"> 
			<input type="radio"	name="slide" id="slide3"> 
			<input type="radio" name="slide" id="slide4">
			<ul id="imgholder" class="imgs">
				<li><img src="${pageContext.request.contextPath}/style/img/pingpong1.jpg"></li>
				<li><img src="${pageContext.request.contextPath}/style/img/pingpong2.jpg"></li>
				<li><img src="${pageContext.request.contextPath}/style/img/pingpong3.jpg"></li>
				<li><img src="${pageContext.request.contextPath}/style/img/pingpong4.jpg"></li>
			</ul>
			<div class="bullets">
				<label for="slide1">&nbsp;</label> <label for="slide2">&nbsp;</label>
				<label for="slide3">&nbsp;</label> <label for="slide4">&nbsp;</label>
			</div>
		</div>
		<hr>
		<div>
			<h3>▶쾌적한 탁구장과 최신 설비 완비</h3>
			사회체육센터의 3층에 위치한 탁구장은 최신 탁구대 10대, 오토 티칭머신 2대 완비되어 있습니다.
			전직 선수출신의 강사들로 구성하여 체계적인 강습으로 최상의 교육품질을 제공합니다. 
			<br><br><br> 
			
			<h3>▶종합적인 체력단련에 적합한 전신운동</h3>
			탁구는 구기 종목 중 가장 작은 공을 사용하기 떄문에 순간적인 판단력과 빠른 대응이 중요합니다. 손목 스냅과 어깨를 사용하여
			스윙을 지속해야하므로 팔과 손목 근육, 허리, 복근, 허벅지 근력 등 종합적인 체력단련에 적합한 운동입니다.
		
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