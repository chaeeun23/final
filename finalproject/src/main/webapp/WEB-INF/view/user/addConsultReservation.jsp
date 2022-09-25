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
					<td><sec:authentication property="principal" var="member"></sec:authentication>
					${memberDto.memberId}
					</td>
				</tr>
				<tr>
					<td>상담일시</td>
					<td><input type="datetime-local" id="consultDate" name="consultDate"></td>
				</tr>
			</table>
			<button type="button" class="btn btn-primary" id="addConsultReservationBtn"
				style="width: 100px; float: right; margin-right: 10px;" onclick="javascript:btn()">상담예약</button>
		
		</form>
	</div>
	
	<br>
	<br>
	<br>
	<!-- footer -->
	<div>
		<c:import url="/WEB-INF/resource/inc/footer.jsp"></c:import>
	</div>
	
	<script>
	$("#addConsultReservationBtn").click(function() {
		if ($("#consultDate").val() == "") {
			alert("상담일시를 입력해주세요.");
			return false;
		} else {
			addConsultReservationForm.submit();
		}
	});
	function btn(){
		    alert('상담예약 완료');
		}
	</script>
</body>
</html>