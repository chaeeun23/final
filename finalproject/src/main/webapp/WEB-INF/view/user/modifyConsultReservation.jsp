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
		<h1 style="text-align: center;">상담예약 변경</h1>
		<br>
		<form method="post"
			action="${pageContext.request.contextPath}/modifyConsultReservation"
			id="modifyConsultReservationForm">

			<table class="table table-bordered"
				style="text-align: center; vertical-align: middle;">
				<tr>
					<td>회원아이디</td>
					<td><input type="text" id="userId" name="userId"
						value="${map.userId}" readonly></td>
				</tr>
				<tr>
					<td>상담날짜</td>
					<td><input type="date" id="consultDate" name="consultDate" value="${map.consultDate}"></td>
				</tr>
				<tr>
					<td>상담시간</td>
					<td><select id="consultDateTime" name="consultDateTime">
							<option value="default">******* 시간 선택 *******</option>
							<option value="09:00">9시</option>
							<option value="10:00">10시</option>
							<option value="11:00">11시</option>
							<option value="14:00">2시</option>
							<option value="15:00">3시</option>
							<option value="16:00">4시</option>
							<option value="17:00">5시</option>
					</select></td>
				</tr>
			</table>
			<button type="button" class="btn btn-primary"
				id="modifyConsultReservationBtn"
				style="width: 100px; float: right; margin-right: 10px;"
				>상담예약</button>

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
		$("#modifyConsultReservationBtn").click(function() {
			if ($("#consultDate").val() == "") {
				alert("상담날짜를 입력해 주세요.");
				return false;
			} else if ($("#consultDateTime option:selected").val() == "default") {
				alert("상담시간을 선택해 주세요.");
				return false;
			} else {
				alert('상담예약 변경완료');
				modifyConsultReservationForm.submit();
			}
		});
		
		

		var now_utc = Date.now() // 지금 날짜를 밀리초로
		// getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
		var timeOff = new Date().getTimezoneOffset() * 60000; // 분단위를 밀리초로 변환
		// new Date(now_utc-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환
		var today = new Date(now_utc - timeOff).toISOString().split("T")[0];
		document.getElementById("consultDate").setAttribute("min", today);
	</script>
</body>
</html>