<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2유2김</title>
<style>
th, td {
	vertical-align:middle;
}
</style>
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/mainImg/favicon.png">
</head>
<body>
	<!-- header(로고, 네비게이션바) -->
	<div>
		<c:import url="/WEB-INF/resource/inc/header.jsp"></c:import>
		<br>
		<br>
		<br>
	</div>
	<!-- header END -->

	<!-- 장바구니 리스트 -->
	<div class="container">
	<sec:authentication property="principal" var="member"/>
		<h2 style="text-align: center;"> ${member.memberId}님의 장바구니</h2>
		<hr>
		<br>
<form method="post" action="${pageContext.request.contextPath}/userPaymentList" id="addForm">
	
		<table class="table" style="text-align: center;">
			<thead>
				<tr>
					<th></th>
					<th>강좌번호</th>
					<th>강의명</th>
					<th>장소</th>
					<th>수강요일</th>
					<th>시간</th>
					<th>가격</th>
					<th>주문관리</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="uc" items="${userCartList}">
					
					<tr>
						<td><input type="checkbox" id="cartCheck" name="cartCheck" value="${uc.lectureNo}" checked></td>
						<td>${uc.lectureNo}</td>
						<td>${uc.lectureName}</td>
						<td>${uc.lectureAddr}</td>
						<td>${uc.lectureDay}</td>
						<td>${uc.lectureTime}</td>
						<td>${uc.lecturePrice}원</td>
						<td><a class="btn btn-primary" href="${pageContext.request.contextPath}/removeUserCart?lectureNo=${uc.lectureNo}&userId=${member.memberId}">삭제하기</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<button class="btn btn-primary" id="movePaymentPageBtn" type="button" style="float:right;" value="cntCheck">결제하기</button>
		<a href="${pageContext.request.contextPath}/lectureList" class="btn btn-primary" style="float:right; margin-right:10px;">강좌목록</a>
	</form>
	</div>
	<!-- 장바구니 리스트 END -->


	<!-- footer -->
	<div>
	<br>
	<br>
		<c:import url="/WEB-INF/resource/inc/footer.jsp"></c:import>
	</div>
	<!-- footer END -->
</body>
<script>
	// 결제하기 알림창
	$('#movePaymentPageBtn').click(function(){
		if($(":checkbox[name='cartCheck']:checked").length == 0) {
			alert('결제할 강좌를 1 이상 체크해주세요.');
			return false;
		} else if(confirm("결제페이지로 이동하시겠습니까?")) {
			alert('결제페이지로 이동합니다.');
			addForm.submit();
		}
	});
</script>
</html>