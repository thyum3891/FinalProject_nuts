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
</body>
</html>
