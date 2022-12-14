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
		<br>
		<br>
		<br>
	</div>

	<div class="container">
		<h1 style="text-align: center;">상담예약정보/상담내역</h1>
		<br>
		<table class="table table-bordered" style="text-align: center;">
			<tr>
				<td>회원이름</td>
				<td>${map.userName}</td>
			</tr>
			<tr>
				<td>회원아이디</td>
				<td>${map.userId}</td>
			</tr>
			<tr>
				<td>상담날짜</td>
				<td>${map.consultDate} ${map.consultDateTime}</td>
			</tr>
			<tr>
				<td>담당직원이름</td>
				<td>${map.memberName}</td>
			</tr>
			<tr>
				<td>상담내용</td>
				<td>${map.consultContent}</td>
			</tr>
		</table>
		<a href="${pageContext.request.contextPath}/removeConsultReservation?consultReservationNo=${map.consultReservationNo}"
			class="btn btn-primary"
			style="width: 150px; float: right; margin-right: 10px;" onclick="javascript:btn()">상담예약취소</a>
			<a href="${pageContext.request.contextPath}/modifyConsultReservation?consultReservationNo=${map.consultReservationNo}"
			class="btn btn-primary"
			style="width: 150px; float: right; margin-right: 10px;">상담예약수정</a>
	</div>




	<br>
	<br>
	<br>
	<!-- footer -->
	<div>
		<c:import url="/WEB-INF/resource/inc/footer.jsp"></c:import>
	</div>
	<script>
	function btn(){
        alert('상담내역 취소완료');
    }</script>
</body>
</html>