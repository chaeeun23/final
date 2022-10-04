<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
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
    <div class="container">
        <div class="row mt-5 justify-content-center">
            <form action="${pageContext.request.contextPath}/free-board/insert" method="post" enctype="multipart/form-data" id="free-board"
                  class="w-100 p-3 border">
            <h5 class="text-center fw-bolder">Q&A</h5>
            <p class="fw-bolder mt-3 text-center" style="font-size: 14px;color: #666">궁금한점이 생기셨나요? 무엇이든 물어보세요 빠르고 친절한 답변드리겠습니다.</p>
                <div class="mb-3">
                    <label for="boardTitle" class="form-label">제목</label>
                    <input type="text" class="form-control" id="boardTitle" name="boardTitle">
                </div>
                <div class="mb-3">
                    <label for="boardContent" class="form-label">내용</label>
                    <textarea style="height: 500px" class="form-control" id="boardContent" name="boardContents" rows="5"></textarea>
                </div>
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                    <button class="btn btn-primary my-2" type="button" id="addButton">등록</button>
                </div>
            </form>
        </div>
        <!-- footer -->
        <div>
            <br>
            <br>
            <c:import url="/WEB-INF/resource/inc/footer.jsp"></c:import>
        </div>

        <c:if test="${suc ne null}">
        <script>
            alert('${suc}')
        </script>
        </c:if>
        <script>
            document.querySelector("#addButton").addEventListener('click', function (ev) {
                let boardTitle = document.querySelector("#boardTitle");
                let boardContent = document.querySelector("#boardContent");
                if (boardTitle.value.trim() == '') {
                    alert('제목을 입력해주세요')
                    return;
                }
                if (boardContent.value.trim() == '') {
                    alert('내용을 입력해주세요')
                    return;
                }

                document.querySelector("#free-board").submit();
            })
        </script>
</body>
</html>
