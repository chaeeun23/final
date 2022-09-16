<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.image-box {
    width:1295px;
    height:600px;
    overflow:hidden;
    margin:0 auto;
}

.image-thumbnail {
    width:100%;
    height:100%;
    object-fit:cover;
}
</style>
</head>
<body>
	<!-- header(로고, 네비게이션바) -->
	<div>
		<c:import url="/resource/inc/header.jsp"></c:import>
	</div>

	<div class="container">
	
		<div class="image-box">
			<img class="image-thumbnail" src="/resource/mainImg/main.jpg" sytle="max-width:100%;">
		</div>
	</div>
	
	<!-- footer -->
	<div>
		<c:import url="/resource/inc/footerjsp"></c:import>
	</div>
</body>
</html>