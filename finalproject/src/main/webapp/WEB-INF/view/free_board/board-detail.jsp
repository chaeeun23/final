<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <sec:authentication property="principal" var="memberDto"/>
    <c:set value="${pageContext.request.contextPath}" var="contextPath"/>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <script type="text/javascript" src="${contextPath}/js/free-board.js"></script>
</head>
<body>
<div>
    <c:import url="/WEB-INF/resource/inc/header.jsp"></c:import>
</div>
<div class="d-flex justify-content-center container my-2">
    <div class="container">
        <div class="row mt-2 justify-content-center">
            <div style="padding: 20px; font-size: 40px; text-align: center"> Q&A</div>
            <hr style="border: solid 1px #ddd">
            <form action="/board/update" method="post">
                <%--제목--%>
                <div class="fw-bolder fs-4 ">
                    <%--작성한 아이디로 로그인한 상태라면 --%>
                    <sec:authorize access="hasAuthority('USER')">
                        <c:if test="${boardDetailDto.boardDto.memberId eq memberDto.memberId}">
                            <h5 class="fs-6 text-dark">제목</h5>
                            <input type="text" class="form-control" id="subject" name="subject"
                                   value="${boardDetailDto.boardDto.boardTitle}">
                        </c:if>
                    </sec:authorize>
                    <%--작성한 아이디로 로그인한 상태가 아니라면--%>
                    <sec:authorize access="hasAuthority('USER')">
                        <c:if test="${boardDetailDto.boardDto.memberId ne memberDto.memberId}">
                            ${boardDetailDto.boardDto.boardTitle}
                        </c:if>
                    </sec:authorize>
                    <%--비회원--%>
                    <sec:authorize access="isAnonymous()">
                        ${boardDetailDto.boardDto.boardTitle}
                    </sec:authorize>

                </div>
                <hr style="border: solid 1px #ddd">
                <%--작성일자--%>
                <div class="fw-bolder mt-3" style="font-size: 14px;color: #666">
                    <sec:authorize access="hasAuthority('USER')">
                        <c:if test="${boardDetailDto.boardDto.memberId ne memberDto.memberId}">
                            <p>작성자 : ${boardDetailDto.boardDto.memberId} | 작성일자
                                : ${boardDetailDto.boardDto.createDate} </p>
                        </c:if>
                    </sec:authorize>
                    <%--비회원--%>
                    <sec:authorize access="isAnonymous()">
                        <p>작성자 : ${boardDetailDto.boardDto.memberId} | 작성일자
                            : ${boardDetailDto.boardDto.createDate}
                        </p>
                    </sec:authorize>
                </div>
                <hr style="border: solid 1px #ddd">
                <%--내용--%>
                <div class="mb-3 fs-6" style="border-bottom:solid 1px #ddd;padding: 15px 10px;min-height: 300px">
                    <%--작성자로 로그인된 경우--%>
                    <sec:authorize access="hasAuthority('USER')">
                        <c:if test="${boardDetailDto.boardDto.memberId eq memberDto.memberId}">
                            <h5 class="fs-6 text-dark">내용</h5>
                            <textarea class="form-control" name="content" id="content" style="height: 200px"
                                      rows="5">${boardDetailDto.boardDto.boardContents}</textarea>
                        </c:if>
                    </sec:authorize>
                    <%--작성자로 로그인 안된 경우--%>
                    <sec:authorize access="hasAuthority('USER')">
                        <c:if test="${boardDetailDto.boardDto.memberId ne memberDto.memberId}">
                            ${boardDetailDto.boardDto.boardContents}
                        </c:if>
                    </sec:authorize>

                    <%--비회원--%>
                    <sec:authorize access="isAnonymous()">
                        ${boardDetailDto.boardDto.boardContents}
                    </sec:authorize>

                </div>
                <%--수정삭제버튼--%>
                <div>
                    <sec:authorize access="hasAuthority('USER')">
                        <c:if test="${boardDetailDto.boardDto.memberId eq memberDto.memberId}">
                            <input type="submit" class="btn btn-primary" value="수정">
                            <a id="deleteBtn" class="btn btn-primary">삭제</a>
                        </c:if>
                    </sec:authorize>
                </div>
            </form>
        </div>
    </div>
