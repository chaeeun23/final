<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2유2김</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/mainImg/favicon.png">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="./js/jquery-1.12.4.min.js"></script>
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
	<h1 style="text-align:center;">강좌 추가하기</h1>
	<br>
	
	<form method="post" action="${pageContext.request.contextPath}/addLecture" id="addLectureForm">
	<table class="table table-bordered" style="text-align:center;" >
		<tr> 
			<td>강좌번호</td>
			<td><input type="text" id="lectureNo" name="lectureNo"></td>
		</tr>
		<tr> 
			<td>강사아이디</td>
			<td>
			<select name="instructorId" id="instructor">
				<option value="default">******* 강사 선택 *******</option>
			<c:forEach var="i" items="${instructor}">
				<option value="${i.memberId}">${i.memberId} ) ${i.memberName}</option>
			</c:forEach>
		</select>
			</td>
		</tr>
		<tr> 
			<td>장소</td>
			<td>	
			<select name="locationNo" id="location">
				<option value="default">******* 장소 선택 *******</option>
			<c:forEach var="l" items="${location}">
				<option value="${l.locationNo}">${l.locationNo} ) ${l.lectureAddr}</option>
			</c:forEach>
		</select></td>
		</tr> 
		<tr> 
			<td>강좌명</td>
			<td><input type="text" id="lectureName" name="lectureName"></td>
		</tr>
		<tr> 
			<td>수강요일</td>
			<td>
				<div >
					<input type="checkbox" name="lectureDay" value="월" id="월">
					<label for="월">월</label>&nbsp;&nbsp;&nbsp;
					<input type="checkbox" name="lectureDay" value="화" id="화">
					<label for="화">화</label>&nbsp;&nbsp;&nbsp;
					<input type="checkbox" name="lectureDay" value="수" id="수">
					<label for="수">수</label>&nbsp;&nbsp;&nbsp;
					<input type="checkbox" name="lectureDay" value="목" id="목">
					<label for="목">목</label>&nbsp;&nbsp;&nbsp;
					<input type="checkbox" name="lectureDay" value="금" id="금">
					<label for="금">금</label>
				</div>
			</td>
		</tr>
		<tr> 
			<td>수강인원</td>
			<td><input type="text" id="lectureLimited" name="lectureLimited"></td>
		</tr>
		<tr> 
			<td>수업시간</td>
			<td>
				<div>
					<input type="radio" name="lectureTime" id="9시타임" value="9시타임" >&nbsp;
					<label for="9시타임" >9-10</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="lectureTime" id="10시타임" value="10시타임" >&nbsp;
					<label for="10시타임">10-11</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="lectureTime" id="11시타임" value="11시타임"  >&nbsp;
					<label for="11시타임">11-12</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="lectureTime" id="13시타임" value="13시타임"  >&nbsp;
					<label for="13시타임">13-14</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="lectureTime" id="14시타임" value="14시타임"  >&nbsp;
					<label for="14시타임">14-15</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="lectureTime" id="15시타임" value="15시타임"  >&nbsp;
					<label for="15시타임">15-16</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="lectureTime" id="16시타임" value="16시타임"  >&nbsp;
					<label for="16시타임">16-17</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="lectureTime" id="17시타임" value="17시타임"  >&nbsp;
					<label for="17시타임">17-18</label>
				</div>
			</td>
		</tr>
		<tr> 
			<td>강좌금액</td>
			<td><input type="text" id="lecturePrice" name="lecturePrice"></td>
		</tr>
		<tr> 
			<td>개강일</td>
			<td><input type="date" id="lectureStartDate" name="lectureStartDate" style="text-align:center;" ></td>
		</tr>
		<tr> 
			<td>종강일</td>
			<td><input type="date" id="lectureEndDate" name="lectureEndDate" style="text-align:center;" ></td>
		</tr>
		
		</table>
			<a href="${pageContext.request.contextPath}/lectureList" class="btn btn-primary" style="width:100px; float:right; margin-right:10px; ">강좌목록</a>
			<button type="button" class="btn btn-primary" id="addLectureBtn" style="width:100px; float:right; margin-right:10px;">강좌추가</button>
	</form>
