<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  isErrorPage= "true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<p>500대 에러나면 여기로 와여</p>

status : 500
<br/>
error : ${error}
<br/>
stacktrace : ${exception}
</body>
</html>
