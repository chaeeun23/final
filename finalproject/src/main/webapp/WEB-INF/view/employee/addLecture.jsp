<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<br>
		<br>
		<br>
	</div>
	
<!-- 총 관리자만 강좌 추가 가능 -->

	<h1 style="text-align:center;">강좌 추가하기</h1>
	<br>
	
	<form method="post" action="${pageContext.request.contextPath}/addLecture">
	<table class="table table-bordered" style="text-align:center;" >
		<tr> 
			<td>강좌번호</td>
			<td><input type="text" id="lectureNo" name="lectureNo"></td>
		</tr>
		<tr> 
			<td>강사아이디</td>
			<td>
			<select name="instrutorId">
				<option value="">::: 강사 선택 :::</option>
			<c:forEach var="i" items="${regionList}">
				<option value="${i.regionId}">${i.regionName}</option>
			</c:forEach>
		</select>
			</td>
		</tr>
		<tr> 
			<td>장소번호</td>
			<td>	
			<select name="locationNo">
				<option value="">::: 장소번호 선택 :::</option>
			<c:forEach var="l" items="${regionList}">
				<option value="${l.regionId}">${l.regionName}</option>
			</c:forEach>
		</select></td>
		</tr>
		<tr> 
			<td>강좌명</td>
			<td><input type="text" id="lectureName" name="lectureName"></td>
		</tr>
		<tr> 
			<td>수강인원</td>
			<td><input type="text" id="lectureLimited" name="lectureLimited"></td>
		</tr>
		<tr> 
			<td>수업시간</td>
			<td><input type="text" id="lectureTime" name="lectureTime"></td>
		</tr>
		<tr> 
			<td>강좌금액</td>
			<td><input type="text" id="lecturePrice" name="lecturePrice"></td>
		</tr>
		<tr> 
			<td>개강일</td>
			<td><input type="text" id="lectureStartDate" name="lectureStartDate"></td>
		</tr>
		<tr> 
			<td>종강일</td>
			<td><input type="text" id="lectureEndDate" name="lectureEndDate"></td>
		</tr>
		
	</table>
	<a href="${pageContext.request.contextPath}/employeeLectureList" class="btn btn-primary" style="width:100px; float:right; margin-right:10px; ">강좌목록</a>
	</form>
		
	<br>
	<br>
	<br>	
	
	
	<!-- footer -->
	<div>
		<c:import url="/WEB-INF/resource/inc/footer.jsp"></c:import>
	</div>
</body>
</html>