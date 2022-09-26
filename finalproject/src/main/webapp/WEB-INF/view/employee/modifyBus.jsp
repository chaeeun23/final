<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2유2김</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/mainImg/favicon.png">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="./js/jquery-1.12.4.min.js"></script>
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
	<h1 style="text-align:center;">버스 수정</h1>
	<br>
	
	<form method="post" action="${pageContext.request.contextPath}/modifyBus?busNo=${modifyBus.busNo}" id="modifyBusForm">
	<table class="table table-bordered" style="text-align:center;" >
		<tr> 
			<td>버스 번호</td>
			<td>${modifyBus.busNo}</td>
		</tr>
		<tr> 
			<td>버스 기사</td>
			<td><input type="text" id="busDriver" name="busDriver" value="${modifyBus.busDriver}"></td>
		</tr>
		<tr> 
			<td>수용 인원</td>
			<td><input type="text" id="busLimited" name="busLimited" value="${modifyBus.busLimited}"></td>
		</tr> 
		
		</table>
			<a href="${pageContext.request.contextPath}/busList" class="btn btn-primary" style="width:100px; float:right; margin-right:10px; ">버스목록</a>
			<button type="button" class="btn btn-primary" id="modifyBusBtn" style="width:100px; float:right; margin-right:10px;">버스수정</button>
	</form>
</div>

	<br>
	<br>
	<br>	
	
	
	
	<!-- footer -->
	<div>
		<c:import url="/WEB-INF/resource/inc/footer.jsp"></c:import>
	</div>
	
	<script>

	$("#modifyBusBtn").click(function(){
		 if( $("#busDriver").val() == "")	 { 
			alert("빈칸입니다. 버스기사를 입력해주세요!");	  
					$("#busDriver").focus();	
							return false; 
	   } else if( $("#busLimited").val() == "")	{
			alert("빈칸입니다. 수용인원을 입력해주세요!");	  
					$("#busLimited").focus();	
							return false; 
		} else {
			alert("버스 수정 성공!");	
			modifyBusForm.submit();
		}
	});
	</script>
</body>
</html>