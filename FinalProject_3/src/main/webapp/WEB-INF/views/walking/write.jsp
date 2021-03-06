<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
 <!-- Fontawesome -->
    <link type="text/css" href="${path}/resources/vendor/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

    <!-- Leaflet JS -->
    <link type="text/css" href="${path}/resources/vendor/leaflet/dist/leaflet.css" rel="stylesheet">

    <!-- Fancybox -->
    <link rel="stylesheet" href="${path}/resources/vendor/@fancyapps/fancybox/dist/jquery.fancybox.min.css">

    <!-- VectorMap -->
    <link rel="stylesheet" href="${path}/resources/vendor/jqvmap/dist/jqvmap.min.css">

    <!-- Main CSS -->
    <link type="text/css" href="${path}/resources/css/spaces.css" rel="stylesheet">
  <script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ffea6673691d899c7b831444d7cf6ba1&libraries=services"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-- Primary Meta Tags -->
    <title>Spaces - All items list</title>
    

    <style>
        .th,
        td {
            color: #5E4D44;
        }
        .dot {overflow:hidden;float:left;width:12px;height:12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');}    
		.dotOverlay {position:relative;bottom:10px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;font-size:12px;padding:5px;background:#fff;}
		.dotOverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}    
		.number {font-weight:bold;color:#ee6152;}
		.dotOverlay:after {content:'';position:absolute;margin-left:-6px;left:50%;bottom:-8px;width:11px;height:8px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')}
		.distanceInfo {position:relative;top:5px;left:5px;list-style:none;margin:0;}
		.distanceInfo .label {display:inline-block;width:50px;}
		.distanceInfo:after {content:none;}
    </style>
</head>

<body>
    <main>
        <section class="section-header pb-lg-12 fontJua" style="background-color: rgba(253, 225, 148,1)">
            <div class="container">
                <div class="row justify-content-center mb-4 mb-lg-5">
                    <div class="col-12 col-md-8 text-left text-sm-center mb-5">
                        <h2 class="h1 mt-6 fontJua" style="color: #5E4D44;">?????? ????????????</h2>
                        <p class="lead mt-3 text-surroundAir font-base fontJua" style="color: #BA9F81;">?????? ????????? ????????? ???????????? ?????? ???????????????!</p>
                    </div>
                </div>
            </div>
        </section>
        <form class="fontJua" action="${path}/walking/create">
<input id="pathAll" name="pathAll" type="text" hidden="hidden"  required>
<input id="distance" name="distance" type="text" hidden="hidden"  required>
<!--  <input id="memberId" name="memberId" type="text" hidden="hidden"  required value="${loginMember.id}"> -->
 <input id="memberId" name="memberId" type="text" hidden="hidden"  required value="test">
        <div class="container mt-n12 z-2">
            <div class="row align-items-center justify-content-between mb-6">
                <div id="map" class="col-md-6 col-lg-7 border-primary card" style="height: 580px;">
                    
                </div>
                <div class="col-md-4 col-lg-5">
                    <!-- ???????????? ?????? -->
                    <div class="mb-2 mt-5 ml-6">
                        <div class="p-0">
                            <div class="d-flex">
                                <div>
                                    <div class="icon icon-secondary ">
                                        <svg style="color: #5E4D44;" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="mt-2 bi bi-calendar" viewBox="0 0 16 16">
                                            <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
                                        </svg>
                                    </div>
                                </div>
                                <div class="pl-4 mb-3">
                                    <input id="startDate" name="startDate" class="form-control datepicker text-surroundAir" placeholder="?????? ??????" type="text" style="border-color: #5E4D44; width: 250px;" required>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ???????????? ??? -->

                    <!-- ???????????? ?????? -->
                    <div class="mb-2 ml-6">
                        <div class="p-0">
                            <div class="d-flex">
                                <div>
                                    <div class="icon icon-secondary">
                                        <svg style="color: #5E4D44;" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="mt-2 bi bi-clock" viewBox="0 0 16 16">
                                            <path d="M8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71V3.5z"/>
                                            <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm7-8A7 7 0 1 1 1 8a7 7 0 0 1 14 0z"/>
                                        </svg>
                                    </div>
                                </div>
                                <div class="pl-4 mb-3">
                                    <input id="startTime" name="startTime" type="time" class="form-control autocomplete text-surroundAir" placeholder="?????? ??????" style="border-color: #5E4D44; width: 250px;" required>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ???????????? ??? -->

                    <!-- ?????????????????? ?????? -->
                    <div class="mb-2 ml-6">
                        <div class="p-0">
                            <div class="d-flex">
                                <div>
                                    <div class="icon icon-secondary">
                                        <svg style="color: #5E4D44;" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="mt-2 bi bi-hourglass-split" viewBox="0 0 16 16">
                                                    <path d="M2.5 15a.5.5 0 1 1 0-1h1v-1a4.5 4.5 0 0 1 2.557-4.06c.29-.139.443-.377.443-.59v-.7c0-.213-.154-.451-.443-.59A4.5 4.5 0 0 1 3.5 3V2h-1a.5.5 0 0 1 0-1h11a.5.5 0 0 1 0 1h-1v1a4.5 4.5 0 0 1-2.557 4.06c-.29.139-.443.377-.443.59v.7c0 .213.154.451.443.59A4.5 4.5 0 0 1 12.5 13v1h1a.5.5 0 0 1 0 1h-11zm2-13v1c0 .537.12 1.045.337 1.5h6.326c.216-.455.337-.963.337-1.5V2h-7zm3 6.35c0 .701-.478 1.236-1.011 1.492A3.5 3.5 0 0 0 4.5 13s.866-1.299 3-1.48V8.35zm1 0v3.17c2.134.181 3 1.48 3 1.48a3.5 3.5 0 0 0-1.989-3.158C8.978 9.586 8.5 9.052 8.5 8.351z"/>
                                                </svg>
                                    </div>
                                </div>
                                <div class="pl-4 mb-3">
                                <input id="estimated_time" name="estimated_time" type="text" hidden="hidden"  required>
                                    <input id="estimated_time2" type="text" class="form-control autocomplete text-surroundAir" placeholder="?????? ?????? ??????" style="border-color: #5E4D44; width: 250px;" disabled required>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ?????????????????? ??? -->

                    <!-- ???????????? ?????? -->
                    <div class="mb-2 ml-6">
                        <div class="p-0">
                            <div class="d-flex">
                                <div>
                                    <div class="icon icon-secondary">
                                        <svg style="color: #5E4D44;" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="mt-2 bi bi-pin-map-fill" viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd" d="M3.1 11.2a.5.5 0 0 1 .4-.2H6a.5.5 0 0 1 0 1H3.75L1.5 15h13l-2.25-3H10a.5.5 0 0 1 0-1h2.5a.5.5 0 0 1 .4.2l3 4a.5.5 0 0 1-.4.8H.5a.5.5 0 0 1-.4-.8l3-4z"/>
                                                    <path fill-rule="evenodd" d="M4 4a4 4 0 1 1 4.5 3.969V13.5a.5.5 0 0 1-1 0V7.97A4 4 0 0 1 4 3.999z"/>
                                                </svg>
                                    </div>
                                </div>
                                <div class="pl-4 mb-3">
                                <input id="pathOne" name="pathOne" type="text" hidden="hidden"  required>
                                    <input id="pathOne2" type="text" class="form-control autocomplete text-surroundAir" placeholder="?????? ??????" style="border-color: #5E4D44; width: 250px;" disabled required>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ???????????? ??? -->

                    <!-- ?????? ?????? -->
                    <div class="mb-2 ml-6">
                        <div class=" p-0">
                            <div class="d-flex">
                                <div>
                                    <div class="icon icon-secondary">
                                        <svg style="color: #5E4D44;" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="mt-2 bi bi-pencil-square" viewBox="0 0 16 16">
                                                    <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                                    <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                                </svg>
                                    </div>
                                </div>
                                <div class="pl-4 mb-3">
                                    <input id="contant" name="contant" type="text" class="form-control autocomplete text-surroundAir text-center" placeholder="??????" style="border-color: #5E4D44; width: 250px; height: 220px;" required>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ?????? ??? -->

                </div>
            </div>

            <div class="col ml-400 mt-50">
                <button class="btn btn-primary mt-5 ml-4 animate-up-2 font-medium" type="submit" style="background-color: #5E4D44; border-color: #5E4D44; width: 200px; height: 60px;">
                    <span style="color: white;">????????????</span>
                </button>
            </div>
        </div>
        </form>
        <script>
var LatLngJs = '';
var mapContainer = document.getElementById('map'), // ????????? ????????? div  
    mapOption = { 
	<c:if test="${LatLng!=null}">

	center: new kakao.maps.LatLng(${LatLng}),
	</c:if>
	<c:if test="${LatLng==null}">
	center: new kakao.maps.LatLng(33.450701, 126.570667),
	</c:if>
	
        level: 3 // ????????? ?????? ??????
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // ????????? ???????????????

if (navigator.geolocation) {
    
    // GeoLocation??? ???????????? ?????? ????????? ???????????????
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // ??????
            lon = position.coords.longitude; // ??????
        
        var locPosition = new kakao.maps.LatLng(lat, lon); // ????????? ????????? ????????? geolocation?????? ????????? ????????? ???????????????
        
        // ????????? ?????????????????? ???????????????
        displayMarker(locPosition) ;
            
      });
    
} else { // HTML5??? GeoLocation??? ????????? ??? ????????? ?????? ?????? ????????? ??????????????? ????????? ???????????????
    
    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667);
        
    displayMarker(locPosition) ;
}

// ????????? ????????? ?????????????????? ???????????? ???????????????
function displayMarker(locPosition) {

    // ????????? ???????????????
    var marker = new kakao.maps.Marker({  
        map: map, 
        position: locPosition
    }); 
    
    
    
    // ?????? ??????????????? ??????????????? ???????????????
    map.setCenter(locPosition);      
}

var drawingFlag = false; // ?????? ???????????? ?????? ????????? ????????? ?????? ???????????????
var moveLine; // ?????? ???????????? ????????? ????????? ???????????? ?????? ????????? ??? ?????? ?????????
var clickLine // ???????????? ????????? ????????? ????????? ??? ???????????????
var distanceOverlay; // ?????? ??????????????? ????????? ????????????????????? ?????????
var dots = {}; // ?????? ???????????? ????????? ????????? ????????? ?????? ????????? ????????? ???????????? ????????? ???????????? ???????????????.

// ????????? ?????? ???????????? ???????????????
// ????????? ???????????? ??? ???????????? ??????????????? ????????? ?????? ????????? ????????? ?????? ????????????
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {

    // ???????????? ????????? ??????????????? 
    var clickPosition = mouseEvent.latLng;

    // ?????? ?????????????????? ??????????????? ?????? ??????????????? ????????? ?????????
    if (!drawingFlag) {

        // ????????? true???, ?????? ??????????????? ????????? ???????????????
        drawingFlag = true;
        
        // ?????? ?????? ?????? ???????????? ????????? ???????????? ???????????????
        deleteClickLine();
        
        // ?????? ?????? ???????????????????????? ???????????? ????????? ???????????? ???????????????
        deleteDistnce();

        // ?????? ?????? ?????? ????????? ?????? ????????? ????????? ?????? ????????? ??????????????? ???????????? ????????? ???????????? ???????????????
        deleteCircleDot();
    
        // ????????? ????????? ???????????? ?????? ???????????? ???????????? ???????????????
        clickLine = new kakao.maps.Polyline({
            map: map, // ?????? ????????? ??????????????? 
            path: [clickPosition], // ?????? ???????????? ?????? ??????????????? ????????? ????????? ???????????????
            strokeWeight: 3, // ?????? ??????????????? 
            strokeColor: '#db4040', // ?????? ???????????????
            strokeOpacity: 1, // ?????? ????????????????????? 0?????? 1 ??????????????? 0??? ??????????????? ???????????????
            strokeStyle: 'solid' // ?????? ??????????????????
        });
        
        // ?????? ???????????? ?????? ??? ????????? ???????????? ?????? ?????? ????????? ????????? ????????? ?????? ???????????????
        moveLine = new kakao.maps.Polyline({
            strokeWeight: 3, // ?????? ??????????????? 
            strokeColor: '#db4040', // ?????? ???????????????
            strokeOpacity: 0.5, // ?????? ????????????????????? 0?????? 1 ??????????????? 0??? ??????????????? ???????????????
            strokeStyle: 'solid' // ?????? ??????????????????    
        });
    
        // ????????? ????????? ?????? ????????? ????????? ???????????????
        displayCircleDot(clickPosition, 0);

            
    } else { // ?????? ???????????? ?????? ????????????
		
        // ???????????? ?????? ?????? ?????? ????????? ???????????????
        var path = clickLine.getPath();
    	

        // ?????? ????????? ????????? ????????? ???????????????
        path.push(clickPosition);
        
        // ?????? ?????? ?????? ????????? ???????????? ?????? ???????????? ?????? ???????????? ???????????????
        clickLine.setPath(path);

        var distance = Math.round(clickLine.getLength());
        displayCircleDot(clickPosition, distance);
    }
});
    