</div>
<div class="container px-3 mt-5">
    <div class="pt-4 border-bottom border-dark">
        <h4 class="fw-bold">댓글</h4>
    </div>
    <%-- 댓글 입력 폼 --%>
    <div class="d-flex align-items-center my-2">
        <div class="flex-grow-1 px-2">
            <sec:authorize access="hasAnyAuthority('USER')">
            <textarea class="form-control" placeholder="댓글을 작성해주세요" name="commentContent" id="commentContent"
                      style="height: 100px; resize: none;"></textarea>
            </sec:authorize>
            <div class="invalid-feedback">
                1자 이상 입력해주세요
            </div>
            <sec:authorize access="isAnonymous()">
                <label for="commentContent">댓글을 작성하려면, 로그인 해주세요</label>
            </sec:authorize>
        </div>
        <sec:authorize access="hasAnyAuthority('USER')">
            <a boardNo="${boardDetailDto.boardDto.boardNo}" memberId="${memberDto.memberId}" id="cmInsertBtn"
               class="btn btn-primary btn-sm">등록</a>
        </sec:authorize>
    </div>
    <%-- 댓글리스트 --%>
    <div id="commentLists" class="container px-5 my-4">
        <c:forEach items="${boardDetailDto.cmList}" var="dto">
            <%-- 댓글 내용 --%>
            <div class="listForm">
                <c:if test="${dto.memberAuth.contains('EMPLOYEE') || dto.memberAuth.contains('ADMIN')}">
                    <h4 class="fw-bolder fs-6" style="color: red">${dto.memberId} (관리자)</h4>
                </c:if>
                <c:if test="${!dto.memberAuth.contains('EMPLOYEE') && !dto.memberAuth.contains('ADMIN')}">
                    <h4 class="fw-bolder fs-6">${dto.memberId}</h4>
                </c:if>
                <div class="lh-sm">${dto.cmContents}</div>
                <div class="d-flex justify-content-end">
                    <div>
                        <sec:authorize access="hasAnyAuthority('USER')">
                            <c:if test="${memberDto.memberId eq dto.memberId}">
                                <a class='cmUpdateBtnForm btn btn-primary btn-sm'>수정</a>
                                <a boardNo="${boardDetailDto.boardDto.boardNo}" commentNo="${dto.cmNo}"
                                   class='cmDelBtn btn btn-primary btn-sm'>삭제</a>
                            </c:if>
                        </sec:authorize>
                    </div>
                </div>
                <div class="d-flex justify-content-end">작성일 : ${dto.createDate}</div>
                <hr/>
            </div>
            <%-- 수정하기 수정 클릭시 요놈 생김 --%>
            <div class="updateForm" style="display: none">
                <div class="flex-grow-1 px-2">
                    <textarea class="cmUpdateContent form-control"
                              style="height: 100px; resize: none;">${dto.cmContents}</textarea>
                    <div class="invalid-feedback">
                        1자 이상 입력해주세요
                    </div>
                </div>
                <div class="d-flex justify-content-end mt-2">
                    <a boardNo="${boardDetailDto.boardDto.boardNo}" commentNo="${dto.cmNo}"
                       class='cmUpdateBtn btn btn-primary btn-sm mx-1'>등록</a>
                    <a class='cmUpdateCancel btn btn-primary btn-sm ms-1'>취소</a>
                </div>
                <hr/>
            </div>
        </c:forEach>
    </div>
    <%-- 페이지네이션 --%>
    <div id="paginationBox">
        <ul class="pagination justify-content-center my-2 mb-2">
            <%-- 이전 --%>
            <c:if test="${boardDetailDto.pageNation.startPage ne 1}">
                <li class="page-item">
                    <a style="cursor: pointer" class="page-link page-info"
                       boardNo="${board.boardNo}"
                       page="${pageNation.startPage-1}">
                        이전 </a>
                </li>
            </c:if>
            <%-- 페이지넘버 --%>
            <c:forEach begin="${boardDetailDto.pageNation.startPage}" end="${boardDetailDto.pageNation.endPage}"
                       varStatus="status">
                <c:if test="${boardDetailDto.pageNation.currentPage eq status.index}">
                    <li class="page-item active">
                        <a class="page-link">${status.index}
                        </a>
                    </li>
                </c:if>
                <c:if test="${boardDetailDto.pageNation.currentPage ne status.index}">
                    <li class="page-item">
                        <a class="page-link page-info"
                           style="cursor: pointer"
                           boardNo="${boardDetailDto.boardDto.boardNo}"
                           page="${status.index}">${status.index}
                        </a>
                    </li>
                </c:if>
            </c:forEach>
            <%-- 다음버튼 --%>
            <c:if test="${boardDetailDto.pageNation.endPage ne boardDetailDto.pageNation.lastPage}">
                <li class="page-item">
                    <a style="cursor: pointer"
                       class="page-link page-info"
                       boardNo="${boardDetailDto.boardDto.boardNo}"
                       page="${boardDetailDto.pageNation.endPage+1}">다음</a>
                </li>
            </c:if>
        </ul>
    </div>
</div>
<!-- footer -->
<div>
    <br>
    <br>
    <c:import url="/WEB-INF/resource/inc/footer.jsp"></c:import>
</div>
</body>
</html>
