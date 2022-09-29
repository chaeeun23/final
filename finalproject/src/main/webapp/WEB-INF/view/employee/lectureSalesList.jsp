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
							<a class="dropdown-item"
								href="${pageContext.request.contextPath}/monthSalesList?payDateM=01"
								style="text-align: center;">2022년</a>
						</div></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/lectureSalesList?lectureName=수영"
						style="text-align: center; background-color: #95a5a6; font-size: large; color: white;">강좌별
							매출</a></li>
				</ul>
			</div>

			<div class="col-sm-10">
				<!-- 강좌별 매출 버튼 -->
				<div style="text-align: center;">
					<c:forEach var="t" items="${totalSales}">
						<input type="hidden" id="m${t.lectureName}"
							value="${t.totalSales}">
						<a
							href="${pageContext.request.contextPath}/lectureSalesList?lectureName=${t.lectureName}"
							class="btn btn-outline-secondary" style="margin-right: 5px">${t.lectureName}&nbsp;매출&nbsp;:&nbsp;${t.totalSales}원</a>
					</c:forEach>
				</div>
			<br> 

			<!-- 그래프 -->
			<canvas id="bar-chart" width="700" height="200"></canvas>
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
			<div>
				<!-- 페이지네이션 -->
				<ul class="pagination justify-content-center my-2 mb-2">
					<!-- 이전 -->
					<c:if test="${pageNation.startPage ne 1}">
						<li class="page-item"><a class="page-link"
							href="${pageNation.path}&current=${pageNation.startPage-1}">
								이전 </a></li>
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

		</div>
	</div>
	</div>

	<!-- footer -->
	<div>
		<c:import url="/WEB-INF/resource/inc/footer.jsp"></c:import>
	</div>

	<script>
		let pSales = $('#m필라테스').val();
		let sSales = $('#m수영').val();
		let tSales = $('#m테니스').val();
		let ppSales = $('#m탁구').val();
		let aSales = $('#m에어로빅').val();
	
		//구분자 빼기
		//수영 총매출
		let Sales1 = sSales.split(',');
		console.log(Sales1);
		let sSales1 = "";
		for(let i = 0 ; i < Sales1.length; i++){
			sSales1 += Sales1[i];
		}
		//에어로빅 총매출
		let Sales2 = aSales.split(',');
		console.log(Sales2);
		let aSales1 = "";
		for(let i = 0 ; i < Sales2.length; i++){
			aSales1 += Sales2[i];
		}
		//탁구 총매출
		let Sales3 = ppSales.split(',');
		let ppSales1 = "";
		for(let i = 0 ; i < Sales3.length; i++){
			ppSales1 += Sales3[i];
		}
		//테니스 총매출
		let Sales4 = tSales.split(',');
		let tSales1 = "";
		for(let i = 0 ; i < Sales4.length; i++){
			tSales1 += Sales4[i];
		}
		//필라테스 총매출
		let Sales5 = pSales.split(',');
		let pSales1 = "";
		for(let i = 0 ; i < Sales5.length; i++){
			pSales1 += Sales5[i];
		}

	
		new Chart(document.getElementById("bar-chart"), {
			type : 'bar',
			data : {
				labels : [ "수영", "에어로빅", "탁구", "테니스", "필라테스" ],
				datasets : [ {
					label : "Population (millions)",
					backgroundColor : [ "#3e95cd", "#8e5ea2", "#3cba9f",
							"#e8c3b9", "#c45850" ],
					data : [ sSales1, aSales1, ppSales1, tSales1, pSales1 ]
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