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
  <style>
               
        .border {
            color: #5E4D44;
            border-style: solid;
            border-width: 5px;
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
	.blog-prc {
	display: flex;
	align-items: center;
	justify-content: center;

}
    </style>

</head>

<body>

    <main>

        <!-- Hero -->
        <section class="section section-header bg pb-12" style="background-color: rgba(253, 225, 148,1)">
            <div class="container ">
                <div class="row justify-content-between align-items-center mx-6">
                    <div class="col-12 col-md-5 order-lg-1 ">
                        <h4 class="display-4  mb-0 " style="text-align: center; color: #5E4D44;">오늘 당신의 산책메이트는<br> 누구인가요?<br></h4>
                        <br>
                            <div class="col-12 mt-4">
                                <button class="btn btn-lg btn-primary btn-block animate-up-2 font-medium border-0" style="background-color: #a38778; " type="button" onclick="location.href='${path}/park/list'">내 주변 공원 찾기</button>
                            </div>
                            <div class="col-12 mt-4">
                                <button class="btn btn-lg btn-primary btn-block animate-up-2 font-medium border-0" style="background-color: #5E4D44;" type="button" onclick="location.href='${path}/walking/view'">내 위치로 산책 메이트 찾기</button>
                            </div>
                    </div>
                    <div class="col-12 col-md-7 order-lg-2 d-none d-md-block">
                        <!-- Image --><img src="${path}/resources/images/main.png" class="img-fluid" alt="Forest Illustration">
                    </div>
                </div>
            </div>
        </section>
<div id="wp" class="mt-n6 mb-n8 blog-prc" style="height: 843px">
       
      </div>
        <section class="section section-lg pt-0 mx-11">
            <div class="container ">
                <div class="row ">
                    <div class="col-12" style="color: #5E4D44;">
                        <h3 class=" mb-5 " style="color: #5E4D44;"><span class="fas fa-hospital mr-2" style="color: #5E4D44;"></span> 인기 공원 </h3>
                    </div>
                </div>
                <div class="row d-none d-lg-block ">
                    <div class="col-12 ">
                        <!-- Cities -->
                        <div class="form-row ">
                            <div class="col-4 ">
                                <!-- Card -->
                                <a href="http://localhost/nuts/park/best?no=1" class="card img-card fh-170 border-0 outer-bg " style="border-radius: 20px;" data-background-inner="${path }/resources/images/보라매공원.png">
                                    <div class="inner-bg overlay-github "></div>
                                    <div class="card-img-overlay d-flex align-items-center ">
                                        <div class="card-body text-white p-3 " }>
                                            <h5 class="text-uppercase text-center ">보라매 공원</h5>
                                        </div>
                                    </div>
                                   
                                </a>
                                <!-- End of Card -->
                            </div>
                            <div class="col-3 ">
                                <!-- Card -->
                                <a href="http://localhost/nuts/park/best?no=2" class="card img-card fh-80 border-0 outer-bg mb-2 " style="border-radius: 20px;" data-background-inner="${path }/resources/images/노을공원.png ">
                                    <div class="inner-bg overlay-github "></div>
                                    <div class="card-img-overlay d-flex align-items-center ">
                                        <div class="card-body text-white p-3 ">
                                            <h6 class="text-center mb-1 ">노을 공원</h6>
                                        </div>
                                    </div>
                                </a>
                                <!-- End of Card -->
                                <!-- Card -->
                                <a href="http://localhost/nuts/park/best?no=4" class="card img-card fh-80 border-0 outer-bg " style="border-radius: 20px;" data-background-inner="${path }/resources/images/선유도공원.png">
                                    <div class="inner-bg overlay-github "></div>
                                    <div class="card-img-overlay d-flex align-items-center ">
                                        <div class="card-body text-white p-3 ">
                                            <h6 class="text-center mb-1 ">선유도 공원</h6>
                                        </div>
                                    </div>
                                </a>
                                <!-- End of Card -->
                            </div>
                            <div class="col-5 ">
                                <div class="form-row mb-2 ">
                                    <div class="col-5 ">
                                        <!-- Card -->
                                        <a href="http://localhost/nuts/park/best?no=3" class="card img-card fh-170 border-0 outer-bg " style="border-radius: 20px;" data-background-inner="${path }/resources/images/서울숲공원.png  ">
                                            <div class="inner-bg overlay-github "></div>
                                            <div class="card-img-overlay d-flex align-items-center ">
                                                <div class="card-body text-white p-3 ">
                                                    <h5 class="font-weight-normal text-uppercase text-center ">서울숲</h5>
                                                </div>
                                            </div>
                                        </a>
                                        <!-- End of Card -->
                                    </div>
                                    <div class="col-7 ">
                                        <!-- Card -->
                                        <a href="http://localhost/nuts/park/best?no=5" class="card img-card fh-170 border-0 outer-bg " style="border-radius: 20px;" data-background-inner="${path }/resources/images/한강공원.png">
                                            <div class="inner-bg overlay-github "></div>
                                            <div class="card-img-overlay d-flex align-items-center ">
                                                <div class="card-body text-white p-3 ">
                                                    <h5 class="text-uppercase text-center ">한강 공원</h5>
                                                </div>
                                            </div>
                                        </a>
                                        <!-- End of Card -->
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>




                <div class="row mt-6" style="color: #a38778;">
                    <!-- title -->
                    <div class="col-12" style="color: #5E4D44;">
                        <h3 class=" mb-3 " style="color: #5E4D44;"><span class="fas fa-hospital mr-2" style="color: #5E4D44;"></span> 동물 병원 </h3>
                    </div>
                    <!-- contents -->
                    <div class="col-12 section py-0">
                        <div class="container z-2 ">
                            <div class="row position-relative justify-content-center align-items-cente ">
                                <!-- Card -->
                                <div class="col-6 ">
                                    <p class="lead mb-4 ">
                                        <span class="font-weight-bold ">후기</span>가 좋은 <span class="font-weight-bold ">동물병원</span>을 알려드릴게요!
                                    </p>
                                    <br>
                                    <div class="row mb-4 list-group mb-3" style="height: 130px">
                                    	<c:forEach var="hp" items="${hospList}">
                                                <a  class="font-medium text-gray p-0 mb-3 "><span onclick="OnClickList('${hp.venue}')" class="fas fa-map-marker-alt mr-2 ">${hp.title}</span></a>
                                    	
                                    	</c:forEach>
                                    	<br>
                                    </div>
                                    	<a href="${path}/hospital/view">더 찾아보기<span class="fas fa-arrow-right fa-xs ml-2 "></span></a>

                                </div>

                                <div id="map" class="col-6 card border-github " style="border-radius: 30px;">
                                </div>
                            </div>
                        </div>
                    </div>



                </div>

                <div class="row mt-6 ">
                    <div class="col-12" style="color: #5E4D44;">
                        <h3 class=" mb-3 " style="color: #5E4D44;"> <span class="fas fa-store mr-2 " style="color: #5E4D44;"></span> 넛츠 마켓 인기 상품 </h3>
                    </div>
					
                    <c:forEach var="sp" items="${shopList}">
                    <div class="col-3 col-md-4 col-lg-3 overwrite-hidden" style="height: 317px">
                        <div class="card border-github mb-1 animate-up-5 " style="border-radius: 20px;height: 317px;">

                            <a href="${sp.link}" class="position-relative ">
                                <img src="${sp.image }" class="card-img-top p-2 rounded-xl " width="200px" height="200px" alt="themesberg office ">
                            </a>
                            <div class="card-body">
                                <a href="${sp.link}">
                                    <h4 class="h6 my-0" style="text-align: center; color: #a38778;">${sp.title }</h4>
                                </a>
                            </div>

                        </div>
                    </div>
                    </c:forEach>
                    
                    
                    </div>
                    <br>
                 	<a href="${path}/shop/search">더 찾아보기<span class="fas fa-arrow-right fa-xs ml-2 "></span></a>
                    
                    
                 
                <div class="row">
                    <div class=" col-6 mt-7">
                        <!-- title -->
                        <div class="col" style="color: #5E4D44;">
                            <h3 class="mb-3 mx-4 " style="color: #5E4D44;"> <span style="color: #5E4D44;"></span> 공지사항</h3>
                        </div>
                        <!-- contents -->
                        <div class="col-12 ">
                            <!-- Card -->
                            <div class="card border-github animate-up-1 px-4" style="border-radius: 20px;">
                                <table class="table table-hover " style="text-align: center; ">
                                    <thead>
                                        <tr class="h5">
                                            <th>No</th>
                                            <th>제목</th>
                                            <th>Date</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="notice" items="${noticeList}">
                                        <tr>
                                            <td>${notice.notice_no }</td>
                                            <td><a href="${path }/notice/view?notice_no=${notice.notice_no} ">${notice.title }</a></td>
                                            <td>${fn:substring(notice.write_date,0,10)}</td>
                                        </tr>
                                        
                                    	</c:forEach>
                                        
                                    </tbody>
                                </table>

                            </div>
                            <!-- End of Card -->
                        </div>
                    </div>



                    <div class="col-6 mt-7">
                        <!-- title -->
                        <div class="col" style="color: #5E4D44;">
                            <h3 class="mb-3" style="color: #5E4D44;"> <span style="color: #5E4D44;"></span> Best 핫도그</h3>
                        </div>


                        <!-- contents -->
                        <div class="col-12">
                            <!-- Card -->
                            <div class="card border-github mb-4 animate-up-1 px-4 " style="border-radius: 20px;">
                                <table class="table table-hover " style="text-align: center; ">
                                    <thead>
                                        <tr class="h5">
                                            <th>No</th>
                                            <th>제목</th>
                                            <th>Date</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="hotdog" items="${hotdogList}">
                                        <tr>
                                            <td>${hotdog.hot_no }</td>
                                            <td><a href="${path }/hotdog/detail?hot_no=${hotdog.hot_no} ">${hotdog.title }</a></td>
                                            <td>${fn:substring(hotdog.write_date,0,10)}</td>
                                        </tr>
                                    	</c:forEach>
                                       
                                    </tbody>
                                </table>

                            </div>
                            <!-- End of Card -->
                        </div>
                    </div>
                </div>


                <!-- Section -->
            </div>
        </section>

    </main>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script type="text/javascript">
	var mapContainer = document.getElementById('map'); // 지도를 표시할 div  
    var mapOption = { center: new kakao.maps.LatLng(37.555744, 126.970431), level: 5 };

    var map = new kakao.maps.Map(mapContainer, mapOption); 
    
    navigator.geolocation.getCurrentPosition(function(position) {
   	    var lat = position.coords.latitude,
   	        lon = position.coords.longitude;
   	    
   	 var latLon = new kakao.maps.LatLng(lat, lon);

     map.setCenter(latLon);
		 });
		 
			var geocoder = new kakao.maps.services.Geocoder();
		 <c:forEach var="hp" items="${hospList}">
			geocoder.addressSearch('${hp.venue}', function(result, status) {
				if (status === kakao.maps.services.Status.OK) {
					var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					var marker${hp.rnum} = new kakao.maps.Marker({
					map: map,
					position: coords
					});
				} 
			});
		</c:forEach>
		 function OnClickList(venue){
		var geocoder = new kakao.maps.services.Geocoder();
         		geocoder.addressSearch(venue, function(result, status) {
                    if (status === kakao.maps.services.Status.OK) {
                  	  console.log(result[0].y,result[0].x);
                       var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                       map.setCenter(coords);
                       
               		} 
                  });
         		
           	 }
	
	navigator.geolocation.getCurrentPosition(function(position) {
	    var lat = position.coords.latitude,
	        lon = position.coords.longitude;
	    $.ajax({ 
			type : "GET",
			url : "${path}/home/wpAjax",
			data : {
				lat, lon
			},
			success : function (result) {
				$("#wp").html(result);
			},
			error : function (e) {
				$("#wp").html("에러<br>" + e);
			},
		});
	});
	
	</script>


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