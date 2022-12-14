<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2유2김</title>
<style type="text/css">
th {
	vertical-align:middle;
}
</style>
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

	<!-- 공지사항 상세보기 -->
	<div class="container">
	<h2 style="text-align:center;">공지사항 상세보기</h2>
	<br>
		<table class="table table-bordered" style="text-align: center;">
			<tr>
				<th style="width: 10%;">제목</th>
				<td style="width: 90%;">${noticeOne.noticeTitle }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${noticeOne.employeeId}</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${noticeOne.noticeRead}</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td><a
					href="${pageContext.request.contextPath}/notice/download/file?fileName=${noticeOne.fileName}">
						${noticeOne.fileName}</a></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><c:if test="${not empty noticeOne.fileName}">
						<img class="image-notice" style="width: 50%"
							src="${pageContext.request.contextPath}/noticeFileUpload/${noticeOne.fileName}">
					</c:if> 
					<br>${noticeOne.noticeContent}<br>
				</td>
			</tr>
		</table>
		<a class="btn btn-primary" href="${pageContext.request.contextPath}/noticeList/" style="float:right; margin-left:10px">목록</a>
		<!-- 관리자만 수정,삭제 가능버튼 보임 -->
		<sec:authorize access="hasAnyAuthority('ADMIN', 'EMPLOYEE')">
		<a class="btn btn-primary" href="${pageContext.request.contextPath}/removeNotice?noticeNo=${noticeOne.noticeNo}&fileName=${noticeOne.fileName}" style="float:right; margin-left:10px">삭제하기</a>
		<a class="btn btn-primary" href="${pageContext.request.contextPath}/modifyNotice?noticeNo=${noticeOne.noticeNo}&fileName=${noticeOne.fileName}" style="float:right; margin-left:10px" >수정하기</a>
		</sec:authorize>
		<br>
		<br>
	</div><!-- 공지사항 상세보기 END -->


	<!-- footer -->
	<div>
		<c:import url="/WEB-INF/resource/inc/footer.jsp"></c:import>
	</div>
</body>
</html>