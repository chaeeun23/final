<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
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
<div>
    <c:import url="/WEB-INF/resource/inc/header.jsp"></c:import>
</div>
<div class="d-flex justify-content-center container " style="height: 600px">
    <form method="post" action="${pageContext.request.contextPath}/anonymous/find-id"
          class="w-75 border p-5 mt-5  bg-white shadow rounded align-self-center">
        <div class="text-center">
            <h4 class="ms-20 fw-bold mb-5">아이디 찾기</h4>
        </div>
        <p class=" fw-bold text-center small mt-4 text-black-50">등록한 메일로 가입한 아이디가 전송됩니다. 메일을 확인해주세요.</p>
        <div class="mb-3">
            <label for="email" class="fw-bold small">이메일</label>
            <input type="text" class="form-control" name="memberEmail" id="email" placeholder="메일을 입력해주세요">
        </div>
        <c:if test="${error ne null}">
            <div class="alert alert-danger d-flex align-items-center justify-content-center">
                <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:">
                    <use xlink:href="#exclamation-triangle-fill"/>
                </svg>
                <div>${error}</div>
            </div>
        </c:if>
        <div class="text-center">
            <button type="submit" id="boardBtn" class="btn btn-secondary mt-2 rounded-0">아이디 찾기</button>
            <a href="${pageContext.request.contextPath}/member/login-form"
               class="btn btn-secondary mt-2 rounded-0">뒤로가기</a>
        </div>
    </form>
</div>
<div>

    <br>
    <c:import url="/WEB-INF/resource/inc/footer.jsp"></c:import>
</div>
</body>
</html>
