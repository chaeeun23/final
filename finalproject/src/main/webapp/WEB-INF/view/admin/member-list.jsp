<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/mainImg/favicon.png">
</head>
<body>
<div
<c:import url="/WEB-INF/resource/inc/header.jsp"></c:import>
<br>
<br>
<br>
</div>
<div class="container">
    <h4>회원 권한변경</h4>
    <hr>
    <div >
        <table class="table table-striped">
            <thead>
            <tr>
                <th class="col-3">회원아이디</th>
                <th class="col-3">회원이름</th>
                <th class="col-3">생성날짜</th>
                <th class="col-3">권한변경</th>

            </tr>
            </thead>
            <tbody>
            <c:forEach items="${memberList}" var="member">
                <th>
                        ${member.memberId}
                </th>
                <th>
                        ${member.memberName}
                </th>
                <th>
                        ${member.createDate}
                </th>

                <th>
                    <select  id="selectbox" name="selectbox" >
                        <option selected="selected">N</option>
                        <option>Y</option>
                        
                </select>
                </th>

                <td>

                </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<%-- 페이지네이션 --%>
<ul class="pagination justify-content-center my-2 mb-2">
    <%-- 이전 --%>
    <c:if test="${pageNation.startPage ne 1}">
        <li class="page-item">
            <a class="page-link"
               href="${pageNation.path}?current=${pageNation.startPage-1}">
                이전 </a>
        </li>
    </c:if>
    <%-- 페이지넘버 --%>
    <c:forEach begin="${pageNation.startPage}" end="${pageNation.endPage}" varStatus="status">
        <c:if test="${pageNation.currentPage eq status.index}">
            <li class="page-item active">
                <a class="page-link">${status.index}
                </a>
            </li>
        </c:if>
        <c:if test="${pageNation.currentPage ne status.index}">
            <li class="page-item">
                <a class="page-link"
                   href="${pageNation.path}?current=${status.index}">${status.index}
                </a>
            </li>
        </c:if>
    </c:forEach>
    <%-- 다음버튼 --%>
    <c:if test="${pageNation.endPage ne pageNation.lastPage}">
        <li class="page-item">
            <a class="page-link"
               href="${pageNation.path}?current=${pageNation.endPage+1}">다음</a>
        </li>
    </c:if>
</ul>
</div>
<!-- footer -->
<div>
    <c:import url="/WEB-INF/resource/inc/footer.jsp"></c:import>
</div>

<script>
    let active = document.querySelectorAll('.active-value');
    active.forEach(function (element) {
        element.addEventListener('change', function (e) {
            fetch(url, {
                method: "GET",
            })
                .then((response) => response.text())
                .then((data) => {
                    if (data.trim() == 'ok') {
                        alert('변경성공')
                    } else {
                        alert('변경실패')
                    }
                })
        })
    })
</script>
</body>
</html>
