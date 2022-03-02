<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="testId" value="test2" />


<div class="section section-lg pt-0">
	<div class="container mt-n12  ">
		<div class="flex-container blog-prc">
			<img src="${path}/resources/images/caret-up-fill.svg" width="50px"
				alt="" onclick="scrollUp()" style="cursor: pointer;"
				class="scrollBtn"> <img
				src="${path}/resources/images/caret-down-fill.svg" width="50px"
				alt="" onclick="scrollDown()" style="cursor: pointer;"
				class="scrollBtn">

		</div>


		<div class="row">
			<div class="col-md-12 ">
				<div id="listScroll" class="row overflow-hidden"
					style="height: 665px;">
					<c:if test="${wpList == null}">
	검색결과가 없습니다.
</c:if>
					<c:forEach var="wp" items="${wpList}" varStatus="vs">
						<!-- Item 1 -->
						<div style="width: 363px; height: 658px; margin: 5px;">
							<!-- Card -->
							<div class="card border-light mb-4 animate-up-5">
								<table>
									<tr>
										<td>
											<div class="position-relative card p-2 rounded-xl">
												<div id="pathMap${wp.party_no}"
													style="width: 340px; height: 260px; overflow: hidden; cursor: pointer;"
													disabled="disabled"></div>
											</div>
										</td>
									</tr>
								</table>
								<div class="card-body ">
										<h4 class="h5 fontJua">
											<span>
											<c:if test="${wp.profile != null}">
											<img src="${path}/resources/upload/member/${wp.profile}"
												class="card-img-top rounded-circle border-white"
												style="height: 50px; width: 50px;" alt="">
											</c:if>
												
												</span>${wp.nick_name}
										</h4>
									<div class="d-flex my-4">
									</div>
									<ul class="list-group mb-3  ">
										<li id="detailAddr${wp.party_no }"
											class="list-group-item small p-0 fontJua"><span
											class="fas fa-map-marker-alt mr-2 fontJua"></span>좌표로 주소값 구하기</li>
										<li class="list-group-item small p-0 fontJua"><span
											class="fas fa-bullseye mr-2"></span>시작 시간 : ${wp.start_time }</li>
										<li class="list-group-item small p-0 fontJua"><span
											class="fas fa-bullseye mr-2"></span>거리 : ${wp.distance}</li>
										<li class="list-group-item small p-0 fontJua"><span
											class="fas fa-bullseye mr-2"></span>예상 소요 시간 :
											${wp.estimated_time}</li>
										<li class="list-group-item small p-0"></li>
										<li class="list-group-item small p-0" fontJua><br>${wp.contant}</li>
									</ul>
									<div class="col-12 mt-4">
										<c:if test="${loginMember==null}">
											<button id="btn${wp.party_no}"
												class="btn btn-lg btn2 btn-block" type="button"
												disabled="disabled">로그인 해주세요</button>
										</c:if>
										<c:if test="${loginMember!=null}">
											<button id="btn${wp.party_no}"
												class="btn btn-lg btn2 btn-block" type="button"
												onclick="partyReq('${wp.party_no}', '${wp.writer_id}')">신청</button>
										</c:if>



									</div>
								</div>
							</div>
							<script>
							detailAddr(new kakao.maps.LatLng${wp.pathOne});
								var linePath${wp.party_no} = [
									<c:forEach var="item"  items="${wp.pathAll}" varStatus="status">
								
									new kakao.maps.LatLng( ${item} ) 
									<c:if test="${!status.last}">,</c:if>
									
									</c:forEach>
								];
								var mapNo = 'pathMap${wp.party_no}';
								
								mapSet(mapNo,linePath${wp.party_no});
													
								function mapSet(mapId, linePath) {
									var mapContainer = document.getElementById(mapId), // 지도를 표시할 div 
										mapOption = { 
											center: new kakao.maps.LatLng(${myLat}, ${myLng}), // 지도의 중심좌표
												level: 5 // 지도의 확대 레벨
											};
									
									var map = new kakao.maps.Map(mapContainer, mapOption); 
									
									map.setDraggable(false);		
									
									map.setZoomable(false);
									
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
							        	
							        	$("#detailAddr${wp.party_no}").html('<span class="fas fa-map-marker-alt mr-2"></span>모임주소 : ' + result[0].address.address_name);
							        	}   
							    	});
								}
								function searchDetailAddrFromCoords(coords, callback) {
								    // 좌표로 법정동 상세 주소 정보를 요청합니다
								    var geocoder = new kakao.maps.services.Geocoder();
								    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
								}
							</script>
						</div>

					</c:forEach>
				</div>
			</div>
		</div>

	</div>
</div>

</main>


<input type="text" id="myLat" name="lng" hidden>
<input type="text" id="myLng" name="lon" hidden>

<script type="text/javascript">
console.log('${loginMember.id}')
	<c:if test="${loginMember!=null}">
		<c:forEach var="wp" items="${wpList}" varStatus="vs">	
		var reqNo = '${wp.party_no}'+'${loginMember.id}';
		reqFunction('btn${wp.party_no}', reqNo);
		</c:forEach>
	</c:if>

var sh = 670;
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


function moveMap(mapCenterPath) {
	map.setCenter(mapCenterPath)
}

function partyReq(partyNo, respId) {
	var reqId = "${loginMember.id}"
	$.ajax({
		type: "post",
		url: "${path}/walking/partyReq",
		dataType: "json",
		data: {
			partyNo, reqId, respId
		},
		success: 
		function(data) {
			console.log(data);
			
			if(data.creatStat === true) {
		location.href = '${path}/';
		alert("신청 완료");
				
			} else {
				alert("신청 실패");							
			}
		},
		error: function(e) {
			console.log(e);
		}
	});
}
function reqFunction(btnId, reqNo){
	
	const btnIdDoc = document.getElementById(btnId);
	console.log(btnId);
	if('${reqStr}'.indexOf(reqNo) >= 0){
		btnIdDoc.disabled = true;	
		btnIdDoc.innerText = "신청완료";	
	}else{
		
	}
	
}

</script>
