<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-- Primary Meta Tags -->
    <title>견과류</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="title" content="Spaces - Directory Listing Landing page 2">
    <meta name="author" content="Themesberg">
    <meta name="description" content="Premium Directory Listing Bootstrap 4 Template featuring 37 hand-crafted pages, a dashboard an Mapbox integration. Spaces also comes with a complete UI Kit featuring over 700 components by Themesberg.">
    <meta name="keywords" content="bootstrap, bootstrap 4 template, directory listing bootstrap, bootstrap 4 listing, bootstrap listing, bootstrap 4 directory listing template, vector map, leaflet js template, mapbox theme, mapbox template, dashboard, themesberg, user dashboard bootstrap, dashboard bootstrap, ui kit, bootstrap ui kit, premium bootstrap theme"
    />
    <link rel="canonical" href="${path}/resources/images/nuts_logo.png">

    <!-- Open Graph / Facebook -->
    <meta property="og:type" content="website">
    <meta property="og:url" content="https://demo.themesberg.com/pixel-pro">
    <meta property="og:title" content="Spaces - Directory Listing Landing page 2">
    <meta property="og:description" content="Premium Directory Listing Bootstrap 4 Template featuring 37 hand-crafted pages, a dashboard an Mapbox integration. Spaces also comes with a complete UI Kit featuring over 700 components by Themesberg.">
    <meta property="og:image" content="https://themesberg.s3.us-east-2.amazonaws.com/public/products/spaces/thumbnail.jpg">
 
    <!-- Twitter -->
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:url" content="https://demo.themesberg.com/pixel-pro">
    <meta property="twitter:title" content="Spaces - Directory Listing Landing page 2">
    <meta property="twitter:description" content="Premium Directory Listing Bootstrap 4 Template featuring 37 hand-crafted pages, a dashboard an Mapbox integration. Spaces also comes with a complete UI Kit featuring over 700 components by Themesberg.">
    <meta property="twitter:image" content="https://themesberg.s3.us-east-2.amazonaws.com/public/products/spaces/thumbnail.jpg">

    <!-- Favicon -->
    <link rel="apple-touch-icon" sizes="120x120" href="${path}/resources/images/nuts_favicon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="${path}/resources/images/nuts_favicon.png">
    <link rel="icon" type="image/png" sizes="16x16" href="${path}/resources/images/nuts_favicon.png">
    <link rel="manifest" href="${path}/resources/assets/img/favicon/site.webmanifest">
    <link rel="mask-icon" href="${path}/resources/images/nuts_favicon.png color="#ffffff">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="theme-color" content="#ffffff">

    <!-- Fontawesome -->
    <link type="text/css" href="${path}/resources/vendor/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">

    <!-- Leaflet JS -->
    <link type="text/css" href="${path}/resources/vendor/leaflet/dist/leaflet.css" rel="stylesheet">

    <!-- Fancybox -->
    <link rel="stylesheet" href="${path}/resources/vendor/@fancyapps/fancybox/dist/jquery.fancybox.min.css">

    <!-- VectorMap -->
    <link rel="stylesheet" href="${path}/resources/vendor/jqvmap/dist/jqvmap.min.css">

    <!-- Main CSS -->
    <link type="text/css" href="${path}/resources/css/spaces.css" rel="stylesheet">

    <!-- NOTICE: You can use the _analytics.html partial to include production code specific code & trackers -->

</head>

<body>
    <header class="header-global">
        <nav id="navbar-main" class="navbar navbar-main navbar-theme-primary navbar-expand-lg headroom py-lg-3 px-lg-6 navbar-light navbar-theme-primary navbar-transparent">
            <div class="container">
                <a class="logo" href="nuts_index.html">
                    <img class="logo" src="${path}/resources/images/nutslogo.svg" height="100px" alt="Logo light">
                </a>
                <div class="navbar-collapse collapse" id="navbar_global">
                    <div class="navbar-collapse-header">
                        <div class="row">
                            <div class="col-6 collapse-brand">
                                <a href="${path}/resources/index.html">
                                </a>
                            </div>
                            <div class="col-6 collapse-close">
                                <a href="#navbar_global" role="button" class="fas fa-times" data-toggle="collapse" data-target="#navbar_global" aria-controls="navbar_global" aria-expanded="false" aria-label="Toggle navigation"></a>
                            </div>
                        </div>
                    </div>
                    <ul class="navbar-nav navbar-nav-hover justify-content-center">
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="${path}/working/view"><strong>산책하기</strong></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="${path}/park/view"><strong>공원조회</strong></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="${path}/hospital/view"><strong>동물병원</strong></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="${path}/shop/list"><strong>넛츠마켓</strong></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="${path}/hotdog/list"><strong>커뮤니티</strong></a>
                        </li>

                    </ul>
                </div>
                <div class="d-none d-lg-block @@cta_button_classes">
                    <a href="${path}/member/login" target="_blank" class="btn btn-md btn-outline-white animate-up-2 mr-3"><span class="d-xl-none">로그인</span> <span class="d-none d-xl-inline">로그인</span></a>
                </div>
                <div class="d-flex d-lg-none align-items-center">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar_global" aria-controls="navbar_global" aria-expanded="false" aria-label="Toggle navigation"><span
                        class="navbar-toggler-icon"></span></button>
                </div>
            </div>
        </nav>
    </header>
    
    
    <!-- Core -->
    <script src="${path}/resources/vendor/jquery/dist/jquery.min.js"></script>
    <script src="${path}/resources/vendor/popper.js/dist/umd/popper.min.js"></script>
    <script src="${path}/resources/vendor/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="${path}/resources/vendor/headroom.js/dist/headroom.min.js"></script>
    <script src="${path}/resources/vendor/onscreen/dist/on-screen.umd.min.js"></script>

    <!-- NoUISlider -->
    <script src="${path}/resources/vendor/nouislider/distribute/nouislider.min.js"></script>

    <!-- Bootstrap Datepicker -->
    <script src="${path}/resources/vendor/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>

    <!-- jQuery Waypoints -->
    <script src="${path}/resources/vendor/waypoints/lib/jquery.waypoints.min.js"></script>

    <!-- Owl acrousel -->
    <script src="${path}/resources/vendor/owl.carousel/dist/owl.carousel.min.js"></script>

    <!-- Smooth scroll -->
    <script src="${path}/resources/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>

    <!-- Fancybox -->
    <script src="${path}/resources/vendor/@fancyapps/fancybox/dist/jquery.fancybox.min.js"></script>

    <!-- Sticky sidebar -->
    <script src="${path}/resources/vendor/sticky-sidebar/dist/sticky-sidebar.min.js"></script>

    <!-- Mapbox & Leaflet.js -->
    <script src="${path}/resources/vendor/leaflet/dist/leaflet.js"></script>

    <!-- Chartist -->
    <script src="${path}/resources/vendor/chartist/dist/chartist.min.js"></script>
    <script src="${path}/resources/vendor/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>

    <!-- Vector Maps -->
    <script src="${path}/resources/vendor/jqvmap/dist/jquery.vmap.min.js"></script>
    <script src="${path}/resources/vendor/jqvmap/dist/maps/jquery.vmap.usa.js"></script>

    <!-- Sliderform -->
    <script src="${path}/resources/assets/js/jquery.slideform.js"></script>

    <!-- Spaces custom Javascript -->
    <script src="${path}/resources/assets/js/spaces.js"></script>
</body>
</html>