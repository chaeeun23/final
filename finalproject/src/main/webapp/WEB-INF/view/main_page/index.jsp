<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2유2김</title>
<link rel="shortcut icon" href="/resource/mainImg/favicon.png">
<style>
.image-thumbnail {
    width:100%;
    height:550px;
    object-fit:fill;   
}

img {
  max-width: 100%;
  height: auto;
}
</style>
</head>
<body>
	<!-- header(로고, 네비게이션바) -->
	<div>
		<c:import url="/resource/inc/header.jsp"></c:import>
	</div>

	<div class="container">
			<img class="image-thumbnail" src="/resource/mainImg/main.png" style="max-width:100%;">
	</div>
	<br><br>
	
	<!-- footer -->
	<div>
		<c:import url="/resource/inc/footer.jsp"></c:import>
	</div>
</body>
</html>