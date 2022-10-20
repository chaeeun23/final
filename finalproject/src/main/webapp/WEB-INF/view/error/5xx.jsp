<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<div  style="width: 800px;min-height: 200px;  margin: 10% auto;"  >
    <div style="height: 80px;border: #232323">
        <img src="${pageContext.request.contextPath}/mainImg/logo.png">
        <a href="${pageContext.request.contextPath}" style="font-size: 14px; margin-left: 150px"> 홈으로</a>
        <hr style="border: solid 1px black;">
    </div>
    <div style="padding: 50px 50px 0 100px">

        <h3 class="test-center">죄송합니다.</h3>
        <h4 class="test-center">서버스 이용에 불편을 드려 죄송합니다.</h4>
        <p>
            시스템 에러가 발생하여 페이지를 표시할 수 없습니다.
            <br>
            관리자에게 문의하시거나 잠시 후 다시 시도해주세요.
        </p>

</div>
</div>
</body>
</html>
