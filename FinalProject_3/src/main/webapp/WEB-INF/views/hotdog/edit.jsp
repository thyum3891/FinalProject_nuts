<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-- Primary Meta Tags -->
    <title>HOTDOG</title>
    <meta name="title" content="게시글 작성하기">
    <meta name="author" content="Themesberg">
    <meta name="description" content="Premium Directory Listing Bootstrap 4 Template featuring 37 hand-crafted pages, a dashboard an Mapbox integration. Spaces also comes with a complete UI Kit featuring over 700 components by Themesberg.">
    <meta name="keywords" content="bootstrap, bootstrap 4 template, directory listing bootstrap, bootstrap 4 listing, bootstrap listing, bootstrap 4 directory listing template, vector map, leaflet js template, mapbox theme, mapbox template, dashboard, themesberg, user dashboard bootstrap, dashboard bootstrap, ui kit, bootstrap ui kit, premium bootstrap theme"
    />
    <link rel="canonical" href="https://themesberg.s3.us-east-2.amazonaws.com/public/products/spaces/thumbnail.jpg">

    <!-- Favicon -->
    <link rel="apple-touch-icon" sizes="120x120" href="${path}/resources/assets/img/favicon/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="${path}/resources/assets/img/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="${path}/resources/assets/img/favicon/favicon-16x16.png">
    <link rel="manifest" href="${path}/resources/assets/img/favicon/site.webmanifest">
    <link rel="mask-icon" href="${path}/resources/assets/img/favicon/safari-pinned-tab.svg" color="#ffffff">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="theme-color" content="#ffffff">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Fontawesome -->
    <link type="text/css" href="${path}/resources/vendor/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">


    <!-- Leaflet JS -->
    <link type="text/css" href="${path}/resources/vendor/leaflet/dist/leaflet.css" rel="stylesheet">

    <!-- Fancybox -->
    <link rel="stylesheet" href="${path}/resources/vendor/@fancyapps/fancybox/dist/jquery.fancybox.min.css">

    <!-- VectorMap -->
    <link rel="stylesheet" href="${path}/resources/vendor/jqvmap/dist/jqvmap.min.css">

    <!-- Main CSS -->
    <link type="text/css" href="${path}/resources/css/spaces.css" rel="stylesheet">

    <!-- NOTICE: You can use the _analytics.html partial to include production code specific code & trackers -->
    <style>
        body {
            font-family: 'Jua', sans-serif;
        }
        
        .font {
            font-family: 'Jua', sans-serif;
            color: #7c6356;
        }
        
        .bg {
            background-color: #fae3a5;
        }
        
        .btn {
            background-color: #5f4f46;
            border-color: #5E4D44;
            color: rgb(255, 255, 255);
        }
        
        .border-a {
            border: #5E4D44 solid 2px;
        }
    </style>
</head>

<body>
    <!-- Section -->
    <form action="${path}/hotdog/edit" method="post" enctype="multipart/form-data">
    <input type="text" name="write" value="${loginMember.id}" hidden>
    <input>
    <section class="min-vh-100 d-flex align-items-center section-image">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 ">
                    <div class="col-12 mt-3 d-flex align-items-center justify-content-center">
                        <div class="bg mt-8 rounded p-5 w-100 fmxw-700 border-a ">

                            <!-- Form -->
                            

                                <div class="col-12 text-center mb-5 mt-md-3">
                                    <h5 class="mb-0 font" style="color: #5E4D44;">핫도그</h5>
                                </div>


                                <div class="col-12 px-3">

                                    <input class="form-control" type="text" id="hotdog_title" name="title" placeholder="제목" name="hotdog_title" value="${hotdog.title}" required>

                                </div>
                                <div class="col-12 d-flex">
                                    <input class="col-md-8 my-3 form-control mr-lg-5" id="hotdog_file" value="${hotdog.re_filename }" name="hotdog_file">
                                    <label class="btn col-md-3 my-3 btn-dark animate-up-2" style="background-color: #a38778; border-color: #a38778; font-color : white;">
                                       파일 업로드<input id="input_file_hotdog" name="upfiles" type="file" hidden onchange="change(this.value)"multiple="multiple" accept=".jpg, .jpeg, .png"></label>
                            </div>

                                <div class="slideform-group col-12">
                                    <textarea class="form-control my-3" placeholder="" id="notice_Textarea" name="content" rows="12" required>${hotdog.content}</textarea>
                                </div>
                            
                            <!-- End of Form -->

                        </div>
                    </div>
                </div>
            </div>


            <div class="container mb-5 d-flex justify-content-center">
                <div class="row">
                    <div class="col-12 d-flex justify-content-center">
                        <button class="btn mx-2 px-6 btn-dark mt-4 animate-up-2" type="submit">수정하기</button>
                        <button class="btn mx-2 px-6 btn-dark mt-4 animate-up-2" onclick="location.href='${path}/hotdog/delete?hot_no=${hotdog.hot_no}'">삭제하기</button>
                    </div>
                    <div class="col-12 mb-5 d-block d-flex justify-content-center align-items-center mt-4 ">
                        <a href="${path}/hotdog/list" style="color : #977d6f; ">목록으로</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    </form>

    </main>
       <script type="text/javascript">
    	function change(value){
    		$("#hotdog_file").val(value);
    		
    	}
    </script>
        <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

   

  
    </div>
   <!-- Core -->
    <script src="${path}/resources/vendor/jquery/dist/jquery.min.js "></script>
    <script src="${path}/resources/vendor/popper.js/dist/umd/popper.min.js "></script>
    <script src="${path}/resources/vendor/bootstrap/dist/js/bootstrap.min.js "></script>
    <script src="${path}/resources/vendor/headroom.js/dist/headroom.min.js "></script>
    <script src="${path}/resources/vendor/onscreen/dist/on-screen.umd.min.js "></script>

    <!-- NoUISlider -->
    <script src="${path}/resources/vendor/nouislider/distribute/nouislider.min.js "></script>

    <!-- Bootstrap Datepicker -->
    <script src="${path}/resources/vendor/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js "></script>

    <!-- jQuery Waypoints -->
    <script src="${path}/resources/vendor/waypoints/lib/jquery.waypoints.min.js "></script>

    <!-- Owl acrousel -->
    <script src="${path}/resources/vendor/owl.carousel/dist/owl.carousel.min.js "></script>

    <!-- Smooth scroll -->
    <script src="${path}/resources/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js "></script>

    <!-- Fancybox -->
    <script src="${path}/resources/vendor/@fancyapps/fancybox/dist/jquery.fancybox.min.js "></script>

    <!-- Sticky sidebar -->
    <script src="${path}/resources/vendor/sticky-sidebar/dist/sticky-sidebar.min.js "></script>

    <!-- Mapbox & Leaflet.js -->
    <script src="${path}/resources/vendor/leaflet/dist/leaflet.js "></script>

    <!-- Chartist -->
    <script src="${path}/resources/vendor/chartist/dist/chartist.min.js "></script>
    <script src="${path}/resources/vendor/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js "></script>

    <!-- Vector Maps -->
    <script src="${path}/resources/vendor/jqvmap/dist/jquery.vmap.min.js "></script>
    <script src="${path}/resources/vendor/jqvmap/dist/maps/jquery.vmap.usa.js "></script>

    <!-- Sliderform -->
    <script src="${path}/resources/assets/js/jquery.slideform.js "></script>

    <!-- Spaces custom Javascript -->
    <script src="${path}/resources/assets/js/spaces.js "></script>
</body>

</html>