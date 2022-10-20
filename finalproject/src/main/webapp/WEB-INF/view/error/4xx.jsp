<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<div  style="width: 560px;min-height: 200px;  margin: 10% auto;"  >
<div style="height: 80px;border: #232323">
        <img src="${pageContext.request.contextPath}/mainImg/logo.png">
    <a href="${pageContext.request.contextPath}" style="font-size: 14px; margin-left: 150px"> 홈으로</a>
    <hr style="border: solid 1px black;">
</div>
    <div style="padding: 33px 20px 0 81px">

        <h4 class="test-center">죄송합니다</h4>
        <h4 class="test-center">요청하신 페이지를 찾을 수 없습니다</h4>

        <p>
            방문하시려는 페이지의 주소가 잘못 입력되었거나,
            <br>
            페이지의 주소가 변경 혹은 삭제되어 요청하신 페이지를 찾을 수 없습니다.
            <br>
            <br>
            입력하신 주소가 정확한지 다시 한번 확인해 주시기 바랍니다.
        </p>


    </div>
</div>


</body>
</html>
