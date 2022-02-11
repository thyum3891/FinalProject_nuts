<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<!DOCTYPE html>

<html>

<head>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ffea6673691d899c7b831444d7cf6ba1&libraries=services"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<!-- Fontawesome -->
<link type="text/css"
	href="${path}/resources/vendor/@fortawesome/fontawesome-free/css/all.min.css"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">

<!-- Leaflet JS -->
<link type="text/css"
	href="${path}/resources/vendor/leaflet/dist/leaflet.css"
	rel="stylesheet">

<!-- Fancybox -->
<link rel="stylesheet"
	href="${path}/resources/vendor/@fancyapps/fancybox/dist/jquery.fancybox.min.css">

<!-- VectorMap -->
<link rel="stylesheet"
	href="${path}/resources/vendor/jqvmap/dist/jqvmap.min.css">

<!-- Main CSS -->
<link type="text/css" href="${path}/resources/css/spaces.css"
	rel="stylesheet">

<!-- NOTICE: You can use the _analytics.html partial to include production code specific code & trackers -->
<style type="text/css">
.mapcard {
	width: 100%;
	-webkit-tap-highlight-color: transparent;
	/* position relative and z-index fix webkit rendering fonts issue */
	position: block;
	z-index: auto;
	content: ".";
	display: block;
	clear: both;
	visibility: hidden;
	line-height: 0;
	height: 0;
	content: ".";
}

.flex-container {
	display: flex;
	justify-content: center;
}

body, .fontJua {
	font-family: 'Jua';
}

.btn1 {
	color: white;
	background-color: #BA9F81;
	border-color: #BA9F81;
	height: 55px;
}

.btn2 {
	color: white;
	background-color: #5E4D44;
	border-color: #5E4D44;
	height: 55px;
}

.btn1:hover {
	color: black;
	background-color: white;
	border-color: #BA9F81;
	height: 55px;
}

.btn2:hover {
	color: black;
	background-color: white;
	border-color: #5E4D44;
	height: 55px;
}
</style>
</head>

