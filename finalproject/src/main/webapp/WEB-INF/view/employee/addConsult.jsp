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
	<!-- 예약정보는 있고 상담내역이 없을 때 상담내역 추가(직원) -->
	<div class="container">
		<h1 style="text-align: center;">상담내역 추가</h1>
		<br>
		<form method="post"
			action="${pageContext.request.contextPath}/addConsult"
			id="addConsultForm">

			<table class="table table-bordered" style="text-align: center; vertical-align:middle;">
				<tr>
					<td>회원아이디</td>
					<td><input type="text" id="userId" name="userId"
						value="${consultReservationOne.userId}" readonly="readonly"></td>
				<input type="hidden" name="consultReservationNo" value="${consultReservationOne.consultReservationNo}">
				</tr>
				<tr>
					<td>상담날짜</td>
					<td><input type="text" id="consultDate" name="consultDate"
						value="${consultReservationOne.consultDate} ${consultReservationOne.consultDateTime}"
						readonly="readonly"></td>
				</tr>
				<tr>
               <td>담당직원이름</td>
               <td><select name="employeeId" id="memberName"
                  style="text-align: center;">
                     <option value="default">******* 직원 선택 *******</option>
                     <c:forEach var="e" items="${employee}">
                        <option value="${e.memberId}">${e.memberName}</option>
                     </c:forEach>
               </select></td>
            </tr>
            <tr>
               <td>상담내용</td>
               <td><textarea id="consultContent" name="consultContent"
                     rows="5" cols="33" ></textarea></td>
            </tr>
			</table>
			<a href="${pageContext.request.contextPath}/consultReservationList"
				class="btn btn-primary"
				style="width: 150px; float: right; margin-right: 10px;">상담스케줄</a>
			<button type="button" class="btn btn-primary" id="addConsultBtn"
				style="width: 100px; float: right; margin-right: 10px;">추가</button>
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
		$("#addConsultBtn").click(function() {
			if ($("#employeeId option:selected").val() == "default") {
				alert("직원을 선택해 주세요.");
				return false;
			} else if ($("#consultContent").val() == "") {
				alert("상담내역을 입력해주세요.");
				return false;
			} else {
				addConsultForm.submit();
			}
		});
	</script>

</body>
</html>