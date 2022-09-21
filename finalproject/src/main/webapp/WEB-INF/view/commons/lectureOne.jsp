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
	<div class="container">
	<h1 style="text-align:center;">강좌 추가하기</h1>
	<br>

	<form action="${pageContext.request.contextPath}/cart?lectureNo=${lectureOne.lectureNo}" method="post">
	<table class="table table-bordered" style="text-align:center;">
		<tr> 
			<td>강좌번호</td>
			 <td>${lectureOne.lectureNo} </td>
		</tr>
		<tr> 
			<td>강좌명</td>
			<td><a href="${pageContext.request.contextPath}/employee/" class="btn btn-primary"  style="width:100px;">${lectureOne.lectureName}</a></td>
		</tr>
		<tr>
			<td>강좌요일</td>
			<td>${lectureOne.lectureDay}</td>
		</tr>
		<tr> 
			<td>강사이름</td>
			<td>${lectureOne.lectureName}</td>
		</tr>
		<tr> 
			<td>성별</td>
			<td>${lectureOne.memberGender}</td>
		</tr>
		<tr> 
			<td>장소번호</td>
			<td>${lectureOne.locationNo}</td>
		</tr>
		<tr> 
			<td>수강정원</td>
			<td>${lectureOne.lectureLimited}</td>
		</tr>
		<tr> 
			<td>수업시간</td>
			<td>${lectureOne.lectureTime}</td>
		</tr>
		<tr> 
			<td>강의금액</td>
			<td>${lectureOne.lecturePrice}</td>
		</tr>
		<tr> 
			<td>개강일</td>
			<td>${lectureOne.lectureStartDate}</td>
		</tr>
		<tr> 
			<td>종강일</td>
			<td>${lectureOne.lectureEndDate}</td>
		</tr>
	</table>
		
		<button type="submit" name="cart" id="cart" class="btn btn-primary" style="width:100px; float:right;" >장바구니</button>
		<a href="${pageContext.request.contextPath}/employeeLectureList" class="btn btn-primary" style="width:100px; float:right; margin-right:10px; ">강좌목록</a>
		
		<!-- 관리자만 수정,삭제 가능버튼 보임 -->
		<a href="${pageContext.request.contextPath}/removeLecture?lectureNo=${lectureOne.lectureNo}" class="btn btn-primary" style="width:100px; float:right; margin-right:10px;">강좌삭제</a>
		<a href="${pageContext.request.contextPath}/modifyLecture?lectureNo=${lectureOne.lectureNo}" 
			class="btn btn-primary" style="width:100px; float:right; margin-right:10px;">강좌수정</a>
		
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