// ????????? ??????????????? ???????????? ???????????????
// ?????? ??????????????? ???????????? ??????????????? ???????????? ???????????? ????????? ?????? ????????? ???????????? ??????????????? ?????????
kakao.maps.event.addListener(map, 'mousemove', function (mouseEvent) {

    // ?????? ??????????????? ???????????? ??????????????? ?????? ??????????????? ????????????
    if (drawingFlag){
        
        // ????????? ????????? ?????? ????????? ??????????????? 
        var mousePosition = mouseEvent.latLng; 

        // ????????? ???????????? ????????? ?????? ?????? ????????? ???????????????
        var path = clickLine.getPath();
        
        // ????????? ???????????? ????????? ????????? ????????? ????????? ?????? ????????? ????????? ?????? ???????????????
        var movepath = [path[path.length-1], mousePosition];
        moveLine.setPath(movepath);    
        moveLine.setMap(map);
        
        var distance = Math.round(clickLine.getLength() + moveLine.getLength()), // ?????? ??? ????????? ???????????????
            content = '<div class="dotOverlay distanceInfo">????????? <span class="number">' + distance + '</span>m</div>'; // ???????????????????????? ????????? ???????????????
        
        // ??????????????? ????????? ???????????????
        showDistance(content, mousePosition);   
    }             
});                 

