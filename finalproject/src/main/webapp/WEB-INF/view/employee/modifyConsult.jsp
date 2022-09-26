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
		<br><br><br>
	</div>
	
	<div class="container">
		<h1 style="text-align: center;">상담정보 수정</h1>
		<br>
		<form method="post" action="${pageContext.request.contextPath}/modifyConsult" id="modifyConsultForm">
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
               <td><input type="text" id="employeeId" name="employeeId" value="${consultReservationOne.memberName}" readonly="readonly"></td>
            </tr>
            <tr>
               <td>상담내용</td>
               <td><textarea id="consultContent" name="consultContent" 
                     rows="5" cols="33" >${consultReservationOne.consultContent}</textarea></td>
            </tr>
			</table>
		<a href="${pageContext.request.contextPath}/consultReservationList" class="btn btn-primary" style="width:150px; float:right; margin-right:10px; ">상담스케줄</a>
			<button type="button" class="btn btn-primary" id="modifyConsultBtn" style="width:100px; float:right; margin-right:10px;" >완료</button>
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
		$("#modifyConsultBtn").click(function() {
			if ($("#consultContent").val() == "") {
				alert("상담내역을 입력해주세요.");
				return false;
			} else {
				alert('상담내역 수정완료');
				modifyConsultForm.submit();
			}
		});
		
		
	</script>
</body>
</html>