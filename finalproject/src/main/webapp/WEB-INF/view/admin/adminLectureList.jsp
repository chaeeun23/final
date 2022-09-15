<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>강좌리스트</h1>
	<div>
		<a href="${pageContext.request.contextPath }/addLecture/">강좌 추가</a>
	</div>
	
	<table border="1">
		<tr>
			<th>강좌번호</th>
			<th>강사아이디</th>
			<th>강의실번호</th>
			<th>강좌이름</th>
			<th>수강인원</th>
			<th>수업시간</th>
			<th>강좌가격</th>
			<th>개강일</th>
			<th>종강일</th>
			<th>강좌수정</th>
			<th>강좌삭제</th>
		</tr>
		<c:forEach var="l" items="${lectureList}">
		<tr>
			<td>${l.lectureNo}</td>
			<td>${l.instructorId}</td>
			<td>${l.locationNo}</td>
			<td>${l.lectureName}</td>
			<td>${l.lectureLimited}</td>
			<td>${l.lectureTime}</td>
			<td>${l.lecturePrice}</td>
			<td>${l.lectureStartDate}</td>
			<td>${l.lectureEndDate}</td>
			<td><a href="">수정</a></td>
			<td><a href="">삭제</a></td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>