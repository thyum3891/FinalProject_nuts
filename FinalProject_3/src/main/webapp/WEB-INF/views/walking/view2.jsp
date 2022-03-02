<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />



<div class=" pt-5">
	<div class="container mt-n11 ">
				<div class="row">
			<div class="col-md-12 ">
				<div id="listScroll" class="row" style="">
					<c:forEach var="wp" items="${wpList}" varStatus="vs">
						<!-- Item 1 -->
						<div style="width: 363px; height: 658px; margin: 5px;" >
							<!-- Card -->
							<div class="card border-light mb-4 animate-up-5">
								<table>
									<tr>
										<td>
											<div class="position-relative card p-2 rounded-xl">
												<div id="pathMap${wp.party_no}"
													style="width: 340px; height: 260px; cursor: pointer;" onclick="moveMap(new kakao.maps.LatLng${wp.pathOne})" disabled = "disabled">
												</div>
											</div>
										</td>
									</tr>
								</table>
								<div class="card-body ">
										<h4 class="h5 fontJua">
											<span>
											<c:if test="${wp.profile != null}">
											<img src="${path}/resources/upload/member/${wp.profile}"
												class="card-img-top rounded-circle border-white"
												style="height: 50px; width: 50px;" alt="">
											</c:if>
												
											</span>${wp.nick_name}
										</h4>
									<div class="d-flex my-4">
									</div>
									<ul class="list-group mb-3  ">
										<li id="detailAddr${wp.party_no }"
											class="list-group-item small p-0 fontJua"><span
											class="fas fa-map-marker-alt mr-2 fontJua"></span>좌표로 주소값 구하기</li>
										<li class="list-group-item small p-0 fontJua"><span
											class="fas fa-bullseye mr-2"></span>시작 시간 : ${wp.start_time }</li>
										<li class="list-group-item small p-0 fontJua"><span
											class="fas fa-bullseye mr-2"></span>거리 : ${wp.distance}</li>
										<li class="list-group-item small p-0 fontJua"><span
											class="fas fa-bullseye mr-2"></span>예상 소요 시간 :
											${wp.estimated_time}</li>
										<li class="list-group-item small p-0"></li>
										<li class="list-group-item small p-0" fontJua><br>${wp.contant}</li>
									</ul>
									<div class="col-12 mt-4">
									<c:if test="${loginMember != null }">
										<button id="btn${wp.party_no}" class="btn btn-lg btn2 btn-block" type="button" 
										onclick="partyReq('${wp.party_no}', '${loginMember.id}', '${wp.writer_id}')">신청</button>
									</c:if>
									<c:if test="${loginMember == null }">
										<button id="btn${wp.party_no}" class="btn btn-lg btn2 btn-block" type="button" 
										 disabled="disabled">로그인 후 이용해주세요</button>
									</c:if>
									</div>
								</div>
							</div>
							<script>
							detailAddr(new kakao.maps.LatLng${wp.pathOne});
								var linePath${wp.party_no} = [
									<c:forEach var="item"  items="${wp.pathAll}" varStatus="status">
								
									new kakao.maps.LatLng( ${item} ) 
									<c:if test="${!status.last}">,</c:if>
									
									</c:forEach>
								];
								var mapNo = 'pathMap${wp.party_no}';
								
								mapSet(mapNo,linePath${wp.party_no});
													
								function mapSet(mapId, linePath) {
									var mapContainer = document.getElementById(mapId), // 지도를 표시할 div 
										mapOption = { 
											center: new kakao.maps.LatLng(${myLat}, ${myLng}), // 지도의 중심좌표
												level: 5 // 지도의 확대 레벨
											};
									
									var map = new kakao.maps.Map(mapContainer, mapOption); 
									
									map.setDraggable(false);		
									
									map.setZoomable(false);  
									
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
								    }
								
								function detailAddr(latLng){
							    searchDetailAddrFromCoords(latLng, function(result, status) {
							        if (status === kakao.maps.services.Status.OK) {
							        	
							        	$("#detailAddr${wp.party_no}").html('<span class="fas fa-map-marker-alt mr-2"></span>모임주소 : ' + result[0].address.address_name);
							        	}   
							    	});
								}
								function searchDetailAddrFromCoords(coords, callback) {
								    // 좌표로 법정동 상세 주소 정보를 요청합니다
								    var geocoder = new kakao.maps.services.Geocoder();
								    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
								}
							</script>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>

	</div>