// ????????? ????????? ????????? ?????? ???????????? ???????????????
// ?????? ??????????????? ???????????? ????????? ????????? ?????? ???????????? ???????????? ??? ???????????? ???????????????
kakao.maps.event.addListener(map, 'rightclick', function (mouseEvent) {

    // ?????? ????????? ?????? ???????????? ??????????????? ?????? ??????????????? ????????????
    if (drawingFlag) {
        
        // ?????????????????? ????????? ?????? ???????????? ???????????????
        moveLine.setMap(null);
        moveLine = null;  
        
        // ????????? ???????????? ?????? ?????? ?????? ????????? ???????????????
        var path = clickLine.getPath();
        $("#pathAll").val(path);
        $("#pathOne").val(path[0]);
        var pathLatLng = String(path[0]).replace('\(','').replace('\)','').split(',');
        console.log(pathLatLng[0],pathLatLng[1]);
        
        detailAddr(new kakao.maps.LatLng(pathLatLng[0],pathLatLng[1]));
        function detailAddr(latLng){
        	console.log('??????1');
            searchDetailAddrFromCoords(latLng, function(result, status) {
                if (status === kakao.maps.services.Status.OK) {
                	$("#pathOne2").val(result[0].address.address_name);
                	}else{
                		console.log('??????')
                		
                	}   
            	});
        	}
        function searchDetailAddrFromCoords(coords, callback) {
            // ????????? ????????? ?????? ?????? ????????? ???????????????
            var geocoder = new kakao.maps.services.Geocoder();
            geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
        }
       
        // ?????? ???????????? ????????? ????????? 2??? ????????????
        if (path.length > 1) {

            // ????????? ?????? ????????? ?????? ?????? ?????? ????????? ??????????????? ????????????
            if (dots[dots.length-1].distance) {
                dots[dots.length-1].distance.setMap(null);
                dots[dots.length-1].distance = null;    
            }

            var distance = Math.round(clickLine.getLength()), // ?????? ??? ????????? ???????????????
                content = getTimeHTML(distance); // ???????????????????????? ????????? ???????????????
                console.log(content);
                console.log(path);
            // ????????? ?????? ??????????????? ????????? ???????????????
                showDistance(content, path[path.length-1]);  
             
        } else {

            // ?????? ???????????? ????????? ????????? 1??? ???????????? 
            // ????????? ???????????? ?????? ?????? ???????????? ???????????? ???????????????.
            deleteClickLine();
            deleteCircleDot(); 
            deleteDistnce();
            $("#pathAll").val("");
            $("#pathOne").val("");
            $("#pathOne2").val("");
            $("#distance").val("");
            $("#estimated_time").val("");
            $("#distance2").val("");
            $("#estimated_time2").val("");

        }
        
        // ????????? false???, ????????? ?????? ?????? ????????? ???????????????
        drawingFlag = false;          
    }  
});    

