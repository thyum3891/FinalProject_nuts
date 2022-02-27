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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
    
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

<style type="text/css">
 * {
            font-family: 'Jua', sans-serif;
        }
        
        h1,
        h2,
        h3,
        h4,
        h5,
        h6,
        p,
        li {
            font-family: 'Jua' !important;
        }
        
        .bg {
            background-color: #fae3a5;
        }
        
        input,
        button {
            border: none;
        }
        
        span,
        tr,
        td,
        th,
        a {
            color: #5E4D44;
        }

	.loginBtn {
	border-color: #5E4D44; 
	background-color: #5E4D44; 
	color: white;
	}
	.loginBtn:hover{
		border-color: #5E4D44; 
		background-color: white; 
		color: black;
	}
	.navBtn:hover{
		border-color: #5E4D44; 
		background-color: white; 
	}

	body, .fontJua {
	font-family: 'Jua';
}
</style>

</head>

<body>
   <header class="header-global fontJua" >
        <nav id="navbar-main" class="navbar navbar-main  navbar-expand-lg" style="background-color: white">
            <div class="container">
                <a class="navbar-brand @@logo_classes ml-4" href="${path}">
                    <img src="${path}/resources/images/nutslogo.svg" style="height: 80px;">
                </a>
                <div class="navbar-collapse collapse ml-6" id="navbar_global">
                    <ul class="navbar-nav navbar-nav-hover  justify-content-center">
                        <li class="nav-item dropdown navBtn">
                            <a href="${path}/walking/view" id="mainPagesDropdown" class="nav-link fontJua" >
                                <span class="nav-link-inner-text mr-1" style="color: #5E4D44;">산책하기</span>
                            </a>
                        </li>
                        <li class="nav-item dropdown ml-5 navBtn">
                            <a href="#" id="dashboardPagesDropdown" class="nav-link dropdown-toggle fontJua" aria-expanded="false" data-toggle="dropdown">
                                <span class="nav-link-inner-text mr-1" style="color: #5E4D44;">공원조회</span>
                            </a>
                        </li>
                        <li class="nav-item dropdown ml-5 navBtn">
                            <a href="${path}/hospital/view" id="dashboardPagesDropdown" class="nav-link fontJua">
                                <span class="nav-link-inner-text mr-1" style="color: #5E4D44;">동물병원</span>
                            </a>
                        </li>
                        <li class="nav-item dropdown ml-5 navBtn">
                            <a href="#" id="dashboardPagesDropdown" class="nav-link dropdown-toggle fontJua" aria-expanded="false" data-toggle="dropdown">
                                <span class="nav-link-inner-text mr-1" style="color: #5E4D44;">넛츠마켓</span>
                            </a>
                        </li>
                        <li class="nav-item dropdown ml-5">
                            <a href="#" id="supportDropdown" class="nav-link dropdown-toggle fontJua" aria-expanded="false" data-toggle="dropdown">
                                <span class="nav-link-inner-text mr-1" style="color: #5E4D44;">커뮤니티</span>
                                <i class="fas fa-angle-down nav-link-arrow" style="color: #5E4D44;"></i>
                            </a>
                            <div class="dropdown-menu dropdown-menu-lg" aria-labelledby="supportDropdown">
                                <div class="col-auto px-0">
                                    <div class="list-group list-group-flush">
                                        <a href="https://themesberg.com/docs/spaces/getting-started/quick-start/" target="_blank" class="list-group-item list-group-item-action d-flex align-items-center p-0 py-3 px-lg-4 navBtn">
                                            <span class="icon icon-md icon-secondary">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-megaphone " viewBox="0 0 16 16" style="color: #5E4D44;">
                                                    <path d="M13 2.5a1.5 1.5 0 0 1 3 0v11a1.5 1.5 0 0 1-3 0v-.214c-2.162-1.241-4.49-1.843-6.912-2.083l.405 2.712A1 1 0 0 1 5.51 15.1h-.548a1 1 0 0 1-.916-.599l-1.85-3.49a68.14 68.14 0 0 0-.202-.003A2.014 2.014 0 0 1 0 9V7a2.02 2.02 0 0 1 1.992-2.013 74.663 74.663 0 0 0 2.483-.075c3.043-.154 6.148-.849 8.525-2.199V2.5zm1 0v11a.5.5 0 0 0 1 0v-11a.5.5 0 0 0-1 0zm-1 1.35c-2.344 1.205-5.209 1.842-8 2.033v4.233c.18.01.359.022.537.036 2.568.189 5.093.744 7.463 1.993V3.85zm-9 6.215v-4.13a95.09 95.09 0 0 1-1.992.052A1.02 1.02 0 0 0 1 7v2c0 .55.448 1.002 1.006 1.009A60.49 60.49 0 0 1 4 10.065zm-.657.975 1.609 3.037.01.024h.548l-.002-.014-.443-2.966a68.019 68.019 0 0 0-1.722-.082z"/>
                                                </svg>
                                            </span>
                                            <div class="ml-4">
                                                <span class="d-block small text-surroundAir" style="color: #5E4D44; ">공지사항</span>
                                            </div>
                                        </a>
                                        <a href="${path}/hotdog/list" target="_blank" class="list-group-item list-group-item-action d-flex align-items-center p-0 py-3 px-lg-4 navBtn">
                                            <span class="icon icon-md icon-secondary">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-left-text" viewBox="0 0 16 16" style="color: #5E4D44;">
                                                    <path d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H4.414A2 2 0 0 0 3 11.586l-2 2V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                                                    <path d="M3 3.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3 6a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9A.5.5 0 0 1 3 6zm0 2.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z"/>
                                                </svg>
                                            </span>
                                            <div class="ml-4">
                                                <span class="d-block small text-surroundAir" style="color: #5E4D44;">핫도그</span>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="d-none d-lg-block  mr-4">
                	<c:if test="${loginMember == null}">
	                    <a href="${path }/login" class="btn btn-md mr-3 loginBtn">
	                        로그인
	                    </a>
                	</c:if>
                	
                	<c:if test="${loginMember != null}">
                		<span>
                		<c:if test="${loginMember.profile_re_name != null}">
                			<a onclick="location.href = '${path}/myPage'">
                				<img  class=" rounded-circle border-white" src="${path}/resources/upload/member/${loginMember.profile_re_name}" width="50px" height="50px">
                			</a>
                		</c:if>
                		
                		<a href="${path}/logout" class="btn btn-md mr-3">
	                        로그아웃
	                    </a>  
                		</span>
                		
                	</c:if>
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