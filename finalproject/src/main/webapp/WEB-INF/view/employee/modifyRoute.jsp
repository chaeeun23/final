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
	<h1 style="text-align:center;">노선 수정</h1>
	<br>
	
	<form method="post" action="${pageContext.request.contextPath}/modifyRoute?routeNo=${updateRoute.routeNo}" id="modifyRouteForm">
	<table class="table table-bordered" style="text-align:center;" >
		<tr> 
			<td>노선 번호</td>
			<td>${updateRoute.routeNo}</td>
		</tr>
		<tr> 
			<td>운행시작시간</td>
			<td><input type="time" id="routeStart" name="routeStart" value="${updateRoute.routeStart}"></td>
		</tr>
		<tr> 
			<td>운행종료시간</td>
			<td><input type="time" id="routeEnd" name="routeEnd" value="${updateRoute.routeEnd}"></td>
		</tr> 
		<tr> 
			<td>운행 간격</td>
			<td><input type="text" id="routeInterval" name="routeInterval" value="${updateRoute.routeInterval}"></td>
		</tr> 
		<tr> 
			<td>경유지</td>
			<td><input type="text" id="busStop" name="busStop" value="${updateRoute.busStop}"></td>
		</tr> 
		
		</table>
			<a href="${pageContext.request.contextPath}/routeList" class="btn btn-primary" style="width:100px; float:right; margin-right:10px; ">노선목록</a>
			<button type="button" class="btn btn-primary" id="modifyRouteBtn" style="width:100px; float:right; margin-right:10px;">노선수정</button>
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

	$("#modifyRouteBtn").click(function(){
		if( $("#routeStart").val() == "")	 { 
			alert("운행시작시간을 선택해주세요!");	
					$("#busNo").focus();	
							return false; 
	   } else if( $("#routeEnd").val() == "")	 { 
			alert("운행종료시간을 선택해주세요!");	  
					$("#busDriver").focus();	
							return false; 
	   } else if( $("#routeInterval").val() == "")	{
			alert("빈칸입니다. 운행간격을 입력해주세요!");	  
					$("#busLimited").focus();	
							return false; 
		} else if( $("#busStop").val() == "")	{
			alert("빈칸입니다. 경유지를 입력해주세요!");	  
					$("#busLimited").focus();	
							return false; 
		} else {
			alert("노선 수정 성공!");	
			modifyRouteForm.submit();
		}
	});
	</script>
</body>
</html>