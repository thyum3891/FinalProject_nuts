<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
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
.bubble {
	position:relative; 
	width: 360px; 
	height: 275px; 
	padding-top:30px;
	padding-left:40px;
	background:url('${path}/resources/images/bubble2.png') no-repeat;
}
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
		<section class="section section-header pb-11" style="background-color: rgba(253, 225, 148,1)">
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
												class="fas fa-user"></span></span>
										</div>
										<input id="nickName" type="text" name="writerName"
											class="form-control autocomplete" placeholder="닉네임" required >
									</div>
								</div>
							</div>
							<div class="col-12 mb-3 mb-lg-4">
								<div class="input-group input-group-lg">
									<div class="input-group-prepend">
										<span class="input-group-text"><span
											class="far fa-calendar-alt"></span></span>
									</div>
									<input class="form-control datepicker col-auto" id="date" 
										name="searchDate" placeholder="날짜" type="text" required>
								</div>
							</div>

							<div class="row col-12 mt-4 btn-group-toggle">
							
								<button class="btn btn-lg  btn-block animate-up-2 btn1" 
									type="button" onclick="mapQuery($('#date').val() ,$('#nickName').val())">검색하기</button>

								<button class="btn btn-lg  btn-block animate-up-2 btn2"
									type="button" onclick="location.href()">생성하기</button>

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
<div id= "view" style="height: 843px"></div>

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
					<li><a target="_blank" href="https://themesberg.com/licensing">License</a></li>
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
							class="font-weight-normal d-block">Available on</small> App Store
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
						Copyright © Themesberg <span class="current-year">2020</span>. All
						rights reserved.
					</p>
				</div>
			</div>
		</div>
	</div>
</footer>


<script type="text/javascript">
mapQuery("", "");
function mapQuery(searchDate, writerName){
	navigator.geolocation.getCurrentPosition(function(position) {
	    var lat = position.coords.latitude,
	        lon = position.coords.longitude;
	    $.ajax({ 
			type : "GET",
			url : "${path}/walking/view2",
			data : {
				lat, lon, searchDate, writerName
			},
			success : function (result) {
				$("#view").html(result);
			},
			error : function (e) {
				$("#view").html("에러<br>" + e);
			},
		});
	});
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
		src="${path}/resources/OwlCarousel2-2.3.4/src/js/owl.carousel.js"></script>

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
	<script src="${path}/resources/assets/js/spaces.js"></script>
	<!-- Core -->
	<script
		src="${path}/resources/vendor/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
</body>


</html>