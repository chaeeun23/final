<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2유2김</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/mainImg/favicon.png">     <%-- 
<script type="text/javascript" src="${contextPath}/js/review.js"></script>
<c:set value="${pageContext.request.contextPath}" var="contextPath"/> --%>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<sec:authentication property="principal" var="member"/> 

 <style>
 .reviews { width: 100%; margin-top: 99px; }
 .reviews_title { font-family: 'Lucida', serif; font-size: 30px; color: #232323; text-transform: uppercase; line-height: 0.75; }
 .reviews_container { margin-top: 99px; }
 .review { margin-bottom: 62px; }
.review_date { font-size: 12px; color: #937c6f; margin-top: 3px; }
.review_rating { margin-top: 14px; }
.reviewList { margin-top: 28px; }
.review_text p { color: #777777; line-height: 2.14; }
.review_text p:last-of-type { margin-bottom: 0; }
.table_td{ padding-top:10px; color:#ffffff; font-size: 15px; line-height: 40px; }
.review_name a {
	font-size: 17px;
	font-weight: 600;
	color: #232323;
	-webkit-transition: all 200ms ease;
	-moz-transition: all 200ms ease;
	-ms-transition: all 200ms ease;
	-o-transition: all 200ms ease;
	transition: all 200ms ease;
}
.review_name a:hover { color: #937c6f; }
</style>
 
</head>
<body>
	<!-- header(로고, 네비게이션바) -->
	<div>
		<c:import url="/WEB-INF/resource/inc/header.jsp"></c:import>
		<br>
		<br>
		<br>
	</div>
	<!-- 총 관리자만 강좌 추가 가능 -->
	<div class="container">
	<h1 style="text-align:center;">강좌 상세보기</h1>
	<br>
	<sec:authentication property="principal" var="member"/>
	
	<table class="table table-bordered" style="text-align:center; vertical-align:middle;">
		<tr> 
			<td>강좌 번호</td>
			<td><input type="hidden" id=lectureNo value="${lectureOne.lectureNo}">${lectureOne.lectureNo}</td>
		</tr>
		<tr> 
			<td>강좌명</td>
			<td>
				<c:choose >
					<c:when test="${lectureOne.lectureName eq '필라테스'}">
						<a href="${pageContext.request.contextPath}/pilates" class="btn btn-primary" style="width:100px;">${lectureOne.lectureName}</a> 
					</c:when>
					<c:when test="${lectureOne.lectureName eq '수영'}">
						<a href="${pageContext.request.contextPath}/swimming" class="btn btn-primary" style="width:100px;">${lectureOne.lectureName}</a> 
					</c:when>
					<c:when test="${lectureOne.lectureName eq '테니스'}">
						<a href="${pageContext.request.contextPath}/tennis" class="btn btn-primary" style="width:100px;">${lectureOne.lectureName}</a> 
					</c:when>
					<c:when test="${lectureOne.lectureName eq '탁구'}">
						<a href="${pageContext.request.contextPath}/pingpong" class="btn btn-primary" style="width:100px;">${lectureOne.lectureName}</a>  
					</c:when>
					<c:when test="${lectureOne.lectureName eq '에어로빅'}">
						<a href="${pageContext.request.contextPath}/aerobics" class="btn btn-primary" style="width:100px;">${lectureOne.lectureName}</a>  
					</c:when>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td>강좌 요일</td>
			<td>${lectureOne.lectureDay}</td>
		</tr>
		<tr> 
			<td>강사 이름</td>
			<td>${lectureOne.memberName}</td>
		</tr>
		<tr> 
			<td>강사 성별</td>
			<td>${lectureOne.memberGender}</td>
		</tr>
		<tr> 
			<td>장소 번호</td>
			<td>${lectureOne.locationNo}</td>
		</tr>
		<tr> 
			<td>수강 정원</td>
			<td>${lectureOne.lectureLimited}</td>
		</tr>
		<tr> 
			<td>수업 시간</td>
			<td>${lectureOne.lectureTime}</td>
		</tr>
		<tr> 
			<td>강의 금액</td>
			<td>${lectureOne.lecturePrice}</td>
		</tr>
		<tr> 
			<td>개강일</td>
			<td>${lectureOne.lectureStartDate}</td>
		</tr>
		<tr> 
			<td>종강일</td>
			<td>${lectureOne.lectureEndDate}</td>
		</tr>
	</table>
	
		<!-- 회원만 가능 -->
		<sec:authorize access="hasAnyAuthority('USER','EMPLOYEE','ADMIN')">
			<a href="${pageContext.request.contextPath}/insertUserCart?lectureNo=${lectureOne.lectureNo}&userId=${member.memberId}" 
				onclick="javascript:btAn()" type="button" class="btn btn-primary" style="width:100px; float:right;" >장바구니</a>
		</sec:authorize>
		<a href="${pageContext.request.contextPath}/lectureList" class="btn btn-primary" style="width:100px; float:right; margin-right:10px; ">강좌목록</a>
		
		<!-- 관리자면 수정, 삭제버튼 보이게 -->
		<sec:authorize access="hasAnyAuthority('EMPLOYEE','ADMIN')">
			<a href="${pageContext.request.contextPath}/removeLecture?lectureNo=${lectureOne.lectureNo}" 
				id="removeBtn" class="btn btn-primary" style="width:100px; float:right; margin-right:10px;">강좌삭제</a>
			<a href="${pageContext.request.contextPath}/modifyLecture?lectureNo=${lectureOne.lectureNo}" 
				class="btn btn-primary" style="width:100px; float:right; margin-right:10px;">강좌수정</a>
		</sec:authorize>
	</div>

	<br>
	<br>
	<br>
	<br>


	<!-- 리뷰 입력 -->
	<!-- 리뷰 자신이 작성한 것만 수정, 삭제 가능(수강:아이디와 로그인한 아이디가 일치하면 수정, 삭제 가능) / 관리자는 모든 리뷰 삭제 가능  -->
	<!-- Reviews -->
	<div class="container"> 
		<div class="reviews" style="width: 100%; margin-top: 99px;">
			<div class="reviews_title">&nbsp;&nbsp;Reviews</div>
		<hr>
<%-- 		
   댓글 입력 폼
    <div class="d-flex align-items-center mt-2">
        <div class="form-floating flex-grow-1 px-2">
             <c:if test="${member.memberId ne null}">
            <textarea class="form-control" placeholder="리뷰를 작성해주세요" name="reviewContent" id="reviewContent"
                      style="height: 100px; resize: none;"></textarea>
            </c:if>
            <div class="invalid-feedback">
                1자 이상 입력해주세요
            </div>
            <c:if test="${member.memberId eq null}">
                <label for="reviewContent">댓글을 작성하려면, 로그인 해주세요</label>
            </c:if>
        </div>
        <c:if test="${sessionScope.loginMember ne null}">
            <a lectureNo="${lectureList.lectureNo}" userId="${userId}" id="reviewInsertBtn"
               class="btn btn-primary btn-sm">등록</a>
        </c:if>
    </div>
     --%>
    
    <%-- 리뷰리스트 --%>
 <%--    <div id="reviewList">
    <c:forEach items="${reviewList}" var="r">
            <!-- 댓글 내용 -->
			<table class="table">
				<tr>
					<td><div class="review_name">★ ${r.reviewWriter}님의 리뷰 </div></td>
					<td class="text-right" width="300px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${r.createDate}에 작성 </td>
				</tr>
				<tr>
					<td>
						<div class="review_text">
							<p>&nbsp;&nbsp;&nbsp;&nbsp;${r.reviewContent} </p>
						</div>
					</td>
					<td class="text-right" width="300px">
					<div class="review_text">
							<p>
								<button type="button" class="btn btn-primary" style="float:right;" id="removeReviewBtn" href="${pageContext.request.contextPath}/removeReview?reviewNo=">삭제</a>
								<a class="btn btn-primary" style="float:right; margin-right:10px;"  
									href="${pageContext.request.contextPath}/updateReview?reviewNo=${r.reviewNo}">수정</a>
							</p>
						</div>
					</td>
				<tr>
			</table>
		</c:forEach>  
		
	</div> --%>
</div>
	
<script type="text/javascript">
	
/* 리뷰 목록  */
$(document).ready(function(){ 
	// alert('aaa'); 
	let a =''; 
	// lectureController에 있는 Review를 가져와 페이지네이션만 뽑아옴
	let lectureNo = $('#lectureNo').val(); 
	let url = '/finalproject/reviewList';
	/* alert(url); */
	// 아이디를 설정해 값을 가져오기
	// alert('bbb'); 
	$.ajax({        
		url : url,        
		type : 'GET',        
		data : {lectureNo:lectureNo},
		success : function(json) {
			const x = $(json);
			/* alert(x); */
			 alert('ccc'); 
			a += '<table class="table">';
        $(json).each(function(i, item){			// 리스트에서 뽑기
           	a += '<tr>';
           	a += 	'<td>';
           	a += 		'<div class="review_name">★&nbsp;&nbsp;'+ item.reviewWriter + '님의 리뷰 </div>';               
       		a += 	'</td>';  
       		a += 	'<td class="text-right" width="300px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+ item.createDate+'에 작성 ';
       		a += 	'</td>';                
       		a += '</tr>';               
       		
       		a += '<tr>';              
       		a +=	'<td>';             
       		a += 		'<div class="review_text">';               
       		a += 			'<p>&nbsp;&nbsp;&nbsp;&nbsp;'+ item.reviewContent + '</p>';              
       		a += 		'</div>';            
       		a += 	'</td>';           
       		a += 	'<td class="text-right" width="300px">';                
       		a += 		'<div class="review_text">';                
       		a += 		'<p>';             
       		a += 		'<a type="button" class="btn btn-primary" style="float:right;" id="removeReviewBtn" href="${pageContext.request.contextPath}/removeReview?reviewNo='+ item.reviewNo+'">삭제</a>';             
       		a += 		'<a type="button" class="btn btn-primary" style="float:right;" id="updateReivewBtn" margin-right:50px;" href="${pageContext.request.contextPath}/updateReview?reviewNo='+ item.reviewNo+'">수정</a>';           
       		a += 		'</p>';             
       		a += 	'</div>';               
       		a += 	'</td>';              
       		a += '</tr>';    
       			});       
       		a += '</table>';                  
			  $("#reviewList").append(a);       
		}
	});
}); 	
		
	$(document).on('click', '#removeReviewBtn', function (){
		let delete_warning = confirm('댓글을 삭제하시겠습니까?');
	    let reviewNo = '${reviewList.reviewNo}';
	    let lectureNo = $('#lectureNo').val(); 
	    alert(reviewNo);  
	    let url = '/finalproject/removeReview';
	    if (delete_warning == true) {
	        $.ajax({
	            type: "GET",
	            url: url,
	            dataType: "json",
	            data: {reviewNo :reviewNo},
	            success: function (data) { //성공시
	            	alert('삭제 성공!');               	
	                reviewList(data); 
	            },
	            error: function (e) { //실패시
	            	alert('삭제 실패!'); 
	                console.log(e);
	            }
	        });
	     }
	  }); 	  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  /* 
		  
		$('#removeReviewBtn').click(function() {
			alert(reviewNo);
			var reviewNo = $(this).val(); 
			$.ajax({
				url : '/finalproject/removeReview',
				type : 'GET',
				data : {reviewNo : reviewNo},
				success : function(json) {
					if(json == 'y') {
						alert('삭제 성공!');
					} else {
						alert('삭제 실패!');					
					}
				}
			});
			
			location.reload();
			return false;
		});
		   */
		  
		  
		  
		
	$("#removeBtn").click(function(){
			alert("강좌 삭제 성공!");
	});

	function btAn(){
        alert('장바구니 추가완료!');
    }

</script>
<%-- 
			<!-- 수정 클릭시 --!>
            <div class="updateForm" style="display: none">
                <div class="form-floating flex-grow-1 px-2">
                    <textarea class="reviewUpdateContent form-control"
                              style="height: 100px; resize: none;">${r.reviewContent}</textarea>
                    <div class="invalid-feedback">
                        1자 이상 입력해주세요
                    </div>
                </div>
                <div class="d-flex justify-content-end mt-2">
                    <a lectureNo="${r.lectureNo}" reviewNo="${r.reviewNo}"
                       class='reviewUpdateBtn btn btn-primary btn-sm mx-1'>등록</a>
                    <a class='reviewUpdateCancel btn btn-primary btn-sm ms-1'>취소</a>
                </div>
                <hr/>
            </div>
            </div> --%>
      
    
   </div> 
 
	<br>
	<br>
	
	
	<!-- footer -->
	<div>
		<c:import url="/WEB-INF/resource/inc/footer.jsp"></c:import>
	</div>
</body>
</html>