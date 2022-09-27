<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Title</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/mainImg/favicon.png">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
</head>
<body>
<sec:authentication property="principal" var="member" scope="session"/>
<div>
    <c:import url="/WEB-INF/resource/inc/header.jsp"></c:import>
    <br>
    <br>
    <br>
</div>
<div class="d-flex justify-content-center container" style="height: 800px">
    <form method="post" action="${pageContext.request.contextPath}/member/instructor-application"
          id="instructor-application"
          class="w-75 border p-3 bg-white shadow rounded align-self-center">
        <div class="text-center">
            <h3>강사신청</h3>
        </div>
        <div class="mb-3">
            아이디
            <input class="form-control" name="memberId" type="text" id="id" value="${member.memberId}" readonly>
        </div>
        <div class="mb-3">
            소개말
            <textarea class="form-control" name="introduce" type="text" name="introduce" id="introduce"></textarea>
        </div>
        <div class="text-center">
            <button type="submit" id="boardBtn" class="btn btn-outline-danger ">신청하기</button>
            <a href="${pageContext.request.contextPath}" class="btn btn-outline-dark">홈으로</a>
        </div>
    </form>
</div>
<!-- footer -->
<div>
    <c:import url="/WEB-INF/resource/inc/footer.jsp"></c:import>
</div>
</body>
</html>
