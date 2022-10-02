<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
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
<div class="container">

    <div class="row mt-5 justify-content-center">
        <form action="${pageContext.request.contextPath}/sleep-member" method="post"
              enctype="multipart/form-data"
              id="member-form"
              class="w-75 p-3">
            <div class="mt-2">
                <h4 class="text-center fw-bold t-10">휴면계정 전환안내</h4>
            </div>
            <div class="border border-2 mt-5 p-3 bg-light">
                <p class="fw-bold  text-center">안녕하세요 <span
                        style="color: cornflowerblue"> ${cookie.username.value}</span>님!</p>
                <p class="fw-bold  text-center">
                    회원님은 로그인 한 지 6개월 이상이 지나 아이디가 휴면 상태로 전환되었습니다.
                </p>
                <p class="small text-center">
                    <span style="color: cornflowerblue"> ${cookie.username.value}</span>로 사회체육센터 전체 서비스를 다시 이용하고 싶은
                    경우에는,
                    <br>
                    아래 로그인을 하여 휴면상태를 해제해주세요
                </p>
                <div class="mb-2">
                    <p class="fw-bold  text-center">아이디</p>
                    <div class="d-flex justify-content-center">
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="memberId" id="id">
                        </div>
                    </div>
                </div>
                <div class="mt-2 text-center">
                    <button type="submit" class="btn btn-sm btn-primary">계정활성화</button>
                    <a class="btn btn-sm btn-primary"
                       href="${pageContext.request.contextPath}">홈으로</a>
                </div>
            </div>
        </form>
    </div>
    <!-- footer -->
    <div>
        <br>
        <br>
        <c:import url="/WEB-INF/resource/inc/footer.jsp"></c:import>
    </div>
    <c:if test="${error ne null}">
    <script>
        alert('${error}')
    </script>
    </c:if>
</body>
</html>


