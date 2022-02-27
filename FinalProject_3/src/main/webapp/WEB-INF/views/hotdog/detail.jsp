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
    <title>게시글</title>
    <meta name="title" content="게시글 작성하기">
    <meta name="author" content="Themesberg">
    <meta name="description" content="Premium Directory Listing Bootstrap 4 Template featuring 37 hand-crafted pages, a dashboard an Mapbox integration. Spaces also comes with a complete UI Kit featuring over 700 components by Themesberg.">
    <meta name="keywords" content="bootstrap, bootstrap 4 template, directory listing bootstrap, bootstrap 4 listing, bootstrap listing, bootstrap 4 directory listing template, vector map, leaflet js template, mapbox theme, mapbox template, dashboard, themesberg, user dashboard bootstrap, dashboard bootstrap, ui kit, bootstrap ui kit, premium bootstrap theme"
    />
    <link rel="canonical" href="https://themesberg.s3.us-east-2.amazonaws.com/public/products/spaces/thumbnail.jpg">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Favicon -->
    <link rel="apple-touch-icon" sizes="120x120" href="${path}/resources/assets/img/favicon/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="${path}/resources/assets/img/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="${path}/resources/assets/img/favicon/favicon-16x16.png">
    <link rel="manifest" href="${path}/resources/assets/img/favicon/site.webmanifest">
    <link rel="mask-icon" href="${path}/resources/assets/img/favicon/safari-pinned-tab.svg" color="#ffffff">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="theme-color" content="#ffffff">

    <!-- Fontawesome -->
    <link type="text/css" href="${path}/resources/vendor/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <link href="https://webfontworld.github.io/Cafe24Ssurround/Cafe24Ssurround.css" rel="stylesheet">


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
        
        .font-jua {
            font-family: 'Jua', sans-serif;
            color: #7c6356;
        }
        
        .font-jua-lg {
            font-family: 'Jua', sans-serif;
            color: #7c6356;
            font-size: larger;
        }
        
        .font-surround {
            font-family: 'Cafe24Ssurround';
        }
        
        .bg {
            background-color: #fae3a5;
        }
        
        .bg-b {
            background-color: #f8f1de;
        }
        
        .btn {
            background-color: #7c6356;
            color: white;
        }
        
        .border-a {
            border: #5E4D44 solid 2px;
        }
        
        .border-c {
            border: #7c665a solid 10px;
        }
        
        .border-d {
            border: #7c665a solid 2px;
        }
    </style>
</head>

<body>
    <!-- Section -->
    <section>
        <div class="container">

            <div class="row justify-content-center">
                <div class="col-12 mt-3 d-flex align-items-center justify-content-center">
                    <div class="bg mt-8 rounded p-5 w-100 fmxw-700 border-d">

                        <div class="d-flex text-left mb-1 align-items-center">
                            <div class="col-md-4 col-6 p-3" >
                                <img src="${path}/resources/upload/member/${hotdog.profile}" style="background-color: white" class="border-c rounded-circle" alt="">
                            </div>
                            <div>
                                <label for="hotdog_title" class="font-jua-lg col-sm-12"> ${hotdog.title }</label>
                                <label for="nickname" class="font-jua pl-3" style="color: #c7a694;"> ${hotdog.nick_name }</label>
                                <label for="LIKE" class="pl-3 font-jua align-self-baseline" style="color: #c7a694;">좋아요 ${hotdog.count }</label>
                            </div>
                        </div>
                        <!-- Carousel -->
                         <c:if test="${hotdog.re_filename != null}">
                        <div id="demo" class="carousel slide" data-bs-ride="carousel">

                            <!-- Indicators/dots -->
                            <div class="carousel-indicators">
                           <c:forEach var="file" items="${fileList}" varStatus="vs">
                   				<c:if test="${vs.first}">
	                                <button type="button" data-bs-target="#demo" data-bs-slide-to="${vs.index}" class="active"></button>
								</c:if>
								<c:if test="${!vs.first}">
    	                            <button type="button" data-bs-target="#demo" data-bs-slide-to="${vs.index}"></button>
								</c:if>
							</c:forEach>
                            </div>

                           	
	                            <div class="carousel-inner rounded border-d">
									<c:forEach var="file" items="${fileList}" varStatus="vs">
										
										<c:if test="${vs.first}">
										 	<div class="carousel-item active">
	                                    		<img src="${path}/resources/upload/hotdog/${file}" class="d-block" style="width: 800px; height: 600px">
	                                		</div>
										</c:if>
										<c:if test="${!vs.first}">
											<div class="carousel-item">
			                                    <img src="${path}/resources/upload/hotdog/${file}" class="d-block" style="width: 800px; height: 600px">
			                                </div>
										</c:if>
									</c:forEach>
	
	
	                                <!-- Left and right controls/icons -->
	                                <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev"><span class="carousel-control-prev-icon"></span></button>
	                                <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next"><span class="carousel-control-next-icon"></span></button>
	                            </div>
                          



                        </div>
                          </c:if>
                        <div class="card col-12 bg-white rounded mt-5 border-d" style="height: auto;">
                            <div class="card-body font-jua">
                                ${hotdog.content }
                            </div>
                        </div>

                    </div>
                </div>
            </div>


            <div class="container mb-5">
                <div class="row text-center">
	                    <div class="text-center ml-auto mx-2">
                <c:if test="${loginMember != null }">
					<c:if test="${like ==null }">
	                        <button class="btn btn-primary btn-dark mt-4 animate-up-2 text-center px-6" onclick="location.href='${path }/hotdog/like?hot_no=${hotdog.hot_no}&member_id=${loginMember.id}'" >
	                    	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
							  <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
							</svg>
	                    	</button>
					</c:if> 
					<c:if test="${like !=null }">
	                        <button class="btn btn-primary btn-dark mt-4 animate-up-2 text-center px-6" onclick="location.href='${path }/hotdog/delete?hl_id=${like.hl_id}&hot_no=${hotdog.hot_no}'" style="color: red" >
	                    	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
							  <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
							</svg>
	                    	</button>
					</c:if>
					<c:if test="${loginMember.id == hotdog.write}"> 
					 		<button class="btn btn-primary btn-dark mt-4 animate-up-2 text-center px-6" onclick="location.href='${path }/hotdog/edit?hot_no=${hotdog.hot_no}'" >
	                    		게시글 수정
	                    	</button>                  	
					 		<button class="btn btn-primary btn-dark mt-4 animate-up-2 text-center px-6" onclick="location.href='${path }/hotdog/delete?hl_id=${like.hl_id}&hot_no=${hotdog.hot_no}'" >
	                    		게시글 삭제
	                    	</button>     
	                </c:if>             	
	                    </div>
                </c:if>
                    <div class="d-block d-sm-flex justify-content-center align-items-center mt-4 mb-5">
                        <a href="${path }/hotdog/list" style="color : #977d6f;">목록으로</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    </main>
    
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
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