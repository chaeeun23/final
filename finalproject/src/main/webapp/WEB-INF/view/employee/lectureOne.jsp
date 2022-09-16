<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lecture One</title>
</head>
<body>
	<h1>강좌 상세페이지</h1>
	<table border="1">
		<tr> 
			<td>강좌번호</td>
			<td>${lectureNo}</td>
		</tr>
		<tr> 
			<td>강좌명</td>
			<td></td>
		</tr>
		<tr> 
			<td>강좌요일</td>
			<td></td>
		</tr>
		<tr> 
			<td>강사이름</td>
			<td></td>
		</tr>
		<tr> 
			<td>성별</td>
			<td></td>
		</tr>
		<tr> 
			<td>장소번호</td>
			<td></td>
		</tr>
		<tr> 
			<td>수강정원</td>
			<td></td>
		</tr>
		<tr> 
			<td>수업시간</td>
			<td></td>
		</tr>
		<tr> 
			<td>강의금액</td>
			<td></td>
		</tr>
		<tr> 
			<td>개강일</td>
			<td></td>
		</tr>
		<tr> 
			<td>종강일</td>
			<td></td>
		</tr>
		<tr> 
			<td>강좌소개</td>
			<td><textarea rows="3" cols="100" ></textarea></td>
		</tr>
	</table>
	
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
	
</body>
</html>