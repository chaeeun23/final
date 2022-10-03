// 댓글 수정창
$(document).on('click', '.cmUpdateBtnForm', function () {
    $(this).parents('.listForm').css('display', 'none');
    $(this).parents('.listForm').next().css('display', '');
})
$(document).on('click', '.cmUpdateCancel', function () {
    $(this).parents('.updateForm').css('display', 'none');
    $(this).parents('.updateForm').prev().css('display', '');
})
/* 댓글 페이지네이션 클릭시 ajax */
$(document).on('click', '.page-info', function () {
    let page = $(this).attr('page');
    let boardNo = $(this).attr('boardNo');
    let url = "/finalproject/cm/list?current=" + page + "&boardNo=" + boardNo;
    $.ajax({
        type: "GET",
        url: url,
        dataType: 'JSON',
        success: function (data) { //성공시
            commentList(data);
        },
        error: function (e) { //실패시
            console.log(e);
        }
    });
})

/* 댓글 삭제 ajax */
$(document).on('click', '.cmDelBtn', function () {
    let cmNo = $(this).attr('commentNo');
    let boardNo = $(this).attr('boardNo');
    let current = $(this).attr('current');
    $.ajax({
        type: "POST",//방식
        url: "/finalproject/cm/delete",//주소
        headers: {'Content-Type': 'application/json'},
        data: JSON.stringify({
            cmNo: cmNo,
            boardNo: boardNo,
            current: current
        }),
        success: function (data) { //성공시
            alert('삭제성공')
            commentList(data);
        },
        error: function (e) { //실패시
            console.log(e);
        }
    });
})

/* 댓글 등록 ajax */
$(document).on('click', '#cmInsertBtn', function () {
    // 여기에 받을 변수 써주세용
    let cmContents = $('#commentContent').val();
    let memberId = this.getAttribute('memberId');
    let boardNo = this.getAttribute('boardNo');
    if (cmContents.trim() != "") {
        $('#commentContent').removeClass('is-invalid');
        $.ajax({
            type: "POST",//방식
            url: "/finalproject/cm/insert",//주소
            headers: {'Content-Type': 'application/json'},
            data: JSON.stringify({
                cmContents: cmContents,
                memberId: memberId,
                boardNo: boardNo
            }),
            success: function (map) { //성공시
                commentList(map);
                $('#commentContent').val("");
            },
            error: function (e) { //실패시
                console.log(e);
            }
        });
    } else {
        $('#commentContent').addClass('is-invalid');
    }
})

/* 댓글 업데이트 ajax */
$(document).on('click', '.cmUpdateBtn', function () {
    let cmNo = $(this).attr('commentNo');
    let boardNo = $(this).attr('boardNo');
    let current = $(this).attr('current');
    let cmContents = $(this).parent().prev().children('.cmUpdateContent').val();
    if (cmContents.trim() != "") {
        $.ajax({
            type: "POST",//방식
            url: "/finalproject/cm/update",//주소
            headers: {'Content-Type': 'application/json'},
            data: JSON.stringify({
                cmNo: cmNo,
                boardNo: boardNo,
                cmContents: cmContents,
                current: current
            }),
            success: function (data) { //성공시
                commentList(data);
            },
            error: function (e) { //실패시
                console.log(e);
            }
        });
    } else {
        $(this).parent().prev().children('.cmUpdateContent').addClass('is-invalid');
    }
})

/* 댓글 리스트 메서드 */
function commentList(result) {
    let content = '';
    let sessionId = result.memberId;
    /*댓글리스트 불러오기*/
    $.each(result.cmList, function (i, dto) {
        content += '<div class="listForm">'
        if (dto.memberAuth.includes('ADMIN') || dto.memberAuth.includes('EMPLOYEE')) {
            content += '<h4 class="fw-bolder fs-5" style="color: red">' + dto.memberId + ' (관리자)</h4>'
        } else {
            content += '<h4 class="fw-bolder fs-5">' + dto.memberId + '</h4>'
        }
        content += '<div class="lh-sm">' + dto.cmContents + '</div>'
        content += '<div class="d-flex justify-content-end">'
        content += '<div>'
        if (sessionId != null) {
            if (sessionId == dto.memberId) {
                content += '<a class="cmUpdateBtnForm btn btn-primary btn-sm mx-1">수정</a>'
                content += '<a boardNo ="' + dto.boardNo + '" current="' + result.pageNation.currentPage + '" commentNo="' + dto.cmNo + '" class="cmDelBtn btn btn-primary btn-sm ms-1">삭제</a>'
            }
        }
        content += '</div>'
        content += '</div>'
        content += '<div class="d-flex justify-content-end">'
        content += '작성일 : ' + dto.createDate
        content += '</div>'
        content += '<hr/>'
        content += '</div>'
        content += '<div class="updateForm" style="display: none">'
        content += '<div class="flex-grow-1 px-2">'
        content += '<textarea class="cmUpdateContent form-control" style="height: 100px; resize: none;">' + dto.cmContents + '</textarea>'
        content += '<div class="invalid-feedback">1자 이상 입력해주세요</div>'
        content += '</div>'
        content += '<div class="d-flex justify-content-end mt-2">'
        content += '<a current="' + result.pageNation.currentPage + '" boardNo="' + dto.boardNo + '" commentNo="' + dto.cmNo + '" class="cmUpdateBtn btn btn-primary btn-sm mx-1">등록</a>'
        content += '<a class="cmUpdateCancel btn btn-primary btn-sm ms-1">취소</a>'
        content += '</div>'
        content += '<hr/>'
        content += '</div>'
    })
    $('#commentLists').empty();
    $('#commentLists').append(content);

    /* 페이지네이션 불러오기 욕나오네 */
    content = '';
    content += '<ul class="pagination justify-content-center my-2 mb-2">'
    if (result.pageNation.startPage != 1) {
        content += '<li class="page-item">'
        content += '<a class="page-link page-info" boardNo="' + result.boardNo + '" page="' + (result.pageNation.startPage - 1) + '" style="cursor:pointer;">'
        content += '이전'
        content += '</a>'
        content += '</li>'
    }
    for (let i = result.pageNation.startPage; i <= result.pageNation.endPage; i++) {
        if (result.pageNation.currentPage != i) {
            content += '<li class="page-item"><a style="cursor:pointer;" boardNo="' + result.boardNo + '" class="page-link page-info" page="' + i + '" >' + i + '</a></li>'
        } else {
            content += '<li class="page-item active"><a class="page-link">' + i + '</a></li>'
        }
    }
    if (result.pageNation.endPage != result.pageNation.lastPage) {
        content += '<li class="page-item">'
        content += '<a class="page-link page-info" boardNo="' + result.boardNo + '" page="' + (result.pageNation.endPage + 1) + '" aria-label="Next" style="cursor:pointer;">'
        content += '다음'
        content += '</a>'
        content += '</li>'
    }
    content += '</ul>'
    $('#paginationBox').empty();
    $('#paginationBox').append(content);
}








