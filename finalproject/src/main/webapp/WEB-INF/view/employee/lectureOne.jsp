<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lecture One</title>
</head>
<body>
<%
	String lectureName = request.getParameter("lectulectureNamereNo");
	System.out.println("lectureName : " + lectureName);
%> 
	<h1>강좌 상세페이지</h1>
	<table border="1">
		<tr> 
			<td>강좌번호</td>
			<td>${lectureOne.lectureNo}</td>
		</tr>
		<tr> 
			<td>강좌명</td>
			<td><a href="${pageContext.request.contextPath}/employee/">${lectureOne.lectureName}</a></td>
		</tr>
		<tr> 
			<td>강좌요일</td>
			<td></td>
		</tr>
		<tr> 
			<td>강사이름</td>
			<td></td>
		</tr>
		<tr> 
			<td>성별</td>
			<td></td>
		</tr>
		<tr> 
			<td>장소번호</td>
			<td></td>
		</tr>
		<tr> 
			<td>수강정원</td>
			<td></td>
		</tr>
		<tr> 
			<td>수업시간</td>
			<td></td>
		</tr>
		<tr> 
			<td>강의금액</td>
			<td></td>
		</tr>
		<tr> 
			<td>개강일</td>
			<td></td>
		</tr>
		<tr> 
			<td>종강일</td>
			<td></td>
		</tr>
		<tr> 
			<td>강좌소개</td>
			<td><textarea rows="3" cols="100" ></textarea></td>
		</tr>
	</table>
	
	
</body>
</html>