<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2유2김</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/mainImg/favicon.png">
</head>
<body>
	<!-- header(로고, 네비게이션바) -->
	<div>
		<c:import url="/WEB-INF/resource/inc/header.jsp"></c:import>
		<br> <br>

	</div><!-- header END -->
	
	<!-- 센터소개 페이지 -->
	<div class="container">
	<h3>센터 소개</h3>
	<hr>
	<br>
	<div>
		<h4>▶ 인사말</h4>
		<br>
		<img src="${pageContext.request.contextPath}/mainImg/centerIntroduce.jpg" style="height:100%; width:100%">
		<br><br>
		<h4>사회체육센터 홈페이지를 찾아주셔서 감사합니다.</h4>
		<br>
		“건강한 가산디지털단지”로 거듭나고 있는 우리 가산디지털단지 사회체육센터는 개관에 힘입어 더욱 활기차고 역동적인 삶의 중심지로 나아가고 있습니다.
		<br><br>
		사회체육센터는 시민의 건강증진 및 여가 선용을 위한 지하 1층, 지상 3층 규모의 시설로서 수영장, 헬스장, 다목적체육관, GX실, 풋살장 등의 체육시설을 제공하고 있으며 다양한 프로그램을 즐길 수 있도록 노력하고 있습니다.
		<br><br>		
		“함께 여는 미래, 더불어 누리는 가산디지털단지”로의 출발점은 시민의 신체적, 정신적 건강에서부터 이루어지므로 사회체육센터는 쾌적한 환경에서 최고시설을 효율적으로 운영하며 시민 여러분의 삶의 질 향상을 높이는데 최우선으로 생각하며 시민을 위한 프로그램을 지속적으로 개발해 나가겠습니다.
		<br><br>
		앞으로도 사회체육센터는 지역주민들의 건강 지킴이로서 행복과 건강증진에 도움이 되도록 노력할 것이며, 시민 여러분의 많은 응원과 격려를 부탁드립니다. 감사합니다.
		<br><br>
		
		- 사회체육센터 임직원 일동 -
	</div>
	
	
	
	
	
	</div>
	<!-- footer -->
	<div>
		<br>
		<c:import url="/WEB-INF/resource/inc/footer.jsp"></c:import>
	</div>

</body>
</html>