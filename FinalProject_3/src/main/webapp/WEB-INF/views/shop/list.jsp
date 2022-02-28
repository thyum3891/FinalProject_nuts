<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
   
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!DOCTYPE html>
<html>
<head>

  
    <style>
       .th,
        td {
            color: #5E4D44;
        }
/*         #searchcard {
        background-color: #BA9F81;
        border 
        } */
        
    </style>

<title>Insert title here</title>
</head>


<body>
    <div class="container">
        <div class="row pt-5 mt-10">
            <!-- 검색창 시작 -->
            <div class="col-12 col-md-4 d-none d-lg-block" >
                <div class="card border-nuts p-2" style="background-color: #BA9F81; border:1px solid #5E4D44;" >
                    <div class="card-body p-2" >
                        <h1 class="h4 ml-4 mt-5 mb-3" style="color: white;">넛츠마켓</h1>
                        <div class="d-flex justify-content-center mb-5" >
                            <div class="form-group form-group-lg mb-lg-0">
								<form action="${ path }/shop/search" method="get">
                                <div class="input-group input-group-lg mt-4">
                                    <div class="input-group-prepend" >
                                        <span class="input-group-text" style="border-color: #5E4D44;">
                                                <svg style="color: #5E4D44;" xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-shop" viewBox="0 0 16 16">
                                                    <path d="M2.97 1.35A1 1 0 0 1 3.73 1h8.54a1 1 0 0 1 .76.35l2.609 3.044A1.5 1.5 0 0 1 16 5.37v.255a2.375 2.375 0 0 1-4.25 1.458A2.371 2.371 0 0 1 9.875 8 2.37 2.37 0 0 1 8 7.083 2.37 2.37 0 0 1 6.125 8a2.37 2.37 0 0 1-1.875-.917A2.375 2.375 0 0 1 0 5.625V5.37a1.5 1.5 0 0 1 .361-.976l2.61-3.045zm1.78 4.275a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 1 0 2.75 0V5.37a.5.5 0 0 0-.12-.325L12.27 2H3.73L1.12 5.045A.5.5 0 0 0 1 5.37v.255a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0zM1.5 8.5A.5.5 0 0 1 2 9v6h1v-5a1 1 0 0 1 1-1h3a1 1 0 0 1 1 1v5h6V9a.5.5 0 0 1 1 0v6h.5a.5.5 0 0 1 0 1H.5a.5.5 0 0 1 0-1H1V9a.5.5 0 0 1 .5-.5zM4 15h3v-5H4v5zm5-5a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1v-3zm3 0h-2v3h2v-3z"/>
                                                </svg>
                                            </span>
                                    </div>
                                    <select class="custom-select text-surroundAir" name="category" style="border-color: #5E4D44;">
                                            <option value="">카테고리</option>
                                            <option value="반려견하네스">하네스</option>
                                            <option value = "반려견사료">사료</option>
                                            <option value = "반려견간식">간식</option>
                                            <option value = "반려견장난감">장난감</option>
                                        </select>
                                </div>
                                <div class="input-group mt-4">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" style="border-color: #5E4D44;">
                                                <svg style="color: #5E4D44;" xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-box2-fill" viewBox="0 0 16 16">
                                                    <path d="M3.75 0a1 1 0 0 0-.8.4L.1 4.2a.5.5 0 0 0-.1.3V15a1 1 0 0 0 1 1h14a1 1 0 0 0 1-1V4.5a.5.5 0 0 0-.1-.3L13.05.4a1 1 0 0 0-.8-.4h-8.5ZM15 4.667V5H1v-.333L1.5 4h6V1h1v3h6l.5.667Z"/>
                                                </svg>
                                            </span>
                                    </div>
                                    <input style="color: #5E4D44; border-color: #5E4D44;" id="search-product" type="text" class="form-control autocomplete text-surroundAir" name="query" placeholder="상품명">
                                </div>

                                <div class="col-12 mt-5">
                                    <button class="btn btn-lg btn-primary btn-block animate-up-2" type="submit" style="background-color: #5E4D44;">검색하기</button>
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 검색창 끝 -->

           <!-- 인기상품 리스트 시작 -->
                   
			<c:forEach var="item" items="${best}" varStatus="vs">
            <div class="col ">
                <div class="col mt-5">
                <c:if test="${vs.first}">
                 <a class="py-4 ml-2 font-medium" style="color: #5E4D44;">인기상품</a>
                </c:if>
                <c:if test="${!vs.first}">
                    <a class="py-4 ml-2 font-medium"></a>
                </c:if>

                    <div class="mt-2 animate-up-5">
                        <div class="card border-primary mt-4 mb-4" style="width: 235px;">
                            <div class="row no-gutters align-items-center ">
                                <div class="col-12 ">
                                    <a href="">
                                        <img src="${item.image}" class="card-img p-2 rounded-xl" style="height: 253px;">
                                    </a>

                                    <ul class="list-group mt-1 mb-2">
                                        <li class="list-group-item small p-0 text-surroundAir" style="text-align: center; color: #BA9F81; height: 40px;">${item.title}</li>
                                        <li class="list-group-item small p-0 text-surroundAir" style="text-align: center; color: #5E4D44;">${item.lprice}원</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
			</c:forEach>
        </div> 
        <!-- 인기상품 리스트 끝-->

        <!-- 검색 리스트 시작 -->
        <div class="row">
	       <c:forEach var="item" items="${shopList1}" > 
	            <div class="col mt-6 ml-2">
	                <div class="mt-2 animate-up-5">
	                    <div class="card border-primary mt-4 mb-4" style="width: 210px;">
	                        <div class="row no-gutters align-items-center ">
	                            <div class="col-12 ">
	                                <a href="">
	                                    <img src="${item.image}" class="card-img p-2 rounded-xl" style="height: 220px;">
	                                </a>
	
	                                <ul class="list-group mt-1 mb-2">
	                                    <li class="list-group-item small p-0 text-surroundAir" style="text-align: center; color: #BA9F81; height: 40px;"><a href="${item.link}">${item.title}</a></li><br>
	                                    <li class="list-group-item small p-0 text-surroundAir" style="text-align: center; color: #5E4D44;">${item.lprice}원</li>
	                                </ul>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </c:forEach>
        </div>

        <!-- 검색 리스트 시작 -->
        <div class="row">
	       <c:forEach var="item" items="${shopList2}" > 
	            <div class="col mt-6 ml-2">
	                <div class="mt-2 animate-up-5">
	                    <div class="card border-primary mt-4 mb-4" style="width: 210px;">
	                        <div class="row no-gutters align-items-center ">
	                            <div class="col-12 ">
	                                <a href="">
	                                    <img src="${item.image}" class="card-img p-2 rounded-xl" style="height: 220px;">
	                                </a>
	
	                                <ul class="list-group mt-1 mb-2">
	                                    <li class="list-group-item small p-0 text-surroundAir" style="text-align: center; color: #BA9F81; height: 40px;"><a href="${item.link}">${item.title}</a></li><br>
	                                    <li class="list-group-item small p-0 text-surroundAir" style="text-align: center; color: #5E4D44;">${item.lprice}원</li>
	                                </ul>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </c:forEach>
        </div>
        <!-- 간식 리스트 끝 -->
    </div>
       

    <!-- 페이지바 시작 -->
    <div class="col mt-6 ">
        <nav aria-label="Page navigation example ">
            <ul class="pagination justify-content-center ">
                
                <!-- 페이지 목록 -->
                  <c:forEach var="i"  begin="1" end="${maxPage}"> 
                   <li class="page-item  <c:if test="${i == page}">active</c:if>">
                 		<a class="page-link " href="${path}/shop/search?page=${i}">${i}</a>
             	   </li>
                  </c:forEach>
            </ul>
        </nav>
    </div>
    <!-- 페이지바 끝 -->




    <!-- Core -->
    <script src="${path}/resources//vendor/jquery/dist/jquery.min.js "></script>
    <script src="${path}/resources//vendor/popper.js/dist/umd/popper.min.js "></script>
    <script src="${path}/resources//vendor/bootstrap/dist/js/bootstrap.min.js "></script>
    <script src="${path}/resources//vendor/headroom.js/dist/headroom.min.js "></script>
    <script src="${path}/resources//vendor/onscreen/dist/on-screen.umd.min.js "></script>

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
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>

</html>

