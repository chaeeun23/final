<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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
	
	<div class="container">
	<h1 style="text-align:center;">강좌리스트</h1>
	<br>
	
	<div>
 	<!-- 관리자이면 추가버튼 보이게 -->
	<sec:authorize access="hasAuthority('EMPLOYEE')">
		<a href="${pageContext.request.contextPath }/addLecture" class="btn btn-primary"  style="width:100px; float:right; ">강좌 추가</a>
	</sec:authorize>
	</div>
	
	<br>
	<br>
	
	<div>
	<table class="table table-bordered" style="text-align:center; vertical-align:middle;">
		<tr>
			<th>강좌번호</th>
			<th>강사이름</th>
			<th>강좌명</th>
			<th>수강요일</th>
			<th>수강인원</th>
			<th>수업시간</th>
			<th>개강일</th>
			<th>종강일</th>
		</tr>
		<c:forEach var="l" items="${lectureList}">
			<tr>
				<td>${l.lectureNo}</td>
				<td>${l.memberName}</td>
				<td>
				<a href="${pageContext.request.contextPath}/lectureOne?lectureNo=${l.lectureNo}" class="btn btn-primary"  style="width:100px;">
				${l.lectureName}</a></td>
				<td>${l.lectureDay}</td>
				<td>${l.lectureLimited}</td>
				<td>${l.lectureTime}</td>
				<td>${l.lectureStartDate}</td>
				<td>${l.lectureEndDate}</td>
			</tr>
		</c:forEach>
	</table>
	</div>
	
	
	<div>
	<%-- 페이지네이션 --%>
	<ul class="pagination justify-content-center my-2 mb-2" >
		<%-- 이전 --%>
		<c:if test="${pageNation.startPage ne 1}">
			<li class="page-item"><a class="page-link"
				href="${pageNation.path}?current=${pageNation.startPage-1}"> 이전
			</a></li>
		</c:if>
		<%-- 페이지넘버 --%>
		<c:forEach begin="${pageNation.startPage}" end="${pageNation.endPage}"
			varStatus="status">
			<c:if test="${pageNation.currentPage eq status.index}">
				<li class="page-item active" ><a class="page-link">${status.index}
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
	<c:if test="${check eq 'insert'}">
		<script>
			alert('등록성공');
		</script>
	</c:if>
	
	
</div>

	<!-- footer -->
	<div>
		<c:import url="/WEB-INF/resource/inc/footer.jsp"></c:import>
	</div>
</body>
</html>