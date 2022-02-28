<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<c:set var="path" value="${pageContext.request.contextPath}"/>    
 <div class="container mt-n10 " >
            <div class="row ">
                <div class="col">
                    <div class="testimonial-carousel owl-carousel owl-theme mt-8" >
	                <c:if test="${ list == null }">
							<tr>
								<td colspan="2">조회된 게시글이 없습니다.</td>
							</tr>
						</c:if>
										
						<c:if test="${ list != null }">
	                    	<c:forEach var="park" items="${ list }">
                        		<div class="item p-3">
		                            <div class="card text-text-left mb-4 " style="border-color: #5E4D44;">
		                                <div class="card-body py-4" style="height: 230px;">
		                                    <table class="mt-3 " onclick="panTo(${park.latitude},${park.longitude })">
		                                        <tr>
		                                            <td>
		                                                <a class="h5" style="color: #BA9F81; ">
		                                                	<c:out value="${ park.parkNm }"></c:out>
		                                                </a>
		                                            </td>
		                                        </tr>
		                                    </table>
		                                    
		                                    <table class="mt-4 ml-2 mb-3 text-surroundAir">
	                                        	<tr class="mt-2">
	                                            	<td>
	                                            		<svg style="color: #5E4D44;" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="mr-2 bi bi-geo-alt-fill" viewBox="0 0 16 16">
	  														<path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"/>
														</svg>
	                                            	</td>
	                                            	<td><c:out value="${ park.inmadr }" /></td>
		                                        	<td><span></span></td>
	                                        	</tr>
		                                        <tr>
		                                        	<td>
		                                            	<svg style="color: #5E4D44;" xmlns="http://www.w3.org/2000/svg " width="20 " height="20 " fill="currentColor " class="mr-2 bi bi-telephone-fill " viewBox="0 0 16 16 ">
		                                                	<path fill-rule="evenodd " d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.7451.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z "/>
		                                                </svg>
		                                            </td>
		                                            <c:if test="${ park.phoneNumber != null }">
			                                            <td><c:out value="${ park.phoneNumber }" /></td>
		                                            </c:if>
		                                        </tr>	
	                                    	</table>
	                                	</div>
	                            	</div>
	                        	</div>
                        	</c:forEach>
                    	</c:if>
	                	 
                    </div>
                </div>
            </div>
        </div>
	                	 
    
   
    
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = { 
	    center: new kakao.maps.LatLng(${lat}, ${lng}), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	}; 
	
	//지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	<c:forEach var="park" items="${list}">
	var marker${wp.party_no} = new kakao.maps.Marker({
	    map: map, // 마커를 표시할 지도
	    position: new kakao.maps.LatLng(${park.latitude},${park.longitude}), // 마커를 표시할 위치
	});
	</c:forEach>	

	function setCenter() {            
	// 이동할 위도 경도 위치를 생성합니다 
	var moveLatLon = new kakao.maps.LatLng(33.452613, 126.570888);
	
	// 지도 중심을 이동 시킵니다
	map.setCenter(moveLatLon);
	}
	
	function panTo(lat,lng) {
	// 이동할 위도 경도 위치를 생성합니다 
	var moveLatLon = new kakao.maps.LatLng(lat, lng);
	
	// 지도 중심을 부드럽게 이동시킵니다
	// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
	map.panTo(moveLatLon);            
	}
	
	
</script>

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
