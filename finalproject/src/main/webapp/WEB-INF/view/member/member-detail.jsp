<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
<sec:authentication property="principal" var="member"/>
<div class="d-flex justify-content-center container my-2">
    <form action="/update" method="post" enctype="multipart/form-data" id="member-form"
          class="w-75 border p-3 bg-white shadow rounded align-self-center">
        <div class="mt-4">
            <h4>기본 회원정보<span style="color: darkgrey"> 필수</span></h4>
            <hr style="border: solid 2px black;">
            <input type="hidden" name="memberNo" value="${member.memberNo}">
            <div class="mb-4 mx-2">
                프로필 이미지
                <div class="d-flex">
                    <div class="imgBox">
                        <img style=" width: 150px; height: 150px" src="${member.memberImg}"
                             onerror="this.src = '${pageContext.request.contextPath}/memberImg/aa.png'">
                    </div>
                    <div style="font-size: 13px">
                        회원님을 알릴 수 있는 사진을 등록해주세요.
                        </br>
                        등록된 사진은 회원님의 게시물이나 댓글들에 사용됩니다.
                    </div>
                </div>
                <div class="mb-3">
                    아이디<input class="form-control" type="text" id="memberId" name="memberId"
                              value="${member.memberId}"
                              readonly>
                </div>

                <div class="mb-3">
                    이름
                    <input class="form-control valid-check" type="text" id="name" name="memberName"
                           value="${member.memberName}">
                    <div id="invalid-nameCheck" class="invalid-feedback">
                        이름을 입력해주세요
                    </div>

                </div>
                <div class="mb-3">
                    이메일
                    <input class="form-control" type="text" id="memberEmail" name="memberEmail"
                           value="${member.memberEmail}" readonly>
                    <div class="mx-2 opacity-50 " style="font-size: 12px">* 이메일 변경을 원하시면 관리자에게 메일을 보내주세요</div>

                </div>
                <div class="mb-3">
                    전화번호
                    <input class="form-control valid-check" type="tel" id="phone" name="memberPhone"
                           value="${member.memberPhone}" aria-describedby="invalid-phoneCheck">
                    <div id="invalid-phoneCheck" class="invalid-feedback">
                        전화번호를 입력해주세요
                    </div>

                </div>
            </div>
            <div class="mt-5">
                <h4>추가 회원정보<span style="color: darkgrey"> 선택</span></h4>
                <hr style="border: solid 2px black;">

                <div class="mb-3">
                    생년월일
                    <input class="form-control" type="text" id="birth" name="memberBirth"
                           value="${member.memberBirth}">

                </div>
                <div class="mb-3">
                    성별
                    <input type="radio" class="custom-control-input" id="sex-1" name="memberGender" value="1" checked>
                    <label class="custom-control-label" for="sex-1">여자</label>
                    <input type="radio" class="custom-control-input" id="sex-2" name="memberGender" value="2">
                    <label class="custom-control-label" for="sex-2">남자</label>

                </div>
                <div class="mb-3">
                    주소
                    <input class="form-control" type="text" name="memberAddr" id="addr" readonly="readonly"
                           aria-describedby="invalid-addrCheck" value="${member.memberAddr}">
                    <div id="invalid-addrCheck" class="invalid-feedback">
                        주소를 입력해주세요
                    </div>
                    <button class="btn btn-sm btn-secondary mt-2 rounded-0" type="button" id="addrBtn"
                            onclick="sample2_execDaumPostcode()">
                        주소검색
                    </button>
                    <br>
                    상세주소
                    <input class="form-control" type="text" name="memberDetailAddr" id="subAddr"
                           value="${member.memberDetailAddr}">
                </div>
                <button id="addButton" type="button" class="btn btn-sm btn-secondary mt-2 rounded-0">수정하기</button>
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
<script>

    document.querySelector("#removeFile").addEventListener('click', function (ev) {
        document.querySelector("#fileSection").innerHTML = "";
    })

    document.querySelector(".imgBox").addEventListener('click', function (ev) {
        let div = document.createElement("div");
        let input = document.createElement("input");
        input.className = "mt-2 form-control multiList";
        input.name = "multiList";
        input.type = "file"
        div.appendChild(input);
        document.querySelector("#fileSection").appendChild(div);
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

    // 버튼 클릭시
    document.querySelector('#addButton').addEventListener('click', function (ev) {
            let name = document.querySelector('#name');
            let phone = document.querySelector('#phone');
            let addr = document.querySelector('#addr');

            if (!name.classList.contains('is-valid')) {
                name.className += ' is-invalid';
                return;
            }
            if (!phone.classList.contains('is-valid')) {
                phone.className += ' is-invalid';
                return;
            }
            if (!addr.classList.contains('is-valid')) {
                addr.className += ' is-invalid';
                return;
            }

            document.querySelector('#member-form').submit();
        }
    )

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
