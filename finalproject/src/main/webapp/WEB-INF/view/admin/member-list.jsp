<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/mainImg/favicon.png">
</head>
<body>
<div>
    <c:import url="/WEB-INF/resource/inc/header.jsp"></c:import>
    <br>
</div>
<div class="container">
    <h4 class="text-center">회원 권한변경</h4>
    <hr>
    <div>
        <table class="table table-striped">
            <thead>
            <tr>
                <th class="col-3">회원아이디</th>
                <th class="col-3">회원이름</th>
                <th class="col-3">생성날짜</th>
                <th class="col-3">권한변경</th>

            </tr>
            </thead>
            <tbody id="box">
            <c:forEach items="${memberList}" var="member">
                <tr>
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
                        <select class="emp-yn">
                            <c:if test="${member.empYn}">
                                <option value="Y" selected="selected">Y</option>
                                <option value="N">N</option>
                            </c:if>
                            <c:if test="${!member.empYn}">
                                <option value="N" selected="selected">N</option>
                                <option value="Y">Y</option>
                            </c:if>
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
    //큰 박스(부모) 걸어주고 다 체인지 이벤트 걸어줌
    document.querySelector("#box").addEventListener('change', function (ev) {
        // 클래스 'emp-yn' 비교해서 가져오기
        if (ev.target.getAttribute('class') == 'emp-yn') {
            let empYn = ev.target.value;
            // 아이디 가져오는 건 부모의 부모의 첫번째 자식 이런식으로 찾아야 함 innerText 이건 안에 있는 텍스트
            let memberId = ev.target.parentElement.parentElement.firstElementChild.innerText;
            // POST 방식일경우 body가 http 메시지에 담길때 json 형태로 담기기 때문에
            // 해당 데이터가 json 형태임을 헤더에 명시해준다
            fetch("${pageContext.request.contextPath}/admin/auth-update", {
                headers: {
                    "Content-Type": "application/json",
                },
                method: "POST",
                body: JSON.stringify({
                    'memberId': memberId,
                    'empYn': empYn
                })
            }).then(response => response.text())
                .then(data => {
                    if(data == 'ok'){
                        alert('관리자 권한 변경 성공')
                    }
                })
        }
    })

</script>
</body>
</html>
