<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
<div class="d-flex justify-content-center container my-2">
    <div class="container ">
        <div class="row mt-4 justify-content-center">
            <h4 class="fw-bolder">강사신청 리스트(권한설정)</h4>
            <div class="mt-4">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th class="col-3">회원아이디</th>
                        <th class="col-3">소개말</th>
                        <th class="col-3">생성날짜</th>
                        <th class="col-3">강사승인여부</th>
                    </tr>
                    </thead>
                    <tbody id="box" class="small">
                    <c:forEach items="${instructorList}" var="instructor">
                        <tr>
                            <th>
                                    ${instructor.memberId}
                            </th>
                            <th>
                                    ${instructor.introduce}
                            </th>
                            <th>
                                    ${instructor.createDate}

                            </th>
                            <th>
                                <select class="inspect-yn">
                                    <c:if test="${instructor.inspectYn eq 'Y'}">
                                        <option value="Y" selected="selected">Y</option>
                                        <option value="N">N</option>
                                    </c:if>
                                    <c:if test="${instructor.inspectYn eq 'N'}">
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
        if (ev.target.getAttribute('class') == 'inspect-yn') {
            let inspectYn = ev.target.value;
            // 아이디 가져오는 건 부모의 부모의 첫번째 자식 이런식으로 찾아야 함 innerText 이건 안에 있는 텍스트
            let memberId = ev.target.parentElement.parentElement.firstElementChild.innerText;
            // POST 방식일경우 body가 http 메시지에 담길때 json 형태로 담기기 때문에
            // 해당 데이터가 json 형태임을 헤더에 명시해준다
            fetch("${pageContext.request.contextPath}/admin/instructor-update", {
                headers: {
                    "Content-Type": "application/json",
                },
                method: "POST",
                body: JSON.stringify({
                    'memberId': memberId,
                    'inspectYn': inspectYn
                })
            }).then(response => response.text())
                .then(data => {
                    if (data == 'ok') {
                        alert('강사여부 수정완료')
                    } else {
                        alert('강사여부 수정실패')
                    }
                    location.reload();
                })
        }
    })

</script>
</body>
</html>
