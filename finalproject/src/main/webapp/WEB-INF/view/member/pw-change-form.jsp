<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<div>
    <c:import url="/WEB-INF/resource/inc/header.jsp"></c:import>
</div>
<div class="d-flex justify-content-center container my-2">
    <div class="container">
        <div class="row mt-5 justify-content-center">
            <div class="col-10">
                <form method="post" action="${pageContext.request.contextPath}/member/update-pw" id="pw-change-form"
                      class=" w-100 border p-3 bg-white  rounded align-self-center">
                    <div class="mt-5 mb-5 text-center">
                        <p class="fw-bolder fs-5">고객님이 비밀번호를 변경한지 3개월이 지났습니다.</p>
                        <p class="fw-bolder fs-5"> 보안을 위하여 비밀번호를 변경해주세요.</p>
                    </div>
                    <div class="mb-3">
                        <p class="fw-bolder  small">현재 비밀번호</p>
                        <input class="form-control" type="password" name="pw" id="curPass"
                               aria-describedby="invalid-pw">
                        <div class="valid-feedback">
                        </div>
                        <div id="invalid-pw2" class="invalid-feedback">
                            현재 비밀번호가 맞지않습니다 다시 확인해주세요
                        </div>
                    </div>
                    <div class="mb-3">
                        <p class="fw-bolder  small">새로운 비밀번호 </p>
                        <input class="form-control" type="password" name="changePw" id="pw"
                               aria-describedby="invalid-pw">
                        <div class="mt-2 ttext-opacity-75" style="font-size: 14px;color: #666">비밀번호는 10자이상 20자 이하 영문,특수문자,숫자 조합으로
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
                        <p class="fw-bolder small">비밀번호 재확인</p>
                        <input class="form-control" type="password" id="checkPw" aria-describedby="invalid-pwCheck">
                        <div class="valid-feedback">
                            비밀번호가 일치합니다.
                        </div>
                        <div id="invalid-pwCheck" class="invalid-feedback">
                            비밀번호가 일치하지 않습니다.
                        </div>
                    </div>
                    <div class="text-center">
                        <button type="button" id="pwUpdateBtn" class="btn btn-secondary mt-2 rounded-0">비밀번호 변경
                        </button>
                        <a href="${pageContext.request.contextPath}"
                           class="btn btn-secondary mt-2 rounded-0">나중에 변경</a>
                        <a href="${pageContext.request.contextPath}/member/pw-change-update" type="submit"
                           class="btn btn-secondary mt-2 rounded-0">계속사용
                        </a>
                    </div>
                </form>
            </div>
        </div>
        <c:if test="${error ne null}">
        <script>
            alert('${error}')
        </script>
        </c:if>
        <div>
            <br>
            <br>
            <c:import url="/WEB-INF/resource/inc/footer.jsp"></c:import>
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
