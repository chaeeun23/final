<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.payBar{

  background-color:black;
  position:fixed;
  width:100%;
  bottom:0; 
  height: 160px;
  z-index: 500;
  opacity: 0.8;

}
.payBar table{
	  margin:0 auto;
	  width:70%;
	  text-align: center;
}
.table_td{
	padding-top:10px;
	color:#ffffff;
	font-size: 15px;
	line-height: 40px;
}
.table_td_price{
	padding-top:10px;
	color:#ffffff;
	font-size: 35px;
	font-family:600;
	line-height: 40px;
}
.table_td_price_fix{
	padding-top:10px;
	color:#ff0000;
	font-size: 35px;
	font-family:600;
	line-height: 40px;
}
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

	<div class="container">
		<sec:authentication property="principal" var="member" />
		<h2 style="text-align: center;">${member.memberId}님의 결제창</h2>
		<hr>
		<br>

		<form method="post"
			action="${pageContext.request.contextPath}/addUserPayment"
			id="userPaymentListForm">
			<p style="text-align:right">※ 사물함 선택 시 10,000원이 추가됩니다.</p>
			<table class="table table-bordered" style="text-align: center;">
				<tr>
					<th>강좌번호</th>
					<th>강좌이름</th>
					<th>강사이름</th>
					<th>강의장소</th>
					<th>강의시간</th>
					<th>강의요일</th>
					<th>개강일</th>
					<th>종강일</th>
					<th>강좌금액</th>
					<th>사물함사용여부</th>
				</tr>
				<c:set var="totalLecture" value="0"/>
				<c:forEach var="p" items="${userPaymentList}">
				<input type="hidden" id="lectureNo" name="lectureNo" value="${p.lectureNo}">
				<c:set var="totalLecture" value="${totalLecture + p.lecturePrice}"/>
				<c:set var="totalLocker" value="${totalLocker + p.lecturePrice}"/>
					<tr>
						<td>${p.lectureNo}</td>
						<td>${p.lectureName}</td>
						<td>${p.memberName}</td>
						<td>${p.lectureAddr}</td>
						<td>${p.lectureTime}</td>
						<td>${p.lectureDay}</td>
						<td>${p.lectureStartDate}</td>
						<td>${p.lectureEndDate}</td>
						<td>${p.lecturePrice}원</td>
						<td>
							<select name="lockerUse">
								<option value="0">X
								<option value="10000">O
							</select>
						</td>
					</tr>
				</c:forEach>
				<tr>
				<th colspan='10' style="font-size:large;">총 금액&nbsp;:&nbsp;&nbsp;${totalLecture}원</th>
				</tr>
				<tr>
				<th colspan='10' style="font-size:large;">
			    결제수단&nbsp;:&nbsp;&nbsp;<select id="payMethod" name="payMethod" class="payMethod">
					<option value="default">******* 결제수단 선택 *******</option>
					<option value="무통장입금">무통장입금</option>
					<option value="신용카드">신용카드</option>
					<option value="네이버페이">네이버페이</option>
					<option value="카카오페이">카카오페이</option>
				</select></th>
				</tr>
			</table>
			
		</form>
	</div>

	<!-- 결제 하단 바 -->
	<div class="payBar">
		<table>
			<tr>
				<td class="table_td">강좌 금액</td>
				<td rowspan="2" class="table_td">+</td>
				<td class="table_td">사물함 금액</td>
				<td rowspan="2" class="table_td">=</td>
				<td class="table_td">총 금액</td>
				<td rowspan="2">
					<button type="button" onclick="orderBtn()" class="btn btn-danger" id="userPaymentListBtn">결제하기</button>
				</td>
			</tr>
			<tr>
				<td class="table_td_price">${totalLecture}원</td>
				<td class="table_td_price">${totalLocker}원</td>
				<td class="table_td_price_fix">${payPrice}원</td>
			</tr>
		</table>
		
		<input type="hidden" value="${totalLecture}" id="totalLecture" name="totalLecture">
		<input type="hidden" value="${totalLocker}" id="totalLocker" name="totalLocker">
		<input type="hidden" value="${payment}" id="totalLocker" name="totalLocker">
		<input type="hidden" id="count" name="count">
		<!--  정보 다 나오고 주문 버튼 -->

	</div>	

		<!-- footer -->
		<div>
			<br>
			<br>
			<c:import url="/WEB-INF/resource/inc/footer.jsp"></c:import>
		</div>
</body>
<script>
	// 최종 결제 금액 창 화면
	
	var totalLecture = $('#totalLecture').val();
	/* var str += $('#lockerUse').val();  */
	var totalLocker = 0;
	var payPrice = totalLecture + totalLocker;
	
	$('#totalLecture').text(totalLecture+'원');
	$('#totalLocker').text(totalLocker+'원');
	$('#payPrice').text(payPrice+'원');
	
	function orderBtn(){  
	    if($('.payMethod').val() == 'default'){
	        alert("결제 방법을 선택해주세요");
	        $('.payMethod').focus();
	        return;
		} else if(confirm("결제하시겠습니까?")) {
			alert('결제가 완료되었습니다.');
			userPaymentListForm.submit();
		}
	};
</script>
</html>