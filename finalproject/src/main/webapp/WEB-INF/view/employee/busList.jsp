<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
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
		<br>
		<br>
		<br>
	</div>
	
	<div class="container">
	<h1 style="text-align:center;">버스 리스트</h1>
	<br>
	<br>
	
	<div>
		<a href="${pageContext.request.contextPath}/addBus" class="btn btn-primary" style="width:100px; float:right;">버스 추가</a>
	</div>
	
	<br>
	<br>
	
	<div>
	<table class="table table-bordered" style="text-align:center; vertical-align:middle;">
		<tr>
			<th>버스번호</th>
			<th>버스기사</th>
			<th>수용인원</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<c:forEach var="b" items="${busList}">
			<tr>
				<td>${b.busNo}</td>
				<td>${b.busDriver}</td>
				<td>${b.busLimited}</td>
				<td><a href="${pageContext.request.contextPath}/modifyBus?busNo=${b.busNo}" class="btn btn-primary" >수정</a></td>
				<td><a href="${pageContext.request.contextPath}/removeBus?routeNo=${routeList.routeNo}&raceNo=${routeList.raceNo}&busNo=${routeList.busNo}" class="btn btn-primary" >삭제</a></td>
			</tr>
		</c:forEach>
	</table>
	
	<br>
	
	</div>
	
	<br>
	<br>
	
	
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