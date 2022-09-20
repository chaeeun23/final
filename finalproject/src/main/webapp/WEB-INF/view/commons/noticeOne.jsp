<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	<!-- 공지사항 상세보기 -->
	<div class="container">
		<table class="table table-bordered" style="text-align: center;">
			<tr>
				<td style="width: 10%;">제목</td>
				<td style="width: 90%;">${noticeOne.noticeTitle }</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${noticeOne.employeeId}</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>${noticeOne.originalFileName}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>${noticeOne.noticeContent}</td>
			</tr>
		</table>

		<a class="btn btn-primary" href="${pageContext.request.contextPath}/noticeList/" style="float:right">목록</a>
		<br>
		<br>
	</div><!-- 공지사항 상세보기 END -->


	<!-- footer -->
	<div>
		<c:import url="/WEB-INF/resource/inc/footer.jsp"></c:import>
	</div>
</body>
</html>