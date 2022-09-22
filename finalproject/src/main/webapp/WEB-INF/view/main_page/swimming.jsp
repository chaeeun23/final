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
	
	<!-- 프로그램안내 - 수영 -->
	<div class="container">
		<h3>수영</h3>
		<hr>
		<div class="slider">
			<input type="radio" name="slide" id="slide1" checked> 
			<input type="radio" name="slide" id="slide2"> 
			<input type="radio"	name="slide" id="slide3"> 
			<input type="radio" name="slide" id="slide4">
			<input type="radio" name="slide" id="slide5">
			<ul id="imgholder" class="imgs">
				<li><img src="${pageContext.request.contextPath}/style/img/swimming1.jpg"></li>
				<li><img src="${pageContext.request.contextPath}/style/img/swimming2.jpg"></li>
				<li><img src="${pageContext.request.contextPath}/style/img/swimming3.jpg"></li>
				<li><img src="${pageContext.request.contextPath}/style/img/swimming4.jpg"></li>
				<li><img src="${pageContext.request.contextPath}/style/img/swimming5.jpg"></li>
			</ul>
			<div class="bullets">
				<label for="slide1">&nbsp;</label> <label for="slide2">&nbsp;</label>
				<label for="slide3">&nbsp;</label> <label for="slide4">&nbsp;</label>
				<label for="slide5">&nbsp;</label>
			</div>
		</div>
		<hr>
		<div>
			<h3>▶국제규격의 50m 레인과 국내 최고의 수질</h3>
			사회체육센터는 국제규격의 50m 레인과 철저한 수질관리를 바탕으로 한 국내 최고의 수질 등 최상의 운동 환경을 제공하며,
			수영 전문 지도강사가 표준화된 영법 지도서에 따라 체계적인 강습을 제공함으로써 회원들이 각종 영법을 조기에 마스터할 수
			있도록 지도하고 있습니다. 또한 여성 전용반과 만 65세 이상 어르신을 위한 실버반, 어린이반 등 계층별·연령별로 다양한
			강습 및 자유수영 프로그램을 운영하고 있습니다 <br><br><br>
			
			<h3>▶종합적인 체력단련에 적합한 전신운동</h3>
			수영은 물의 저항을 극복하며 앞으로 나아가기 위해 상당한 수준의 근력이나 에너지가 필요한 전신운동으로서, “큰 호흡운동을
			요구하기 때문에 근육이나 심폐의 발달에 좋으며”(출처 : 스포츠 백과, 2008., 국민생활체육회) 종합적인 체력단련에
			적합한 운동입니다.
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