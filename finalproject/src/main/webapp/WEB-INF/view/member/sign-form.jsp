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
<div class="d-flex justify-content-center container mt-2">
    <form method="post" action="/sign/sign-member" id="sign-form"
          class="w-75 border p-3 bg-white shadow rounded align-self-center">
        <div class="text-center">
            <h1>회원가입</h1>
        </div>
        <div class="mb-3">
            아이디 <span style="color: red">*</span>
            <input class="form-control" type="text" name="memberId" id="id" aria-describedby="invalid-id">
            <div class="valid-feedback">
                중복체크완료!
            </div>
            <div id="invalid-id" class="invalid-feedback">
                중복 확인을 해주세요.
            </div>
            <button id="idCheck" type="button" class="btn btn-secondary mt-2 rounded-0">중복확인</button>
        </div>
        <div class="mb-3">
            비밀번호 <span style="color: red">*</span>
            <input class="form-control" type="password" name="memberPw" id="pw" aria-describedby="invalid-pw">
            <div class="valid-feedback">
                사용 가능합니다.
            </div>
            <div id="invalid-pw" class="invalid-feedback">
                비밀번호는 10자이상 20자 이하 영문,특수문자,숫자 조합으로 입력해주세요.
            </div>
        </div>
        <div class="mb-3">
            비밀번호 재확인 <span style="color: red">*</span>
            <input class="form-control" type="password" id="checkPw" aria-describedby="invalid-pwCheck">
            <div class="valid-feedback">
                비밀번호가 일치합니다.
            </div>
            <div id="invalid-pwCheck" class="invalid-feedback">
                비밀번호가 일치하지 않습니다.
            </div>
        </div>
        <div class="mb-3">
            <td>이름<span style="color: red">*</span></td>
            <td>
                <input class="form-control valid-check" type="text" name="memberName" id="name" aria-describedby="invalid-nameCheck">
                <div  id="invalid-nameCheck" class="invalid-feedback">
                 이름을 입력해주세요
                </div>
            </td>
        </div>
        <div class="mb-3">
            <td>전화번호<span style="color: red">*</span></td>
            <td>
                <input class="form-control valid-check" type="tel" name="memberPhone" id="phone"  aria-describedby="invalid-phoneCheck">
                <div id="invalid-phoneCheck" class="invalid-feedback">
                    전화번호를 입력해주세요
                </div>
            </td>
        </div>
        <div class="mb-3">
            <td>이메일<span style="color: red">*</span></td>
            <td>
                <input class="form-control valid-check" type="tel" name="memberEmail" id="email" aria-describedby="invalid-emailCheck">
                <div id="invalid-emailCheck" class="invalid-feedback">
                    이메일을 입력해주세요
                </div>
            </td>
        </div>
        <div class="mb-3">
            주소<span style="color: red">*</span>
            <input class="form-control" type="text" name="memberAddr" id="addr" readonly="readonly" aria-describedby="invalid-addrCheck">
            <div id="invalid-addrCheck" class="invalid-feedback">
                주소를 입력해주세요
            </div>
            <button class="btn btn-secondary mt-2 rounded-0" type="button" id="addrBtn"
                    onclick="sample2_execDaumPostcode()">
                주소검색
            </button>
            <br>
            상세주소
            <input class="form-control" type="text" name="memberDetailAddr" id="subAddr">
        </div>
        <div class="mb-3">
            <td>생년월일</td>
            <td><input class="form-control" type="tel" name="memberBirth" id="birth"></td>
        </div>
        <div class="mt-2">
            <input class="btn btn-secondary mt-2 rounded-0" id="joinBtn" type="button" value="가입하기">
            <a class="btn btn-secondary mt-2 rounded-0" href="/">뒤로가기</a>
        </div>
    </form>
</div>
<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
    <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer"
         style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()"
         alt="닫기 버튼">
</div>
<script>
    function addrChange() {
        console.log("안녕")
    }

    document.querySelectorAll(".valid-check").forEach(e => e.addEventListener('keyup', function (ev) {
        if (this.classList.contains("valid-check")) {
            if (this.value.trim() != '') {
                this.classList.remove("is-invalid");
                this.className += ' is-valid';
            } else {
                this.classList.remove("is-valid");
            }
        }
    }))

    document.querySelector("#pw").addEventListener('keyup', function (ev) {
        let check = /^(?=.*[a-zA-Z])(?=.*[!@#$%^~*+=-])(?=.*[0-9]).{10,19}$/;
        if (!check.test(this.value)) {
            this.classList.remove("is-valid");
            this.className += ' is-invalid';
        } else {
            this.classList.remove("is-invalid");
            this.className += ' is-valid';
        }
    })

    document.querySelector("#checkPw").addEventListener('keyup', function (ev) {
        let pw = document.querySelector("#pw").value;
        if (pw == this.value) {
            this.classList.remove("is-invalid");
            this.className += ' is-valid';
        } else {
            this.classList.remove("is-valid");
            this.className += ' is-invalid';
        }
    })
    // 아이디 중복체크
    document.querySelector('#idCheck').addEventListener('click', function (ev) {
        let id = document.querySelector('#id').value.trim();
        if (id == '') {
            alert("아이디를 입력해주세요");
            return
        }
        let url = '/sign/id-check?id=' + id;
        fetch(url, {
            method: 'GET'
        }).then(res => res.text())
            .then(data => {
                if (data == 'ok') {
                    document.querySelector('#id').setAttribute('readonly', 'readonly');
                    document.querySelector('#id').classList.remove('is-invalid');
                    document.querySelector('#id').className += ' is-valid';
                } else {
                    alert('이미 존재하는 아이디입니다 다시 시도해주세요')
                }
            })
    })
    // 회원가입 버튼 클릭시
    document.querySelector('#joinBtn').addEventListener('click', function (ev) {
        let id_tag = document.querySelector('#id');
        let pw = document.querySelector('#pw');
        let name = document.querySelector('#name');
        let phone = document.querySelector('#phone');
        let email = document.querySelector('#email');
        let addr = document.querySelector('#addr');
        let birth = document.querySelector('#birth');
        let checkPw = document.querySelector("#checkPw");

        if (!id_tag.hasAttribute('readonly')) {
            id_tag.className += ' is-invalid';
            return;
        }

        if (!pw.classList.contains('is-valid')) {
            pw.className += ' is-invalid';
            return;
        }
        if (!checkPw.classList.contains('is-valid')) {
            checkPw.className += ' is-invalid';
            return;
        }

        if (!name.classList.contains('is-valid')) {
            name.className += ' is-invalid';
            return;
        }
        if (!phone.classList.contains('is-valid')) {
            phone.className += ' is-invalid';
            return;
        }
        if (!email.classList.contains('is-valid')) {
            email.className += ' is-invalid';
            return;
        }

        if (!addr.classList.contains('is-valid')) {
            addr.className += ' is-invalid';
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
                document.getElementById('addr').className += ' is-valid'

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