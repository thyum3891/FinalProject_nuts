<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<%@ page session="false" %>
<!DOCTYPE html>
<html>



<head>
    <meta charset="utf-8">
    <title>이미지 지도 생성하기</title>
  
  
</head>
<body>
<!-- 이미지 지도를 표시할 div 입니다 -->

<div class="row" style="padding: 5%;">
                    <div class="col-12 col-md-6 mb-3">
                        <div class="card border-light mb-4 animate-up-5">
                            <div class="row no-gutters align-items-center">
                                <div class="col-12 col-lg-6 col-xl-5">
                                    <a href="./single-space.html">
                                        <img src="../assets/img/spaces/loft-wide.jpg" alt="loft space" class="card-img p-2 rounded-xl">
                                    </a>
                                </div>
                                <div class="col-12 col-lg-6 col-xl-7">
                                    <div class="card-body">
                                        <img src="C:\Users\USER\Documents\카카오톡 받은 파일\KakaoTalk_20220125_140624405.jpg" class="card-img-top rounded-circle border-white" style="height: 50px; width: 50px;" alt="">
                                        <a href="./single-space.html">
                                            <a class="h5">귀여운 동훈이</a>
                                        </a>
                                       
                                        <ul class="list-group mb-3">
                                            <li class="list-group-item small p-0"><span class="fas fa-map-marker-alt mr-2"></span>좌표로 주소값 구하기</li>
                                            <li class="list-group-item small p-0"><span class="fas fa-bullseye mr-2"></span>소요시간</li>
                                            <li class="list-group-item small p-0"><span class="fas fa-bullseye mr-2"></span>거리 (소요시간)</li>
                                            
                                        </ul>
                                        <div class="d-flex justify-content-between">
                                            <div class="col pl-0">
                                                <span class="text-muted font-small d-block">Hourly</span>
                                                <span class="h6 text-dark font-weight-bold">50$</span>
                                            </div>
                                            <div class="col">
                                                <span class="text-muted font-small d-block">People</span>
                                                <span class="h6 text-dark font-weight-bold">20-50</span>
                                            </div>
                                            <div class="col pr-0">
                                                <span class="text-muted font-small d-block">Sq.Ft</span>
                                                <span class="h6 text-dark font-weight-bold">1200</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                  </div>

<div id="map" style="width:600px;height:350px;"></div>
<button onclick="setBounds()">지도 범위 재설정 하기</button> 
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1e1bfb910a320b22f190e3d2881cdce7"></script>
<script>


var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { 
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};

//지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption); 
var linePath = [
<c:forEach var="item" items="${pathList}" varStatus="status">
	
	
new kakao.maps.LatLng(${item})<c:if test="${!staus.last}">,</c:if>
	
	
	
	
	</c:forEach>  
	
];

// 지도에 표시할 선을 생성합니다
var polyline = new kakao.maps.Polyline({
    path: linePath, // 선을 구성하는 좌표배열 입니다
    strokeWeight: 5, // 선의 두께 입니다
    strokeColor: '#FFAE00', // 선의 색깔입니다
    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
    strokeStyle: 'solid' // 선의 스타일입니다
});
polyline.setMap(map);
var bounds = new kakao.maps.LatLngBounds();  
var i;
for(i =0;i<linePath.length;i++){
    bounds.extend(linePath[i]);
    
}

    map.setBounds(bounds);


</script>
<script src="../vendor/jquery/dist/jquery.min.js"></script>
<script src="../vendor/popper.js/dist/umd/popper.min.js"></script>
<script src="../vendor/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="../vendor/headroom.js/dist/headroom.min.js"></script>
<script src="../vendor/onscreen/dist/on-screen.umd.min.js"></script>

<!-- NoUISlider -->
<script src="../vendor/nouislider/distribute/nouislider.min.js"></script>

<!-- Bootstrap Datepicker -->
<script src="../vendor/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>

<!-- jQuery Waypoints -->
<script src="../vendor/waypoints/lib/jquery.waypoints.min.js"></script>

<!-- Owl acrousel -->
<script src="../vendor/owl.carousel/dist/owl.carousel.min.js"></script>

<!-- Smooth scroll -->
<script src="../vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>

<!-- Fancybox -->
<script src="../vendor/@fancyapps/fancybox/dist/jquery.fancybox.min.js"></script>

<!-- Sticky sidebar -->
<script src="../vendor/sticky-sidebar/dist/sticky-sidebar.min.js"></script>

<!-- Mapbox & Leaflet.js -->
<script src="../vendor/leaflet/dist/leaflet.js"></script>

<!-- Chartist -->
<script src="../vendor/chartist/dist/chartist.min.js"></script>
<script src="../vendor/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>

<!-- Vector Maps -->
<script src="../vendor/jqvmap/dist/jquery.vmap.min.js"></script>
<script src="../vendor/jqvmap/dist/maps/jquery.vmap.usa.js"></script>

<!-- Sliderform -->
<script src="../assets/js/jquery.slideform.js"></script>

<!-- Spaces custom Javascript -->
<script src="../assets/js/spaces.js"></script>
</body>
</html>
