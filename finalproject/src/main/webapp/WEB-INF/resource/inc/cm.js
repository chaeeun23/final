
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
    let url = "/board/cmList?current=" + page + "&boardNo=" + boardNo;
    console.log(url)
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
$(document).on('click', '.reviewDelBtn', function () {
    let reviewNo = $(this).attr('reviewNo');
    let lectureNo = $(this).attr('lectureNo');
    let current = $(this).attr('current');
    $.ajax({
        type: "POST",//방식
        url: "/board/cmDelete",//주소
        data: {
            reviewNo: reviewNo,
            lectureNo: lectureNo,
            current: current
        },
        dataType: 'JSON',
        success: function (data) { //성공시
            alert('삭제성공')
            reviewList(data);
        },
        error: function (e) { //실패시
            console.log(e);
        }
    });
})

/* 댓글 등록 ajax */
$('#cmInsertBtn').on('click', function () {
    // 여기에 받을 변수 써주세용
    let commentContent = $('#commentContent').val();
    let memberId = this.getAttribute('memberId')
    let boardNo = this.getAttribute('boardNo');
    if (commentContent.trim() != "") {
        $('#commentContent').removeClass('is-invalid');
        $.ajax({
            type: "POST",//방식
            url: "/board/cmInsert",//주소
            data: {
                commentContent: commentContent,
                memberId: memberId,
                boardNo: boardNo
            },
            dataType: 'JSON',
            success: function (map) { //성공시
                console.log(map)
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

/* 리뷰 리스트 메서드 */
function reviewList(map) {
    let content = '';
    let sessionId = map.reviewWriter;
    /* 리뷰 리스트 불러오기*/
    $.each(map.getReviewList, function (i, dto) {
        content += '<div class="listForm">'
        content += '<h4 class="fw-bold fs-5">' + dto.reviewWriter + '</h4>'
        content += '<div class="lh-sm">' + dto.reviewContent + '</div>'
        content += '<div class="d-flex justify-content-end">'
        content += '<div>'
        if (sessionId != null) {
            if (sessionId == dto.reviewWriter) {
                content += '<a class="reviewUpdateBtnForm btn btn-primary btn-sm mx-1">수정</a>'
                content += '<a lectureNo ="' + dto.lectureNo + '" current="' + map.pageNation.currentPage + '" reviewNo="' + dto.reviewNo + '" class="reviewDelBtn btn btn-primary btn-sm ms-1">삭제</a>'
            }
        }
        content += '</div>'
        content += '</div>'
        content += '<div class="d-flex justify-content-end">'
        content += '작성일 :' + dto.createDate
        content += '</div>'
        content += '<hr/>'
        content += '</div>'
        content += '<div class="updateForm" style="display: none">'
        content += '<div class="form-floating flex-grow-1 px-2">'
        content += '<textarea class="reviewUpdateContent form-control" style="height: 100px; resize: none;">' + dto.reviewContent + '</textarea>'
        content += '<div class="invalid-feedback">1자 이상 입력해주세요</div>'
        content += '</div>'
        content += '<div class="d-flex justify-content-end mt-2">'
        content += '<a current="' + map.pageNation.currentPage + '" lectureNo="' + dto.lectureNo + '" reviewNo="' + dto.reviewNo + '" class="reviewUpdateBtn btn btn-primary btn-sm mx-1">등록</a>'
        content += '<a class="reviewUpdateCancel btn btn-primary btn-sm ms-1">취소</a>'
        content += '</div>'
        content += '<hr/>'
        content += '</div>'
    })
    $('#reviewLists').empty();
    $('#reviewLists').append(content);

    /* 페이지네이션 */
    content = '';
    content += '<ul class="pagination justify-content-center my-2 mb-2">'
    if (map.pageNation.startPage != 1) {
        content += '<li class="page-item">'
        content += '<a class="page-link page-info" lectureNo="' + map.lectureNo + '" page="' + (map.pageNation.startPage - 1) + '" style="cursor:pointer;">'
        content += '이전'
        content += '</a>'
        content += '</li>'
    }
    for (let i = map.pageNation.startPage; i <= map.pageNation.endPage; i++) {
        if (map.pageNation.currentPage != i) {
            content += '<li class="page-item"><a style="cursor:pointer;" lectureNo="' + map.lectureNo + '" class="page-link page-info" page="' + i + '" >' + i + '</a></li>'
        } else {
            content += '<li class="page-item active"><a class="page-link">' + i + '</a></li>'
        }
    }
    if (map.pageNation.endPage != map.pageNation.lastPage) {
        content += '<li class="page-item">'
        content += '<a class="page-link page-info" lectureNo="' + map.lectureNo + '" page="' + (map.pageNation.endPage + 1) + '" aria-label="Next" style="cursor:pointer;">'
        content += '다음'
        content += '</a>'
        content += '</li>'
    }
    content += '</ul>'
    $('#paginationBox').empty();
    $('#paginationBox').append(content);
}

/* 댓글 업데이트 ajax */
$(document).on('click', '.cmUpdateBtn', function () {
    let commentNo = $(this).attr('commentNo');
    let boardNo = $(this).attr('boardNo');
    let current = $(this).attr('current');
    let cmUpdateContent = $(this).parent().prev().children('.cmUpdateContent').val();
    if (cmUpdateContent.trim() != "") {
        $.ajax({
            type: "POST",//방식
            url: "/board/cmUpdate",//주소
            data: {
                commentNo: commentNo,
                boardNo: boardNo,
                cmUpdateContent: cmUpdateContent,
                current: current
            },
            dataType: 'JSON',
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








