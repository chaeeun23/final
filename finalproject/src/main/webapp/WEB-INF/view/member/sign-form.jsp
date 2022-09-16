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
        <div class="mb-3">
            아이디 : <input class="form-control" type="text" name="memberId" id="id">
            <button id="idCheck" type="button" class="btn btn-primary mt-2">중복확인</button>
        </div>
        <div class="mb-3">
            비밀번호 : <input class="form-control" type="password" name="memberPw" id="pw">
        </div>
        <div class="mb-3">
            비밀번호 재확인: <input class="form-control" type="password" name="memberPw" id="pw2">
        </div>

        <div class="mb-3">
            <td>이름</td>
            <td><input class="form-control" type="text" name="memberName" id="name"></td>
        </div>
        <div class="mb-3">
            <td>전화번호</td>
            <td><input class="form-control" type="tel" name="memberPhone" id="phone"></td>
        </div>
        <div class="mb-3">
            <td>이메일</td>
            <td><input class="form-control" type="tel" name="memberEmail" id="email"></td>
        </div>
        <div class="mb-3">
            주소 : <input class="form-control" type="text" name="addr" id="addr" readonly="readonly">
            <button class="btn btn-primary mt-2" type="button" id="addrBtn" onclick="sample2_execDaumPostcode()">
                주소검색
            </button>
            <br>
            상세주소 : <input class="form-control" type="text" name="subAddr" id="subAddr">
        </div>
        <div class="mb-3">
            <td>생년월일</td>
            <td><input class="form-control" type="tel" name="memberBirth" id="birth"></td>
        </div>
     <form>
         <fieldset>
             <legend>
                 성별
             </legend>
         </fieldset>
     </form>

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
        let name = document.querySelector('#name').value.trim();
        let phone = document.querySelector('#age').value.trim();
        let email = document.querySelector('#name').value.trim();
        let addr = document.querySelector('#addr').value.trim();
        let birth = document.querySelector('#age').value.trim();
        if (id_tag.value.trim() == '') {
            alert('아이디는 필수 입니다')
            return;
        }
        if (pw == '') {
            alert('비밀번호는 필수 입니다')
            return;
        }
        if (name == '') {
            alert('이름은 필수 입니다')
            return;
        }
        if (phone == '') {
            alert('나이는 필수 입니다')
            return;
        }
        if (email == '') {
            alert('이메일은 필수 입니다')
            return;
        }

        if (addr == '') {
            alert('주소는 필수 입니다')
            return;
        }

        if (birth == '') {
            alert('성별은 필수 입니다')
            return;
        }
        if (!id_tag.hasAttribute('readonly')) {
            alert('중복확인 해주세요')
            return;
        }
        document.querySelector('#sign-form').submit();
    })


    // 우편번호 찾기 화면을 넣을 element
    let element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function sample2_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function (data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                let addr = ''; // 주소 변수
                let extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if (data.userSelectedType === 'R') {
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    // document.getElementById("sample2_extraAddress").value = extraAddr;

                } else {
                    // document.getElementById("sample2_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                // document.getElementById('sample2_postcode').value = data.zonecode;
                // document.getElementById("sample2_address").value = addr;

                // $('#addr').val(data.zonecode + ' ' + addr);
                document.getElementById('addr').value = data.zonecode + ' ' + addr;


                // 커서를 상세주소 필드로 이동한다.
                // document.getElementById("sample2_detailAddress").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width: '100%',
            height: '100%',
            maxSuggestItems: 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition() {
        let width = 650; //우편번호서비스가 들어갈 element의 width
        let height = 450; //우편번호서비스가 들어갈 element의 height
        let borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height) / 2 - borderWidth) + 'px';
    }

</script>
</body>
</html>