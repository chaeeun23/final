<%@ page import="java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <!-- jQuery library -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <form action="/member/update" method="post" enctype="multipart/form-data" id="member-form">
        기본 회원정보(필수)
        <input type="hidden" name="member.memberNo" value="${member.memberNo}">
        <div class="mb-3">
            <h2 class="form-label">사진</h2>
            <div class="d-flex">
                <c:forEach items="${member.memberImg}" var="file">
                    <div class="imgBox">
                        <img style="width: 150px; height: 150px" src="${file}"
                             onerror="this.src = '/mainImg/aa.png'">
                        회원님을 알릴 수 있는 사진을 등록해주세요.
                        등록된 사진은 회원님의 게시물이나 댓글들에 사용됩니다.
                    </div>
                </c:forEach>
            </div>
            <hr/>
        </div>
        <div class="mb-3">
            <h2 class="form-label">아이디</h2>
            <input class="form-control" type="text" id="memberId" name="member.memberId" value="${member.memberId}">
            <hr/>
        </div>
        <div class="mb-3">
            <h2 class="form-label">비밀번호</h2>
            <input class="form-control" type="text" id="memberPw" name="member.memberPw"
                   value="${member.memberPw}">
            <hr/>
        </div>
        <div class="mb-3">
            <h2 class="form-label">이름</h2>
            <input class="form-control" type="text" id="memberName" name="member.memberName"
                   value="${member.memberName}">
            <hr/>
        </div>
        <div class="mb-3">
            <h2 class="form-label">이메일</h2>
            <input class="form-control" type="text" id="memberEmail" name="member.memberEmail"
                   value="${member.memberEmail}">
            <hr/>
        </div>
        <div class="mb-3">
            <h2 class="form-label">휴대전화</h2>
            <input class="form-control" type="text" id="memberPhone" name="member.memberPhone"
                   value="${member.memberPhone}">
            <hr/>
        </div>

        <div class="mb-3">추가 회원정보(선택)
            <hr style="border: solid 5px black;">

            <div class="mb-3">
                <h2 class="form-label">생년월일</h2>
                <input class="form-control" type="text" id="memberBirth" name="member.memberBirth" value="${member.memberBirth}">
                <hr/>
            </div>
            <div class="mb-3">
                <h2 class="form-label">성별</h2>
                <input class="form-control" type="text" id="memberGender" name="member.memberGender"
                       value="${member.memberGender}">
                <hr/>
            </div>
            <div class="mb-3">
                <h2 class="form-label">주소</h2>
                <input class="form-control" type="text" id="memberAddr" name="member.memberAddr"
                       value="${member.memberAddr}">
                <hr/>
            </div>
            <div class="mb-3">
                <h2 class="form-label">상세주소</h2>
                <input class="form-control" type="text" id="memberDetailAddr" name="member.memberDetailAddr"
                       value="${member.memberDetailAddr}">
                <hr/>
            </div>

        </div>
    </form>
</div>
<script>

    document.querySelector("#removeFile").addEventListener('click', function (ev) {
        document.querySelector("#fileSection").innerHTML = "";
    })

    document.querySelector("#addFile").addEventListener('click', function (ev) {
        let div = document.createElement("div");
        let input = document.createElement("input");
        input.className = "mt-2 form-control multiList";
        input.name = "multiList";
        input.type = "file"
        div.appendChild(input);
        document.querySelector("#fileSection").appendChild(div);
    })

    // 유효성 검사
    document.querySelector("#addButton").addEventListener('click', function (ev) {
        let isFileEmpty = false;
        document.querySelectorAll(".multiList").forEach(ev => {
            if (ev.value == '') {
                isFileEmpty = true;
            }
        })
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
        if (isFileEmpty) {
            alert("파일을 등록해주세요")
            return;
        }
        document.querySelector("#board-form").submit();
    })

    // 삭제 버튼
    document.querySelectorAll(".imgBox").forEach((e) => {
        e.addEventListener('click', function (ev) {
            if (ev.target.className === 'btn-sm btn-primary imgDelBtn') {
                let fileName = ev.target.getAttribute("fileName");
                let url = "/board/img-delete";
                fetch(url, {
                    headers: {
                        "Content-Type": "application/json"
                    },
                    method: "POST",
                    body: JSON.stringify({
                        fileName: fileName
                    })
                }).then(resp => resp.text())
                    .then(data => {
                        console.log(data)
                        if (data == 'ok') {
                            alert('삭제성공')
                            ev.target.parentElement.remove();
                        }
                    })
            }
        });
    })
</script>
</body>

</html>
