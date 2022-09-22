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
	
	<!-- 프로그램안내 - 필라테스 -->
	<div class="container">
		<h3>필라테스</h3>
		<hr>
		<div class="slider">
			<input type="radio" name="slide" id="slide1" checked> 
			<input type="radio" name="slide" id="slide2"> 
			<input type="radio"	name="slide" id="slide3"> 
			<ul id="imgholder" class="imgs">
				<li><img src="${pageContext.request.contextPath}/style/img/pilates1.jfif"></li>
				<li><img src="${pageContext.request.contextPath}/style/img/pilates2.jfif"></li>
				<li><img src="${pageContext.request.contextPath}/style/img/pilates3.jfif"></li>
			</ul>
			<div class="bullets">
				<label for="slide1">&nbsp;</label> <label for="slide2">&nbsp;</label>
				<label for="slide3">&nbsp;</label> 
			</div>
		</div>
		<hr>
		<div>
			<h3>▶넓고 쾌적한 공간, 전문지도교사의 체계적 강습</h3>
			사회체육센터에서는 탄탄한 근육과 매끈한 보디라인을 원하시는 분들을 위하여 넓고 쾌적한 필라테스장을 갖추고 전문 지도교사를
			초빙해 주2회 체계적인 강습을 제공합니다. 필라테스 강좌와 함께 건강과 아름다움, 두 마리 토끼를 모두 잡아보세요.
			<br> <br> <br>

			<h3>▶운동효과, 건강하고 아름다운 보디라인을 위한 필수운동</h3>
			우리 몸의 파워하우스(power house), 즉 복부와 둔부를 강화하기 위한 반복적인 동작을 통하여 자세를 바로잡고 몸의
			균형과 힘, 유연성을 증대시킬 수 있습니다. 특히 필라테스를 지속하면 자세에 균형이 잡히고 관절과 척추가 강화되는 것은 물론
			심폐능력과 순환기능력이 강화되는 효과가 있으며, 일상생활에서 오는 긴장과 스트레스를 해소하는 데에도 도움이 됩니다.
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