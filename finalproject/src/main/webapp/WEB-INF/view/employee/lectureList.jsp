<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lecture List</title>
</head>
<body>
	<h1>강좌리스트</h1>
	<div>
		<!-- employee 와 총관리자인 권한이면 강좌추가버튼 보이게 -->
<%-- 	<c:if test="${member eq 'employee'}">
		<a href="${pageContext.request.contextPath }/addLecture/">강좌 추가</a>
	</c:if> --%>
	
	</div>
	<table border="1">
		<tr>
			<th>강사이름</th>
			<th>강좌명</th>
			<th>수강인원</th>
			<th>수업시간</th>
			<th>개강일</th>
			<th>종강일</th>
		</tr>
			<c:forEach var="l" items="${lectureList}">
		<tr>
			<td>${l.instructorId}</td>	<!-- 강사이름 조인 -->
			<td>${l.lectureName}</td>
			<td>${l.lectureLimited}</td>
			<td>${l.lectureTime}</td>
			<td>${l.lectureStartDate}</td>
			<td>${l.lectureEndDate}</td>

		</tr>
		</c:forEach>
	</table>
</body>
</html>