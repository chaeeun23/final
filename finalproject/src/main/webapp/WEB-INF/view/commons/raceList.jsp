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
 <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
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
	<div class="row">
	<h1 style="text-align:center;">운행 리스트</h1>
	<br>
	
	
	<div class="container">
		<div class="row">
			<div class="col-sm-9">
			</div>
	
		<!-- 검색 -->
		<div class="col-sm-3">
			<form class="form-inline" action="${pageContext.request.contextPath}/raceList" method="get">
				<div class = "search-wrap" >
					<input type="text" class="form-control search-input" name="keyword" style="text-align:center; margin-right:8px;" placeholder="경유지를 입력하세요.">
					<button type="submit" class="btn btn-info search-btn" style="float:right;">검색</button>
				</div>
			</form>
		</div>
		</div>
	</div>
	
	<br>
	<br>
	<br>
	
	<div>
		<table class="table table-bordered" style="text-align:center; vertical-align:middle;">
			<tr>
				<th>노선번호</th>
				<th>운행시작시간</th>
				<th>운행종료시간</th>
				<th>운행간격</th>
				<th>경유지</th>
				<th>수용인원</th>
			<!-- 관리자면 삭제버튼 보이게 -->
			<sec:authorize access="hasAuthority('EMPLOYEE')">
				<th>삭제</th>
			</sec:authorize>
				
			</tr>
			<c:forEach var="r" items="${raceList}">
				<tr>
					<td>${r.routeNo}</td>
					<td>${r.routeStart}</td>
					<td>${r.routeEnd}</td>
					<td>${r.routeInterval}</td>
					<td>${r.busStop}</td>
					<td>${r.busLimited}</td>
			<!-- 관리자면 삭제버튼 보이게 -->
			<sec:authorize access="hasAuthority('EMPLOYEE')">
					<td><a href="${pageContext.request.contextPath}/removeRace?raceNo=${r.raceNo}" class="btn btn-primary">삭제</a></td>
			</sec:authorize>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	
	<!-- 관리자면 추가버튼 보이게 -->
	<div>
		<sec:authorize access="hasAuthority('EMPLOYEE')">
			<a href="${pageContext.request.contextPath }/addRace" class="btn btn-primary"  style="width:100px; float:right;">운행 추가</a>
		</sec:authorize>
			<a href="${pageContext.request.contextPath }/raceList" class="btn btn-primary"  style="width:100px; float:right; margin-right:10px;">운행 목록</a>
	
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
</div>

	<!-- footer -->
	<div>
		<c:import url="/WEB-INF/resource/inc/footer.jsp"></c:import>
	</div>
</body>
</html>