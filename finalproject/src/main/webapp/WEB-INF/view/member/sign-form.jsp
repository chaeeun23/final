<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
<div class="d-flex justify-content-center container" style="margin-top: 20px">
    <form method="post" action="${pageContext.request.contextPath}/sign/sign-member" id="sign-form"
          class="w-75 border p-3 bg-white  rounded align-self-center">
        <div class="text-center">
            <h4 class="ms-2 fw-bold">회원가입</h4>
        </div>
        <div class="mb-3">
            <p class="fw-lighter small">아이디<span style="color: red">*</span></p>
            <input class="form-control" type="text" name="memberId" id="id" aria-describedby="invalid-id">
            <div class="mx-1 opacity-50 " style="font-size: 12px">아이디는 8자리 이상으로 입력해주세요</div>
            <div class="valid-feedback">
                중복체크완료!
            </div>
            <div id="invalid-id" class="invalid-feedback">
                중복 확인을 해주세요.
            </div>
            <button id="idCheck" type="button" class="btn btn-sm btn-secondary mt-2 rounded-0">중복확인</button>
        </div>
        <div class="mb-3">
            <p class="fw-lighter small">비밀번호 <span style="color: red">*</span></p>
            <input class="form-control" type="password" name="memberPw" id="pw" aria-describedby="invalid-pw">
            <div class="mx-1 opacity-50 " style="font-size: 12px">비밀번호는 10자이상 20자 이하 영문,특수문자,숫자 조합으로 입력해주세요.</div>
            <div class="valid-feedback">
                사용 가능합니다.
            </div>
            <div id="invalid-pw" class="invalid-feedback">
                비밀번호는 10자이상 20자 이하 영문,특수문자,숫자 조합으로 입력해주세요.
            </div>
        </div>
        <div class="mb-3">
            <p class="fw-lighter small">비밀번호 재확인 <span style="color: red">*</span></p>
            <input class="form-control" type="password" id="checkPw" aria-describedby="invalid-pwCheck">
            <div class="valid-feedback">
                비밀번호가 일치합니다.
            </div>
            <div id="invalid-pwCheck" class="invalid-feedback">
                비밀번호가 일치하지 않습니다.
            </div>
        </div>
        <div class="mb-3">
            <p class="fw-lighter small">이름<span style="color: red">*</span></p>
            <td>
                <input class="form-control valid-check" type="text" name="memberName" id="name"
                       aria-describedby="invalid-nameCheck">
                <div id="invalid-nameCheck" class="invalid-feedback">
                    이름을 입력해주세요
                </div>
            </td>
        </div>
        <div class="mb-3">
            <p class="fw-lighter small">전화번호<span style="color: red">*</span></p>
            <td>
                <input class="form-control valid-check" type="tel" name="memberPhone" id="phone"
                       aria-describedby="invalid-phoneCheck">
                <div id="invalid-phoneCheck" class="invalid-feedback">
                    전화번호를 입력해주세요
                </div>
            </td>
        </div>
        <div class="mb-3">
            <p class="fw-lighter small">이메일<span style="color: red">*</span></p>
            <td>
                <input class="form-control valid-check" type="tel" name="memberEmail" id="email"
                       aria-describedby="invalid-emailCheck" readonly>
                <div class="valid-feedback">
                    인증성공
                </div>
                <button class="btn btn-sm btn-secondary mt-2 rounded-0" type="button" id="emailCheck"
                        data-bs-toggle="modal" data-bs-target="#emailPopup">
                    이메일인증
                </button>
                <div id="invalid-emailCheck" class="invalid-feedback">
                    이메일을 입력해주세요
                </div>
            </td>
        </div>
        <!-- 팝업 -->
        <div class="modal fade" id="emailPopup" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">이메일 인증</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="mb-2">
                            이메일
                            <input id="emailData" class="form-control" type="text"
                                   aria-describedby="invalid-emailCheck2">
                            <button id="emailCheckBtn" type="button" class="mt-2 btn btn-sm btn-secondary rounded-0">인증
                            </button>
                            <div class="valid-feedback">
                                메일이 곧 도착합니다 인증번호를 올바르게 입력해주세요
                            </div>
                            <div id="invalid-emailCheck2" class="invalid-feedback">
                                메일형태가 아니거나 인증에 실패했습니다. 다시 시도해주세요
                            </div>
                        </div>
                        <div>
                            인증번호
                            <input id="emailCheckNum" class="form-control" type="text" aria-describedby="invalid-id"
                                   readonly>
                        </div>
                        <input type="hidden" value="test">
                    </div>
                    <div class="modal-footer">
                        <button id='emailCloseBtn' type="button" class="btn btn-sm btn-secondary rounded-0"
                                data-bs-dismiss="modal">닫기
                        </button>
                        <button id="emailCheckSuc" type="button" class="btn btn-sm btn-primary rounded-0">완료</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="mb-3">
            <p class="fw-lighter small">주소<span style="color: red">*</span></p>
            <input class="form-control" type="text" name="memberAddr" id="addr" readonly="readonly"
                   aria-describedby="invalid-addrCheck">
            <div id="invalid-addrCheck" class="invalid-feedback">
                주소를 입력해주세요
            </div>
            <button class="btn btn-sm btn-secondary mt-2 rounded-0" type="button" id="addrBtn"
                    onclick="sample2_execDaumPostcode()">
                주소검색
            </button>

            <br>
            <br>
            <p class="fw-lighter small" >상세주소</p>
            <input class="form-control" type="text" name="memberDetailAddr" id="subAddr">
        </div>
        <div class="mb-3">
            <p class="fw-lighter small" >생년월일</p>
            <td><input class="form-control" type="tel" name="memberBirth" id="birth"></td>
        </div>
        <div style="margin: 0;">
            <p class="fw-lighter small" >성별체크</p>
            <br>
            <div class="custom-control custom-radio custom-control-inline">
                <input type="radio" class="custom-control-input" id="sex-1" name="memberGender" value="1" checked>
                <label class="custom-control-label" for="sex-1">여자</label>
                <input type="radio" class="custom-control-input" id="sex-2" name="memberGender" value="2">
                <label class="custom-control-label" for="sex-2">남자</label>
            </div>
            <div class="mt-2">
                <input class="btn btn-sm btn-secondary mt-2 rounded-0" id="joinBtn" type="button" value="가입하기">
                <a class="btn btn-sm btn-secondary mt-2 rounded-0" href="${pageContext.request.contextPath}">뒤로가기</a>
            </div>
        </div>
    </form>
