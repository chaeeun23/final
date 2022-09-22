<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2유2김</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/mainImg/favicon.png">
</head>
<body>
	<!-- header(로고, 네비게이션바) -->
	<div>
		<c:import url="/WEB-INF/resource/inc/header.jsp"></c:import>
		<br> <br>

	</div>
	<div class="container">
	<h3>오시는 길</h3>
	<hr>
	
		<!-- Map Section -->
	<div class="container">
		<div class="col-lg-12 d-flex justify-content-center">
			<div class="center-block" id="map" style="width: 60%; height: 400px;"></div>
		</div>
	</div>
	
	<br>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2eb3c2736bb5d65dbc4b8211eea19288&libraries=services"></script>
	
	
	
	</div>
	<!-- footer -->
	<div>
		<br>
		<c:import url="/WEB-INF/resource/inc/footer.jsp"></c:import>
	</div>
	<script>
  var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
      mapOption = { 
          center: new kakao.maps.LatLng(37.478803, 126.881220), // 지도의 중심좌표
          level: 4 // 지도의 확대 레벨
      };
  
  // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
  var map = new kakao.maps.Map(mapContainer, mapOption); 
     
       
  var zoomControl = new kakao.maps.ZoomControl();
  // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
  var mapTypeControl = new kakao.maps.MapTypeControl();
  // 지도 타입 컨트롤을 지도에 표시합니다
  map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
  map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
   
  var geocoder = new kakao.maps.services.Geocoder();
   // 마커가 표시될 위치입니다 
  var markerPosition  = new kakao.maps.LatLng(37.478803, 126.881220); 

  // 마커를 생성합니다
  var marker = new kakao.maps.Marker({
      position: markerPosition
  });

  // 마커가 지도 위에 표시되도록 설정합니다
  marker.setMap(map);
  
  </script>
</body>
</html>
