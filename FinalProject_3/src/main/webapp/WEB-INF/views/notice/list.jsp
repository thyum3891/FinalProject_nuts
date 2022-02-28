<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>


<!DOCTYPE html>
<html lang="en">

<head>
  <style>
        body {
            font-family: 'Jua', sans-serif;
            font-size: larger;
        }
        
        .font-jua {
            font-family: 'Jua', sans-serif;
            color: #7c6356;
        }
        
        .form-control {
            border-radius: 0.3rem;
        }
        
        th {
            text-align: center;
        }
        
        tr {
            text-align: center;
            font-family: 'Jua', sans-serif;
            font-weight: lighter;
            color: #7c6356;
        }
        
        .page-link {
            color: #5E4D44;
            border: 0px;
            padding: 20px;
        }
        
        .border-a {
            border: #5E4D44 solid 3px;
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
            <div class="container ">

                <div class="row mt-3 mb-5 mx-5 d-flex align-items-center justify-content-center">

                    <div class="border-a bg-white mt-8 w-100 rounded p-4 ">
                        <div class="col-12">
                            <h2 class="font-jua px-4 pt-4" style="color: #5E4D44;">공지사항</h2>
                        </div>
                        <div class="row mb-5">
                            <div class=" col-12">
                                <div class="card p-md-2">
                                    <div class="card-body p-2 p-md-0">
                                        <form autocomplete="off" class="row" method="get" action="">
                                            <div class="col-12 col-lg-4">
                                                <div class="input-group input-group-lg mb-3 mb-lg-0 border-b">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
                                                    </div>
                                                    <input class="form-control datepicker" name="date" style="border: 0px;" placeholder="날짜" type="text" >
                                                </div>
                                            </div>
                                            <div class="col-12 col-lg-5">
                                                <div class="form-group form-group-lg mb-lg-0">
                                                    <div class="input-group border-b">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text"><span class="fas fa-search-location"></span></span>
                                                        </div>
                                                        <input id="notice_title_search" style="border: 0px;" name="quary" type="text" class="form-control autocomplete" placeholder="제목" >
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-12 col-lg-3 container">
                                                <button class="btn btn-lg btn-primary btn-block animate-up-2" type="submit" style="background-color: #5E4D44; border-color: #5E4D44;">검색하기</button>
                                            	 <c:if test="${loginMember.id != null }">
										            <c:if test="${loginMember.id.equals('admin') }">
										                <button id="listbtn" class="btn btn-lg btn-primary btn-block animate-up-2"  style="background-color: #5E4D44; border-color: #5E4D44;" type="button" onclick="location.href='${path}/notice/write'">
										            작성하기</button>
										            </c:if>
									            </c:if>
                                            </div>
                                            
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="border-a d-md-flex rounded mb-md-5 mx-md-5 justify-content-around">
                    <table class="table table-hover table-lg mt-md-3">
                            <thead>
                                <tr>
                                    <th colspan="1">번호</th>
                                    <th colspan="6">제목</th>
                                    <th colspan="2">글쓴이</th>
                                    <th colspan="1">첨부파일</th>
                                    <th colspan="1">작성일</th>
                                </tr>
                            </thead>
                            <tbody>
                            
                            <c:forEach var="notice" items="${list}" varStatus="vs">
                                <tr>
                                    <th scope="row" colspan="1">${notice.notice_no }</th>
                                    <td scope="row" class="text-left" colspan="6" onclick="location.href='${path}/notice/view?notice_no=${notice.notice_no }'" style="cursor: pointer">${notice.title }</td>
                                    <td scope="row" colspan="2">${notice.nick_name }</td>
                                    <td scope="row" colspan="1 ">
	                                    	<c:if test="${notice.re_filename != null }">
	                                    		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-image" viewBox="0 0 16 16">
												  <path d="M8.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
												  <path d="M12 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zM3 2a1 1 0 0 1 1-1h8a1 1 0 0 1 1 1v8l-2.083-2.083a.5.5 0 0 0-.76.063L8 11 5.835 9.7a.5.5 0 0 0-.611.076L3 12V2z"/>
												</svg>
	                                    	</c:if>
	                                    </td>
                                    <td scope="row" colspan="1">${fn:substring(notice.write_date,0,10)}</td>
                                </tr>
                               </c:forEach>

                            </tbody>
                    </table>
                </div>
                </div>
                
        </section>

        <div class="row my-5 justify-content-center">
             <ul class="pagination ">
                <li class="page-item ">
                    <a class="page-link " 
                    href="${ path }/notice/list?pageStr=${pageInfo.prvePage}&date=${date}&title=${title}"
                    ><span class="icon icon-sm ml-auto "><span class="fas fa-chevron-left"></span></span></a>
                </li>
                <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" step="1" varStatus="status">
	                <c:if test="${ pageInfo.currentPage == status.current}">
	                	<li class="page-item font-jua active"><a class="page-link " 
	                	href="${ path }/notice/list?pageStr=${status.current}&date=${date}&title=${title}"
	                	>${ status.current }</a></li>
	                </c:if>
	                <c:if test="${ pageInfo.currentPage != status.current}">
	                	<li class="page-item font-jua "><a class="page-link " 
	                	href="${ path }/notice/list?pageStr=${status.current}&date=${date}&title=${title}"
	                	></a></li>
	                </c:if>
                </c:forEach>
                <li class="page-item ">
                    <a class="page-link " 
                    href="${ path }/notice/list?pageStr=${pageInfo.nextPage}&date=${date}&title=${title}"
                    ><span class="icon icon-sm ml-auto "><span class="fas fa-chevron-right"></span></span></a>
                </li>
            </ul>
        </div>









    </main>

    <!-- Core -->
    <script src="${path}/resources/vendor/jquery/dist/jquery.min.js"></script>
    <script src="${path}/resources/vendor/popper.js/dist/umd/popper.min.js"></script>
    <script src="${path}/resources/vendor/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="${path}/resources/vendor/headroom.js/dist/headroom.min.js"></script>
    <script src="${path}/resources/vendor/onscreen/dist/on-screen.umd.min.js"></script>

    <!-- NoUISlider -->
    <script src="${path}/resources/vendor/nouislider/distribute/nouislider.min.js"></script>

    <!-- Bootstrap Datepicker -->
    <script src="${path}/resources/vendor/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>

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
</body>


</html>