<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2유2김</title>
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/mainImg/favicon.png">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.2.0/flatly/bootstrap.min.css"
	integrity="sha512-SAOc0O+NBGM2HuPF20h4nse270bwZJi8X90t5k/ApuB9oasBYEyLJ7WtYcWZARWiSlKJpZch1+ip2mmhvlIvzQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<br>

		<sec:authorize access="isAnonymous()">
			<div class="d-flex justify-content-end">
				<a href="${pageContext.request.contextPath}/anonymous/login-form"
					class="btn btn-primary btn-sm">로그인</a>&nbsp;<a
					href="${pageContext.request.contextPath}/anonymous/sign-form"
					class="btn btn-primary btn-sm">회원가입</a>
			</div>
		</sec:authorize>
		<sec:authorize access="isAuthenticated()">
			<div class="d-flex justify-content-end">
				<sec:authorize access="hasAnyAuthority('EMPLOYEE','ADMIN')">
					<div class="btn-group">
						<button type="button" class="btn btn-primary btn-sm"">관리자용</button>

						<button type="button"
							class="btn btn-primary dropdown-toggle dropdown-toggle-split btn-sm"
							data-toggle="dropdown">
							<span class="caret"></span>
						</button>
						<div class="dropdown-menu">
							<a class="dropdown-item"
								href="${pageContext.request.contextPath}/lectureList">강좌관리</a> <a
								class="dropdown-item"
								href="${pageContext.request.contextPath}/consultReservationList">상담스케줄</a>
							<a class="dropdown-item"
								href="${pageContext.request.contextPath}/busList">버스관리</a> <a
								class="dropdown-item"
								href="${pageContext.request.contextPath}/routeList">노선관리</a> <a
								class="dropdown-item"
								href="${pageContext.request.contextPath}/raceList">운행관리</a> <a
								class="dropdown-item"
								href="${pageContext.request.contextPath}/salesList">매출리스트</a> <a
								class="dropdown-item"
								href="${pageContext.request.contextPath}/employeePaymentList">결제리스트</a>


					<sec:authorize access="hasAuthority('ADMIN')">
						<a class="dropdown-item"
								href="${pageContext.request.contextPath}/admin/member-list">회원권한리스트</a> <a
							class="dropdown-item"
							href="${pageContext.request.contextPath}/admin/instructor-list">강사신청리스트</a>
					</sec:authorize>
						</div>
					</div>
				</sec:authorize>
				<a href="${pageContext.request.contextPath}/member/detail"
					class="btn btn-primary btn-sm mx-1">내정보</a> <a
					href="${pageContext.request.contextPath}/logout"
					class="btn btn-primary btn-sm">로그아웃</a>
			</div>
		</sec:authorize>
		<!-- 로고 -->
		<div class="d-flex justify-content-center">
			<a href="${pageContext.request.contextPath}/index"> <img
				src="${pageContext.request.contextPath}/mainImg/logo.png"
				style="max-width: 100%; height: auto;"></a>
		</div>
		<br>

		<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
			<div class="container">
				<div class="collapse navbar-collapse " id="navbarColor01">
					<div class="container">
						<div class="row">
							<ul class="navbar-nav mr-auto">
								<!-- <ul class="navbar-nav me-auto"> -->
								<div class="col-sm-1"></div>
								<div class="col-sm-2">
									<!-- 카테고리 드롭다운 -->
									<li class="nav-item dropdown "><a
										class="nav-link dropdown-toggle" href="#" id="navbardrop"
										data-toggle="dropdown">시설소개</a>
										<div class="dropdown-menu">
											<a class="dropdown-item"
												href="${pageContext.request.contextPath}/centerIntroduce">센터소개</a>
											<a class="dropdown-item"
												href="${pageContext.request.contextPath}/instructorList">강사소개</a>
											<a class="dropdown-item"
												href="${pageContext.request.contextPath}/centerRoute">오시는길</a>
										</div></li>
								</div>
								<div class="col-sm-2">
									<li class="nav-item dropdown"><a
										class="nav-link dropdown-toggle" href="#" id="navbardrop"
										data-toggle="dropdown">이용안내</a>
										<div class="dropdown-menu">
											<a class="dropdown-item"
												href="${pageContext.request.contextPath}/lectureList">강좌안내</a>
											<a class="dropdown-item"
												href="${pageContext.request.contextPath}/instructorList">강사안내</a>
											<a class="dropdown-item"
												href="${pageContext.request.contextPath}/raceList">셔틀버스
												운행안내</a>


										</div></li>
								</div>
								<div class="col-sm-2">
									<li class="nav-item dropdown"><a
										class="nav-link dropdown-toggle" href="#" id="navbardrop"
										data-toggle="dropdown">프로그램안내</a>
										<div class="dropdown-menu">
											<a class="dropdown-item"
												href="${pageContext.request.contextPath}/swimming">수영</a> <a
												class="dropdown-item"
												href="${pageContext.request.contextPath}/aerobics">에어로빅</a>
											<a class="dropdown-item"
												href="${pageContext.request.contextPath}/pilates">필라테스</a> <a
												class="dropdown-item"
												href="${pageContext.request.contextPath}/tennis">테니스</a> <a
												class="dropdown-item"
												href="${pageContext.request.contextPath}/pingpong">탁구</a>
										</div></li>
								</div>
								<div class="col-sm-2">
									<li class="nav-item dropdown"><a
										class="nav-link dropdown-toggle" href="#" id="navbardrop"
										data-toggle="dropdown">이용신청</a>
										<div class="dropdown-menu">

												<a class="dropdown-item"
													href="${pageContext.request.contextPath}/userCartList">
													장바구니</a>
												<a class="dropdown-item"
													href="${pageContext.request.contextPath}/userPaymentHistory">수강신청내역</a>


										</div></li>
								</div>
								<div class="col-sm-2">
									<li class="nav-item dropdown"><a
										class="nav-link dropdown-toggle" href="#" id="navbardrop"
										data-toggle="dropdown">열린마당</a>
										<div class="dropdown-menu">
											<a class="dropdown-item"
												href="${pageContext.request.contextPath}/noticeList">공지사항</a>
											<a class="dropdown-item"
												href="${pageContext.request.contextPath}/free-board/list">Q&A</a>



											<sec:authorize access="hasAuthority('USER')">
												<sec:authentication property="principal" var="member" />
												<a class="dropdown-item"
													href="${pageContext.request.contextPath}/userConsultReservationList?userId=${member.memberId}">상담예약</a>
											</sec:authorize>
										</div></li>

								</div>
								<div class="col-sm-1"></div>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</nav>
	</div>
</body>
</html>


