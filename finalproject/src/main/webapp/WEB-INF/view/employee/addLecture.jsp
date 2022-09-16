<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2유2김</title>
<link rel="shortcut icon" href="/resource/mainImg/favicon.png">
</head>
<body>
	<!-- header(로고, 네비게이션바) -->
	<div>
		<c:import url="/resource/inc/header.jsp"></c:import>
		<br>
		<br>
		<br>
	</div>
	
<!-- 총 관리자만 강좌 추가 가능 -->

	<h1>강좌 추가하기</h1>
	<table class="table table-bordered" style="text-align:center;">
		<tr> 
			<td>강좌번호</td>
			<td><input type="text" id="lectureNo" name=""></td>
		</tr>
		<tr> 
			<td>강사아이디</td>
			<td></td>
		</tr>
		<tr> 
			<td>장소번호</td>
			<td></td>
		</tr>
		<tr> 
			<td>강좌이름</td>
			<td><input type="text" id="" name=""></td>
		</tr>
		<tr> 
			<td>성별</td>
			<td><input type="text" id="" name=""></td>
		</tr>
		<tr> 
			<td>장소번호</td>
			<td><input type="text" id="" name=""></td>
		</tr>
		<tr> 
			<td>수강정원</td>
			<td><input type="text" id="" name=""></td>
		</tr>
		<tr> 
			<td>수업시간</td>
			<td><input type="text" id="" name=""></td>
		</tr>
		<tr> 
			<td>강의금액</td>
			<td><input type="text" id="" name=""></td>
		</tr>
		<tr> 
			<td>개강일</td>
			<td><input type="text" id="" name=""></td>
		</tr>
		<tr> 
			<td>종강일</td>
			<td><input type="text" id="" name=""></td>
		</tr>
		<tr> 
			<td>강좌소개</td>
			<td><textarea rows="3" cols="100" ></textarea></td>
		</tr>
	</table>
	
	
	<!-- footer -->
	<div>
		<c:import url="/resource/inc/footer.jsp"></c:import>
	</div>
</body>
</html>