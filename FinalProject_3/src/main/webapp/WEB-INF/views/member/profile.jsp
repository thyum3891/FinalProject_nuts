<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=ffea6673691d899c7b831444d7cf6ba1&libraries=services"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<c:forEach var="wp" items="${wpList}" varStatus="vs">
                                                    <div id="mapPath${wp.party_no}" style="height: 500px;width: 500px;">
                                                    
                                                    </div>
                                	 <div class="item mx-1">
                                            <div class="card border-light mb-4 m-1 animate-up-5 " style="width: 300px; height: 380px;">
                                                <div class="card-body">
                                                    <ul class="list-group mb-3">
                                                        <li class="list-group-item small p-0"><span class="fas fa-bullseye mr-2"></span>${fn:substring(wp.start_date,0,10)}
                                                        </li>
                                                        <li class="list-group-item small p-0"><span class="fas fa-bullseye mr-2"></span>시작시간 :${wp.start_time }</li>
                                                        <li class="list-group-item small p-0"><span class="fas fa-bullseye mr-2"></span>예상소요시간 : ${wp.start_time }</li>
                                                        <li class="list-group-item small p-0"><span class="fas fa-bullseye mr-2"></span>${wp.contant}</li>
                                                    </ul>
                                                </div>
                                                <div class="col mt-lg-0 mt-5 pt-3 d-flex flex-column text-center">
                                                    <div>
                                                        <a href="#" class="btn btn-primary animate-up-2 mb-2">마감</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                       
                                        
                                	</c:forEach>
                                	   <script>
                          <c:forEach var="wp" items="${wpList}" varStatus="vs">
								var linePath${wp.party_no} = [
									<c:forEach var="item"  items="${wp.pathAll}" varStatus="status">
								
									new kakao.maps.LatLng( ${item} ) 
									<c:if test="${!status.last}">,</c:if>
									
									</c:forEach>
								];
								console.log('${wp}');
								console.log('${wp.pathAll}');
								console.log(linePath${wp.party_no});
								var mapNo = 'mapPath${wp.party_no}';
								mapSet(mapNo, linePath${wp.party_no});
													
								function mapSet(mapId, linePath) {
									console.log('맵 id : ' + mapId);
									var mapContainer = document.getElementById(mapId), // 지도를 표시할 div 
										mapOption = { 
											center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
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
								console.log('함수2');
								    }
								</c:forEach>
							</script>
</body>
</html>