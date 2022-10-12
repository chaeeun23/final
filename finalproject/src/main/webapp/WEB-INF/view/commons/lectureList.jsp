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
 	<!-- 직원, 총관리자면 삭제버튼 보이게 -->
	<sec:authorize access="hasAnyAuthority('EMPLOYEE','ADMIN')">
		<a href="${pageContext.request.contextPath }/addLecture" class="btn btn-primary"  style="width:100px; float:right; ">강좌 추가</a>
	</sec:authorize>
	
	</div>
	
	<div>
		<form name="search-form" autocomplete="off" style="float:right;  margin-right:50px;" >
			<select name="type" id="option" onchange="chageSelect()" style="text-align:center;   width: 200px; font-family: inherit;  
			border: 1px solid #999; border-radius: 5px;  -webkit-appearance: none; -moz-appearance: none; appearance: none;">
				<option value="" 
					<c:if test="${lectureName eq ''}">selected</c:if>>전체</option>
				<option value="수영"
					<c:if test="${lectureName eq '수영'}">selected</c:if>>수영</option>
				<option value="에어로빅"
					<c:if test="${lectureName eq '에어로빅'}">selected</c:if>>에어로빅</option>
				<option value="탁구"
					<c:if test="${lectureName eq '탁구'}">selected</c:if>>탁구</option>
				<option value="테니스"
					<c:if test="${lectureName eq '테니스'}">selected</c:if>>테니스</option>
				<option value="필라테스"
					<c:if test="${lectureName eq '필라테스'}">selected</c:if>>필라테스</option>
			</select>
		</form>
	</div>
	
	
	
	
	<br>
	<br>
	
	<div>
	<table class="table table-bordered" style="text-align:center; vertical-align:middle;" id="lectureList">
			<thead>
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
			</thead>
		<c:forEach var="l" items="${lectureList}">
			<tbody>
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
			</tbody>
		</c:forEach>
	</table>
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

	<script type="text/javascript">

	   $("#option").on("change", (e) => {
		   var type = $("#option").val();
		   var currentPage = "${pageNation.currentPage}";
	       location.href = "${pageContext.request.contextPath}/lectureList?currentPage="+currentPage+"&type="+type;
	   })
	</script>
	
	
	<br>


	<!-- footer -->
	<div>
		<c:import url="/WEB-INF/resource/inc/footer.jsp"></c:import>
	</div>
</body>
</html>