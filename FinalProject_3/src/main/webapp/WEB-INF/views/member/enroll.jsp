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
<meta charset="UTF-8">
<title>Insert title here</title>
<head>
    <style>
        .form-group label {
            color: #5E4D44;
        }
        
        .rounded {
            border-radius: 3rem !important;
        }
        
        .h3 {
            font-size: 2rem;
        }
        
        .h3,
        .font-weight-bold,
        .font-weight-bolder,
        button,
        input {
            font-family: 'Jua', sans-serif;
        }
        
        .form-control,
        .input-group-text {
            border: 0.0625rem solid #5E4D44;
            color: #5E4D44;
        }
        
        #sign-up {
            font-size: 20px;
            letter-spacing: 3px;
        }
    </style>
</head>

<body>
    <main>

        <div class="preloader bg-dark flex-column justify-content-center align-items-center">
            <div class="position-relative">
                <img src="${path}/resources/assets/img/brand/light-without-letter.svg" alt="Logo loader">
                <img src="${path}/resources/assets/img/brand/letter.svg" class="rotate-letter" alt="Letter loader">
            </div>
        </div>

        <!-- Section -->
        <div style="background: linear-gradient(to bottom, #BA9F81 55%, white 45%); margin-bottom: 100px;">
            <section class="min-vh-100 d-flex align-items-center section-image  py-5 py-lg-0">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-12" style="margin-top: 100px;">
                            <div class="text-center text-md-center  mt-md-0 mb-4 text-white">
                                <h1 class="mb-0 h3 ">견과류</h1>
                            </div>
                        </div>
                        <div class="col-12 d-flex align-items-center justify-content-center">
                            <div class="signin-inner mt-3 mt-lg-0 bg-white shadow-soft  rounded  p-4 p-lg-5 w-100 fmxw-500" style="border: 1.5px solid #5E4D44;">
                                <form action="${path}/member/enroll" method="post" enctype="multipart/form-data">
                                    <!-- Form -->
                                    <div class="form-group">
                                        <label for="exampleInputIcon4" class="font-weight-bolder">아이디</label>
                                        <div class="input-group mb-4">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"><span class="fas fa-dog"></span></span>
                                            </div>
                                            <input style=" border-top-right-radius: 7px; border-bottom-right-radius: 7px;" class="form-control" id="id" name="id" placeholder="아이디를 입력하세요" type="text" aria-label="id" required> &nbsp;
                                            <input type="button" class="btn btn-primary" id="idCheck" name="idCheck" value="중복확인" onclick="idCheckF()">
                                        </div>
                                    </div>
                                    <!-- End of Form -->
                                    <div class="form-group">
                                        <!-- Form -->
                                        <div class="form-group">
                                            <label for="exampleInputIcon4" class="font-weight-bolder">비밀번호</label>
                                            <div class="input-group mb-4 ">
                                                <div class="input-group-prepend ">
                                                    <span class="input-group-text"><span class="fas fa-unlock-alt"></span></span>
                                                </div>
                                                <input class="form-control" id="password1" name="pw" placeholder="비밀번호를 입력하세요" type="password" aria-label="Password" required>
                                            </div>

                                        </div>
                                        <!-- End of Form -->
                                        <!-- Form -->
                                        <div class="form-group">
                                            <label for="exampleInputIcon4" class="font-weight-bolder">비밀번호 확인</label>
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text"><span class="fas fa-unlock-alt"></span></span>
                                                </div>
                                                <input class="form-control" id="password2" name="pw2" placeholder="비밀번호를 한 번 더 입력하세요 " type="password" onblur="checkPw()" aria-label="Password" required>
                                            </div>
                                        </div>
                                        <!-- End of Form -->
                                        <!-- Form -->
                                        <div class="form-group">
                                            <label for="exampleInputIcon4" class="font-weight-bolder">닉네임</label>

                                            <div class="input-group mb-4">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text"><span class="fas fa-book"></span></span>
                                                </div>
                                                <input style=" border-top-right-radius: 7px; border-bottom-right-radius: 7px;" class="form-control" id="nickname" name="nick_name" placeholder="닉네임을 입력하세요 " type="text" aria-label="nickname">&nbsp;
                                                <input type="button" id="nicknameCheck" name="nicknameCheck" class="btn  btn-primary " value="중복확인">
                                            </div>
                                        </div>
                                        <!-- End of Form -->

                                        <!-- Form -->
                                        <div class="form-group">
                                            <label for="exampleInputIcon4" class="font-weight-bolder">휴대전화</label>
                                            <div class="input-group mb-4 ">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text"><span class="fas fa-phone"></span></span>
                                                </div>
                                                <input class="form-control" id="phone" name="phone_num" placeholder="숫자만 입력해주세요 ex) 01012345678 " type="text" aria-label="phone">
                                            </div>
                                        </div>
                                        <!-- End of Form -->
                                        
                                        <!-- Form -->
                                        <div class="form-group">
                                            <label for="exampleInputIcon4" class="font-weight-bolder">카카오톡 오픈 프로필 url</label>
                                            <div class="input-group mb-5">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text"><span class="fas fa-link "></span></span>
                                                </div>
                                                <input class="form-control" id="kakaourl" name="open_profile_url" placeholder="URL을 입력해주세요 " type="text" aria-label="kakaorul">
                                            </div>
                                        </div>
                                        <!-- End of Form -->
                                        <!-- Form -->
                                        <div class="form-group">
                                            <label for="exampleInputIcon4" class="font-weight-bolder">프로필 사진</label>
                                            <div class="input-group mb-5">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text"><span class="fas fa-link "></span></span>
                                                </div>
                                                <input class="form-control" id="upfile" name="upfile" type="file" aria-label="upfile" accept=".jpg, .jpeg, .png">
                                                	
                                            </div>
                                        </div>
	                                            <img id="img"  class= "card-img-top rounded-circle " style="height:  150px; width: 150px; display: none; border: solid, 3px, black ;margin: 5px; align-items: center" >
                                        <!-- End of Form -->
                                    </div>
                                    <button type="submit" id="sign-up" class="btn btn-block btn-primary ">회원가입</button>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
            </section>
        </div>
    </main>
	<script type="text/javascript">
	$(document).ready(function(){
		$("#upfile").on("change", handleImgFileSelect);
	})
		
		function handleImgFileSelect(e){
			var files = e.target.files;
			var reader = new FileReader();
			reader.onload = function(e){
				$("#img").attr("src", e.target.result);
				$("#img").css("display", "block");
			}
			reader.readAsDataURL(files[0]);
		}
	</script>


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



    <script>
        //비밀번호 일치 확인
        function checkPw() {
            var pw1 = document.getElementById("password1").value;
            var pw2 = document.getElementById("password2").value;

            if (pw1 != pw2) {
                alert("비밀번호가 일치하지 않습니다. 다시 입력해 주세요");
                pw2.focus();
            }
        }

        // 아이디 중복확인
        


        // 닉네임 중복확인
        function idCheckF() {
                let id = $("#id").val().trim();

                $.ajax({
    				type: "get",
    				url: "${path}/member/idCheck",
    				dataType: "json",
    				data: {
    					id // 속성의 키값과 변수명이 동일할 경우
    				},
    				success: 
    				function(data) {
    					console.log(data);
    					
    					if(data.validate === true) {
    						alert("이미 사용중인 아이디 입니다.");
    					} else {
    						alert("사용 가능한 아이디 입니다.");							
    					}
    				},
    				error: function(e) {
    					console.log(e);
    				}
    			});
		}
    </script>


</body>
</html>