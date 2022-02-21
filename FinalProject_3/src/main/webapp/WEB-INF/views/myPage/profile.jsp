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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    
    <main>

        <div class="preloader bg-dark flex-column justify-content-center align-items-center">
            <div class="position-relative">
                <img src="${path}/resources/assets/img/brand/light-without-letter.svg" alt="Logo loader">
                <img src="${path}/resources/assets/img/brand/letter.svg" class="rotate-letter" alt="Letter loader">
            </div>
        </div>
        <div class="section pt-lg-0">
            <div id="spaces-container" class="container">
                <div class="row">
                    <aside class="col-12 col-lg-4 d-block z-10">
                        <div id="profile-sidebar">
                            <div class="sidebar-inner">
                                <!-- Profile Card -->
                                <div class="card mt-n7 d-none d-lg-block border-light text-center p-2">
                                    <div class="profile-cover rounded-top" data-background="${path}/resources/assets/img/coworking.jpg">
                                    </div>
                                    <div class="card-body p-2">
                                        <div class="profile-thumbnail small-thumbnail mt-n6 mx-auto">
                                            <img src="${path}/resources/assets/img/DongHun.jpg" class="card-img-top rounded-circle border-white" alt="Joseph Portrait">
                                        </div>
                                        <h4 class="font-weight-normal mt-4 mb-0">동훈이</h4>
                                        <ul style="text-align: center;" class="list-inline row mx-auto my-4">
                                            <li class="list-inline-item col-sm-4 col-auto px-2 px-xl-3 my-2 mx-0 ml-2">
                                                <h6 class="font-weight-normal font-small">팔로워</h6>
                                                <a class="d-sm-block h6 text-gray font-weight-normal font-small" href="#">
                                                    3명
                                                </a>
                                            </li>
                                            <li class="list-inline-item col-sm-4 col-md-auto px-2 px-xl-3 my-2 mx-0 ml-2">
                                                <h6 class="font-weight-normal font-small">인기도</h6>
                                                <a class="d-sm-block h6 text-gray font-weight-normal font-small" href="#">
                                                    5/5
                                                </a>
                                            </li>
                                            <li class="list-inline-item col-sm-4 col-md-auto px-2 px-xl-3 my-2 mx-0 ml-2">
                                                <h6 class="font-weight-normal font-small">게시글</h6>
                                                <a class="d-sm-block h6 text-gray font-weight-normal font-small" href="#">
                                                    3개
                                                </a>
                                            </li>
                                        </ul>
                                        <a class="btn btn-sm btn-secondary mb-3" href="#">
                                            <span class="fas fa-user-plus mr-1"></span> 팔로우
                                        </a>
                                    </div>
                                </div>
                                <!-- End of Profile Card -->
                            </div>
                        </div>
                        <!-- Profile Card -->
                        <div class="card d-lg-none border-light text-center mt-n5 mt-md-n7 p-2">
                            <div class="card-body p-2">
                                <div class="profile-thumbnail small-thumbnail mt-n6 mx-auto">
                                    <img src="${path}/resources/assets/img/DongHun.jpg" class="card-img-top rounded-circle border-white" alt="Joseph Portrait">
                                </div>
                                <h4 class="font-weight-normal mt-4 mb-0">드러누운 동훈이</h4>
                                <ul class="list-inline row mx-auto my-4">
                                    <li class="list-inline-item col-4 px-2 px-xl-3 my-2 mx-0 ml-2">
                                        <h6 class="font-weight-normal font-small">팔로워</h6>
                                        <a class="d-sm-block h6 text-gray font-weight-normal font-small" href="#">
                                            3명
                                            </a>
                                    </li>
                                    <li class="list-inline-item col-4 px-2 px-xl-3 my-2 mx-0 ml-2">
                                        <h6 class="font-weight-normal font-small">인기도</h6>
                                        <a class="d-sm-block h6 text-gray font-weight-normal font-small" href="#">
                                            5/5
                                        </a>
                                    </li>
                                    <li class="list-inline-item col-4 px-2 px-xl-3 my-2 mx-0 ml-2">
                                        <h6 class="font-weight-normal font-small">게시글</h6>
                                        <a class="d-sm-block h6 text-gray font-weight-normal font-small" href="#">
                                            3개
                                        </a>
                                    </li>
                                </ul>
                                <a class="btn btn-sm btn-secondary mb-3" href="#">
                                    <span class="fas fa-user-plus mr-1"></span> 팔로우
                                </a>
                            </div>
                        </div>
                        <!-- End of Profile Card -->
                    </aside>
                    <div class="col-12 col-lg-8">
                        <div>
                            <h5>다녀온 산책</h5>
                        </div>
                        <div class="container ">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="basic-carousel owl-carousel owl-theme">
                                        <div class="item">
                                            <!-- Card -->
                                            <div class="card border-light mb-4 m-1 animate-up-5">
                                                <a href="./single-space.html" class="position-relative">
                                                    <img src="${path}/resources/assets/img/sample.png" class="card-img-top p-2 rounded-xl" alt="themesberg office" style="width: 440px; height: 343px">
                                                </a>
                                                <div class="card-body">
                                                    <ul class="list-group mb-3">
                                                        <li class="list-group-item small p-0"><span class="fas fa-bullseye mr-2"></span>2022 / 01 / 29
                                                        </li>
                                                        <li class="list-group-item small p-0"><span class="fas fa-bullseye mr-2"></span>시작시간 : 오후 7시 30분</li>
                                                        <li class="list-group-item small p-0"><span class="fas fa-bullseye mr-2"></span>예상소요시간 : 1시간</li>
                                                        <li class="list-group-item small p-0"><span class="fas fa-bullseye mr-2"></span>동훈이랑 산책해요!</li>
                                                    </ul>
                                                </div>
                                                <div class="col mt-lg-0 mt-3 d-flex flex-column text-center">
                                                    <div>
                                                        <a href="#" class="btn btn-primary animate-up-2 mb-2">마감</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- End of Card -->
                                        </div>

                                        <div class="item">
                                            <!-- Card -->
                                            <div class="card border-light mb-4 m-1 animate-up-5">
                                                <a href="./single-space.html" class="position-relative">
                                                    <img src="${path}/resources/assets/img/DongHun.jpg" class="card-img-top p-2 rounded-xl" alt="themesberg office" style="width: 440px; height: 343px">
                                                </a>
                                                <div class="card-body">
                                                    <ul class="list-group mb-3">
                                                        <li class="list-group-item small p-0"><span class="fas fa-bullseye mr-2"></span>2022 / 01 / 29
                                                        </li>
                                                        <li class="list-group-item small p-0"><span class="fas fa-bullseye mr-2"></span>시작시간 : 오후 7시 30분</li>
                                                        <li class="list-group-item small p-0"><span class="fas fa-bullseye mr-2"></span>예상소요시간 : 1시간</li>
                                                        <li class="list-group-item small p-0"><span class="fas fa-bullseye mr-2"></span>동훈이랑 산책해요!</li>
                                                    </ul>
                                                </div>
                                                <div class="col mt-lg-0 mt-3 d-flex flex-column text-center">
                                                    <div>
                                                        <a href="#" class="btn btn-primary animate-up-2 mb-2">마감</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- End of Card -->
                                        </div>

                                        <div class="item">
                                            <!-- Card -->
                                            <div class="card border-light mb-4 m-1 animate-up-5">
                                                <a href="./single-space.html" class="position-relative">
                                                    <img src="${path}/resources/assets/img/DongHun2.jpg" class="card-img-top p-2 rounded-xl" alt="themesberg office" style="width: 440px; height: 343px">
                                                </a>
                                                <div class="card-body">
                                                    <ul class="list-group mb-3">
                                                        <li class="list-group-item small p-0"><span class="fas fa-bullseye mr-2"></span>2022 / 01 / 29
                                                        </li>
                                                        <li class="list-group-item small p-0"><span class="fas fa-bullseye mr-2"></span>시작시간 : 오후 7시 30분</li>
                                                        <li class="list-group-item small p-0"><span class="fas fa-bullseye mr-2"></span>예상소요시간 : 1시간</li>
                                                        <li class="list-group-item small p-0"><span class="fas fa-bullseye mr-2"></span>동훈이랑 산책해요!</li>
                                                    </ul>
                                                </div>
                                                <div class="col mt-lg-0 mt-3 d-flex flex-column text-center">
                                                    <div>
                                                        <a href="#" class="btn btn-primary animate-up-2 mb-2">마감</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- End of Card -->
                                        </div>


                                    </div>
                                </div>
                            </div>
                        </div>

                        <div>
                            <h5>저장된 산책로</h5>
                        </div>
                        <div class="container ">
                            <div class="row">
                                <div class="basic-carousel owl-carousel owl-theme">
                                    <div class="item">
                                        <!-- Card -->
                                        <div class="card border-light mb-4 m-1 animate-up-5">
                                            <a href="./single-space.html" class="position-relative">
                                                <img src="${path}/resources/assets/img/sample.png" class="card-img-top p-2 rounded-xl" alt="themesberg office" style="width: 440px; height: 343px">
                                            </a>
                                            <div class="col mt-lg-0 mt-3 d-flex flex-column text-center">
                                                <div>
                                                    <a href="#" class="btn btn-primary animate-up-2 mb-2">자세히 보기</a>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End of Card -->
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div>
                            <h5>지난 산책 메이트</h5>
                        </div>
                        <div class="container ">
                            <div class="row">
                                <div class="basic-carousel owl-carousel owl-theme">
                                    <div class="item">
                                        <!-- Card -->
                                        <div class="card border-light text-center">
                                            <div class="profile-thumbnail mx-auto mt-3">
                                                <img src="${path}/resources/assets/img/DongHun2.jpg" class="card-img-top rounded-circle border-0" alt="Jose Avatar">
                                            </div>
                                            <div class="card-body">
                                                <h2 class="h4 card-title mb-2">노는 동훈이</h2>
                                                <span class="card-subtitle text-gray font-weight-normal">동훈이랑
                                                    놀아요!</span>
                                            </div>
                                        </div>
                                        <!-- End of Card -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
   

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