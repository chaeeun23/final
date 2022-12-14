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
<div class="d-flex justify-content-center container my-1">
    <div class="container">
        <div class="row mt-5 justify-content-center">
            <div class="col-2">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/member/detail"
                           class="nav-link active text-secondary fw-bolder">내 정보 조회/수정</a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/member/update-pw" class="nav-link active text-secondary fw-bolder">비밀번호
                            변경</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active text-secondary fw-bolder"  href="${pageContext.request.contextPath}/member/out-member">회원탈톼</a>
                    </li>
                </ul>
            </div>
            <div class="col-10">
                <form method="post" action="${pageContext.request.contextPath}/member/update-pw"
                      class=" w-100 border p-50 bg-white rounded align-self-center" id="pw-change-form">
                    <h4 class="mx-5 mt-5 fw-bold">비밀번호 변경 </h4>
                    <hr style="border: solid 1px black ;width: 960px; margin-left: 50px">
                    <div class="p-5 w-60 mb-5 mx-5 bg-opacity-25 bg-light text-dark border border-1">
                        <p class="fw-bold small">현재 비밀번호</p>
                        <input class="form-control" type="password" name="pw" id="curPass"
                               aria-describedby="invalid-pw">
                        <div class="valid-feedback">
                        </div>
                        <div id="invalid-pw2" class="invalid-feedback">
                            현재 비밀번호가 맞지않습니다 다시 확인해주세요
                        </div>
                        <div class="mb-3">
                            <p class="fw-bold small mt-3">새로운 비밀번호 </p>
                            <input class="form-control" type="password" name="changePw" id="pw"
                                   aria-describedby="invalid-pw">
                            <div class=" fw-bolder small text-secondary" style="font-size: 12px">비밀번호는 10자이상 20자 이하 영문,특수문자,숫자 조합으로
                                입력해주세요.
                            </div>
                            <div class="valid-feedback">
                                사용 가능합니다.
                            </div>
                            <div id="invalid-pw" class="invalid-feedback">
                                비밀번호는 10자이상 20자 이하 영문,특수문자,숫자 조합으로 입력해주세요.
                            </div>
                        </div>
                        <div class="mb-3">
                            <p class="fw-bold small">비밀번호 재확인</p>
                            <input class="form-control" type="password" id="checkPw" aria-describedby="invalid-pwCheck">
                            <div class="valid-feedback">
                                비밀번호가 일치합니다.
                            </div>
                            <div id="invalid-pwCheck" class="invalid-feedback">
                                비밀번호가 일치하지 않습니다.
                            </div>
                        </div>
                        <div class="text-center mt-3">
                            <button type="button" id="pwUpdateBtn" class="btn btn-sm btn-secondary mt-2 rounded-0">비밀번호 변경
                            </button>
                            <a href="${pageContext.request.contextPath}/member/login-form"
                               class="btn btn-sm btn-secondary mt-2 rounded-0">홈으로</a>
                        </div>
                    </div>

                </form>
            </div>
        </div>
        <c:if test="${error ne null}">
            <script>
                alert('${error}')
            </script>
        </c:if>
        <!-- footer -->
        <div>
            <br>
            <br>
            <c:import url="/WEB-INF/resource/inc/footer.jsp"></c:import>
        </div>
    </div>
</div>
<script>
    document.querySelector("#pw").addEventListener('keyup', function (ev) {
        let check = /^(?=.*[a-zA-Z])(?=.*[.!@#$%^~*+=-])(?=.*[0-9]).{10,19}$/;
        if (!check.test(this.value)) {
            this.classList.remove("is-valid");
            this.className += ' is-invalid';
        } else {
            this.classList.remove("is-invalid");
            this.className += ' is-valid';
        }
    })

    document.querySelector("#checkPw").addEventListener('keyup', function (ev) {
        let pw = document.querySelector("#pw").value;
        if (pw == this.value) {
            this.classList.remove("is-invalid");
            this.className += ' is-valid';
        } else {
            this.classList.remove("is-valid");
            this.className += ' is-invalid';
        }
    })

    // 회원가입 버튼 클릭시
    document.querySelector('#pwUpdateBtn').addEventListener('click', function (ev) {
        let pw = document.querySelector('#pw');
        let checkPw = document.querySelector("#checkPw");
        if (!pw.classList.contains('is-valid')) {
            pw.className += ' is-invalid';
            return;
        }
        if (!checkPw.classList.contains('is-valid')) {
            checkPw.className += ' is-invalid';
            return;
        }
        document.querySelector('#pw-change-form').submit();
    })
</script>
</body>
</html>
