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
	
	<!-- 프로그램안내 - 에어로빅 -->
	<div class="container">
		<h3>에어로빅</h3>
		<hr>
		<div class="slider">
			<input type="radio" name="slide" id="slide1" checked> 
			<input type="radio" name="slide" id="slide2"> 
			<ul id="imgholder" class="imgs">
				<li><img src="${pageContext.request.contextPath}/style/img/aerobics1.jpg"></li>
				<li><img src="${pageContext.request.contextPath}/style/img/aerobics2.jpg"></li>
			</ul>
			<div class="bullets">
				<label for="slide1">&nbsp;</label> <label for="slide2">&nbsp;</label>
			</div>
		</div>
		<hr>
		<div>
			<h3>▶넓고 쾌적한 공간, 실버 계층을 위한 맞춤 강습</h3>
			200㎡규모의 에어로빅실과 더불어 각종 기구가 완비되어있어 최고의 운동환경을 제공하는 사회체육센터는 에어로빅 전문 지도강사가
			체계적인 강습을 제공할 뿐 아니라 만 65세 이상의 어르신들의 실버라이프를 즐길 수 있는 다양한 프로그램으로 운영하고 있습니다. 
			<br><br><br>

			<h3>▶종합적인 체력단련에 적합한 전신운동</h3>
			장시간동안 경쾌한 음악에 맞추어 7가지 기본스텝을 응용 한 팔·다리 대근육의 지속적인 움직임을 통하여 몸 안에 최대한 많은
			양의 산소를 공급시켜 폐와 심장·혈관 기능을 활발하게 촉진시키며 효율적인 지방제거와 대 근육을 균형 있게 강화 시켜 탄력
			있고 건강한 신체를 만들기 위한 운동입니다. 특히 경쾌한 음악에 맞추어 신체의 각 부분을 움직이므로 일상생활에서 쌓인
			스트레스를 제거하여 정신적 스트레스 해소는 물론 긍정적인 태도로 적극적인 사회생활을 이끌어 인간의 전인적인 건강(Total
			well-being) 향상에 기여합니다.
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