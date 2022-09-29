<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
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
<sec:authentication property="principal" var="member" scope="session"/>
<div class="d-flex justify-content-center container my-2">
    <div class="container">
        <div class="row mt-5 justify-content-center">
            <div class="col-2">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/member/detail" class="nav-link active text-secondary" >내 정보 조회/수정</a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/member/update-pw" class="nav-link text-secondary" >비밀번호 변경</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-secondary" href="#">회원탈톼</a>
                    </li>
                </ul>
            </div>
            <div class="col-10">
                <form action="${pageContext.request.contextPath}/member/update" method="post"
                      enctype="multipart/form-data"
                      id="member-form"
                      class="w-75 p-1 border ">
                    <p class="fw-bolder">기본정보</p>
                    <hr style="border: solid 2px black;">
                    <input type="hidden" name="memberDto.memberNo" value="${member.memberNo}">
                    <div class="mb-4 mx-2">
                        <p class="fw-lighter small"> 프로필 이미지</p>
                        <div class="d-flex">
                            <div class="upload">
                                <img style=" width: 200px; height: 200px; cursor: pointer; margin-bottom: 20px"
                                     src="${member.memberImg}"
                                     class="rounded-pill"
                                     onerror="this.src = '${pageContext.request.contextPath}/memberImg/aa.png'"
                                     id="profile">
                                <p class="fw-bolder small">
                                    이미지를 클릭해서 회원님을 알릴 수 있는 사진을 등록해주세요.
                                    </br>
                                    등록된 사진은 회원님의 게시물이나 댓글들에 사용됩니다.
                                </p>
                            </div>

                            <input type="file" name="file" class="real-upload" accept="image/*" style="display: none">
                        </div>
                    </div>
                    <div class="mb-3">
                        <p class="fw-lighter small">아이디</p>
                        <input class="form-control" type="text" id="memberDto.memberId" name="memberDto.memberId"
                               value="${member.memberId}"
                               readonly>
                    </div>

                    <div class="mb-3">
                        <p class="fw-lighter small">이름 <span style="color: red">*</span></p>
                        <input class="form-control valid-check" type="text" id="name" name="memberDto.memberName"
                               value="${member.memberName}" aria-describedby="invalid-nameCheck">
                        <div id="invalid-nameCheck" class="invalid-feedback">
                            이름을 입력해주세요
                        </div>
                    </div>
                    <div class="mb-3">
                        <p class="fw-lighter small">이메일</p>
                        <input class="form-control" type="text" id="memberEmail"
                               value="${member.memberEmail}" readonly>
                        <div class="text-muted" style="font-size: 12px">* 이메일 변경을 원하시면 관리자에게 메일을 보내주세요</div>
                    </div>
                    <div class="mb-3">
                        <p class="fw-lighter small">주소</p>
                        <input class="form-control" type="text" id="addr" readonly="readonly"
                               aria-describedby="invalid-addrCheck" value="${member.memberAddr}">
                    </div>
                    <div class="mt-5">
                        <p class="fw-bolder">추가정보<span style="color: darkgrey"> 선택</span></p>
                        <hr style="border: solid 2px black;">
                        <div class="mb-3">
                            <p class="fw-lighter small">전화번호</p>
                            <input class="form-control" type="tel" id="phone" name="memberDto.memberPhone"
                                   value="${member.memberPhone}">
                        </div>
                    </div>
                    <div class="mb-3">
                        <p class="fw-lighter small">생년월일</p>
                        <input class="form-control" type="text" id="birth" name="memberDto.memberBirth"
                               value="${member.memberBirth}">
                    </div>
                    <div class="mb-3">
                        <p class="fw-lighter small">상세주소</p>
                        <input class="form-control" type="text" name="memberDto.memberDetailAddr" id="subaddr"
                               value="${member.memberDetailAddr}">
                    </div>
                    <div class="mt-2">
                        <input id="addButton" type="button" class="btn btn-sm btn-secondary mt-2 rounded-0"
                               value="수정하기">
                        <a class="btn btn-sm btn-secondary mt-2 rounded-0"
                           href="${pageContext.request.contextPath}">홈으로</a>
                        <sec:authorize access="!hasAnyAuthority('INSTRUCTOR','INSPECT')">
                            <a class="btn btn-sm btn-danger mt-2 rounded-0"
                               href="${pageContext.request.contextPath}/member/instructor-application">강사신청</a>
                        </sec:authorize>
                    </div>
                </form>
            </div>
            <!-- footer -->
            <div>
                <br>
                <br>
                <c:import url="/WEB-INF/resource/inc/footer.jsp"></c:import>
            </div>
            <c:if test="${suc ne null}">
            <script>
                alert('${suc}')
            </script>
            </c:if>
            <script>
                const upload = document.querySelector('.upload');
                const realUpload = document.querySelector('.real-upload');
                upload.addEventListener('click', () => realUpload.click());

                realUpload.addEventListener('change', function (ev) {
                    const files = ev.currentTarget.files;
                    const fileArr = Array.prototype.slice.call(files);
                    fileArr.forEach(function (file) {
                        if (!file.type.match("image/.*")) {
                            alert("이미지 확장자만 업로드 가능합니다.");
                            return;
                        }
                        let reader = new FileReader();
                        reader.onload = function (e) {
                            document.querySelector('#profile').src = e.target.result;
                        };
                        reader.readAsDataURL(file);
                    })
                });

                document.querySelectorAll(".valid-check").forEach(e => e.addEventListener('keyup', function (ev) {
                    if (this.classList.contains("valid-check")) {
                        if (this.value.trim() != '') {
                            this.classList.remove("is-invalid");
                            this.className += ' is-valid';
                        } else {
                            this.classList.remove("is-valid");
                        }
                    }
                }))

                // 버튼 클릭시
                document.querySelector('#addButton').addEventListener('click', function (ev) {
                        let name = document.querySelector('#name');

                        if (name.value.trim() == '') {
                            name.className += ' is-invalid';
                        }
                        document.querySelector('#member-form').submit();
                    }
                )
            </script>
</body>

</html>
