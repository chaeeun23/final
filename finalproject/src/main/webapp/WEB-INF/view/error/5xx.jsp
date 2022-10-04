<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<div class="text-center">
    <h4 >죄송합니다</h4>
    <h4>잘못된 요청입니다</h4>
</div>

status : 500
<br/>
error : ${error}
<br/>
stacktrace : ${exception}
</body>
</html>
