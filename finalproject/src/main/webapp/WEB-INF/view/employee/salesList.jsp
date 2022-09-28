<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<br> <br>
	</div>
	<!-- 직원이 보는 결제리스트 -->
	<div class="container">
		<h1 style="text-align: center;">매출리스트</h1>
		<br>
		<div class="row">
			<div class="col-sm-2">
				<ul class="nav nav-pills flex-column">
					<li class="nav-item dropdown " style="padding-bottom: 15px;"><a
						class="nav-link dropdown-toggle" href="#" id="navbardrop"
						data-toggle="dropdown"
						style="text-align: center; background-color: #95a5a6; font-size: large; color: white;">월별
							매출</a>
						<div class="dropdown-menu" style="">
							<a class="dropdown-item" href="#" style="text-align: center;">2020년</a>
							<a class="dropdown-item" href="#" style="text-align: center;">2021년</a>
							<a class="dropdown-item" href="#" style="text-align: center;">2022년</a>
						</div></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/lectureSalesList?lectureName=필라테스"
						style="text-align: center; background-color: #95a5a6; font-size: large; color: white;">과목별
							매출</a></li>
				</ul>
			</div>
			<div class="col-sm-10">
				<!-- 그래프, 매출리스트 -->
				<table class="table table-bordered" style="text-align: center;">
					<tr>
						<th>회원아이디</th>
						<th>강좌이름</th>
						<th>강좌가격</th>
						<th>결제수단</th>
						<th>결제날짜</th>
					</tr>
					<c:forEach var="l" items="${list}">
						<tr>
							<td>${l.userId}</td>
							<td>${l.lectureName}</td>
							<td>${l.lecturePrice}원</td>
							<td>${l.payMethod}</td>
							<td>${l.payDateYMD}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>


	<div>
		<!-- 페이지네이션 -->
		<ul class="pagination justify-content-center my-2 mb-2">
			<!-- 이전 -->
			<c:if test="${pageNation.startPage ne 1}">
				<li class="page-item"><a class="page-link"
					href="${pageNation.path}?current=${pageNation.startPage-1}"> 이전
				</a></li>
			</c:if>
			<!-- 페이지넘버 -->
			<c:forEach begin="${pageNation.startPage}"
				end="${pageNation.endPage}" varStatus="status">
				<c:if test="${pageNation.currentPage eq status.index}">
					<li class="page-item active"><a class="page-link">${status.index}
					</a></li>
				</c:if>
				<c:if test="${pageNation.currentPage ne status.index}">
					<li class="page-item"><a class="page-link"
						href="${pageNation.path}?current=${status.index}">${status.index}
					</a></li>
				</c:if>
			</c:forEach>
			<!-- 다음버튼 -->
			<c:if test="${pageNation.endPage ne pageNation.lastPage}">
				<li class="page-item"><a class="page-link"
					href="${pageNation.path}?current=${pageNation.endPage+1}">다음</a></li>
			</c:if>
		</ul>
	</div>
	<c:if test="${check eq 'insert'}">
		<script>
			alert('등록성공');
		</script>
	</c:if>
	<!-- footer -->
	<div>
		<c:import url="/WEB-INF/resource/inc/footer.jsp"></c:import>
	</div>
</body>
</html>