</div>



<input type="text" id="myLat" name="lng" hidden>
<input type="text" id="myLng" name="lon" hidden>

<script type="text/javascript">

var mapContainer = document.getElementById('mapAll'), // 지도를 표시할 div  
mapOption = { 
    center: new kakao.maps.LatLng(${myLat}, ${myLng}), // 지도의 중심좌표
    level: 6// 지도의 확대 레벨
};
 
var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커를 표시할 위치와 title 객체 배열입니다 



// 마커 이미지의 이미지 주소입니다
var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 

// 마커 이미지의 이미지 크기 입니다
var imageSize = new kakao.maps.Size(24, 35); 

// 마커 이미지를 생성합니다    
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

// 마커를 생성합니다
<c:forEach var="wp" items="${wpList}" varStatus="vs">
var marker${wp.party_no} = new kakao.maps.Marker({
    map: map, // 마커를 표시할 지도
    position: new kakao.maps.LatLng${wp.pathOne}, // 마커를 표시할 위치
});

var polyline${wp.party_no} = new kakao.maps.Polyline({
	path: linePath${wp.party_no}, // 선을 구성하는 좌표배열 입니다
	strokeWeight: 5, // 선의 두께 입니다
	strokeColor: '#995c00', // 선의 색깔입니다
	strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	strokeStyle: 'solid' // 선의 스타일입니다
	});
	
kakao.maps.event.addListener(marker${wp.party_no}, 'mouseover', function() {
	polyline${wp.party_no}.setMap(map);
});

kakao.maps.event.addListener(marker${wp.party_no}, 'mouseout', function() {
	polyline${wp.party_no}.setMap(null);
});
function btnFn(){
	partyReq('${wp.party_no}', 'test2', '${wp.writer_id}');
}

