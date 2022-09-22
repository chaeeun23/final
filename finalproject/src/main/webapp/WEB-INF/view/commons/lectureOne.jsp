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
	<!-- 총 관리자만 강좌 추가 가능 -->
	<div class="container">
	<h1 style="text-align:center;">강좌 추가하기</h1>
	<br>

	<form action="${pageContext.request.contextPath}/cart?lectureNo=${lectureOne.lectureNo}" method="post">
	<table class="table table-bordered" style="text-align:center; vertical-align:middle;">
		<tr> 
			<td>강좌번호</td>
			<td>${lectureOne.lectureNo} </td>
		</tr>
		<tr> 
			<td>강좌명</td>
			<td><a href="${pageContext.request.contextPath}/commons/lectureIntroduce" class="btn btn-primary"  style="width:100px;">${lectureOne.lectureName}</a></td>
		</tr>
		<tr>
			<td>강좌요일</td>
			<td>${lectureOne.lectureDay}</td>
		</tr>
		<tr> 
			<td>강사이름</td>
			<td>${lectureOne.lectureName}</td>
		</tr>
		<tr> 
			<td>성별</td>
			<td>${lectureOne.memberGender}</td>
		</tr>
		<tr> 
			<td>장소번호</td>
			<td>${lectureOne.locationNo}</td>
		</tr>
		<tr> 
			<td>수강정원</td>
			<td>${lectureOne.lectureLimited}</td>
		</tr>
		<tr> 
			<td>수업시간</td>
			<td>${lectureOne.lectureTime}</td>
		</tr>
		<tr> 
			<td>강의금액</td>
			<td>${lectureOne.lecturePrice}</td>
		</tr>
		<tr> 
			<td>개강일</td>
			<td>${lectureOne.lectureStartDate}</td>
		</tr>
		<tr> 
			<td>종강일</td>
			<td>${lectureOne.lectureEndDate}</td>
		</tr>
	</table>
		
		<button type="submit" name="cart" id="cart" class="btn btn-primary" style="width:100px; float:right;" >장바구니</button>
		<a href="${pageContext.request.contextPath}/lectureList" class="btn btn-primary" style="width:100px; float:right; margin-right:10px; ">강좌목록</a>
		
		<!-- 관리자만 수정,삭제 가능버튼 보임 -->
		<a href="${pageContext.request.contextPath}/removeLecture?lectureNo=${lectureOne.lectureNo}" class="btn btn-primary" style="width:100px; float:right; margin-right:10px;">강좌삭제</a>
		<a href="${pageContext.request.contextPath}/modifyLecture?lectureNo=${lectureOne.lectureNo}" 
			class="btn btn-primary" style="width:100px; float:right; margin-right:10px;">강좌수정</a>
	</form>
	</div>

	<br>
	<br>
	<br>
	<br>

	<!-- 리뷰 리스트 -->
	<!-- 리뷰 자신이 작성한 것만 수정,삭제 가능(수강:아이디와 로그인한 아이디가 일치하면 수정, 삭제 가능)/ 관리자는 모든 리뷰 삭제 가능  -->
	<div class = "container">
	<table class="table table-bordered" style="text-align:center;" >
		<tr>
			<th>수강번호</th>
			<th>리뷰제목</th>
			<th>리뷰내용</th>
			<th>리뷰작성일</th>
			<th>리뷰수정일</th>
		</tr>
		<c:forEach var="r" items="${reviewList}">
			<tr>
				<td>${r.courseNo}</td>
				<td>${r.reviewTitle}</td>
				<td>${r.reviewContent}</td>
				<td>${r.createDate}</td>
				<td>${r.updateDate}</td>
			</tr>
		</c:forEach>
		<tr>
	</table>
	
	<div>
	<%-- 리뷰 페이지네이션 --%>
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

	
	
	<!-- 리뷰입력 -->
	<!-- 리뷰입력은 이 강좌를 수강한 사람만 입력 할 수 있게 -->
	<div class = "container">
			<table class="table table-bordered" style="text-align:center;" >
				<tr>
					<td>수강번호</td>
					<td>${r.courseNo}</td>
				</tr>
				<tr>
					<td>리뷰제목</td>
					<td><input type="text" name="reviewTitle" id="reviewTitle"></td>
				</tr>
				<tr>
					<td>리뷰내용</td>
					<td><textarea  name="reviewContent" id="reviewContent" rows="3" cols="100" ></textarea></td>
				</tr>
				
			</table>
				<button type="button" id="reviewBtn" class="btn btn-primary" style="width:100px; float:right;" >리뷰입력</button>
	</div>
	
	<br>
	<br>



	<!-- footer -->
	<div>
		<c:import url="/WEB-INF/resource/inc/footer.jsp"></c:import>
	</div>
</body>
</html>