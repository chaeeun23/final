<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
		<h2 style="text-align: center;">${member.memberId}님의 결제창</h2>
		<hr>
		<br>

		<form method="post"
			action="${pageContext.request.contextPath}/addUserPayment"
			id="userPaymentListForm">
			<table class="table table-bordered" style="text-align: center;">
				<tr>
					<th>강좌번호</th>
					<th>강좌이름</th>
					<th>강사이름</th>
					<th>강의장소</th>
					<th>강의시간</th>
					<th>강의요일</th>
					<th>개강일</th>
					<th>종강일</th>
					<th>강좌금액</th>
					<th>사물함사용여부</th>
				</tr>
				<c:set var="total" value="0"/>
				<c:forEach var="p" items="${userPaymentList}">
				<input type="hidden" id="lectureNo" name="lectureNo" value="${p.lectureNo}">
				<c:set var="total" value="${total + p.lecturePrice}"/>
					<tr>
						<td>${p.lectureNo}</td>
						<td>${p.lectureName}</td>
						<td>${p.memberName}</td>
						<td>${p.lectureAddr}</td>
						<td>${p.lectureTime}</td>
						<td>${p.lectureDay}</td>
						<td>${p.lectureStartDate}</td>
						<td>${p.lectureEndDate}</td>
						<td>${p.lecturePrice}원</td>
						<td>
							<select name="lockerUse">
								<option value="N">X
								<option value="Y">O
							</select>
						</td>
					</tr>
				</c:forEach>
				<tr>
				<th colspan='10' style="font-size:large;">총 금액&nbsp;:&nbsp;&nbsp;${total}원</th>
				</tr>
				<tr>
				<th colspan='10' style="font-size:large;">
			    결제수단&nbsp;:&nbsp;&nbsp;<select id="payMethod" name="payMethod">
					<option value="default">******* 결제수단 선택 *******</option>
					<option value="무통장입금">무통장입금</option>
					<option value="신용카드">신용카드</option>
					<option value="네이버페이">네이버페이</option>
					<option value="카카오페이">카카오페이</option>
				</select></th>
				</tr>
			</table>
				<button type="submit" class="btn btn-primary" id="userPaymentListBtn"
				style="width: 100px; float: right; margin-right: 10px;">결제하기</button>
			
		</form>
	</div>

	<!-- footer -->
	<div>
	<br><br>
		<c:import url="/WEB-INF/resource/inc/footer.jsp"></c:import>
	</div>
	

</body>

</html>