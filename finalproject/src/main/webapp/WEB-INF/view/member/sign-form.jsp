<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script defer src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script defer src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="container px-4 px-lg-5 mt-5">
    <h1>회원가입 폼</h1>
    <form method="post" action="/sign/sign-member" id="sign-form">
        <div>
            아이디 : <input class="form-control" type="text" name="memberId" id="id">
            <button id="idCheck" type="button" class="btn btn-primary mt-2">중복확인</button>
        </div>
        <div>
            비밀번호 : <input class="form-control" type="password" name="memberPw" id="pw">
        </div>
        <div class="mt-2">
            <input class="btn btn-primary" id="joinBtn" type="button" value="가입하기">
            <a class="btn btn-primary" href="/">뒤로가기</a>
        </div>
    </form>
</div>
<script>
    // 아이디 중복체크
    document.querySelector('#idCheck').addEventListener('click', function (ev) {
        let id = document.querySelector('#id').value;
        let url = '/sign/id-check?id=' + id;
        fetch(url, {
            method: 'GET'
        }).then(res => res.text())
            .then(data => {
                console.log(data)
                if (data == 'ok') {
                    alert('사용 가능합니다.');
                    document.querySelector('#id').setAttribute('readonly', 'readonly');
                } else {
                    alert('이미 존재하는 아이디입니다 다시 시도해주세요')
                }
            })
    })
    // 회원가입 버튼 클릭시
    document.querySelector('#joinBtn').addEventListener('click', function (ev) {
        let id_tag = document.querySelector('#id');
        let pw = document.querySelector('#pw').value;
        if (id_tag.value.trim() == '') {
            alert('아이디는 필수 입니다')
            return;
        }
        if (pw == '') {
            alert('비밀번호는 필수 입니다')
            return;
        }
        if (!id_tag.hasAttribute('readonly')) {
            alert('중복확인 해주세요')
            return;
        }
        document.querySelector('#sign-form').submit();
    })
</script>
</body>
</html>