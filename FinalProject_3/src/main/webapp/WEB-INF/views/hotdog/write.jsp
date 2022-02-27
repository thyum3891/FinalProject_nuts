<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <style>
        body {
            font-family: 'Jua', sans-serif;
        }
        
        .font-jua {
            font-family: 'Jua', sans-serif;
            color: #7c6356;
        }
        
        .form-control {
            border-radius: 0.3rem;
        }
        
        .font-surround {
            font-family: 'Cafe24Ssurround';
        }
        
        .bg {
            background-color: #fae3a5;
        }
        
        .btn {
            background-color: #7c6356;
            color: white;
        }
        
        .border-a {
            border: #5E4D44 solid 2px;
        }
        .blog-prc {
	display: flex;
	align-items: center;
	justify-content: center;

}

	input {
		border: 1px solid black;
	}
    </style>
</head>

<body>

<main>
    <!-- Section -->
    <section class="min-vh-100 d-flex align-items-center section-image">
        <div class="container">
            <div class="">

                <div class="col-12 mt-5 d-flex align-items-center justify-content-center">
                    <div class="bg rounded p-5 w-100 fmxw-700 border-a align-text-center">

                        <form action="${path}/hotdog/write" method="post" enctype="multipart/form-data">
							<input type="text" name="write" value="${loginMember.id}" hidden>
                            <div class="col-12 text-center mb-5 mt-md-3">
                                <h5 class="mb-0 font-jua" style="color: #5E4D44;">핫도그</h5>
                            </div>


                            <div class="col-12 px-3">
                                <input class="form-control" type="text" id="hotdog_title" name="title" placeholder="제목" name="hotdog_title" required>
                            </div>
                            <div class="col-12 d-flex">
                                <input class="col-md-8 my-3 form-control mr-lg-5" disabled="disabled" id="hotdog_file" value="" name="hotdog_file">
                                <label class="btn col-md-3 my-3 btn-dark animate-up-2" style="background-color: #a38778; border-color: #a38778; font-color : white;">
                                        파일 업로드<input id="input_file_hotdog" name="upfiles" type="file" hidden onchange="change(this.value)"multiple="multiple" accept=".jpg, .jpeg, .png"></label>
                            </div>

                            <div class="slideform-group col-12">
                                <textarea class="form-control my-3"  id="hotdog_Textarea" name="content" rows="12" required></textarea>
                            </div>
                            <div class="blog-prc">
	                             <button class=" btn btn-primary btn-dark mt-4 animate-up-2 text-center px-6" type="submit" >
	            				작성하기</button>
                            
                            </div>
            				<div class="blog-prc">
			                    <a class="btn btn-primary btn-dark mt-4 animate-up-2 text-center px-6" href="${path}/hotdog/list" >목록으로</a>
            				</div>
                        </form>
                    </div>
                   
                </div>
            
            </div>
        </div>
         
    </section>
    <script type="text/javascript">
    	function change(value){
    		$("#hotdog_file").val(value);
    		
    	}
    </script>
       
    </main>
     <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <!-- The Modal -->
    <div class="modal " id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <!-- Modal body -->
                <div class="modal-body">
                    게시글을 작성하였습니다.
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn" data-bs-dismiss="modal"><a href="list.jsp">Close</a></button>
                </div>

            </div>
        </div>
    </div>

   

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