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

<!-- Fontawesome -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ffea6673691d899c7b831444d7cf6ba1&libraries=services"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>
.bubble {
	position:relative; 
	width: 360px; 
	height: 275px; 
	padding-top:30px;
	padding-left:40px;
	background:url('${path}/resources/images/bubble2.png') no-repeat;
}
	.th, td {
		color: #5E4D44;
		}
	.hpList {
		color: #5E4D44;
 	       }
	.hpList :hover {
         background-color: gray;
        }
</style>
</head>

<body>
	<main>
		<section
			class="section section-header section-image bg-nuts text-white overflow-dot pb-7">
			<div class="container">
			<form action="${ path }/hospital/view">
				<div class="row justify-content-center mt-50">
					<div class="col-9 text-center">
						<div class="card border-primary p-md-2">
							<div class="row ml-1">
								<div class="col-12 mt-3">
									<div class="row align-items-center">
										<h4 class="ml-3 mt-2" style="color: #5E4D44;">동물병원 조회하기</h4>
									</div>
								</div>
							</div>
							<div class="row ml-1">
								<div class="col-12 mb-4 mt-1">
									<div class="row">
										<div class="col-12 col-lg-4">
											<div class="form-group form-group-lg mb-lg-0">
												<div class="input-group input-group-lg mt-3">
													<div class="input-group-prepend">
														<span class="input-group-text"
															style="border-color: #5E4D44;"> <svg
																style="color: #5E4D44;"
																xmlns="http://www.w3.org/2000/svg" width="22"
																height="22" fill="currentColor" class="bi bi-map"
																viewBox="0 0 16 16">
                                                                <path
																	fill-rule="evenodd"
																	d="M15.817.113A.5.5 0 0 1 16 .5v14a.5.5 0 0 1-.402.49l-5 1a.502.502 0 0 1-.196 0L5.5 15.01l-4.902.98A.5.5 0 0 1 0 15.5v-14a.5.5 0 0 1 .402-.49l5-1a.5.5 0 0 1 .196 0L10.5.99l4.902-.98a.5.5 0 0 1 .415.103zM10 1.91l-4-.8v12.98l4 .8V1.91zm1 12.98 4-.8V1.11l-4 .8v12.98zm-6-.8V1.11l-4 .8v12.98l4-.8z" />
                                                            </svg>
														</span>
													</div>
													<select class="custom-select text-surroundAir" id="addr"
														name="addr" style="border-color: #5E4D44;" value="${addr}">
														<option value="">서울특별시</option>
														<option value="강남구">강남구</option>
														<option value="강동구">강동구</option>
														<option value="강북구">강북구</option>
														<option value="강서구">강서구</option>
														<option value="관악구">관악구</option>
														<option value="광진구">광진구</option>
														<option value="구로구">구로구</option>
														<option value="금천구">금천구</option>
														<option value="노원구">노원구</option>
														<option value="도봉구">도봉구</option>
														<option value="동대문구">동대문구</option>
														<option value="동작구">동작구</option>
														<option value="마포구">마포구</option>
														<option value="서대문구">서대문구</option>
														<option value="서초구">서초구</option>
														<option value="성동구">성동구</option>
														<option value="성북구">성북구</option>
														<option value="송파구">송파구</option>
														<option value="양천구">양천구</option>
														<option value="영등포구">영등포구</option>
														<option value="용산구">용산구</option>
														<option value="은평구">은평구</option>
														<option value="중구">중구</option>
														<option value="종로구">종로구</option>
														<option value="중랑구">중랑구</option>
													</select>
												</div>
											</div>
										</div>

										<div class="col-12 col-lg-5">
											<div class="form-group form-group-lg mb-lg-0">
												<div class="input-group input-group-lg mt-3">
													<div class="input-group-prepend">
														<span class="input-group-text"
															style="border-color: #5E4D44;"> <svg
																style="color: #5E4D44;"
																xmlns="http://www.w3.org/2000/svg" width="22"
																height="22" fill="currentColor" class="bi bi-hospital"
																viewBox="0 0 16 16">
                                                                <path
																	d="M8.5 5.034v1.1l.953-.55.5.867L9 7l.953.55-.5.866-.953-.55v1.1h-1v-1.1l-.953.55-.5-.866L7 7l-.953-.55.5-.866.953.55v-1.1h1ZM13.25 9a.25.25 0 0 0-.25.25v.5c0 .138.112.25.25.25h.5a.25.25 0 0 0 .25-.25v-.5a.25.25 0 0 0-.25-.25h-.5ZM13 11.25a.25.25 0 0 1 .25-.25h.5a.25.25 0 0 1 .25.25v.5a.25.25 0 0 1-.25.25h-.5a.25.25 0 0 1-.25-.25v-.5Zm.25 1.75a.25.25 0 0 0-.25.25v.5c0 .138.112.25.25.25h.5a.25.25 0 0 0 .25-.25v-.5a.25.25 0 0 0-.25-.25h-.5Zm-11-4a.25.25 0 0 0-.25.25v.5c0 .138.112.25.25.25h.5A.25.25 0 0 0 3 9.75v-.5A.25.25 0 0 0 2.75 9h-.5Zm0 2a.25.25 0 0 0-.25.25v.5c0 .138.112.25.25.25h.5a.25.25 0 0 0 .25-.25v-.5a.25.25 0 0 0-.25-.25h-.5ZM2 13.25a.25.25 0 0 1 .25-.25h.5a.25.25 0 0 1 .25.25v.5a.25.25 0 0 1-.25.25h-.5a.25.25 0 0 1-.25-.25v-.5Z" />
                                                                <path
																	d="M5 1a1 1 0 0 1 1-1h4a1 1 0 0 1 1 1v1a1 1 0 0 1 1 1v4h3a1 1 0 0 1 1 1v7a1 1 0 0 1-1 1H1a1 1 0 0 1-1-1V8a1 1 0 0 1 1-1h3V3a1 1 0 0 1 1-1V1Zm2 14h2v-3H7v3Zm3 0h1V3H5v12h1v-3a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3Zm0-14H6v1h4V1Zm2 7v7h3V8h-3Zm-8 7V8H1v7h3Z" />
                                                            </svg>
														</span>
													</div>
													<input style="color: #5E4D44; border-color: #5E4D44;"
														id="title" name="title" type="text"
														class="form-control autocomplete text-surroundAir"
														value="${title}" placeholder="병원명">
												</div>
											</div>
										</div>
										<div class="col-12 col-lg-3">
											<div class="form-group form-group-lg mb-lg-0">
												<div class="input-group input-group-lg mt-3">
													<button
														class="btn btn-lg btn-primary btn-block animate-up-2"
														type="submit"
														style="background-color: #5E4D44; border-color: #5E4D44; width: 10rem;">검색하기</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				</form>
			</div>
		</section>

		<div class="container mt-n10 mt-lg-n6 z-2 col-8">
			<div class="row">
				<div class="col-7">
					<div class="card border-primary mb-4 ">
						<div class="row">
							<div class="card-body" style="height: 630px; width: 900px">
								<table class="table ml-1">
									<thead>
										<tr scope="col " class="text-center font-base"
											style="color: #BA9F81;">
											<th>병원이름</th>
											<th>전화번호</th>
											<th>주소</th>
										</tr>
									</thead>


									<c:forEach var="hospital" items="${hospList}">

										<tr class="text-surroundAir text-center font-small hpList"
											style="cursor: pointer;"
											onclick="OnClickList('${hospital.venue}')">
											<td >${hospital.title}</td>

											<c:if test="${fn:startsWith(hospital.reference, '02')}">
												<td>${hospital.reference}</td>
											</c:if>
											<c:if test="${!(fn:startsWith(hospital.reference, '02'))}">
												<td>02-${hospital.reference}</td>
											</c:if>

											<td>${hospital.venue}</td>
										</tr>
									</c:forEach>

								</table>
							</div>
						</div>
					</div>

					<!-- 페이지바 시작 -->
					<div class="col mt-2 ">
						<nav aria-label="Page navigation example ">
							<ul class="pagination justify-content-center ">
								<li class="page-item mt-1 mr-3 "><a
									href="${ path }/hospital/view?pageStr=${pageInfo.prvePage}&addr=${addr}&title=${title}">
										<svg style="color: #5E4D44;"
											xmlns="http://www.w3.org/2000/svg " width="16 " height="16 "
											fill="currentColor " class="bi bi-caret-left-fill "
											viewBox="0 0 16 16 ">
                                        <path
												d="m3.86 8.753 5.482 4.796c.646.566 1.658.106 1.658-.753V3.204a1 1 0 0 0-1.659-.753l-5.48 4.796a1 1 0 0 0 0 1.506z " />
                                    </svg>
								</a></li>
								<c:forEach begin="${ pageInfo.startPage }"
									end="${ pageInfo.endPage }" step="1" varStatus="status">
									<c:if test="${ pageInfo.currentPage == status.current}">
										<li class="page-item active "><a class="page-link "
											href="# " disabled>${ status.current }</a></li>
									</c:if>
									<c:if test="${ pageInfo.currentPage != status.current}">
										<li class="page-item "><a class="page-link "
											style="color: #5E4D44;"
											href="${ path }/hospital/view?pageStr=${status.current}&addr=${addr}&title=${title}">${ status.current }</a>
										</li>
									</c:if>
								</c:forEach>
								<li class="page-item mt-1 ml-3 "><a
									href="${ path }/hospital/view?pageStr=${pageInfo.nextPage}&addr=${addr}&title=${title}">
										<svg style="color: #5E4D44;"
											xmlns="http://www.w3.org/2000/svg " width="16 " height="16 "
											fill="currentColor " class="bi bi-caret-right-fill "
											viewBox="0 0 16 16 ">
                                        <path
												d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z " />
                                    </svg>
								</a></li>
							</ul>
						</nav>
					</div>

					<!-- 페이지바 끝 -->
				</div>

				<!-- 지도 시작 -->
				<div class="col-5 ">
					<div id="map" class="card border-primary mb-3 mt-4 ">
						<div class="row no-gutters ">
							<div class="card px-7 py-2 " style="height: 580px;">
								<div id="mapListings"></div>
							</div>
						</div>
					</div>
				</div>
				<!-- 지도 끝 -->
			</div>

		</div>

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
                
			
                
                <c:forEach var="hp" items="${hospList}">
               
                	
                var geocoder = new kakao.maps.services.Geocoder();
             	geocoder.addressSearch('${hp.venue}', function(result, status) {
            	 
                  if (status === kakao.maps.services.Status.OK) {
                     var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                     var marker${hp.rnum} = new kakao.maps.Marker({
                         map: map,
                         position: coords
                     });
                     
                     var content${hp.rnum} = '<div class="bubble overflow-hidden"  >'+
                   	'<div class="row">'+
                   	
                   	'<table class="text-surroundAir"> '+
     	              	'<tr>'+
     	              		'<th colspan="3">'+
     	              			'${hp.title}'+
     	              			'<div style="position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;cursor: pointer;" onclick="closeOverlay${hp.rnum}()" >x</div>'+
     	              		'</th>'+
     	              	'</tr>'+
     	              	'<tr>'+
     		              	'<td>'+
     		              		'전화번호'+
     		              	'</td>'+
     		              	'<td>'+
     		              	'<br>:<br>'+
     		              	'</td>'+
     		              	'<td>'+
     		              		'${hp.reference}'+
     		              	'</td>'+
     	              	'</tr>'+
     	              	'<tr>'+
     			              	'<td>'+
     		              		'주소'+
     		              		'</td>'+
     		              		'<td>'+
     		              			'<br>:<br>'+
     		              		'</td>'+
     		              		'<td>'+
     		              			'${hp.venue}'+
     		              		'</td>'+
     	              		'</tr>'+
                   	'</table>'+
                   	'</div>'+
                   	'</div>';
                   
                   //마커 위에 커스텀오버레이를 표시합니다
                   //마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
                   	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
                   	  
                   var overlay${hp.rnum} = new kakao.maps.CustomOverlay({
                   content: content${hp.rnum},
                   map: map,
                   position: marker${hp.rnum}.getPosition(),
                   xAnchor: 0.5,
                   yAnchor: 1.15
                   });
                   overlay${hp.rnum}.setMap(null);

                   //마커를 클릭했을 때 커스텀 오버레이를 표시합니다
                   kakao.maps.event.addListener(marker${hp.rnum}, 'mouseover', function() {
                   	overlay${hp.rnum}.setMap(map);
                   });
                   kakao.maps.event.addListener(marker${hp.rnum}, 'mouseout', function() {
                	   overlay${hp.rnum}.setMap(null)
                   });

                   //커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
                  	overlay${hp.rnum}.setMap(null);
                     
                     
             		} 
                  
                 
                });
             </c:forEach>
             function OnClickList(venue){
          		geocoder.addressSearch(venue, function(result, status) {
                	 
                     if (status === kakao.maps.services.Status.OK) {
                   	  console.log(result[0].y,result[0].x);
                        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                        map.setCenter(coords);
                        
                		} 
                   });
          		
            	 }
   

 </script>

		<!-- Core -->
		<script src="${path}/resources/vendor/jquery/dist/jquery.min.js "></script>
		<script
			src="${path}/resources/vendor/popper.js/dist/umd/popper.min.js "></script>
		<script
			src="${path}/resources/vendor/bootstrap/dist/js/bootstrap.min.js "></script>
		<script
			src="${path}/resources/vendor/headroom.js/dist/headroom.min.js "></script>
		<script
			src="${path}/resources/vendor/onscreen/dist/on-screen.umd.min.js "></script>

		<!-- NoUISlider -->
		<script
			src="${path}/resources/vendor/nouislider/distribute/nouislider.min.js "></script>

		<!-- Bootstrap Datepicker -->
		<script
			src="${path}/resources/vendor/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js "></script>

		<!-- jQuery Waypoints -->
		<script
			src="${path}/resources/vendor/waypoints/lib/jquery.waypoints.min.js "></script>

		<!-- Owl acrousel -->
		<script
			src="${path}/resources/vendor/owl.carousel/dist/owl.carousel.min.js "></script>

		<!-- Smooth scroll -->
		<script
			src="${path}/resources/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js "></script>

		<!-- Fancybox -->
		<script
			src="${path}/resources/vendor/@fancyapps/fancybox/dist/jquery.fancybox.min.js "></script>

		<!-- Sticky sidebar -->
		<script
			src="${path}/resources/vendor/sticky-sidebar/dist/sticky-sidebar.min.js "></script>

		<!-- Mapbox & Leaflet.js -->
		<script src="${path}/resources/vendor/leaflet/dist/leaflet.js "></script>

		<!-- Chartist -->
		<script src="${path}/resources/vendor/chartist/dist/chartist.min.js "></script>
		<script
			src="${path}/resources/vendor/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js "></script>

		<!-- Vector Maps -->
		<script src="${path}/resources/vendor/jqvmap/dist/jquery.vmap.min.js "></script>
		<script
			src="${path}/resources/vendor/jqvmap/dist/maps/jquery.vmap.usa.js "></script>

		<!-- Sliderform -->
		<script src="${path}/resources/assets/js/jquery.slideform.js "></script>

		<!-- Spaces custom Javascript -->
		<script src="${path}/resources/assets/js/spaces.js "></script>
</body>

</body>
</html>