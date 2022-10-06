<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
<sec:authentication property="principal" var="member" scope="session"/>
<div class="d-flex justify-content-center container my-1">
    <div class="container">
        <div class="row mt-5 justify-content-center">
            <form method="post" action="${pageContext.request.contextPath}/member/out-member"
                  class=" w-100 border p-50 bg-white rounded align-self-center">
                <h4 class="mx-5 mt-5 fw-bold">탈퇴 안내 </h4>
                <p class="mx-5 mt-3 small">회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요</P>

                <p class="mx-5 mt-2 small">사용하고 계신 아이디 <span class="fw-bold text-danger ">
                        <c:if test="${boardDetailDto.boardDto.memberId eq memberDto.memberId}">
                            ${member.memberId}는 본인과 타인 모두 재사용 및 복구가 불가</span>
                    하오니 신중하게 선택하시기 바랍니다 </p>
                        </c:if> </span>


                <hr style="border: solid 1px black ;width: 1170px; margin-left: 50px">
                <div class="p-5 w-60 mb-5 mx-5 bg-opacity-25 bg-light text-dark border border-1">
                    <p class="fw-bolder small">회원탈퇴 전 , 유의사항을 확인해 주시기 바랍니다</p>
                    <p class="small">
                        <span class="fw-bolder small text-danger"> 탈퇴하신 계정의 아이디는 동일한 ID로 가입이 불가능 합니다</span>
                        <br>
                        회원탈퇴 즉시 회원전용 웹서비스의 이용이 불가능합니다
                        <br>
                        회원탈퇴 이후에는 게시물 편집, 삭제가 불가능하므로 , 게시물을 편집하거나 삭제하기 바라시는 경우 게시물 편집/삭제 후
                        회원 탈퇴를 해주시기 바랍니다
                        <br>
                        <br>
                        SNS 계정으로 가입하신 회원님은 관리자에게 문의 바랍니다.
                    </p>

                </div>
                <div>
                    <div><p class="mx-5 mt-10 fw-bold text-center small">보안을 위해 회원님의 이름과 계정 아이디 및 비밀번호를 확인 합니다.</p>
                        <div class="d-flex justify-content-center container my-1">
                            <div class="row">
                                <div class="col-sm-4 ">
                                    <label for="name" class="form-label small">이름</label>
                                    <input type="text" class="form-control" style="width: 250px" id="name"
                                           value="${member.memberName}" readonly>
                                </div>
                                <div class="col-sm-4 ">
                                    <label for="id" class="form-label small">아이디</label>
                                    <input class="form-control" type="text" style="width: 250px" id="id"
                                           value="${member.memberId}" readonly>
                                </div>
                                <div class="col-sm-4">
                                    <label for="pw" class="form-label small ">비밀번호</label>
                                    <input type="password" class="form-control" name="pw" style="width: 250px" id="pw"
                                           placeholder="비밀번호를 입력해주세요">
                                </div>
                            </div>
                        </div>
                    </div>
                    <c:if test="${error ne null}">
                        <div class="alert alert-danger d-flex align-items-center justify-content-center">
                            <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:">
                                <use xlink:href="#exclamation-triangle-fill"/>
                            </svg>
                            <div>${error}</div>
                        </div>
                    </c:if>
                    <div class="mt-4 mb-5 text-center ">
                        <button type="submit" id="outBtn" class="btn btn-sm btn-secondary mt-2 rounded-0">탈퇴하기
                        </button>
                        <a href="${pageContext.request.contextPath}"
                           class="btn btn-sm btn-secondary mt-2 rounded-0">홈으로</a>
                    </div>
                </div>
            </form>
        </div>
        <div>
            <br>
            <br>
            <c:import url="/WEB-INF/resource/inc/footer.jsp"></c:import>
        </div>
    </div>
</div>
<script>
    document.getElementById("outBtn").onclick = function () {
        alert("정말 탈퇴하시겠습니까?");
    };
</script>

</body>
</html>

