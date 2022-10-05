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
				<!-- 월별 매출 버튼 -->
				<div style="text-align: center; vertical-align: middle;">
					<c:forEach var="t" items="${totalSales}">
						<input type="hidden" id="m${t.payDateM}" value="${t.totalSales}">
						<a
							href="${pageContext.request.contextPath}/monthSalesList?payDateM=${t.payDateM}"
							class="btn btn-outline-secondary" style="margin-right: 5px; margin-bottom: 5px;" >${t.payDateM}월&nbsp;매출&nbsp;:&nbsp;${t.totalSales}원</a>
					</c:forEach>
				</div>
				<br> 
				<!-- 그래프 -->
				<canvas id="bar-chart" width="700" height="200"></canvas>

				<hr>

				<!-- 과목별 매출그래프 -->
				<table class="table table-bordered" style="text-align: center;">
					<tr>
						<th>회원아이디</th>
						<th>강좌이름</th>
						<th>결제가격</th>
						<th>결제수단</th>
						<th>결제날짜</th>
					</tr>
					<c:forEach var="l" items="${list}">
						<tr>
							<td>${l.userId}</td>
							<td>${l.lectureName}</td>
							<td>${l.payPrice}원</td>
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
		let jan = $('#m01').val();
		console.log(jan);
		let feb = $('#m02').val();
		let mar = $('#m03').val();
		let apr = $('#m04').val();
		let may = $('#m05').val();
		let jun = $('#m06').val();
		let jul = $('#m07').val();
		let aug = $('#m08').val();
		let sep = $('#m09').val();
		let oct = $('#m10').val();
		let nov = $('#m11').val();
		let dec = $('#m12').val();

		//구분자빼기 
		let jan1 = jan.split(',');
		console.log(jan1);
		let jan2 = "";
		for(let i = 0 ; i < jan1.length; i++){
			jan2 += jan1[i];
		}
		console.log(jan2);
		
		let feb1 = feb.split(',');
		let feb2 = "";
		for(let i = 0 ; i < feb1.length; i++){
			feb2 += feb1[i];
		}
		console.log(feb2);
		
		let mar1 = mar.split(',');
		let mar2 = "";
		for(let i = 0 ; i < mar1.length; i++){
			mar2 += mar1[i];
		}
		console.log(mar2);
		
		let apr1 = apr.split(',');
		let apr2 = "";
		for(let i = 0 ; i < apr1.length; i++){
			apr2 += apr1[i];
		}
		console.log(apr2);
		
		let may1 = may.split(',');
		let may2 = "";
		for(let i = 0 ; i < may1.length; i++){
			may2 += may1[i];
		}
		console.log(jan2);
		
		let jun1 = jun.split(',');
		let jun2 = "";
		for(let i = 0 ; i < jun1.length; i++){
			jun2 += jun1[i];
		}
		console.log(jun2);
		
		let jul1 = jul.split(',');
		let jul2 = "";
		for(let i = 0 ; i < jul1.length; i++){
			jul2 += jul1[i];
		}
		console.log(jul2);
		
		let aug1 = aug.split(',');
		let aug2 = "";
		for(let i = 0 ; i < aug1.length; i++){
			aug2 += aug1[i];
		}
		console.log(aug2);
		
		let sep1 = sep.split(',');
		let sep2 = "";
		for(let i = 0 ; i < sep1.length; i++){
			sep2 += sep1[i];
		}
		console.log(sep2);
		
		let oct1 = oct.split(',');
		let oct2 = "";
		for(let i = 0 ; i < oct1.length; i++){
			oct2 += oct1[i];
		}
		console.log(oct2);
		
		let nov1 = nov.split(',');
		let nov2 = "";
		for(let i = 0 ; i < nov1.length; i++){
			nov2 += nov1[i];
		}
		console.log(jul2);
		
		let dec1 = dec.split(',');
		let dec2 = "";
		for(let i = 0 ; i < dec1.length; i++){
			dec2 += dec1[i];
		}
		console.log(dec2);

		
		
		new Chart(document.getElementById("bar-chart"), {
			type : 'bar',
			data : {
				labels : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월",
						"9월", "10월", "11월", "12월" ],
				datasets : [ {
					label : "Population (millions)",
					backgroundColor : [ "#3e95cd", "#8e5ea2", "#3cba9f",
							"#e8c3b9", "#c45850", "#3e95cd", "#8e5ea2",
							"#3cba9f", "#e8c3b9", "#c45850", "#3e95cd",
							"#8e5ea2" ],
					data : [ jan2, feb2, mar2, apr2, may2, jun2, jul2, aug2, sep2, oct2,
							nov2, dec2 ]
				} ]
			},
			options : {
				legend : {
					display : false
				},
				title : {
					display : false,
					text : '월별 매출 그래프'
				}
			}
		});
	</script>
</body>
</html>