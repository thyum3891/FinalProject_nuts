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
	src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=ffea6673691d899c7b831444d7cf6ba1&libraries=services"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
<style>
	body {font-family: Arial, Helvetica, sans-serif;}
	
	.modal {
	  display: none; /* Hidden by default */
	  position: fixed; /* Stay in place */
	  z-index: 1; /* Sit on top */
	  padding-top: 100px; /* Location of the box */
	  left: 0;
	  top: 0;
	  width: 100%; /* Full width */
	  height: 100%; /* Full height */
	  overflow: auto; /* Enable scroll if needed */
	  background-color: rgb(0,0,0); /* Fallback color */
	  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	}
	
	.modal-content {
	  background-color: #fefefe;
	  margin: auto;
	  margin-top: 20%;
	  padding: 20px;
	  border: 1px solid #888;
	  width: 20%;
	}
	
	.close {
	  color: #aaaaaa;
	  float: right;
	  font-size: 28px;
	  font-weight: bold;
	}
	
	.close:hover,
	.close:focus {
	  color: #000;
	  text-decoration: none;
	  cursor: pointer;
	}
</style>	
</head>
<body>
	<main>
		<div class="section pt-8">
			<div id="spaces-container" class="container">
				<div class="row">
					<aside class="col-12 col-lg-4 d-block z-12">
						<div id="profile-sidebar">
							<div class="sidebar-inner">
								<!-- Profile Card -->
								<div
									class="card mt-0 d-none d-lg-block border-light text-center p-2">
									<div class="profile-cover rounded-top"
										style="background-image: url('${path}/resources/images/profilebg1.png')"></div>
									<div class="card-body p-2">
										<div class="profile-thumbnail mt-n7 mx-auto card-img-top rounded-circle " style="background-color: white" >
											<img
												src="${path}/resources/upload/member/${loginMember.profile_re_name}"
												height="200px" width="200px"
												class="card-img-top rounded-circle border-white">
										</div>
										<br>
										<h4 class="font-weight-normal mt-4 mb-0">${loginMember.nick_name}</h4>
										<br> <a href="${path }/member/enroll" class="btn btn-sm btn-primary mb-3">프로필
											수정</a>
									</div>
								</div>
								<!-- End of Profile Card -->
							</div>
						</div>

					</aside>

					<!--  ---------------------------------------------------------------------------------------------------------------------------------------------- -->
					<div class="col-12 col-lg-8">
						<div>
							<h5>다녀온 산책</h5>
						</div>
						<div class="container ">
							<div class="row">
								<c:forEach var="wp" items="${wpList}" varStatus="vs">
									<div class="item mx-1">
										<div class="card border-light mb-4 m-1 animate-up-5 "
											style="width: 226px; height: 380px;">
											<div id="map${wp.party_no}" class="card-body ml-1"
												style="height: 200px; width: 200px;"></div>
											<div class="card-body">
												<ul class="list-group mb-3">
													<li class="list-group-item small p-0"><span
														class="fas fa-bullseye mr-2"></span>${fn:substring(wp.start_date,0,10)}
													</li>
													<li class="list-group-item small p-0"><span
														class="fas fa-bullseye mr-2"></span>시작시간 :${wp.start_time }</li>
													<li class="list-group-item small p-0"><span
														class="fas fa-bullseye mr-2"></span>예상소요시간 :
														${wp.start_time }</li>
													<li class="list-group-item small p-0"><span
														class="fas fa-bullseye mr-2"></span>${wp.contant}</li>
												</ul>
											</div>

											<div
												class=" col mt-lg-0 mt-5 pt-3 d-flex flex-column text-center">
												<div>
													<a id="bellBtn${wp.party_no}" onclick="block${wp.party_no}()" class="btn btn-primary animate-up-2 mb-2" style="color: white">
														<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
															 fill="currentColor" class="bi bi-bell-fill"
															 viewBox="0 0 16 16">
  															<path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zm.995-14.901a1 1 0 1 0-1.99 0A5.002 5.002 0 0 0 3 6c0 1.098-.5 6-2 7h14c-1.5-1-2-5.902-2-7 0-2.42-1.72-4.44-4.005-4.901z" />
														</svg>
													</a> 
															
															<a onclick="partyStatUpdate('${wp.party_no}')" class="btn btn-primary animate-up-2 mb-2">마감</a>
												</div>
											</div>
										</div>
									</div>
									
									<script>
								var linePath${wp.party_no} = [
									<c:forEach var="item"  items="${wp.pathAll}" varStatus="status">
										new kakao.maps.LatLng( ${item} ) 
										<c:if test="${!status.last}">,</c:if>
									</c:forEach>
								];
								var mapNo = 'map${wp.party_no}';
								mapSet(mapNo,linePath${wp.party_no});
													
								function mapSet(mapId, linePath) {
									var mapContainer = document.getElementById(mapId), // 지도를 표시할 div 
										mapOption = { 
											center: new kakao.maps.LatLng(37.476748643175874, 126.96834471935132), // 지도의 중심좌표
												level: 5 // 지도의 확대 레벨
											};
									
									var map = new kakao.maps.Map(mapContainer, mapOption); 
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

							</script>
								</c:forEach>

							</div>
						</div>
						<div>
							<h5>지난 산책 메이트</h5>
						</div>
						<div class="container ">
							<div class="row">
								<div class="basic-carousel owl-carousel owl-theme">
								<c:forEach var="partner"  items="${partnerList}">
									<div class="item">
										<div class="card border-light text-center">
											<div class="profile-thumbnail mx-auto mt-3">
											<c:if test="${partner.profile != null }">
												<img src="${path}/resources/upload/member/${partner.profile}" class="card-img-top rounded-circle border-0"
													alt="Jose Avatar">
											</c:if>
											<c:if test="${partner.profile == null }">
												<img src="${path}/resources/images/nuts_logo.png" class="card-img-top rounded-circle border-0"
													alt="Jose Avatar">
											</c:if>
											</div>
											<div class="card-body">
												<h2 class="h4 card-title mb-2">${partner.nick_name}</h2>
												<span class="card-subtitle text-gray font-weight-normal">
												
												<c:if test="${partner.kakao != null}">
													<a  href="${partner.kakao}" class="btn btn-primary animate-up-2 mb-2" style="color: white">
														<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-fill" viewBox="0 0 16 16">
  															<path d="M8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6-.097 1.016-.417 2.13-.771 2.966-.079.186.074.394.273.362 2.256-.37 3.597-.938 4.18-1.234A9.06 9.06 0 0 0 8 15z"/>
														</svg>
													</a>
												</c:if>
												
												</span>
											</div>
										</div>
									</div>
								</c:forEach>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</main>
	
	
	
	 <c:forEach var="wp" items="${wpList}" varStatus="vs">
	 
	<div id="reqModal${wp.party_no}" class="modal">
			
	</div>
		<script type="text/javascript">
		
		
		 
		var modal${wp.party_no} = document.getElementById("reqModal${wp.party_no}");

		

		function block${wp.party_no}() {
		  modal${wp.party_no}.style.display = "block";
		}

		function close${wp.party_no}() {
		  modal${wp.party_no}.style.display = "none";
		}
		</script>
		
	</c:forEach>
	
	<script>
	window.onclick = function(event) {
		<c:forEach var="wp" items="${wpList}" varStatus="vs">
		  if (event.target == modal${wp.party_no}) {
		    modal${wp.party_no}.style.display = "none";
		  }
		</c:forEach>
	}
	
	</script>
	
	<script>
	<c:forEach var="wp" items="${wpList}" varStatus="vs">
	modalAjax('${wp.party_no}','reqModal${wp.party_no}');
	</c:forEach>
	 function modalAjax(party_no,reqModalNo) {
		 $.ajax({
				type: "get",
				url: "${path}/myPageModal",
				data: {
					party_no // 속성의 키값과 변수명이 동일할 경우
				},
				success: 
				function(result) {
					console.log(result);
					$("#"+reqModalNo).html(result);
				},
				error: function(e) {
					$("#"+reqModalNo).html(e);
					console.log(e);
				}
			});
	}
	 function reqUpdate(req_no,stat) {
         

         $.ajax({
				type: "get",
				url: "${path}/myPage/ReqUpdate",
				dataType: "json",
				data: {
					req_no, stat
				},
				success: 
				function(data) {
					console.log(data);
					
					if(data.validate === true) {
						location.href = '${path}/myPage';
					} else {
						alert("처리에 실패하였습니다.");							
					}
				},
				error: function(e) {
					console.log(e);
				}
			});
	}
	 function partyStatUpdate(party_no) {
         $.ajax({
				type: "get",
				url: "${path}/myPage/partyStatUpdate",
				dataType: "json",
				data: {
					party_no
				},
				success: 
				function(data) {
					console.log(data);
					
					if(data.validate === true) {
						location.href = '${path}/myPage';
					} else {
						alert("처리에 실패하였습니다.");							
					}
				},
				error: function(e) {
					console.log(e);
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


	<!-- Sliderform -->
	<script src="${path}/resources/assets/js/jquery.slideform.js "></script>

	<!-- Spaces custom Javascript -->
	<script src="${path}/resources/assets/js/spaces.js "></script>
</body>

</html>