<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>2유2김</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/mainImg/favicon.png">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.2.0/flatly/bootstrap.min.css"
          integrity="sha512-SAOc0O+NBGM2HuPF20h4nse270bwZJi8X90t5k/ApuB9oasBYEyLJ7WtYcWZARWiSlKJpZch1+ip2mmhvlIvzQ=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
            integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
            crossorigin="anonymous"></script>
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
            <a href="${pageContext.request.contextPath}/login-form" class="btn btn-primary btn-sm">로그인</a>&nbsp;<a
                href="${pageContext.request.contextPath}/sign/sign-form" class="btn btn-primary btn-sm">회원가입</a>
        </div>
    </sec:authorize>
    <sec:authorize access="isAuthenticated()" >
        <div class="d-flex justify-content-end" >
                <%-- 권한 여러개 --%>
            <sec:authorize access="hasAnyAuthority('USER','ADMIN','INSTRUCTOR')">
                <sec:authentication property="principal.memberId"/>님
            </sec:authorize>
            <a href="${pageContext.request.contextPath}/detail" class="btn btn-primary btn-sm mx-2">내정보</a>
            <a href="${pageContext.request.contextPath}/logout" class="btn btn-primary btn-sm">로그아웃</a>
        </div>
    </sec:authorize>
    <!-- 로고 -->
    <div class="d-flex justify-content-center">
        <img src="${pageContext.request.contextPath}/mainImg/logo.png" style="max-width:100%; height:auto;">
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
                                        <a class="dropdown-item" href="#">센터소개</a> <a
                                            class="dropdown-item" href="#">강사소개</a> <a
                                            class="dropdown-item" href="#">오시는길</a>
                                    </div>
                                </li>
                            </div>
                            <div class="col-sm-2">
                                <li class="nav-item dropdown"><a
                                        class="nav-link dropdown-toggle" href="#" id="navbardrop"
                                        data-toggle="dropdown">이용안내</a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="#">강좌안내</a> <a
                                            class="dropdown-item" href="#">셔틀안내</a> <a
                                            class="dropdown-item" href="#">대관안내</a>
                                    </div>
                                </li>
                            </div>
                            <div class="col-sm-2">
                                <li class="nav-item dropdown"><a
                                        class="nav-link dropdown-toggle" href="#" id="navbardrop"
                                        data-toggle="dropdown">프로그램안내</a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="#">수영</a> <a
                                            class="dropdown-item" href="#">에어로빅</a> <a
                                            class="dropdown-item" href="#">필라테스</a> <a
                                            class="dropdown-item" href="#">테니스</a> <a
                                            class="dropdown-item" href="#">탁구</a>
                                    </div>
                                </li>
                            </div>
                            <div class="col-sm-2">
                                <li class="nav-item dropdown"><a
                                        class="nav-link dropdown-toggle" href="#" id="navbardrop"
                                        data-toggle="dropdown">이용신청</a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="#">장바구니</a> <a
                                            class="dropdown-item" href="#">수강신청</a> <a
                                            class="dropdown-item" href="#">대관신청</a>
                                    </div>
                                </li>
                            </div>
                            <div class="col-sm-2">
                                <li class="nav-item dropdown"><a
                                        class="nav-link dropdown-toggle" href="#" id="navbardrop"
                                        data-toggle="dropdown">열린마당</a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="#">공지사항</a> <a
                                            class="dropdown-item" href="#">Q&A</a> <a
                                            class="dropdown-item" href="#">상담예약</a>
                                    </div>
                                </li>
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

