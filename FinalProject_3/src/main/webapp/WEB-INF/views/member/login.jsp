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
    <style>
        .h3,
        .font-weight-bold,
        .font-weight-bolder,
        button,
        input {
            font-family: 'Jua', sans-serif;
        }
        
        .input-group-text .fas,
        .font-weight-bolder {
            color: #5E4D44;
        }
        
        .border {
            border: 2px solid #5E4D44;
        }
        
        .rounded {
            border-radius: 3rem !important;
        }
        
        .h3 {
            font-size: 2rem;
        }
        
        .form-control,
        .input-group-text {
            border: 0.0625rem solid #5E4D44;
            color: #5E4D44;
        }
        
        #login {
            font-size: 20px;
            letter-spacing: 3px;
        }
    </style>

</head>

<body>
    <main>


        <!-- Section -->
        <div style="background: linear-gradient(to bottom, #BA9F81 55%, white 45%); margin-bottom: 100px; ">
            <section class="min-vh-100 d-flex align-items-center section-image  py-5 py-lg-0">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-12">
                            <div class="text-center text-md-center mb-4 mt-md-0 text-white">
                                <h1 class="mb-0 h3">견 과 류</h1>
                            </div>
                        </div>
                        <div class="col-12 d-flex align-items-center justify-content-center">
                            <div class="signin-inner mt-3 mt-lg-0 bg-white shadow-soft rounded  p-4 p-lg-5 w-100 fmxw-500" style="border: 1.5px solid #5E4D44;">
                                <form id="loginForm" action="${path}/login" method="post">
                                    <!-- Form -->
                                    <div class="form-group">
                                        <label for="userId" class="font-weight-bolder">아이디</label>
                                        <div class="input-group mb-4">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"><span class="fas fa-dog" ></span></span>
                                            </div>
                                            <input class="form-control" id="id" name="userId" placeholder="아이디를 입력하세요" type="text" aria-label="id" required>
                                        </div>
                                    </div>
                                    <!-- End of Form -->
                                    <div class="form-group">
                                        <!-- Form -->
                                        <div class="form-group">
                                            <label for="password" class="font-weight-bolder">비밀번호</label>
                                            <div class="input-group mb-4">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text"><span class="fas fa-unlock-alt"></span></span>
                                                </div>
                                                <input class="form-control" id="userPwd" name="userPwd" placeholder="비밀번호를 입력하세요" type="password" aria-label="Password" required>
                                            </div>
                                        </div>
                                        <!-- End of Form -->
                                    </div>
                                    <button type="submit" id="login" class="btn btn-block btn-primary">로그인</button>
                                </form>
                                <div class="d-block d-sm-flex justify-content-center align-items-center " style="margin-top: 10px;">
                                    <span class="font-weight-normal"> 
                                    <a href="${path}/member/enroll" class="font-weight-bold">회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
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