<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<%--List<String> pathList = new ArrayList<String>(Arrays.asList(wp.replaceAll("\\)\\,\\(","\\/").replaceAll("\\(", "").replaceAll("\\)", "").split("\\/")));--%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>이미지 지도 생성하기</title>


</head>
<body>
	<!-- 이미지 지도를 표시할 div 입니다 -->
	<div id="map" style="width: 600px; height: 350px;"></div>
	<button onclick="setBounds()">지도 범위 재설정 하기</button>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1e1bfb910a320b22f190e3d2881cdce7"></script>
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
</body>
</html>
<div class="leaflet-popup  leaflet-zoom-animated" style="opacity: 1; transform: translate3d(467px, 469px, 0px); bottom: -7px; left: -124px;"><div class="leaflet-popup-content-wrapper"><div class="leaflet-popup-content" style="width: 201px;">
                <a href="single-space.html" class="card card-article-wide flex-column no-gutters no-hover">
                    <div class="card-body py-0 d-flex flex-column justify-content-between col-12">
                        <h4 class="h5 font-weight-normal mb-3">Meeting Workspace</h4>
                        <div class="d-flex font-small">
                            <i class="star fas fa-star text-warning"></i><i class="star fas fa-star text-warning"></i><i class="star far fa-star text-gray-500"></i><i class="star far fa-star text-gray-500"></i><i class="star far fa-star text-gray-500"></i>
                            <span class="badge badge-pill badge-secondary map-badge ml-2">3</span>
                        </div>
                        <div class="d-flex justify-content-between my-3">
                            <div class="col pl-0">
                                <span class="text-muted font-xs d-block mb-1">Price</span>
                                <span class="font-small text-dark font-weight-bold">$99</span>
                            </div>
                            <div class="col">
                                <span class="text-muted font-xs d-block mb-1">Size</span>
                                <span class="font-small text-dark font-weight-bold">12</span>
                            </div>
                            <div class="col pr-0">
                                <span class="text-muted font-xs d-block mb-1">Sq.Ft</span>
                                <span class="font-small text-dark font-weight-bold">120</span>
                            </div>
                        </div>
                    </div>
                </a>
            </div></div><div class="leaflet-popup-tip-container"><div class="leaflet-popup-tip"></div></div><a class="leaflet-popup-close-button" href="#close">×</a></div>