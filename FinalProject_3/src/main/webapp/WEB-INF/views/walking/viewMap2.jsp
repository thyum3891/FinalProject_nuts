<%@page import="com.kh.nuts.walking.vo.WalkingParty"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<%
List<WalkingParty> wpList = (List<WalkingParty>) request.getAttribute("wpList");
%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>



<head>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ffea6673691d899c7b831444d7cf6ba1&libraries=services"></script>

<meta charset="utf-8">
<!-- Fontawesome -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link type="text/css"
	href="${path}/resources/vendor/@fortawesome/fontawesome-free/css/all.min.css"
	rel="stylesheet">

<!-- Leaflet JS -->
<link type="text/css"
	href="${path}/resources/vendor/leaflet/dist/leaflet.css"
	rel="stylesheet">

<!-- Fancybox -->
<link rel="stylesheet"
	href="${path}/resources/vendor/@fancyapps/fancybox/dist/jquery.fancybox.min.css">

<!-- VectorMap -->
<link rel="stylesheet"
	href="${path}/resources/vendor/jqvmap/dist/jqvmap.min.css">

<!-- Main CSS -->
<link type="text/css" href="${path}/resources/css/spaces.css"
	rel="stylesheet">
<style>
.btn1 {
	background-color: rgb(207, 181, 147);
}

.btn2 {
	background-color: rgb(85, 56, 17);
	color: white;
}

.btn1:hover {
	background-color: white;
	border: solid rgb(207, 181, 147) 1px;
}

.btn2:hover {
	background-color: white;
	border: solid rgb(85, 56, 17) 1px;
	color: black;
}

.center {
	display: block;
	margin-left: auto;
	margin-right: auto;
	width: 50%;
}
</style>
</head>
<body>
	<script type="text/javascript">

