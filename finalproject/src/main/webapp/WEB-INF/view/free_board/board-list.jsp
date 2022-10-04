<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <c:set value="${pageContext.request.contextPath}" var="contextPath"/>
</head>
<body>
<div>
    <c:import url="/WEB-INF/resource/inc/header.jsp"></c:import>
</div>
<div class="d-flex justify-content-center container my-2">
    <div class="container ">
        <div class="row mt-5 justify-content-center">
            <h4 class="fw-bolder">Q&A 게시판</h4>
            <div>
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th class="col-1">번호</th>
                        <th class="col-1">제목</th>
                        <th class="col-2">작성자</th>
                        <th class="col-1">작성일</th>
                        <th class="col-1">조회수</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${pageBoardDto.boardList}" var="board">
                        <tr style="cursor: pointer"
                            onclick="location.href='${contextPath}/free-board/detail?boardNo=${board.boardNo}'">
                            <th>
                                    ${board.boardNo}
                            </th>
                            <th>
                                    ${board.boardTitle}
                            </th>

                            <th>
                                    ${board.memberId}
                            </th>

                            <th>
                                    ${board.createDate}
                            </th>
                            <th>
                                    ${board.boardRead}
                            </th>
                        </tr>
                    </c:forEach>
                    <div class="d-flex flex-row-reverse">
                        <sec:authorize access="hasAuthority('USER')">
                            <a href="${pageContext.request.contextPath}/free-board/insert-form"
                               class="btn btn-primary">글입력</a>
                        </sec:authorize>
                    </div>
                    </tbody>
                </table>
            </div>
            <%-- 페이지네이션 --%>
            <c:set value="${pageBoardDto.pageNation}" var="pageNation"/>
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
            <br>
            <br>
            <c:import url="/WEB-INF/resource/inc/footer.jsp"></c:import>
        </div>
    </div>
</div>
${suc}
</body>
</html>
