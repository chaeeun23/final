<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2유2김</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/mainImg/favicon.png">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

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
	<h1 style="text-align:center;">운행 추가</h1>
	<br>
	
	<form method="post" action="${pageContext.request.contextPath}/addRace" id="addRaceForm">
	<table class="table table-bordered" style="text-align:center;" >
	
		<tr> 
			<td>버스</td>
			<td>
				<select name="busNo" id="busNo" style="text-align:center;">
						<option value="default" >***** 버스번호 ) 기사 / 인원 *****</option>
					<c:if test=""></c:if>
					<c:forEach var="b" items="${busNoList}">
						<option value="${b.busNo}">${b.busNo} ) ${b.busDriver} / ${b.busLimited} </option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr> 
			<td>노선</td>
			<td>
				<select name="routeNo" id="routeNo" style="text-align:center;">
						<option value="default" >***** 노선번호 ) 간격 / 경유지 *****</option>
					<c:forEach var="r" items="${routeNoList}">
						<option value="${r.routeNo}">${r.routeNo} ) ${r.routeInterval} / ${r.busStop}</option>
					</c:forEach>
				</select>
			</td>
		</tr> 
		
		</table>
			<a href="${pageContext.request.contextPath}/raceList" class="btn btn-primary" style="width:100px; float:right; margin-right:10px; ">운행목록</a>
			<button type="button" class="btn btn-primary" id="addRaceBtn" style="width:100px; float:right; margin-right:10px;">운행추가</button>
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

		$("#addRaceBtn").click(function(){
			if( $("#busNo option:selected").val() == "default")	 { 
				alert("버스번호를 선택해 주세요!");	  
								return false; 
		 } else if( $("#routeNo option:selected").val() == "default")	 { 
				alert("노선번호를 입력해주세요!");	  
								return false; 
		 } else {
				alert("운행 추가 성공!");	
				addRaceForm.submit();
			}
		});

		
		
	</script>
	

			
	
	
</body>
</html>