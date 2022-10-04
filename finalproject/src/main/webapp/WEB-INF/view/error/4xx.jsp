<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<div class="test-center">
    <img src="${pageContext.request.contextPath}/mainImg/403.jpg">
    <h4>죄송합니다</h4>
    <h4>잘못된 요청입니다</h4></div>

status : ${status}
<br/>
error : ${error}
<br/>
stacktrace : ${trace}
</body>
</html>
