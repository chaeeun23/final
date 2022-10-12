<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
</head>
<body>
<div>
    <c:import url="/WEB-INF/resource/inc/header.jsp"></c:import>
</div>
<div class="d-flex justify-content-center container " style="height: 600px">
    <form method="post" action="${pageContext.request.contextPath}/anonymous/login"
          class=" w-75 border p-5 mt-5  bg-white shadow rounded align-self-center">
        <div class=" text-center">
            <h3 class="ms-20 fw-bold mb-5 ">Log In</h3>
        </div>
        <div class="mb-3">
            <label for="username" class="fw-bold small mb-2 ">아이디</label>
            <input type="text" class="form-control" name="username" id="username" placeholder="아이디를 입력해주세요">
        </div>
        <div class="mb-3">
            <label for="password" class="fw-bold small mb-2 ">비밀번호</label>
            <input type="password" class="form-control" name="password" id="password"
                   placeholder="비밀번호를 입력해주세요">
        </div>
        <c:if test="${error ne null}">
            <div class="alert alert-danger d-flex align-items-center justify-content-center">
                <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:">
                    <use xlink:href="#exclamation-triangle-fill"/>
                </svg>
                <c:if test="${error eq 'f'}">
                    <div>정보가 틀리거나 없는 아이디입니다</div>
                </c:if>
                <c:if test="${error eq 't'}">
                    <div>탈퇴한 아이디입니다. 관리자에게 문의해주세요</div>
                </c:if>
            </div>
        </c:if>
        <div class="d-flex justify-content-end">
            <div>
                <div class="small">
                    <a href="${pageContext.request.contextPath}/anonymous/find-id">아이디찾기</a> | <a
                        href="${pageContext.request.contextPath}/anonymous/find-pw">비밀번호찾기</a>
                </div>
            </div>
        </div>
        <div class="text-center">
            <button type="submit" id="boardBtn" class="btn btn-dark">고객 로그인</button>
            <a href="${pageContext.request.contextPath}" class="btn btn-dark">뒤로가기</a>
        </div>
        <%-- 카카오 버튼 --%>
        <div class="text-center mt-2">
            <a href="${pageContext.request.contextPath}/oauth2/authorization/kakao"><img
                    src="${pageContext.request.contextPath}/mainImg/kakao_btn.png"></a>
        </div>
    </form>
</div>
<c:if test="${suc ne null}">
    <script>alert('${suc}')</script>
</c:if>
<!-- footer -->
<div>
    <br>
    <br>
    <c:import url="/WEB-INF/resource/inc/footer.jsp"></c:import>
</div>
</body>
</html>