<c:if test="${loginMember == null}">
	var content${wp.party_no} = '<div class="bubble" >'+
	'<div class="row">'+
	'    <img src="${path}/resources/images/KakaoTalk_20220125_140624405.jpg" style="width: 70px; height: 70px;">'+
	'    <div class="ml-3 mt-2">'+
	'        <h5 style="color: #BA9F81;">${wp.nick_name}</h5>'+
	'        <div class="row ml-0">'+
	'            <svg style="color: #5E4D44;" xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-arrow-through-heart-fill" viewBox="0 0 16 16">                                                                                                                                                                                                                                                                                                                                                                                                                                                                       '+
	'                <path fill-rule="evenodd" d="M2.854 15.854A.5.5 0 0 1 2 15.5V14H.5a.5.5 0 0 1-.354-.854l1.5-1.5A.5.5 0 0 1 2 11.5h1.793l3.103-3.104a.5.5 0 1 1 .708.708L4.5 12.207V14a.5.5 0 0 1-.146.354l-1.5 1.5ZM16 3.5a.5.5 0 0 1-.854.354L14 2.707l-1.006 1.006c.236.248.44.531.6.845.562 1.096.585 2.517-.213 4.092-.793 1.563-2.395 3.288-5.105 5.08L8 13.912l-.276-.182A23.825 23.825 0 0 1 5.8 12.323L8.31 9.81a1.5 1.5 0 0 0-2.122-2.122L3.657 10.22a8.827 8.827 0 0 1-1.039-1.57c-.798-1.576-.775-2.997-.213-4.093C3.426 2.565 6.18 1.809 8 3.233c1.25-.98 2.944-.928 4.212-.152L13.292 2 12.147.854A.5.5 0 0 1 12.5 0h3a.5.5 0 0 1 .5.5v3Z"/>'+
	'            </svg>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       '+
	'        </div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           '+
	'    </div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               '+
	'    <button id="btn2${wp.party_no}" class="btn btn-primary animate-up-2 ml-4 mt-3" type="button" onclick="btnFn()" style="background-color: #5E4D44; border-color: #5E4D44; height: 40px;" disabled>신청</button>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           '+
	'</div>'+
	'<div style="position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;cursor: pointer;" onclick="closeOverlay${wp.party_no}()" >x</div>'+
	'<div class="text-surroundAir mt-2 ml-2" style="color: #5E4D44;">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         '+
	'    <div class="row">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    '+
	'        <svg style="color: #5E4D44;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar" viewBox="0 0 16 16">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           '+
	'            <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>                                                                                                                                                                                                                                                                                                                                                                                                                                                '+
	'        </svg>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           '+
	'        <span class="small d-block mb-1 ml-2">날짜 : ${fn:substring(wp.start_date,0,10)}</span>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                '+
	'    </div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               '+
	'    <div class="row">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    '+
	'        <svg style="color: #5E4D44;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clock" viewBox="0 0 16 16">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              '+
	'            <path d="M8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71V3.5z"/>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               '+
	'            <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm7-8A7 7 0 1 1 1 8a7 7 0 0 1 14 0z"/>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            '+
	'        </svg>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           '+
	'        <span class="small d-block mb-1 ml-2">시작시간 : ${wp.start_time }</span>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            '+
	'    </div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               '+
	'    <div class="row">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    '+
	'        <svg style="color: #5E4D44;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hourglass-split" viewBox="0 0 16 16">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    '+
	'            <path d="M2.5 15a.5.5 0 1 1 0-1h1v-1a4.5 4.5 0 0 1 2.557-4.06c.29-.139.443-.377.443-.59v-.7c0-.213-.154-.451-.443-.59A4.5 4.5 0 0 1 3.5 3V2h-1a.5.5 0 0 1 0-1h11a.5.5 0 0 1 0 1h-1v1a4.5 4.5 0 0 1-2.557 4.06c-.29.139-.443.377-.443.59v.7c0 .213.154.451.443.59A4.5 4.5 0 0 1 12.5 13v1h1a.5.5 0 0 1 0 1h-11zm2-13v1c0 .537.12 1.045.337 1.5h6.326c.216-.455.337-.963.337-1.5V2h-7zm3 6.35c0 .701-.478 1.236-1.011 1.492A3.5 3.5 0 0 0 4.5 13s.866-1.299 3-1.48V8.35zm1 0v3.17c2.134.181 3 1.48 3 1.48a3.5 3.5 0 0 0-1.989-3.158C8.978 9.586 8.5 9.052 8.5 8.351z"/>                                                                        '+
	'        </svg>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           '+
	'        <span class="small d-block mb-1 ml-2">예상소요시간 : ${wp.estimated_time }</span>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        '+
	'    </div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               '+
	'    <div class="row">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    '+
	'        <svg style="color: #5E4D44;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      '+
	'            <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>                                                                                                                                                                                                                                                                                                                                                                                                           '+
	'            <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>                                                                                                                                                                                                                                                                                                                                                                                                                             '+
	'        </svg>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           '+
	'        <span class="small d-block mb-1 ml-2">${wp.contant }</span>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                '+
	'    </div>'+
	'</div>'+
	'</div>';
