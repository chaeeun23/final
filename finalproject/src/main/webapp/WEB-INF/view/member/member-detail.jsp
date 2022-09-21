<
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
<sec:authentication property="principal" var="member"/>
<div class="d-flex justify-content-center container my-2">
    <form action="" method="post" enctype="multipart/form-data" id="member-form"
          class="w-75 border p-3 bg-white shadow rounded align-self-center">
        <h4>기본 회원정보 <span style="color: darkgrey">필수</span></h4>
        <hr style="border: solid 2px black;">

        <input type="hidden" name="member.memberNo" value="${member.memberNo}">
        <div class="mb-3"  >
         <div class="d-flex">
                <div class=" imgBox ">
                    <img style="width: 100px; height: 100px" src="${member.memberImg}"
                         onerror="this.src = '${pageContext.request.contextPath}/memberImg/aa.png'">
                    <div style="font-size: 13px" >
                        회원님을 알릴 수 있는 사진을 등록해주세요.
                        <br>
                        등록된 사진은 회원님의 게시물이나 댓글들에 사용됩니다.
                    </div>
                </div>
         </div>

            <hr/>
        </div>
        <div class="mb-3">
            아이디<input class="form-control" type="text" id="memberId" name="member.memberId" value="${member.memberId}"
                      readonly>
            <hr/>
        </div>
        <div class="mb-3">
            비밀번호
            <input class="form-control" type="text" id="memberPw" name="member.memberPw"
                   value="${member.memberPw}">
            <hr/>
        </div>
        <div class="mb-3">
            이름
            <input class="form-control" type="text" id="memberName" name="member.memberName"
                   value="${member.memberName}">
            <hr/>
        </div>
        <div class="mb-3">
            이메일
            <input class="form-control" type="text" id="memberEmail" name="member.memberEmail"
                   value="${member.memberEmail}">
            <hr/>
            <div class="mb-3">
                휴대전화
                <input class="form-control" type="text" id="memberPhone" name="member.memberPhone"
                       value="${member.memberPhone}">
            </div>


            <div class="mb-3">
                <h4>추가 회원정보<span style="color: darkgrey"> 선택</span></h4>
                <hr style="border: solid 2px black;">


                <div class="mb-3">
                    생년월일
                    <input class="form-control" type="text" id="memberBirth" name="member.memberBirth"
                           value="${member.memberBirth}">
                    <hr/>
                </div>
                <div class="mb-3">
                    성별
                    <input class="form-control" type="text" id="memberGender" name="member.memberGender"
                           value="${member.memberGender}">
                    <hr/>
                </div>
                <div class="mb-3">
                    주소
                    <input class="form-control" type="text" id="memberAddr" name="member.memberAddr"
                           value="${member.memberAddr}">
                    <hr/>
                </div>
                <div class="mb-3">
                    상세주소
                    <input class="form-control" type="text" id="memberDetailAddr" name="member.memberDetailAddr"
                           value="${member.memberDetailAddr}">
                </div>
                <div class="mt-2">
                    <button id="addButton" type="button" class="btn btn-sm btn-secondary mt-2 rounded-0">수정</button>
                    <a class="btn btn-sm btn-secondary mt-2 rounded-0" href="${pageContext.request.contextPath}">뒤로가기</a>
                </div>
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