// ???????????? ????????? ?????? ???????????? ???????????? ???????????????
function deleteClickLine() {
    if (clickLine) {
        clickLine.setMap(null);    
        clickLine = null;        
    }
}

// ????????? ???????????? ???????????? ?????? ?????? ????????? ????????? ????????????
// ????????? ????????? ???????????? ??? ????????? ???????????? ??? ?????? ????????? ???????????? ????????? ??????????????? ???????????? ????????? ???????????? ???????????????
function showDistance(content, position) {
    
    if (distanceOverlay) { // ???????????????????????? ????????? ????????????
        
        // ????????? ??????????????? ????????? ????????? ????????? ???????????????
        distanceOverlay.setPosition(position);
        distanceOverlay.setContent(content);
        
    } else { // ????????? ??????????????? ???????????? ?????? ????????????
        
        // ????????? ??????????????? ???????????? ????????? ???????????????
        distanceOverlay = new kakao.maps.CustomOverlay({
            map: map, // ???????????????????????? ????????? ???????????????
            content: content,  // ???????????????????????? ????????? ???????????????
            position: position, // ???????????????????????? ????????? ???????????????.
            xAnchor: 0,
            yAnchor: 0,
            zIndex: 3  
        });      
    }
}

// ???????????? ?????? ?????? ????????? ????????? 
// ??? ????????? ???????????? ??? ?????? ????????? ???????????? ????????? ??????????????? ???????????? ???????????????
function deleteDistnce () {
    if (distanceOverlay) {
        distanceOverlay.setMap(null);
        distanceOverlay = null;
    }
}

