<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
</head>
<body>
	<!-- header(로고, 네비게이션바) -->
	<div>
		<c:import url="/WEB-INF/resource/inc/header.jsp"></c:import>
		<br> <br>
	</div>
	<!-- 직원이 보는 결제리스트 -->
	<div class="container">
		<h1 style="text-align: center;">매출리스트</h1>
		<hr>
		<br>
		<div class="row">
			<div class="col-sm-2">
				<ul class="nav nav-pills flex-column">
					<li class="nav-item" style="padding-bottom: 15px;"><a
						class="nav-link"
						href="${pageContext.request.contextPath}/salesList"
						style="text-align: center; background-color: #95a5a6; font-size: large; color: white;">전체
							매출</a></li>
					<li class="nav-item dropdown " style="padding-bottom: 15px;"><a
						class="nav-link dropdown-toggle" href="#" id="navbardrop"
						data-toggle="dropdown"
						style="text-align: center; background-color: #95a5a6; font-size: large; color: white;">월별
							매출</a>
						<div class="dropdown-menu" style="">
							<a class="dropdown-item" href="#" style="text-align: center;">2020년</a>
							<a class="dropdown-item" href="#" style="text-align: center;">2021년</a>
							<a class="dropdown-item" href="#" style="text-align: center;">2022년</a>
						</div></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/lectureSalesList?lectureName=수영"
						style="text-align: center; background-color: #95a5a6; font-size: large; color: white;">강좌별
							매출</a></li>
				</ul>
			</div>
			<div class="col-sm-10">
				<table class="table table-bordered" style="text-align: center;">
					<tr>
						<c:forEach var="t" items="${totalSales}">
							<c:choose>
								<c:when test="${t.lectureName eq '수영'}">
									<input type="hidden" id="sSales" value="${t.totalSales}">
									<th>${t.lectureName}&nbsp;총&nbsp;매출&nbsp;:&nbsp;${t.totalSales}원</th>
								</c:when>
								<c:when test="${t.lectureName eq '에어로빅'}">
									<input type="hidden" id="aSales" value="${t.totalSales}">
									<th>${t.lectureName}&nbsp;총&nbsp;매출&nbsp;:&nbsp;${t.totalSales}원</th>
								</c:when>
								<c:when test="${t.lectureName eq '탁구'}">
									<input type="hidden" id="ppSales" value="${t.totalSales}">
									<th>${t.lectureName}&nbsp;총&nbsp;매출&nbsp;:&nbsp;${t.totalSales}원</th>
								</c:when>
								<c:when test="${t.lectureName eq '테니스'}">
									<input type="hidden" id="tSales" value="${t.totalSales}">
									<th>${t.lectureName }&nbsp;총&nbsp;매출&nbsp;:&nbsp;${t.totalSales}원</th>
								</c:when>
								<c:when test="${t.lectureName eq '필라테스'}">
									<input type="hidden" id="pSales" value="${t.totalSales}">
									<th>${t.lectureName}&nbsp;총&nbsp;매출&nbsp;:&nbsp;${t.totalSales}원</th>
								</c:when>
							</c:choose>
						</c:forEach>
					<tr>
				</table>

				<!-- 그래프 -->
				<canvas id="bar-chart" width="700" height="200"></canvas>
				<a
					href="${pageContext.request.contextPath}/lectureSalesList?lectureName=수영"
					class="btn btn-outline-dark btn-sm"
					style="margin-right: 121px; margin-left: 118px">매출내역</a>
				<!-- 수영 결제내역 -->
				<a
					href="${pageContext.request.contextPath}/lectureSalesList?lectureName=에어로빅"
					class="btn btn-outline-dark btn-sm" style="margin-right: 125px;">매출내역</a>
				<!-- 에어로빅 결제내역 -->
				<a
					href="${pageContext.request.contextPath}/lectureSalesList?lectureName=탁구"
					class="btn btn-outline-dark btn-sm" style="margin-right: 123px;">매출내역</a>
				<!-- 탁구 결제내역 -->
				<a
					href="${pageContext.request.contextPath}/lectureSalesList?lectureName=테니스"
					class="btn btn-outline-dark btn-sm" style="margin-right: 120px;">매출내역</a>
				<!-- 테니스 결제내역 -->
				<a
					href="${pageContext.request.contextPath}/lectureSalesList?lectureName=필라테스"
					class="btn btn-outline-dark btn-sm">매출내역</a>
				<!-- 필라테스 결제내역 -->
				<br>
				<hr>




				<!-- 과목별 매출그래프 -->
				<table class="table table-bordered" style="text-align: center;">
					<tr>
						<th>회원아이디</th>
						<th>강좌이름</th>
						<th>강좌가격</th>
						<th>결제수단</th>
						<th>결제날짜</th>
					</tr>
					<c:forEach var="l" items="${list}">
						<tr>
							<td>${l.userId}</td>
							<td>${l.lectureName}</td>
							<td>${l.lecturePrice}원</td>
							<td>${l.payMethod}</td>
							<td>${l.payDateYMD}</td>
						</tr>
					</c:forEach>
				</table>


			</div>
		</div>
	</div>


	<div>
		<!-- 페이지네이션 -->
		<ul class="pagination justify-content-center my-2 mb-2">
			<!-- 이전 -->
			<c:if test="${pageNation.startPage ne 1}">
				<li class="page-item"><a class="page-link"
					href="${pageNation.path}&current=${pageNation.startPage-1}"> 이전
				</a></li>
			</c:if>
			<!-- 페이지넘버 -->
			<c:forEach begin="${pageNation.startPage}"
				end="${pageNation.endPage}" varStatus="status">
				<c:if test="${pageNation.currentPage eq status.index}">
					<li class="page-item active"><a class="page-link">${status.index}
					</a></li>
				</c:if>
				<c:if test="${pageNation.currentPage ne status.index}">
					<li class="page-item"><a class="page-link"
						href="${pageNation.path}&current=${status.index}">${status.index}
					</a></li>
				</c:if>
			</c:forEach>
			<!-- 다음버튼 -->
			<c:if test="${pageNation.endPage ne pageNation.lastPage}">
				<li class="page-item"><a class="page-link"
					href="${pageNation.path}&current=${pageNation.endPage+1}">다음</a></li>
			</c:if>
		</ul>
	</div>
	<c:if test="${check eq 'insert'}">
		<script>
			alert('등록성공');
		</script>
	</c:if>
	<!-- footer -->
	<div>
		<c:import url="/WEB-INF/resource/inc/footer.jsp"></c:import>
	</div>

	<script>
		let pSales = $('#pSales').val();
		console.log(pSales);
		let sSales = $('#sSales').val();
		console.log(sSales);
		let tSales = $('#tSales').val();
		console.log(tSales);
		let ppSales = $('#ppSales').val();
		console.log(ppSales);
		let aSales = $('#aSales').val();
		console.log(aSales);

		new Chart(document.getElementById("bar-chart"), {
			type : 'bar',
			data : {
				labels : [ "수영", "에어로빅", "탁구", "테니스", "필라테스" ],
				datasets : [ {
					label : "Population (millions)",
					backgroundColor : [ "#3e95cd", "#8e5ea2", "#3cba9f",
							"#e8c3b9", "#c45850" ],
					data : [ sSales, aSales, ppSales, tSales, pSales ]
				} ]
			},
			options : {
				legend : {
					display : false
				},
				title : {
					display : true,
					text : '강좌별 매출 그래프'
				}
			}
		});
	</script>
</body>
</html>