</div>
<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
    <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer"
         style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()"
         alt="닫기 버튼">
</div>
<div>
    <br>
    <br>
    <c:import url="/WEB-INF/resource/inc/footer.jsp"></c:import>
</div>
<script>
    let code = '';
    document.querySelector('#emailCheckSuc').addEventListener('click', function (ev) {
        let emailCheckNum = document.querySelector('#emailCheckNum').value;
        if (emailCheckNum.trim() == '') {
            return;
        }
        if (emailCheckNum === code) {
            document.querySelector('#email').value = document.querySelector('#emailData').value;
            document.querySelector('#emailCloseBtn').click();
            document.querySelector('#emailCheck').setAttribute('disabled', 'disabled');
            document.querySelector('#email').className += ' is-valid';
        }
    })


    document.querySelector('#emailCheckBtn').addEventListener('click', function (ev) {
        let email = document.querySelector('#emailData').value;
        let url = '${pageContext.request.contextPath}/sign/email-check?memberEmail=' + email;
        document.querySelector('#emailData').setAttribute('readonly', 'readonly');
        fetch(url, {
            method: 'GET'
        }).then(res => res.text())
            .then(data => {
                if (data != 'fail') {
                    code = data;
                    document.querySelector('#emailData').classList.remove('is-invalid');
                    document.querySelector('#emailData').className += ' is-valid';
                    document.querySelector('#emailCheckNum').removeAttribute('readonly');
                    document.querySelector('#emailCheckBtn').setAttribute('disabled', 'disabled');
                } else {
                    document.querySelector('#emailData').className += ' is-invalid';
                    document.querySelector('#emailData').removeAttribute('readonly');
                }
            })
    })

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
        let check = /^(?=.*[a-zA-Z])(?=.*[.!@#$%^~*+=-])(?=.*[0-9]).{10,19}$/;
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
        if (id.length < 8) {
            alert("아이디는 8자 이상으로 입력해주세요");
            return;
        }
        let url = '${pageContext.request.contextPath}/sign/id-check?memberId=' + id;
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
                document.getElementById('addr').classList.remove('is-invalid');
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