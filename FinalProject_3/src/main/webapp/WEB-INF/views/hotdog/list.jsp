<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <style>
        body {
            font-family: 'Jua', sans-serif;
            font-size: large;
        }
        
        .font-jua {
            font-family: 'Jua', sans-serif;
        }
        
        .font-surround {
            font-family: 'Cafe24Ssurround';
            color: #7c6356;
        }
        
        .li .font-jua {
            color: #5E4D44;
            font-size: large;
        }
        
        .page-item.active .page-link {
            z-index: 3;
            color: #ffffff;
            background-color: #5E4D44;
            border-color: #5E4D44;
        }
        
        .page-link {
            color: #5E4D44;
            border: 0px;
            padding: 20px;
        }
        
        .form-control {
            border-radius: 0.3rem;
        }
        
        .bg {
            background-color: #ffe8ad;
        }
        
        th {
            text-align: center;
        }
        
        tr {
            text-align: center;
            font-family: 'Cafe24Ssurround';
            color: #7c6356;
            font-size: medium;
        }
        
        td {
            border: 0px;
            font-family: 'Cafe24Ssurround';
        }
        
        .border-a {
            border: #5E4D44 solid 2px;
        }
        
        .border-b {
            border: #5E4D44 solid 1.5px;
        }
    </style>
</head>

<body>
    <main>
        <!-- Section -->
        <section>
            <div class="container">

                <div class="row mt-8 mb-5 rounded border-a p-3 mx-5 bg">

                    <div class="col-12">
                        <h2 class="font-jua px-3 py-3" style="color: #5E4D44;">핫도그</h2>
                    </div>

                    <div class="col-12">
                        <form autocomplete="off" method="get" action="">
                            <!-- Form -->

                            <div class="form-group col-12 d-md-flex">

                                <div class="form-group form-group-lg mx-3 my-3">
                                    <div class="input-group border-b">
                                        <div class="input-group-prepend ">
                                            <span class="input-group-text "><span class="fas fa-search-location"></span></span>
                                        </div>
                                        <input id="hotdog_title_search " name="title" type="text" class="form-control autocomplete " style="border: 0px;" placeholder="제목 " >
                                    </div>
                                </div>


                                <div class="form-group form-group-lg mx-3 my-3 ">
                                    <div class="input-group border-b">
                                        <div class="input-group-prepend ">
                                            <span class="input-group-text "><span class="fas fa-heart "></span></span>
                                        </div>
                                        <input id="hotdog_nickname_search " name="nick_name" type="text" class="form-control autocomplete " style="border: 0px;" placeholder="닉네임 " >
                                    </div>
                                </div>


                                <div class="d-flex justify-content-center mx-lg-3 my-3 ">
                                    <div class="justify-content-around align-items-center ">
                                        <button class="btn btn-dark animate-up-2 text-center px-4 py-md-3 d-block" type="submit" style="background-color: #b99683; border-color: #b9927d; ">검색하기</button>
                                    </div>
                                </div>

                                <div class="d-flex justify-content-center mx-lg-3 my-3 ">
                                    <div class="justify-content-around align-items-center ">
                                        <button class="btn btn-dark animate-up-2 text-center px-4 py-md-3 d-sm-flex justify-content-center align-items-center" type="submit " style="background-color: #5E4D44; border-color: #5E4D44; "><a href="${path}/hotdog/write " style="color: white; ">작성하기</a></button>
                                    </div>
                                </div>

                            </div>
                        </form>
                    </div>
                </div>

                <!-- End of Form -->
                <div class="offset-7 col-5 mb-2 offset-lg-9 col-lg-3 mb-md-3 text-center">
                    <a href="" style="color:#cca894; font-size:16px;"><span class="fas fa-heart"></span> 좋아요 순서로 보기</a>
                </div>

                <div class="border-a d-md-flex rounded mb-md-5 mx-md-5 justify-content-around">
                    <table class="table table-hover table-lg mt-md-3 ">
                        <div>
                            <thead>
                                <tr>
                                    <th colspan="1 ">번호</th>
                                    <th colspan="6 ">제목</th>
                                    <th colspan="2 ">글쓴이</th>
                                    <th colspan="1 ">첨부파일</th>
                                    <th colspan="1 ">작성일</th>
                                    <th colspan="1 ">좋아요</th>
                                </tr>
                            </thead>
                            <tbody class="font-b">
                               <c:forEach var="hotdog" items="${list}"> 
	                                <tr>
	                                    <td scope="row" colspan="1 "><b>${hotdog.hot_no}</b></td>
	                                    <td scope="row" class="text-left " colspan="6 "><a href="${path}/hotdog/detail?hot_no=${hotdog.hot_no}">${hotdog.title }</a></td>
	                                    <td scope="row" colspan="2 ">
	                                    <img alt="" src="${path}/resources/upload/member/${hotdog.profile}" width="30px" height="30px" class="border-c rounded-circle" >
	                                    ${hotdog.nick_name}
	                                    </td>
	                                    <td scope="row" colspan="1 ">
	                                    	<c:if test="${hotdog.re_filename != null }">
	                                    		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-image" viewBox="0 0 16 16">
												  <path d="M8.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
												  <path d="M12 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zM3 2a1 1 0 0 1 1-1h8a1 1 0 0 1 1 1v8l-2.083-2.083a.5.5 0 0 0-.76.063L8 11 5.835 9.7a.5.5 0 0 0-.611.076L3 12V2z"/>
												</svg>
	                                    	</c:if>
	                                    </td>
	                                    <td scope="row" colspan="1 ">${fn:substring(hotdog.write_date,0,10)}</td>
	                                    <td scope="row" colspan="1 ">${hotdog.count }</td>
	                                </tr>
                                </c:forEach>
                            </tbody>
                        </div>
                    </table>
                </div>
			</div>
        </section>

        <div class="row my-5 justify-content-center">
            <ul class="pagination ">
                <li class="page-item ">
                    <a class="page-link " 
                    href="${ path }/hotdog/list?pageStr=${pageInfo.prvePage}&nick_name=${nick_name}&title=${title}"
                    ><span class="icon icon-sm ml-auto "><span class="fas fa-chevron-left"></span></span></a>
                </li>
                <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" step="1" varStatus="status">
	                <c:if test="${ pageInfo.currentPage == status.current}">
	                	<li class="page-item font-jua active"><a class="page-link " 
	                	href="${ path }/hotdog/list?pageStr=${status.current}&nick_name=${nick_name}&title=${title}"
	                	>${ status.current }</a></li>
	                </c:if>
	                <c:if test="${ pageInfo.currentPage != status.current}">
	                	<li class="page-item font-jua "><a class="page-link " 
	                	href="${ path }/hotdog/list?pageStr=${status.current}&nick_name=${nick_name}&title=${title}"
	                	>${status.current}</a></li>
	                </c:if>
                </c:forEach>
                <li class="page-item ">
                    <a class="page-link " 
                    href="${ path }/hotdog/list?pageStr=${pageInfo.nextPage}&nick_name=${nick_name}&title=${title}"
                    ><span class="icon icon-sm ml-auto "><span class="fas fa-chevron-right"></span></span></a>
                </li>
            </ul>
        </div>


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