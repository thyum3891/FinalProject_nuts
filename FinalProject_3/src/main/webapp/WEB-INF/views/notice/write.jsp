<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="게시글 수정" name="title"/>
</jsp:include>
  
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-- Primary Meta Tags -->
    <title>공지사항 작성하기</title>
    <meta name="title" content="공지사항 작성하기">
    <meta name="author" content="Themesberg">
    <meta name="description" content="Premium Directory Listing Bootstrap 4 Template featuring 37 hand-crafted pages, a dashboard an Mapbox integration. Spaces also comes with a complete UI Kit featuring over 700 components by Themesberg.">
    <meta name="keywords" content="bootstrap, bootstrap 4 template, directory listing bootstrap, bootstrap 4 listing, bootstrap listing, bootstrap 4 directory listing template, vector map, leaflet js template, mapbox theme, mapbox template, dashboard, themesberg, user dashboard bootstrap, dashboard bootstrap, ui kit, bootstrap ui kit, premium bootstrap theme"
    />
    <link rel="canonical" href="https://themesberg.s3.us-east-2.amazonaws.com/public/products/spaces/thumbnail.jpg">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>



    <!-- Favicon -->
    <link rel="apple-touch-icon" sizes="120x120" href="../assets/img/favicon/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="../assets/img/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="../assets/img/favicon/favicon-16x16.png">
    <link rel="manifest" href="../assets/img/favicon/site.webmanifest">
    <link rel="mask-icon" href="../assets/img/favicon/safari-pinned-tab.svg" color="#ffffff">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="theme-color" content="#ffffff">

    <!-- Fontawesome -->
    <link type="text/css" href="../vendor/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">


    <!-- Leaflet JS -->
    <link type="text/css" href="../vendor/leaflet/dist/leaflet.css" rel="stylesheet">

    <!-- Fancybox -->
    <link rel="stylesheet" href="../vendor/@fancyapps/fancybox/dist/jquery.fancybox.min.css">

    <!-- VectorMap -->
    <link rel="stylesheet" href="../vendor/jqvmap/dist/jqvmap.min.css">

    <!-- Main CSS -->
    <link type="text/css" href="../css/spaces.css" rel="stylesheet">

    <!-- NOTICE: You can use the _analytics.html partial to include production code specific code & trackers -->
    <style>
        body {
            font-family: 'Jua', sans-serif;
        }
        
        .font {
            font-family: 'Jua', sans-serif;
            color: #7c6356;
            font-size: large;
        }
        
        .btn {
            background-color: #7c6356;
            color: white;
        }
        
        .border-a {
            border: #5E4D44 solid 2px;
        }
    </style>
</head>

<body>
    <!-- Section -->
    <form action="${ path }/notice/write" method="post" enctype="multipart/form-data">
    <section class="d-flex align-items-center section-image py-lg-0">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 ">
                    <div class="col-12 mt-3 d-flex align-items-center justify-content-center">
                        <div class="bg mt-8 rounded p-5 w-100 fmxw-700 border-a ">

                            <!-- Form -->
                            

                                <div class="col-12 text-center mb-5 mt-md-3">
                                    <h5 class="mb-0 font" style="color: #5E4D44;">공지사항</h5>
                                </div>


                                <div class="col-12 px-3">

                                    <input class="form-control" type="text" id="notice_title" placeholder="제목" name="title" required>

                                </div>
                                <div class="col-12 d-flex">
                                    <input class="col-md-8 my-3 form-control mr-lg-5" disabled="disabled" id="notice_file" placeholder="파일없음" name="notice_file">
                                    <label class="btn col-md-3 my-3 btn-dark animate-up-2" style="background-color: #a38778; border-color: #a38778; font-color : white;" >
                                        파일 업로드<input type="file" onchange="change(this.value)" name="upfile" hidden></label>
                                </div>

                                <div class="slideform-group col-12">
                                    <textarea class="form-control my-3" placeholder="" id="notice_Textarea" name="content" rows="12" required></textarea>
                                </div>
                                <input type="text" value="${loginMember.id}" name="writer" hidden>
                           
                            <!-- End of Form -->

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section>
        <div class="container mb-5">
            <div class="text-center">
                <button class="btn btn-dark mt-4 animate-up-2 text-center px-7" type="submit" style="background-color: #5E4D44; border-color: #5E4D44;" >
            작성하기 </button>
               
            </div>
            <div class="d-block d-sm-flex justify-content-center align-items-center mt-4">
                <a href="21_notice_list.html" style="color : #977d6f; ">목록으로</a>
            </div>
        </div>
    </section>
         </form>
    </main>
	
	 <script type="text/javascript">
    	function change(value){
    		$("#notice_file").val(value);
    		
    	}
    </script>

    <!-- Core -->
    <script src="../vendor/jquery/dist/jquery.min.js "></script>
    <script src="../vendor/popper.js/dist/umd/popper.min.js "></script>
    <script src="../vendor/bootstrap/dist/js/bootstrap.min.js "></script>
    <script src="../vendor/headroom.js/dist/headroom.min.js "></script>
    <script src="../vendor/onscreen/dist/on-screen.umd.min.js "></script>

    <!-- NoUISlider -->
    <script src="../vendor/nouislider/distribute/nouislider.min.js "></script>

    <!-- Bootstrap Datepicker -->
    <script src="../vendor/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js "></script>

    <!-- jQuery Waypoints -->
    <script src="../vendor/waypoints/lib/jquery.waypoints.min.js "></script>

    <!-- Owl acrousel -->
    <script src="../vendor/owl.carousel/dist/owl.carousel.min.js "></script>

    <!-- Smooth scroll -->
    <script src="../vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js "></script>

    <!-- Fancybox -->
    <script src="../vendor/@fancyapps/fancybox/dist/jquery.fancybox.min.js "></script>

    <!-- Sticky sidebar -->
    <script src="../vendor/sticky-sidebar/dist/sticky-sidebar.min.js "></script>

    <!-- Mapbox & Leaflet.js -->
    <script src="../vendor/leaflet/dist/leaflet.js "></script>

    <!-- Chartist -->
    <script src="../vendor/chartist/dist/chartist.min.js "></script>
    <script src="../vendor/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js "></script>

    <!-- Vector Maps -->
    <script src="../vendor/jqvmap/dist/jquery.vmap.min.js "></script>
    <script src="../vendor/jqvmap/dist/maps/jquery.vmap.usa.js "></script>

    <!-- Sliderform -->
    <script src="../assets/js/jquery.slideform.js "></script>

    <!-- Spaces custom Javascript -->
    <script src="../assets/js/spaces.js "></script>
</body>

</html>