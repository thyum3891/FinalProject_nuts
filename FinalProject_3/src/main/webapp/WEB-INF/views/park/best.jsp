<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=ffea6673691d899c7b831444d7cf6ba1&libraries=services"></script>
	
<body>
	<section id="park" class="section-header pb-9 pb-lg-12 bg-park text-white">
		<div class="container">
			<div class="row">
				<div class="col-12 text-center">
					<div class="col-12 text-center">
						<h1 class="mb-5 mt-100"><span class="font-weight-bolder" style="color: #5E4D44;">인기 공원 조회하기</span></h1>
					</div>
					
					
                    	
                    <div class="d-flex justify-content-center flex-column mb-6">
                        <img src="${ path }/resources/images/park-align.png" class="d-block mx-auto mb-3" height="1" width="1500" alt="Themesberg Logo">
                    </div>
                </div>
			</div>
		</div>
	
		<figure class="position-absolute bottom-0 left-0 w-100 d-none d-md-block mb-n2">
			<svg class="fill-white" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 3000 185.4">
				<path d="M3000,0v185.4H0V0c496.4,115.6,996.4,173.4,1500,173.4S2503.6,115.6,3000,0z" />
			</svg>
		</figure>
	</section>

    <div class="section pt-0">
        <div class="container mt-n10 mt-lg-n12 z-2">
            <div class="row justify-content-center">
                <div class="col-12">
                    <div class="card border-primary p-md-10 " id="map">
						
                    </div>
                </div> 
            </div>
        </div>
    </div>

    <section class="section section-sm pt-70">
        <div class="container mt-n10 ">
            <div class="row ">
                <div class="col ">
                    <div class="testimonial-carousel owl-carousel owl-theme mt-8">
	                	
										
						<c:forEach var= "park" items="${list}">
                        		<div class="item p-3" onclick="setCenter(${park.latitude},${park.longitude})" >
		                            <div class="card text-text-left mb-4 " style="border-color: #5E4D44;">
		                                <div class="card-body py-4" style="height: 230px;">
		                                    <table class="mt-3 ">
		                                        <tr>
		                                            <td>
		                                                <a class="h6" style="color: #BA9F81; ">
		                                                	<c:out value="${ park.parkNm }"></c:out>
		                                                </a>
		                                            </td>
		                                            <td class="input-group col-auto ">
		                                                <button class="btn btn-primary animate-up-2 " type="submit" style="background-color: #5E4D44; border-color: #5E4D44; ">
		                                                	<a href="https://search.naver.com/search.naver?query=${park.parkNm }" style="color: white;">자세히 보기</a>
		                                                </button>
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
	                                            	<td><c:out value="${ park.rdnmadr }" /></td>
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
                        	
                    </div>
                </div>
            </div>
        </div>
	</section>
</body>



<script>
							var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
							mapOption = { 
							    center: new kakao.maps.LatLng(${lat}, ${lng}), // 지도의 중심좌표
							    level: 3 // 지도의 확대 레벨
							}; 
						
							//지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
							var map = new kakao.maps.Map(mapContainer, mapOption); 
							<c:forEach var= "park" items="${list}">
							var marker${park.manageNo} = new kakao.maps.Marker({
							    map: map, // 마커를 표시할 지도
							    position: new kakao.maps.LatLng(${park.latitude},${park.longitude}) // 마커를 표시할 위치
							});
							</c:forEach>
						</script>

<script>
	function setCenter(lat,lng) {            
	// 이동할 위도 경도 위치를 생성합니다 
	var moveLatLon = new kakao.maps.LatLng(lat, lng);
	
	// 지도 중심을 이동 시킵니다
	map.setCenter(moveLatLon);
	}
	
	function panTo() {
	// 이동할 위도 경도 위치를 생성합니다 
	var moveLatLon = new kakao.maps.LatLng(33.450580, 126.574942);
	
	// 지도 중심을 부드럽게 이동시킵니다
	// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
	map.panTo(moveLatLon);            
	}        
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