</script>
	<section>
		<table class="center ">
			<tr>
				<td style="width: 45%;">
					<div class="container section-image rounded  position-relative border border-light"   >
					
					 <div id="listScroll" class="overflow-hidden" style="height: 725px; ">
					<table>
							<%
							for (int i = 0; i < wpList.size(); i++) {
								WalkingParty wp = wpList.get(i);
								//List<String> pathList = new ArrayList<String>(Arrays.asList(
								//wp.getPathAll().replaceAll("\\)\\,\\(", "\\/").replaceAll("\\(", "").replaceAll("\\)", "").split("\\/")));
							%>
							<tr>
								<td>
									<div class="card border-light animate-up-5">
										<div class="row no-gutters align-items-center">
											<div class="row col-5"
												style="width: 350px; height: 200px; margin: 5px">
												<div id="pathMap<%=wp.getParty_no()%>"
													class="card-img p-2 rounded-xl "
													style="width: 100%; height: 100%;"></div>

											</div>
											<div class="col-6">
												<div class="card-body">
													<img
														src="${path}/resources/images/KakaoTalk_20220125_140624405.jpg"
														class="card-img-top rounded-circle border-white"
														style="height: 50px; width: 50px;" alt=""> <a
														href="./single-space.html"> <span class="h5"><%=wp.getWriter_id()%></span>
													</a>
													<button class="btn  btn2" type="button" onclick="">
														<b>신청</b>
													</button>

														<br>
													<ul class="list-group mb-3">
														<li id="detailAddr<%=wp.getParty_no()%>" class="list-group-item small p-0"><span
															class="fas fa-map-marker-alt mr-2"></span>좌표로 주소값 구하기</li>
														<li class="list-group-item small p-0"><span
															class="fas fa-bullseye mr-2"></span>시작 시간 : <%=wp.getStart_time() %></li>
														<li class="list-group-item small p-0"><span
															class="fas fa-bullseye mr-2"></span>거리 : <%=wp.getDistance()%></li>
														<li class="list-group-item small p-0"><span
															class="fas fa-bullseye mr-2"></span>예상 소요 시간 : <%=wp.getEstimated_time() %></li>
														<li  class="list-group-item small p-0"></li>
														<li class="list-group-item small p-0"><br><%=wp.getContant()%></li>

													</ul>

												</div>
											</div>
										</div>
									</div>
							<script>
							detailAddr(new kakao.maps.LatLng<%=wp.getPathOne()%>);
								var linePath<%=wp.getParty_no()%> = [
								<%for (int j = 0; j < pathList.size(); j++) { %>
									new kakao.maps.LatLng( <%=pathList.get(j)%> ) 
									<%if (j != (pathList.size() - 1)) {%> , <%}%>  
								<%}%>  
								];
								var mapNo = 'pathMap<%=wp.getParty_no()%>';
								
								mapSet(mapNo,linePath<%=wp.getParty_no()%>);
													
								function mapSet(mapId, linePath) {
									var mapContainer = document.getElementById(mapId), // 지도를 표시할 div 
										mapOption = { 
											center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
												level: 5 // 지도의 확대 레벨
											};
									//지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
									
									var map = new kakao.maps.Map(mapContainer, mapOption); 
									// 지도에 표시할 선을 생성합니다
									var polyline = new kakao.maps.Polyline({
										path: linePath, // 선을 구성하는 좌표배열 입니다
										strokeWeight: 5, // 선의 두께 입니다
										strokeColor: '#FFAE00', // 선의 색깔입니다
										strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
										strokeStyle: 'solid' // 선의 스타일입니다
										});
									polyline.setMap(map);
									var bounds = new kakao.maps.LatLngBounds();  
									var i;
									for(i =0;i<linePath.length;i++){
										bounds.extend(linePath[i]);
										}
									map.setBounds(bounds);
								    }
								
								function detailAddr(latLng){
							    searchDetailAddrFromCoords(latLng, function(result, status) {
							        if (status === kakao.maps.services.Status.OK) {
							        	console.log(result[0].address.address_name);
							        	
							        	$("#detailAddr<%=wp.getParty_no()%>").html('<span class="fas fa-map-marker-alt mr-2"></span>모임주소 : ' + result[0].address.address_name);
							        	}   
							    	});
								}
								function searchDetailAddrFromCoords(coords, callback) {
								    // 좌표로 법정동 상세 주소 정보를 요청합니다
								    var geocoder = new kakao.maps.services.Geocoder();
								    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
								}
							</script>
								</td>
							</tr>
							<%}%>
					</table>
						</div>
					</div>
				</td>
				<td  style="width: 10%; align-content: center">
					<p>
						<img src="${path}/resources/images/caret-up-fill.svg" width="50px"
							alt="" onclick="scrollUp()" style="cursor: pointer;"
							class="scrollBtn">
					</p>
					<p>
						<img src="${path}/resources/images/caret-down-fill.svg"
							width="50px" alt="" onclick="scrollDown()"
							style="cursor: pointer;" class="scrollBtn">
					</p>
				</td>
				<td style="width: 45%;">
					<div class="card overflow-hidden" style="height: 600px; width: 600px">
						<div id="mapAll" class="col-12" ></div>
					</div>
				</td>
			</tr>
		</table>
				
		<script type="text/javascript">
		var mapContainer = document.getElementById('mapAll'), // 지도를 표시할 div  
	    mapOption = { 
	        center: new kakao.maps.LatLng(${myLat}, ${myLng}), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
		 
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	 
	// 마커를 표시할 위치와 title 객체 배열입니다 
	var positions = [
	<c:forEach var="wp" items="${wpList}" varStatus="vs">
	    {
	    	 title: ${wp.pathOne}, 
		     latlng: new kakao.maps.LatLng${wp.pathOne}
	       
	    }
	   <c:if test="${!vs.last}"> , </c:if>
	    
	    </c:forEach>
	];

	// 마커 이미지의 이미지 주소입니다
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	    
	for (var i = 0; i < positions.length; i ++) {
	    
	    // 마커 이미지의 이미지 크기 입니다
	    var imageSize = new kakao.maps.Size(24, 35); 
	    
	    // 마커 이미지를 생성합니다    
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	    
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng, // 마커를 표시할 위치
	        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	        image : markerImage // 마커 이미지 
	    });
	}
		</script>
	</section>
	<!-- Section -->
	<script>
    var sh = $("#listScroll")[0].scrollHeight/<%=wpList.size()%>;
    function scrollUp(){
        let upScroll = $("#listScroll").scrollTop() - sh;
        if(upScroll>0){
            $('#listScroll').animate({
            scrollTop : upScroll
        }, 400 );
        }else{
            $('#listScroll').animate({
            scrollTop : 0
        }, 400 );
        }
        
    }
    function scrollDown(){
        let downScroll = $("#listScroll").scrollTop() + sh;
        if(downScroll<$("#listScroll")[0].scrollHeight){
            $('#listScroll').animate({
            scrollTop :downScroll
        }, 400 );
        }else{
            $('#listScroll').animate({
            scrollTop : $("#listScroll")[0].scrollHeight
        }, 400 );
        }
    }

 </script>

</body>
</html>
