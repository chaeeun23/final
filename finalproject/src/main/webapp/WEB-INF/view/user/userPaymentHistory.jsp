<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
	<!-- 회원이 보는 결제내역 -->
	<div class="container">
		<sec:authentication property="principal" var="member" />
		<h2 style="text-align: center;">${member.memberId}님의 결제내역</h2>
		<br>

		<table class="table table-bordered" style="text-align: center;">
			<tr>
				<th>결제번호</th>
				<th>강좌번호</th>
				<th>강좌이름</th>
				<th>강사이름</th>
				<th>사물함번호</th>
				<th>강좌가격</th>
				<th>결제수단</th>
				<th>결제날짜</th>
				<th>환불</th>
			</tr>
			<c:forEach var="l" items="${list}">
				<tr>
					<td>${l.courseNo}</td>
					<td>${l.lectureNo}</td>
					<td>${l.lectureName}</td>
					<td>${l.instructorName}</td>
					<td>${l.lockerNo}</td>
					<td>${l.lecturePrice}원</td>
					<td>${l.payMethod}</td>
					<td>${l.payDate}</td>
					<td>
						<!-- refund값이 N일 경우 환불신청버튼 / Y일 경우 환불완료 -->
						<c:if test="${l.refund eq 'N'}">
								<a href="${pageContext.request.contextPath}/modifyRefundStatement?courseNo=${l.courseNo}&refund=${l.refund}">
									<button class="btn btn-primary" style="height=100px">환불신청</button>
								</a>
						</c:if>
						<c:if test="${l.refund eq 'Y'}">
								<button class="btn btn-secondary">환불완료</button>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>


	<div>
		<%-- 페이지네이션 --%>
		<ul class="pagination justify-content-center my-2 mb-2">
			<%-- 이전 --%>
			<c:if test="${pageNation.startPage ne 1}">
				<li class="page-item"><a class="page-link"
					href="${pageNation.path}?current=${pageNation.startPage-1}"> 이전
				</a></li>
			</c:if>
			<%-- 페이지넘버 --%>
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
			<%-- 다음버튼 --%>
			<c:if test="${pageNation.endPage ne pageNation.lastPage}">
				<li class="page-item"><a class="page-link"
					href="${pageNation.path}?current=${pageNation.endPage+1}">다음</a></li>
			</c:if>
		</ul>
	</div>
	
	<!-- footer -->
	<div>
		<c:import url="/WEB-INF/resource/inc/footer.jsp"></c:import>
	</div>
</body>

</html>