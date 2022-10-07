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
		<h1 style="text-align: center;">강사 상세정보</h1>
		<br>
		<table class="table table-bordered" style="text-align: center; vertical-align: middle;">
			<tr>
				<td>강사이름</td>
				<td>${map.memberName}</td>
			</tr>
			<tr>
				<td>강사사진</td>
				<td><img
					src="${map.fileName}"
					style="width: 200px; height: 200px;"></td>
			<tr>
				<td>강사아이디</td>
				<td>${map.memberId}</td>
			</tr>
			<tr>
				<td>강좌이름</td>
				<td>${map.lectureName}</td>
			</tr>
			<tr>
				<td>강좌번호</td>
				<td>${map.lectureNo}</td>
			</tr>
			<tr>
				<td>강사성별</td>
				<td>${map.memberGender}</td>
			</tr>
			<tr>
				<td>강사전화번호</td>
				<td>${map.memberPhone}</td>
			</tr>
			<tr>
				<td>강사이메일</td>
				<td>${map.memberEmail}</td>
			</tr>
		</table>
		<a href="${pageContext.request.contextPath}/instructorList"
			class="btn btn-primary"
			style="width: 100px; float: right; margin-right: 10px;">강사목록</a>
	</div>

	<!-- footer -->
	<div>
	<br> <br>
		<c:import url="/WEB-INF/resource/inc/footer.jsp"></c:import>
	</div>
</body>
</html>