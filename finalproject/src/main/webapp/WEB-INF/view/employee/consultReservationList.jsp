<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- header(로고, 네비게이션바) -->
	<div>
		<c:import url="/WEB-INF/resource/inc/header.jsp"></c:import>
		<br> <br>

	</div>
<div class="container">
		<h1 style="text-align: center;">상담 스케줄</h1>
		<br>
		<h4 style="text-align: center;">

			<a
				href="${pageContext.request.contextPath}/consultReservationList?year=${ year }&month=${ month - 1 }"
				class="btn btn-primary">이전 달</a> &nbsp; ${ year }년 ${ month }월
			&nbsp; <a
				href="${pageContext.request.contextPath}/consultReservationList?year=${ year }&month=${ month + 1 }"
				class="btn btn-primary">다음 달</a>
		</h4>
		<br>

		<div class="mt-2" style="height: auto; width: auto;">
			<table id="zero_config"
				class="table table-striped table-bordered no-wrap">
				<thead>
					<tr>
						<th>일</th>
						<th>월</th>
						<th>화</th>
						<th>수</th>
						<th>목</th>
						<th>금</th>
						<th>토</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<c:forEach var="i" begin="1" end="${totalTd}" step="1">
							<c:choose>
								<c:when test="${(i - startBlank) > 0 && i <= endDay+startBlank}">
									<td style="height: 110px;" width="10%">${i - startBlank}
										<div>
											<c:forEach var="l" items="${ consultReservationListByMonth }">
												<c:if test="${(l.consultDateDay) ==  (i - startBlank)}">
													<div>
														<a
															href="${pageContext.request.contextPath}/consultReservationOne?consultReservationNo=${l.consultReservationNo}" class="btn btn-dark btn-sm" style="margin-top:10px;">${l.userId}/${l.consultDateTime}</a>
													
													</div>
												</c:if>
											</c:forEach>
										</div>
									</td>
								</c:when>

								<c:when test="${(i - startBlank) < 1 }">
									<td></td>
								</c:when>

								<c:when test="${i > endDay}">
									<td></td>
								</c:when>
							</c:choose>
							<c:if test="${ i % 7 == 0}">
					</tr>
					<tr>
						</c:if>
						</c:forEach>
					</tr>
				</tbody>
			</table>

		</div>
	</div>
	<!-- footer -->
	<div>
		<br>
		<c:import url="/WEB-INF/resource/inc/footer.jsp"></c:import>
	</div>

</body>
</html>