<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2유2김</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/mainImg/favicon.png">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
<!-- 파일 등록 JS -->
$(document).ready(function(){
	<!-- 이미지 파일만 업로드 가능 -->
	var regex = new RegExp("(.*?)\.(jpeg|jpg|png|gif|bmp)$"); // 이미지파일확장자 제한
	
	function checkExtension(fileName){ // 정미한테 헬프요청
		if(regex.test(fileName)){
			alert("이미지 파일만 업로드 가능합니다.(jpeg, jpg, png, gif, bmp)");
			return false;
		}
		return
	}
	
	$('#addBtn').click(function(){
		
		if($('#noticeTitle').val() == ''){
			alert('noticeTitle를 입력하세요');
		} else if($('#noticeContent').val() == ''){
			alert('noticeContent를 입력하세요');
		} else{
			addNoticeForm.submit();
		}
		
	});
	
	$('#removeFile').click(function(){
		$('#fileSection').empty();
	});
});
</script>
</head>
<body>
	<!-- header(로고, 네비게이션바) -->
	<div>
		<c:import url="/WEB-INF/resource/inc/header.jsp"></c:import>
		<br>
		<br>
		<br>
	</div><!-- header END -->
	
	<!-- 총 관리자만 공지사항 등록 가능 -->
	
	
	<!-- 공지사항 등록폼 -->
	<div class="container">
		<form enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath }/addNotice" id="addNoticeForm">
			<h1>공지사항 등록</h1>
			<table class="table table-bordered">
				<tr>
					<td style="width: 10%;">제목</td>
					<td style="width: 90%;"><input type="text" id="noticeTitle" name="noticeTitle"></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><input type="text" id="employeeId" name="employeeId" <%-- value="${notice.employeeId}"  readonly --%> ></td>
				</tr>

				<tr>
					<td>첨부파일</td>
					<td>
						<div id="fileSection"><input type="file" name="multiList" class="multiList"></div>
					</td>
				</tr>


				<tr>
					<td>내용</td>
					<td><textarea rows="3" cols="100" id="noticeContent" name="noticeContent"></textarea></td>
				</tr>
			</table>
			<button class="btn btn-primary" type="button" id="addBtn">등록하기</button>
		</form>
	</div>
	<!-- 공지사항 추가폼 END -->

	<!-- footer -->
	<div>
		<c:import url="/WEB-INF/resource/inc/footer.jsp"></c:import>
	</div><!-- footer END -->
</body>
</html>