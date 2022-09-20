<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
에러가 있네
<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
<div class="d-flex justify-content-end">
    <a href="${pageContext.request.contextPath}/detail" class="btn btn-primary btn-sm">회원정보</a>&nbsp;
</div>

</body>
</html>