</c:if>	
<c:if test="${loginMember != null}">
	if('${reqStr}'.indexOf('${wp.party_no}'+'${loginMember.id}') >= 0){
	var content${wp.party_no} = '<div class="bubble" >'+
		'<div class="row">'+
		'    <img src="${path}/resources/images/KakaoTalk_20220125_140624405.jpg" style="width: 70px; height: 70px;">'+
		'    <div class="ml-3 mt-2">'+
		'        <h5 style="color: #BA9F81;">${wp.nick_name}</h5>'+
		'        <div class="row ml-0">'+
		'            <svg style="color: #5E4D44;" xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-arrow-through-heart-fill" viewBox="0 0 16 16">                                                                                                                                                                                                                                                                                                                                                                                                                                                                       '+
		'                <path fill-rule="evenodd" d="M2.854 15.854A.5.5 0 0 1 2 15.5V14H.5a.5.5 0 0 1-.354-.854l1.5-1.5A.5.5 0 0 1 2 11.5h1.793l3.103-3.104a.5.5 0 1 1 .708.708L4.5 12.207V14a.5.5 0 0 1-.146.354l-1.5 1.5ZM16 3.5a.5.5 0 0 1-.854.354L14 2.707l-1.006 1.006c.236.248.44.531.6.845.562 1.096.585 2.517-.213 4.092-.793 1.563-2.395 3.288-5.105 5.08L8 13.912l-.276-.182A23.825 23.825 0 0 1 5.8 12.323L8.31 9.81a1.5 1.5 0 0 0-2.122-2.122L3.657 10.22a8.827 8.827 0 0 1-1.039-1.57c-.798-1.576-.775-2.997-.213-4.093C3.426 2.565 6.18 1.809 8 3.233c1.25-.98 2.944-.928 4.212-.152L13.292 2 12.147.854A.5.5 0 0 1 12.5 0h3a.5.5 0 0 1 .5.5v3Z"/>'+
		'            </svg>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       '+
		'        </div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           '+
		'    </div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               '+
		'    <button id="btn2${wp.party_no}" class="btn btn-primary animate-up-2 ml-4 mt-3" type="button" onclick="btnFn()" style="background-color: #5E4D44; border-color: #5E4D44; height: 40px;" disabled>신청 완료</button>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           '+
		'</div>'+
		'<div style="position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;cursor: pointer;" onclick="closeOverlay${wp.party_no}()" >x</div>'+
		'<div class="text-surroundAir mt-2 ml-2" style="color: #5E4D44;">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         '+
		'    <div class="row">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    '+
		'        <svg style="color: #5E4D44;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar" viewBox="0 0 16 16">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           '+
		'            <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>                                                                                                                                                                                                                                                                                                                                                                                                                                                '+
		'        </svg>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           '+
		'        <span class="small d-block mb-1 ml-2">날짜 : ${fn:substring(wp.start_date,0,10)}</span>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                '+
		'    </div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               '+
		'    <div class="row">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    '+
		'        <svg style="color: #5E4D44;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clock" viewBox="0 0 16 16">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              '+
		'            <path d="M8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71V3.5z"/>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               '+
		'            <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm7-8A7 7 0 1 1 1 8a7 7 0 0 1 14 0z"/>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            '+
		'        </svg>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           '+
		'        <span class="small d-block mb-1 ml-2">시작시간 : ${wp.start_time }</span>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            '+
		'    </div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               '+
		'    <div class="row">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    '+
		'        <svg style="color: #5E4D44;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hourglass-split" viewBox="0 0 16 16">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    '+
		'            <path d="M2.5 15a.5.5 0 1 1 0-1h1v-1a4.5 4.5 0 0 1 2.557-4.06c.29-.139.443-.377.443-.59v-.7c0-.213-.154-.451-.443-.59A4.5 4.5 0 0 1 3.5 3V2h-1a.5.5 0 0 1 0-1h11a.5.5 0 0 1 0 1h-1v1a4.5 4.5 0 0 1-2.557 4.06c-.29.139-.443.377-.443.59v.7c0 .213.154.451.443.59A4.5 4.5 0 0 1 12.5 13v1h1a.5.5 0 0 1 0 1h-11zm2-13v1c0 .537.12 1.045.337 1.5h6.326c.216-.455.337-.963.337-1.5V2h-7zm3 6.35c0 .701-.478 1.236-1.011 1.492A3.5 3.5 0 0 0 4.5 13s.866-1.299 3-1.48V8.35zm1 0v3.17c2.134.181 3 1.48 3 1.48a3.5 3.5 0 0 0-1.989-3.158C8.978 9.586 8.5 9.052 8.5 8.351z"/>                                                                        '+
		'        </svg>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           '+
		'        <span class="small d-block mb-1 ml-2">예상소요시간 : ${wp.estimated_time }</span>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        '+
		'    </div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               '+
		'    <div class="row">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    '+
		'        <svg style="color: #5E4D44;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      '+
		'            <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>                                                                                                                                                                                                                                                                                                                                                                                                           '+
		'            <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>                                                                                                                                                                                                                                                                                                                                                                                                                             '+
		'        </svg>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           '+
		'        <span class="small d-block mb-1 ml-2">${wp.contant }</span>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                '+
		'    </div>'+
		'</div>'+
		'</div>';
	}else{
		var content${wp.party_no} = '<div class="bubble" >'+
		'<div class="row">'+
		'    <img src="${path}/resources/images/KakaoTalk_20220125_140624405.jpg" style="width: 70px; height: 70px;">'+
		'    <div class="ml-3 mt-2">'+
		'        <h5 style="color: #BA9F81;">${wp.nick_name}</h5>'+
		'        <div class="row ml-0">'+
		'            <svg style="color: #5E4D44;" xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-arrow-through-heart-fill" viewBox="0 0 16 16">                                                                                                                                                                                                                                                                                                                                                                                                                                                                       '+
		'                <path fill-rule="evenodd" d="M2.854 15.854A.5.5 0 0 1 2 15.5V14H.5a.5.5 0 0 1-.354-.854l1.5-1.5A.5.5 0 0 1 2 11.5h1.793l3.103-3.104a.5.5 0 1 1 .708.708L4.5 12.207V14a.5.5 0 0 1-.146.354l-1.5 1.5ZM16 3.5a.5.5 0 0 1-.854.354L14 2.707l-1.006 1.006c.236.248.44.531.6.845.562 1.096.585 2.517-.213 4.092-.793 1.563-2.395 3.288-5.105 5.08L8 13.912l-.276-.182A23.825 23.825 0 0 1 5.8 12.323L8.31 9.81a1.5 1.5 0 0 0-2.122-2.122L3.657 10.22a8.827 8.827 0 0 1-1.039-1.57c-.798-1.576-.775-2.997-.213-4.093C3.426 2.565 6.18 1.809 8 3.233c1.25-.98 2.944-.928 4.212-.152L13.292 2 12.147.854A.5.5 0 0 1 12.5 0h3a.5.5 0 0 1 .5.5v3Z"/>'+
		'            </svg>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       '+
		'        </div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           '+
		'    </div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               '+
		'    <button id="btn2${wp.party_no}" class="btn btn-primary animate-up-2 ml-4 mt-3" type="button" onclick="partyReq(\'${wp.party_no}\', \'test2\', \'${wp.writer_id}\')" style="background-color: #5E4D44; border-color: #5E4D44; height: 40px;">신청</button>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           '+
		'</div>'+
		'<div style="position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;cursor: pointer;" onclick="closeOverlay${wp.party_no}()" >x</div>'+
		'<div class="text-surroundAir mt-2 ml-2" style="color: #5E4D44;">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         '+
		'    <div class="row">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    '+
		'        <svg style="color: #5E4D44;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar" viewBox="0 0 16 16">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           '+
		'            <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>                                                                                                                                                                                                                                                                                                                                                                                                                                                '+
		'        </svg>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           '+
		'        <span class="small d-block mb-1 ml-2">날짜 : ${fn:substring(wp.start_date,0,10)}</span>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                '+
		'    </div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               '+
		'    <div class="row">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    '+
		'        <svg style="color: #5E4D44;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clock" viewBox="0 0 16 16">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              '+
		'            <path d="M8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71V3.5z"/>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               '+
		'            <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm7-8A7 7 0 1 1 1 8a7 7 0 0 1 14 0z"/>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            '+
		'        </svg>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           '+
		'        <span class="small d-block mb-1 ml-2">시작시간 : ${wp.start_time }</span>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            '+
		'    </div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               '+
		'    <div class="row">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    '+
		'        <svg style="color: #5E4D44;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hourglass-split" viewBox="0 0 16 16">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    '+
		'            <path d="M2.5 15a.5.5 0 1 1 0-1h1v-1a4.5 4.5 0 0 1 2.557-4.06c.29-.139.443-.377.443-.59v-.7c0-.213-.154-.451-.443-.59A4.5 4.5 0 0 1 3.5 3V2h-1a.5.5 0 0 1 0-1h11a.5.5 0 0 1 0 1h-1v1a4.5 4.5 0 0 1-2.557 4.06c-.29.139-.443.377-.443.59v.7c0 .213.154.451.443.59A4.5 4.5 0 0 1 12.5 13v1h1a.5.5 0 0 1 0 1h-11zm2-13v1c0 .537.12 1.045.337 1.5h6.326c.216-.455.337-.963.337-1.5V2h-7zm3 6.35c0 .701-.478 1.236-1.011 1.492A3.5 3.5 0 0 0 4.5 13s.866-1.299 3-1.48V8.35zm1 0v3.17c2.134.181 3 1.48 3 1.48a3.5 3.5 0 0 0-1.989-3.158C8.978 9.586 8.5 9.052 8.5 8.351z"/>                                                                        '+
		'        </svg>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           '+
		'        <span class="small d-block mb-1 ml-2">예상소요시간 : ${wp.estimated_time }</span>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        '+
		'    </div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               '+
		'    <div class="row">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    '+
		'        <svg style="color: #5E4D44;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      '+
		'            <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>                                                                                                                                                                                                                                                                                                                                                                                                           '+
		'            <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>                                                                                                                                                                                                                                                                                                                                                                                                                             '+
		'        </svg>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           '+
		'        <span class="small d-block mb-1 ml-2">${wp.contant }</span>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                '+
		'    </div>'+
		'</div>'+
		'</div>';
	}