</div>

	<br>
	<br>
	<br>	
	
	
	<!-- footer -->
	<div>
		<c:import url="/WEB-INF/resource/inc/footer.jsp"></c:import>
	</div>
	
	<script>

		$("#addLectureBtn").click(function(){
			if( $("#lectureNo").val() == "")	 { 
				alert("빈칸입니다. 강좌번호를 입력해주세요");	
						$("#lectureNo").focus();	
								return false; 
		   } else if( $("#instructor option:selected").val() == "default")	 { 
				alert("강사옵션을 선택해 주세요!");	  
								return false; 
		   } else if( $("#location option:selected").val() == "default")	{
				alert("장소옵션을 선택해 주세요!");	  
								return false; 
			} else if( $("#lectureName").val() == "")	 { 
				alert("빈칸입니다. 강좌명을 입력해주세요!");	  
						$("#lectureName").focus();	
								return false; 
			} else if( $(":checkbox[name='lectureDay']:checked").length == 0){
				alert("수강요일 1개 이상은 반드시 체크해야합니다!");	 
						$("#lectureDay").focus();	
								return false; 
			} else if( $("#lectureLimited").val() == "")	 { 
				alert("빈칸입니다. 수강인원을 입력해주세요!");	  
						$("#lectureLimited").focus();	
								return false; 
			} else if( $(":radio[name='lectureTime']:checked").length==0)	 { 
				alert("수업시간를 선택해주세요!");	  
						$("#lectureTime").focus();	
								return false; 
			} else if( $("#lecturePrice").val() == "")	 { 
				alert("빈칸입니다. 강좌금액을 입력해주세요!");	  
						$("#lectureLimited").focus();	
								return false; 
			} else if( $("#lectureStartDate").val() == "")	 { 
				alert("빈칸입니다. 개강일을 선택해주세요!");	  
								return false; 
			} else if( $("#lectureEndDate").val() == "")	 { 
				alert("빈칸입니다. 종강일을 선택해주세요!");	
						return false; 
			} else {
				addLectureForm.submit();
			}
		});


	/* 	// 체크박스 값 넣기
		$('#addLectureBtn').click(function() {
			/* // 객체에 생성
		    var genreArray = new Array(); 
		
		    // name이 같은 체크박스의 값들을 배열에 담는다.    
		    var checkboxValues = [];    
		    $("input[name='lectureDay']:checked").each(function(i) {        
		    	checkboxValues.push($(this).val());    });         
		    	// 사용자 ID(문자열)와 체크박스 값들(배열)을 name/value 형태로 담는다.    
		    	var allData = { "checkArray": checkboxValues };         
		    	$.ajax({        
		    		url:'/finalproject/addLecture',        
		    		type:'POST',        
		    		data: allData,        
		    		success:function(data){            
		    			alert("완료!");            
		    			window.opener.location.reload();            
		    			self.close();        
		    			},        
		    			error:function(jqXHR, textStatus, errorThrown){            
		    				alert("실패!" + textStatus + " : " + errorThrown);            
		    				self.close();        
		    				}    
		    		   });
		    	
				// 값이 들어갔는지 확인
			    console.log(genreArray);
				
		    	}
		 */ 
	</script>
	
	<!-- 시작날짜가 종료날짜 보다 작으면 경고창을 띄움 -->
	<script type="text/javascript">	
		$(function(){		
			$("#addLectureBtn").click(function(){
				var startDate = $('#lectureStartDate').val();	        
				var endDate = $('#lectureEndDate').val();	  
				     
				//-을 구분자로 연,월,일로 잘라내어 배열로 반환	        
				var startArray = startDate.split('-');	        
				var endArray = endDate.split('-'); 
				  	        
				//배열에 담겨있는 연,월,일을 사용해서 Date 객체 생성	        
				var start_date = new Date(startArray[0], startArray[1], startArray[2]);	        
				var end_date = new Date(endArray[0], endArray[1], endArray[2]);       
				      
				//날짜를 숫자형태의 날짜 정보로 변환하여 비교한다.	        
				if(start_date.getTime() > end_date.getTime()) {	            
					alert("종료날짜보다 시작날짜가 작아야합니다.");	            
					return false;	        
						}	     
					});	
				});
			
	
	</script>
</body>
</html>