<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="xlink" uri="http://jakarta.apache.org/taglibs/standard/permittedTaglibs" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="d-flex justify-content-center container" style="height: 450px">
    <form method="post" action="${pageContext.request.contextPath}/member/login"
          class="w-75 border p-3 bg-white shadow rounded align-self-center">
        <div class="d-inline-flex">
            <h1 class="ms-2 fw-bold">로그인</h1>
        </div>
        <div class="mb-3">
            <label for="username" class="form-label">아이디</label>
            <input type="text" class="form-control" name="username" id="username" placeholder="아이디를 입력해주세요">
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">비밀번호</label>
            <input type="password" class="form-control" name="password" id="password"
                   placeholder="비밀번호를 입력해주세요">
        </div>
        <c:if test="${error ne ''}">
            <div class="alert alert-danger d-flex align-items-center justify-content-center">
                <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:">
                    <use xlink:href="#exclamation-triangle-fill"/>
                </svg>
                <div>정보가 틀리거나 없는 아이디입니다</div>
            </div>
        </c:if>
        <div class="text-center mt-3">
            <button type="submit" id="boardBtn" class="btn btn-primary rounded-0 me-1">고객 로그인</button>
            <a href="${pageContext.request.contextPath}/admin/login-form" type="submit"
               class="btn btn-primary rounded-0 me-1">관리자 로그인</a>
        </div>
        <div class="text-center mt-3">
            <%-- 카카오 버튼 --%>
            <a href="${pageContext.request.contextPath}/oauth2/authorization/kakao"><img
                    src="${pageContext.request.contextPath}/resource/mainImg/kakao_btn.png"></a>
        </div>
    </form>
</div>
</body>
</html>