// ?????? ???????????? ?????? ????????? ??? ????????? ???????????? ???????????? 
// ?????? ????????? ?????? ?????? (??????????????? ?????? ??????????????? ?????????)??? ???????????? ???????????????
function displayCircleDot(position, distance) {

    // ?????? ????????? ????????? ?????? ???????????? ???????????????????????? ???????????????
    var circleOverlay = new kakao.maps.CustomOverlay({
        content: '<span class="dot"></span>',
        position: position,
        zIndex: 1
    });

    // ????????? ???????????????
    circleOverlay.setMap(map);

    if (distance > 0) {
        

        // ????????? ???????????????
        distanceOverlay.setMap(map);
    }

    // ????????? ???????????????
    dots.push({circle:circleOverlay, distance: distanceOverlay});
}

// ?????? ????????? ?????? ?????? (??????????????? ?????? ??????????????? ?????????)??? ???????????? ?????? ???????????? ???????????????
function deleteCircleDot() {
    var i;

    for ( i = 0; i < dots.length; i++ ){
        if (dots[i].circle) { 
            dots[i].circle.setMap(null);
        }

        if (dots[i].distance) {
            dots[i].distance.setMap(null);
        }
    }

    dots = [];
}

// ????????? ????????? ?????? ??? ???????????? ???????????? ??? ???????????? 
// ????????? ?????? ????????? ????????? ????????? ?????? ??????, ????????? ????????? ????????????
// HTML Content??? ????????? ???????????? ???????????????
function getTimeHTML(distance) {

    // ????????? ????????? ?????? 4km/h ?????? ????????? ????????? 67m/min?????????
    var walkkTime = distance / 67 | 0;
    var walkHour = '', walkMin = '';
    var ajaxHour = '', ajaxMin = '';

    // ????????? ?????? ????????? 60??? ?????? ?????? ???????????? ???????????????
    if (walkkTime > 60) {
        walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>?????? ';
        ajaxHour =  Math.floor(walkkTime / 60)+ '??????';
    }
    $("#distance").val(distance+'m');
    $("#distance2").val(distance+'m');
    ajaxMin =  walkkTime % 60 + '???';
    $("#estimated_time").val(ajaxHour+ajaxMin);
    $("#estimated_time2").val(ajaxHour+ajaxMin);

    walkMin = '<span class="number">' + walkkTime % 60 + '</span>???';

 

    // ????????? ?????? ??????, ????????? ????????? ????????? HTML Content??? ????????? ???????????????
    var content = '<ul class="dotOverlay distanceInfo">';
    content += '    <li>';
    content += '        <span class="label">?????????</span><span class="number">' + distance + '</span>m';
    content += '    </li>';
    content += '    <li>';
    content += '        <span class="label">??????</span>' + walkHour + walkMin;
    content += '    </li>';
    content += '</ul>'

    return content;
}


</script>
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