<body>

	<main>

		<div
			class="preloader bg-dark flex-column justify-content-center align-items-center">
			<div class="position-relative">
				<img
					src="${path}/resources/assets/img/brand/light-without-letter.svg"
					alt="Logo loader"> <img
					src="${path}/resources/assets/img/brand/letter.svg"
					class="rotate-letter" alt="Letter loader">
			</div>
		</div>

		<!-- Hero -->
		<section class="section section-header pb-11"
			style="background-color: rgb(253, 225, 148);">
			<div class="container">
				<div class="row justify-content-between align-items-center">
					<div
						class="col-12 col-md-5 order-lg-1 card ml-6 px-lg-5 py-5 border border-light shadow-sm">
						<h1 class="display-3 lh-100 font-weight-bold mb-0">산책모임 찾기</h1>
						<p class="lead my-4">
							반려견이 새로운 친구와 함께 산책하며 <span class="font-weight-bold">사회성</span>을
							기르는 <span class="font-weight-bold">산책 모임</span>을 가져보세요!
						</p>
						<form autocomplete="off" class="row" method="get"
							action="${path}/walking/view2">
							<div class="col-12 mb-3 mb-lg-4">
								<div class="form-group form-group-lg mb-0">
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"><span
												class="fas fa-map-marker-alt"></span></span>
										</div>
										<input id="search-location" type="text" name="writerName"
											class="form-control autocomplete" placeholder="닉네임" required>
									</div>
								</div>
							</div>
							<div class="col-12 mb-3 mb-lg-4">
								<div class="input-group input-group-lg">
									<div class="input-group-prepend">
										<span class="input-group-text"><span
											class="far fa-calendar-alt"></span></span>
									</div>
									<input class="form-control datepicker col-auto"
										name="searchDate" placeholder="날짜" type="text" required>
								</div>
							</div>

							<div class="row col-12 mt-4 btn-group-toggle">
								<button class="btn btn-lg  btn-block animate-up-2 btn1"
									type="submit">검색하기</button>

								<button class="btn btn-lg  btn-block animate-up-2 btn2"
									type="button" onclick="location.href(${path}/walking/write)">생성하기</button>

							</div>
						</form>
					</div>
					<div class="col-auto order-lg-2">
						<!-- Image -->

						<div id="mapAll" class="rounded border-light shadow-sm"
							style="width: 500px; height: 500px; margin: 5px"></div>

					</div>
				</div>
			</div>




		</section>
		<div class="section section-lg pt-0">
			<div class="container mt-n10 ">
				<div class="flex-container">
					<img src="${path}/resources/images/caret-up-fill.svg" width="50px"
						alt="" onclick="scrollUp()" style="cursor: pointer;"
						class="scrollBtn"> <img
						src="${path}/resources/images/caret-down-fill.svg" width="50px"
						alt="" onclick="scrollDown()" style="cursor: pointer;"
						class="scrollBtn">

				</div>


				<div class="row">
					<div class="col-md-12 ">
						<div id="listScroll" class="row overflow-hidden"
							style="height: 665px;">
							<c:forEach var="wp" items="${wpList}" varStatus="vs">
								<!-- Item 1 -->
								<div style="width: 363px; height: 658px; margin: 5px">
									<!-- Card -->
									<div class="card border-light mb-4 animate-up-5">

										<table>
											<tr>
												<td>
													<div class="position-relative card p-2 rounded-xl">
														<div id="pathMap${wp.party_no}"
															style="width: 340px; height: 260px; overflow: hidden;">
														</div>
													</div>
												</td>
											</tr>

										</table>


										<div class="card-body ">
											<a href="./single-space.html">
												<h4 class="h5 fontJua">
													<span><img
														src="${path}/resources/images/KakaoTalk_20220125_140624405.jpg"
														class="card-img-top rounded-circle border-white"
														style="height: 50px; width: 50px;" alt=""></span>귀여운 동훈이
												</h4>
											</a>
											<div class="d-flex my-4">
												<span class="star fas fa-star text-warning"></span> <span
													class="star fas fa-star text-warning"></span> <span
													class="star fas fa-star text-warning"></span> <span
													class="star fas fa-star text-warning"></span> <span
													class="star fas fa-star text-warning"></span> <span
													class="badge badge-pill badge-primary ml-2">5.0</span>
											</div>
											<ul class="list-group mb-3  ">
												<li id="detailAddr${wp.party_no }"
													class="list-group-item small p-0 fontJua"><span
													class="fas fa-map-marker-alt mr-2 fontJua"></span>좌표로 주소값
													구하기</li>
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
												<button class="btn btn-lg btn2 btn-block" type="submit">신청</button>
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
									//지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
									
									var map = new kakao.maps.Map(mapContainer, mapOption); 
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
								    }
								
								function detailAddr(latLng){
							    searchDetailAddrFromCoords(latLng, function(result, status) {
							        if (status === kakao.maps.services.Status.OK) {
							        	console.log(result[0].address.address_name);
							        	
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

								<!-- End of Card -->


								<!-- End of Card -->

							</c:forEach>
						</div>
					</div>
				</div>

			</div>
		</div>

	</main>

	<hr>
	<footer class="footer pb-5 text-black pt-9 mt-n9">
		<div class="container">
			<div class="row mt-6">
				<div class="col-xl-3 mb-3 mb-xl-0">
					<img src="${path}/resources/assets/img/brand/light.svg" height="30"
						class="mb-3" alt="Spaces logo">
					<p>Premium Bootstrap Directory Listing Template</p>
				</div>
				<div class="col-6 col-xl-2 mb-5 mb-xl-0">
					<span class="h5">Themesberg</span>
					<ul class="footer-links mt-2">
						<li><a target="_blank" href="https://themesberg.com/blog">Blog</a></li>
						<li><a target="_blank" href="https://themesberg.com/products">Products</a></li>
						<li><a target="_blank" href="https://themesberg.com/about">About
								Us</a></li>
						<li><a target="_blank" href="https://themesberg.com/contact">Contact
								Us</a></li>
					</ul>
				</div>
				<div class="col-6 col-xl-3 mb-5 mb-xl-0">
					<span class="h5">Other</span>
					<ul class="footer-links mt-2">
						<li><a
							href="https://themesberg.com/docs/spaces/getting-started/quickstart/">Documentation
								<span class="badge badge-sm badge-secondary ml-2">v3.0</span>
						</a></li>
						<li><a
							href="https://themesberg.com/docs/spaces/getting-started/changelog/">Changelog</a></li>
						<li><a target="_blank" href="https://themesberg.com/contact">Support</a></li>
						<li><a target="_blank"
							href="https://themesberg.com/licensing">License</a></li>
					</ul>
				</div>
				<div class="col-12 col-xl-4 mb-5 mb-xl-0">
					<span class="h5">Get the app</span>
					<p class="text-muted font-small mt-2">It's easy. Just select
						your device.</p>
					<button class="btn btn-sm btn-white mb-xl-0 mr-2 mr-lg-2">
						<span class="d-flex align-items-center"> <span
							class="icon icon-brand mr-2"><span class="fab fa-apple"></span></span>
							<span class="d-inline-block text-left"> <small
								class="font-weight-normal d-block">Available on</small> App
								Store
						</span>
						</span>
					</button>
					<button class="btn btn-sm btn-white">
						<span class="icon icon-brand mr-2"><span
							class="fab fa-google-play"></span></span> <span
							class="d-inline-block text-left"> <small
							class="font-weight-normal d-block">Available on</small> Google
							Play
						</span>
					</button>
				</div>
			</div>
			<hr class="my-3 my-lg-5">
			<div class="row">
				<div class="col mb-md-0">
					<a href="https://themesberg.com" target="_blank" 
						class="d-flex justify-content-center"> <img
						src="${path}/resources/assets/img/themesberg.svg" height="25"
						class="mb-3" alt="Themesberg Logo">
					</a>
					<div
						class="d-flex text-center justify-content-center align-items-center"
						role="contentinfo">
						<p class="font-weight-normal font-small mb-0">
							Copyright © Themesberg <span class="current-year">2020</span>.
							All rights reserved.
						</p>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<input type="text" id="myLat" name="lng">
	<input type="text" id="myLng" name="lon" >

	<script type="text/javascript">

var mapContainer = document.getElementById('mapAll'), // 지도를 표시할 div  
mapOption = { 
    center: new kakao.maps.LatLng(${myLat}, ${myLng}), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
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

var content${wp.party_no} = '<div class="card card-body"  style="position:relative; width: 300px; height: 220px; background-color: white ;no-repeat">'+
	'<div class="row">'+
	'    <img src="${path}/resources/images/KakaoTalk_20220125_140624405.jpg" style="width: 70px; height: 70px;">'+
	'    <div class="ml-3 mt-2">'+
	'        <h5 style="color: #BA9F81;">${wp.writer_id}</h5>'+
	'        <div class="row ml-0">'+
	'            <svg style="color: #5E4D44;" xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-arrow-through-heart-fill" viewBox="0 0 16 16">                                                                                                                                                                                                                                                                                                                                                                                                                                                                       '+
	'                <path fill-rule="evenodd" d="M2.854 15.854A.5.5 0 0 1 2 15.5V14H.5a.5.5 0 0 1-.354-.854l1.5-1.5A.5.5 0 0 1 2 11.5h1.793l3.103-3.104a.5.5 0 1 1 .708.708L4.5 12.207V14a.5.5 0 0 1-.146.354l-1.5 1.5ZM16 3.5a.5.5 0 0 1-.854.354L14 2.707l-1.006 1.006c.236.248.44.531.6.845.562 1.096.585 2.517-.213 4.092-.793 1.563-2.395 3.288-5.105 5.08L8 13.912l-.276-.182A23.825 23.825 0 0 1 5.8 12.323L8.31 9.81a1.5 1.5 0 0 0-2.122-2.122L3.657 10.22a8.827 8.827 0 0 1-1.039-1.57c-.798-1.576-.775-2.997-.213-4.093C3.426 2.565 6.18 1.809 8 3.233c1.25-.98 2.944-.928 4.212-.152L13.292 2 12.147.854A.5.5 0 0 1 12.5 0h3a.5.5 0 0 1 .5.5v3Z"/>'+
	'            </svg>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       '+
	'            <h6 class="font-small text-surroundAir mt-1 ml-1" style="color: #BA9F81;">인기도 5.0</h6>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    '+
	'        </div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           '+
	'    </div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               '+
	'    <button class="btn btn-primary animate-up-2 ml-4 mt-3" type="submit" style="background-color: #5E4D44; border-color: #5E4D44; height: 40px;">신청</button>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           '+
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

//마커 위에 커스텀오버레이를 표시합니다
//마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
var overlay${wp.party_no} = new kakao.maps.CustomOverlay({
content: content${wp.party_no},
map: map,
position: marker${wp.party_no}.getPosition(),
xAnchor: 0.7,
yAnchor: 1.2
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



navigator.geolocation.getCurrentPosition(function(position) {
    var lat = position.coords.latitude,
        lon = position.coords.longitude;
    
    $("#myLat").val(lat);
    $("#myLon").val(lon);
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
</script>
	<script src="${path}/resources/vendor/jquery/dist/jquery.min.js"></script>
	<script src="${path}/resources/vendor/popper.js/dist/umd/popper.min.js"></script>
	<script
		src="${path}/resources/vendor/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="${path}/resources/vendor/headroom.js/dist/headroom.min.js"></script>
	<script
		src="${path}/resources/vendor/onscreen/dist/on-screen.umd.min.js"></script>

	<!-- NoUISlider -->
	<script
		src="${path}/resources/vendor/nouislider/distribute/nouislider.min.js"></script>

	<!-- Bootstrap Datepicker -->


	<!-- jQuery Waypoints -->
	<script
		src="${path}/resources/vendor/waypoints/lib/jquery.waypoints.min.js"></script>

	<!-- Owl acrousel -->



	<script
		src="${path}/resources/OwlCarousel2-2.3.4/src/js/owl.carousel.js">
		$('.owl-carousel').owlCarousel({
		    loop:false,
		    margin:10,
		    nav:true,
		    responsive:{
		        0:{
		            items:1
		        },
		        600:{
		            items:3
		        },
		        1000:{
		            items:5
		        }
		    }
		});
		</script>

	<!-- Smooth scroll -->
	<script
		src="${path}/resources/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>

	<!-- Fancybox -->
	<script
		src="${path}/resources/vendor/@fancyapps/fancybox/dist/jquery.fancybox.min.js"></script>

	<!-- Sticky sidebar -->
	<script
		src="${path}/resources/vendor/sticky-sidebar/dist/sticky-sidebar.min.js"></script>

	<!-- Mapbox & Leaflet.js -->
	<script src="${path}/resources/vendor/leaflet/dist/leaflet.js"></script>

	<!-- Chartist -->
	<script src="${path}/resources/vendor/chartist/dist/chartist.min.js"></script>
	<script
		src="${path}/resources/vendor/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>

	<!-- Vector Maps -->
	<script src="${path}/resources/vendor/jqvmap/dist/jquery.vmap.min.js"></script>
	<script
		src="${path}/resources/vendor/jqvmap/dist/maps/jquery.vmap.usa.js"></script>

	<!-- Sliderform -->
	<script src="${path}/resources/assets/js/jquery.slideform.js"></script>

	<!-- Spaces custom Javascript -->
	<script
		src="${path}/resources/vendor/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
	<script src="${path}/resources/assets/js/spaces.js"></script>
	<!-- Core -->

</body>

</html>