</c:if>
//마커 위에 커스텀오버레이를 표시합니다
//마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
	  
var overlay${wp.party_no} = new kakao.maps.CustomOverlay({
content: content${wp.party_no},
map: map,
position: marker${wp.party_no}.getPosition(),
xAnchor: 0.5,
yAnchor: 1.15
});
overlay${wp.party_no}.setMap(null);

//마커를 클릭했을 때 커스텀 오버레이를 표시합니다
kakao.maps.event.addListener(marker${wp.party_no}, 'click', function() {
	overlay${wp.party_no}.setMap(map);
});

//커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
function closeOverlay${wp.party_no}() {
	overlay${wp.party_no}.setMap(null);     
}


</c:forEach>

<c:if test="${loginMember!=null}">
	<c:forEach var="wp" items="${wpList}" varStatus="vs">	
		var reqNo = '${wp.party_no}'+'${loginMember.id}';
		reqFunction('btn${wp.party_no}', reqNo);
	</c:forEach>
</c:if>


navigator.geolocation.getCurrentPosition(function(position) {
    var lat = position.coords.latitude,
        lon = position.coords.longitude;
    
    $("#myLat").val(lat);
    $("#myLng").val(lon);
});


var sh = 670;
function scrollUp(){
    let upScroll = $("#listScroll").scrollTop() - sh;
    if(upScroll>0){
        $('#listScroll').animate({
        scrollTop : upScroll
    }, 400 );
    }else{
        $('#listScroll').animate({
        scrollTop : 0
    }, 400 );
    }
    
}
function scrollDown(){
    let downScroll = $("#listScroll").scrollTop() + sh;
    if(downScroll<$("#listScroll")[0].scrollHeight){
        $('#listScroll').animate({
        scrollTop :downScroll
    }, 400 );
    }else{
        $('#listScroll').animate({
        scrollTop : $("#listScroll")[0].scrollHeight
    }, 400 );
    }

    
}
$("#myLat").val("${myLat}");
$("#myLng").val("${myLon}");
$("#date").val("${date}");
$("#nickName").val("${nickName}");

function moveMap(mapCenterPath) {
	map.setCenter(mapCenterPath)
}

function partyReq(partyNo, reqId, respId) {
	$.ajax({
		type: "post",
		url: "${path}/walking/partyReq",
		dataType: "json",
		data: {
			partyNo, reqId, respId
		},
		success: 
		function(data) {
			console.log(data);
			
			if(data.creatStat === true) {
		location.href = '${path}/walking/req';
				
			} else {
				alert("신청 실패");							
			}
		},
		error: function(e) {
			console.log(e);
		}
	});
}
function reqFunction(btnId, reqNo){
	
	const btnIdDoc = document.getElementById(btnId);
	console.log(btnId);
	if('${reqStr}'.indexOf(reqNo) >= 0){
		btnIdDoc.disabled = true;	
		btnIdDoc.innerText = "신청완료";	
	}else{
		
	}
	
}

</script>
