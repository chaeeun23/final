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
<script defer src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>
	<!-- header(로고, 네비게이션바) -->
	<div>
		<c:import url="/WEB-INF/resource/inc/header.jsp"></c:import>
		<br><br><br>
	</div><!-- header END -->


<!-- 공지사항 리스트 -->
<sec:authentication property="principal" var="member"/>
<div class="container">
	<h2 style="text-align:center;">공지사항</h2>
	<br>
	
	<table class="table table-bordered" style="text-align:center;">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="n" items="${noticeList}">
			<tr>
				<td style="width: 10%;">${n.noticeNo}</td>
				<td style="width: 60%; text-align: left;"><a
					href="${pageContext.request.contextPath}/noticeOne?noticeNo=${n.noticeNo}">${n.noticeTitle}</a></td>
				<td style="width: 10%;">${n.employeeId}</td>
				<td style="width: 10%;">${n.createDate}</td>
				<td style="width: 10%;">${n.noticeRead}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<!-- 공지사항 추가버튼(관리자) -->
	<div>
		<!-- employee 와 총관리자인 권한이면 공지사항추가버튼 보이게 -->
		<sec:authorize access="hasAnyAuthority('ADMIN', 'EMPLOYEE')">
			<a class="btn btn-primary" style="float:right; margin-left:10px"href="${pageContext.request.contextPath }/addNotice/">글쓰기</a>
		</sec:authorize>
	</div>
	
</div><!-- 공지사항 리스트 END -->
	
	<div>
	<!-- 페이지네이션 -->
	<ul class="pagination justify-content-center my-2 mb-2" >
		<!-- 이전 -->
		<c:if test="${pageNation.startPage ne 1}">
			<li class="page-item"><a class="page-link"
				href="${pageNation.path}?current=${pageNation.startPage-1}"> 이전
			</a></li>
		</c:if>
		<!-- 페이지넘버 -->
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
		
		
		<!-- 다음버튼 -->
		<c:if test="${pageNation.endPage ne pageNation.lastPage}">
			<li class="page-item"><a class="page-link"
				href="${pageNation.path}?current=${pageNation.endPage+1}">다음</a></li>
		</c:if>
	</ul>
	</div>
	
	
	<%-- <c:if test="${check eq 'insert'}">
		<script>
			alert('등록성공');
		</script>
	</c:if> --%>

	<!-- footer -->
	<div>
		<c:import url="/WEB-INF/resource/inc/footer.jsp"></c:import>
	</div><!-- footer END -->
</body>
</html>