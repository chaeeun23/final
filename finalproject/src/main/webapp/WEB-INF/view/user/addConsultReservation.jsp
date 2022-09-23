<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2유2김</title>
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/mainImg/favicon.png">
</head>
<body>
	<!-- header(로고, 네비게이션바) -->
	<div>
		<c:import url="/WEB-INF/resource/inc/header.jsp"></c:import>
		<br> <br> <br>
	</div>

	<div class="container">
		<h1 style="text-align: center;">상담예약하기</h1>
		<br>
		<form method="post"
			action="${pageContext.request.contextPath}/addConsultReservation"
			id="addConsultReservationForm">

			<table class="table table-bordered"
				style="text-align: center; vertical-align: middle;">
				<tr>
					<td>회원아이디</td>
					<td></td>
				</tr>
				<tr>
					<td>상담날짜</td>
					<td><input type="date" id="consultDate" name="consultDate"
						value="${consultReservationOne.consultDate} ${consultReservationOne.consultDateTime}"></td>
				</tr>
			</table>
			<a href="${pageContext.request.contextPath}/userConsultReservationOne"
				class="btn btn-primary"
				style="width: 150px; float: right; margin-right: 10px;">상담스케줄</a>
		</form>
	</div>
	
	<br>
	<br>
	<br>
	<!-- footer -->
	<div>
		<c:import url="/WEB-INF/resource/inc/footer.jsp"></c:import>
	</div>
</body>
</html>