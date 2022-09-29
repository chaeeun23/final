<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
<div class="center">

    <div class="d-flex justify-content-center container " style="height: 500px; padding: 100px">
        <form method="post" action="${pageContext.request.contextPath}/member/find-pw"
              class=" w-75 border p-3 bg-white  rounded align-self-center">
            <div class="d-inline-flex">
                <h4 class="ms-2 fw-bold">비밀번호 변경하기</h4>
            </div>
            <div class="mb-3">
                <p class="fw-lighter small">현재 비밀번호</p>
                <input class="form-control" type="password" name="memberPw" id="pw" aria-describedby="invalid-pw">
                <div class="valid-feedback">
                </div>
                <div id="invalid-pw2" class="invalid-feedback">
                    현재 비밀번호가 맞지않습니다 다시 확인해주세요
                </div>
            </div>
            <div class="mb-3">
                <p class="fw-lighter small">새로운 비밀번호 </p>
                <input class="form-control" type="password" name="memberPw" id="updatePw" aria-describedby="invalid-pw">
                <div class="mx-1 opacity-50 " style="font-size: 12px">비밀번호는 10자이상 20자 이하 영문,특수문자,숫자 조합으로 입력해주세요.</div>
                <div class="valid-feedback">
                    사용 가능합니다.
                </div>
                <div id="invalid-pw" class="invalid-feedback">
                    비밀번호는 10자이상 20자 이하 영문,특수문자,숫자 조합으로 입력해주세요.
                </div>
            </div>
            <div class="mb-3">
                <p class="fw-lighter small">비밀번호 재확인</p>
                <input class="form-control" type="password" id="checkPw" aria-describedby="invalid-pwCheck">
                <div class="valid-feedback">
                    비밀번호가 일치합니다.
                </div>
                <div id="invalid-pwCheck" class="invalid-feedback">
                    비밀번호가 일치하지 않습니다.
                </div>
            </div>
            <div class="text-center">
                <button type="submit" id="boardBtn" class="btn btn-secondary mt-2 rounded-0">비밀번호 변경</button>
                <a href="${pageContext.request.contextPath}/member/login-form"
                   class="btn btn-secondary mt-2 rounded-0">홈으로</a>
            </div>
        </form>
    </div>
</div>
<!-- footer -->
<div>
    <br>
    <br>
    <c:import url="/WEB-INF/resource/inc/footer.jsp"></c:import>
</div>

</body>
</html>
