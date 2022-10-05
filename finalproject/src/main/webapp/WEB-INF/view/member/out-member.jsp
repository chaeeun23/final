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
<div class="d-flex justify-content-center container my-1">
    <div class="container">
        <div class="row mt-5 justify-content-center">
            <div class="col-12">
                <h4 class="ms-2 fw-bold">회원탈퇴</h4>
                <form method="post" action="${pageContext.request.contextPath}/member/out-member"
                      class=" w-100 border p-50 bg-white rounded align-self-center">

                    <div class="mt-3">
                        <p class="small"> 회원 탈퇴를 하실 경우 회원님의 모든 정보가 삭제 되니 신중하게 결정하셔서 신청해 주세요.
                            <br>
                            14일 뒤에는 회원탈퇴가 완료되어 해당계정에 대한 모든 정보는 삭제되며 복원이 불가능합니다
                            <br>
                            <span class="fw-bolder"> 탈퇴하신 계정의 아이디는 14일 동안 동일한 ID로 가입이 불가능 합니다</span>
                        <br>
                        회원탈퇴 즉시 회원전용 웹서비스의 이용이 불가능합니다
                        <br>
                        회원탈퇴 이후에는 게시물 편집, 삭제가 불가능하므로 , 게시물을 편집하거나 삭제하기 바라시는 경우 게시물 편집/삭제 후
                        회원 탈퇴를 해주시기 바랍니다
                        </p>

                    </div>
                    <div class="mb-3 mx-2">
                        <label for="email" class="form-label">아이디</label>
                        <input type="text" class="form-control" name="memberId" id="id" placeholder="아이디를 입력해주세요">
                    </div>
                    <div class="mb-3 mx-2">
                        <label for="email" class="form-label">비밀번호</label>
                        <input type="text" class="form-control" name="memberEmail" id="pw"
                               placeholder="비밀번호를 입력해주세요">
                    </div>
                    <div class="mb-3 mx-2">
                        <label for="email" class="form-label">이메일</label>
                        <input type="text" class="form-control" name="memberEmail" id="email"
                               placeholder="메일을 입력해주세요">
                    </div>
                    <c:if test="${error ne null}">
                        <div class="alert alert-danger d-flex align-items-center justify-content-center">
                            <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:">
                                <use xlink:href="#exclamation-triangle-fill"/>
                            </svg>
                            <div>${error}</div>
                        </div>
                    </c:if>
                    <div class="text-center mb-5">
                        <button type="submit" id="boardBtn" class="btn btn-secondary mt-2 rounded-0">회원탈퇴하기</button>
                        <a href="${pageContext.request.contextPath}/member/login-form"
                           class="btn btn-secondary mt-2 rounded-0">뒤로가기</a>
                    </div>
                </form>
            </div>
            <div>
                <br>
                <br>
                <c:import url="/WEB-INF/resource/inc/footer.jsp"></c:import>
            </div>
</body>
</html>

