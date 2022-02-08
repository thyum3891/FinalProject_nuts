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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />


<!-- Fontawesome -->
<link type="text/css" href="../vendor/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">

<!-- Leaflet JS -->
<link type="text/css" href="../vendor/leaflet/dist/leaflet.css" rel="stylesheet">

<!-- Fancybox -->
<link rel="stylesheet" href="../vendor/@fancyapps/fancybox/dist/jquery.fancybox.min.css">

<!-- VectorMap -->
<link rel="stylesheet" href="../vendor/jqvmap/dist/jqvmap.min.css">

<!-- Main CSS -->
<link type="text/css" href="../css/spaces.css" rel="stylesheet">

<style>
    .btn1{
        background-color: rgb(207, 181, 147);
    }
    .btn2{
        background-color: rgb(85, 56, 17);
        color: white;
    }
    .btn1:hover{
        background-color: white;
        border:solid rgb(207, 181, 147) 1px;
    }
    .btn2:hover{
        background-color: white;
        border:solid rgb(85, 56, 17) 1px;
        color: black;
    }

</style>
</head>

<body>
    
    <main>

        <div class="preloader bg-dark flex-column justify-content-center align-items-center">
    <div class="position-relative">
        <img src="../assets/img/brand/light-without-letter.svg" alt="Logo loader">
        <img src="../assets/img/brand/letter.svg" class="rotate-letter" alt="Letter loader">
    </div>
</div>

        <!-- Hero -->
        <section class="section section-header pb-0">
            <div class="container section-image overlay-soft text-dark rounded px-lg-5 py-6 overflow-hidden position-relative border border-light shadow-sm" data-background="../assets/img/hero-2.jpg">
                <div class="row no-gutters justify-content-between align-items-center">
                    <div class="col-12 order-lg-2">
                        <h1 class="h2 mb-4">내 위치로 산책 메이트 찾기</h1>
                        <div class="card p-md-2 mb-3">
                            <div class="card-body p-2 p-md-0">
                                <form autocomplete="off" class="row" method="get" action="./all-spaces.html">
                                    <div class="col-12 col-lg-6 pr-lg-1">
                                        <div class="form-group form-group-lg mb-lg-0" >
                                            <div class="input-group ">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text"><span class="far fa-calendar-alt"></span></span>
                                                </div>
                                                <input class="form-control datepicker col-auto" placeholder="날짜" type="text" required>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="col-auto col-lg-3 px-lg-1">
                                        <div class="input-group input-group-lg mb-4 mb-lg-0">
                                            

                                            <input id="search-activity " type="text" class="form-control autocomplete"  placeholder="닉네임" required>
                                        </div>
                                    </div>
                                    <div class ="btn btn-group-toggle">
                                        <button class="btn  btn1" type="button" onclick=""><b>검색하기</b></button>
                                        <button class="btn  btn2" type="button" onclick=""><b>생성하기</b></button>
                                    </div>
                                </form>
                            </div>
                        </div>
                       
                    </div>
                </div>
            </div>
        </section>
        <!-- Section -->
        <section class="section section-lg">
            <div class="container">
                <div class="row">
                    <div class="col d-flex justify-content-start">
                        <h3 class="h4 mb-5">Featured spaces near you</h3>
                    </div>
                    <div class="col d-flex justify-content-end">
                        <a href="all-spaces.html">All spaces <span class="icon icon-xs"><span class="fas fa-chevron-right ml-2"></span></span></a>
                    </div>
                </div>
                
               </div>
                   
        </section>
       
    </main>


    <footer class="footer pb-5 bg-primary text-white pt-9 mt-n9">
   
        <hr class="my-3 my-lg-5">
        <div class="row">
            <div class="col mb-md-0">
                <a href="https://themesberg.com" target="_blank" class="d-flex justify-content-center">
                    <img src="../assets/img/themesberg.svg" height="25" class="mb-3" alt="Themesberg Logo">
                </a>
            <div class="d-flex text-center justify-content-center align-items-center" role="contentinfo">
                <p class="font-weight-normal font-small mb-0">Copyright © Themesberg
                    <span class="current-year">2020</span>. All rights reserved.</p>
                </div>
            </div>
        </div>

        <div>


        </div>
    
</footer>

    <!-- Core -->
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

<script type="text/javascript">
mapQuery("default", "");
function mapQuery(searchDate, writerName){
	navigator.geolocation.getCurrentPosition(function(position) {
	    var lat = position.coords.latitude,
	        lon = position.coords.longitude;
	    $.ajax({ 
			type : "GET",
			url : "${path}/workingMap",
			data : {
				lat, lon, searchDate, writerName
			},
			success : function (result) {
				$("#mapDiv").html(result);
			},
			error : function (e) {
				$("#mapDiv").html("에러<br>" + e);
			},
		});
	    </script>
</body>

</html>
</html>