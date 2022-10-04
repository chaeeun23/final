<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- header(로고, 네비게이션바) -->
	<div>
		<c:import url="/WEB-INF/resource/inc/header.jsp"></c:import>
		<br>
		<br>
		<br>
	</div>

	<div class="container">
	<sec:authentication property="principal" var="member" />
		<h2 style="text-align: center;">${member.memberId}님의 상담예약리스트</h2>
		<br>

		<table class="table table-bordered" style="text-align: center;">
			<tr>
				<th>회원아이디</th>
				<th>예약날짜</th>
			</tr>
			<c:forEach var="l" items="${list}">
				<tr>
					 <td>${l.userId}</td>
					<td><a href="${pageContext.request.contextPath}/userConsultReservationOne?userId=${l.userId}" class="btn btn-primary">${l.consultDate}</a></td>
				</tr>
			</c:forEach>
		</table>
		<a href="${pageContext.request.contextPath}/addConsultReservation" class="btn btn-primary"
			style="float: right;">상담예약하기</a>
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