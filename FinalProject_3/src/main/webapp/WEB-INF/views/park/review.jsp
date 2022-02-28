<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<style>
	.th,
    .td {
		color: #5E4D44;
	}
</style>

<body>
    <section class="section-header pb-9 pb-lg-12 bg-primary text-white">
        <div class="container">
            <div class="row mt-6">
                <div class="col-12 text-center">
                    <div class="col-12 text-center">
                        <h1 class="mb-5 mt-30"><span class="font-weight-bolder" style="color: #5E4D44;">공원 후기 작성하기</span></h1>
                    </div>
                    <div class="d-flex mb-3">
                        <div class="col-12 col-lg-4">
                            <div class="form-group form-group-lg mb-lg-0">
                                <div class="input-group input-group-lg mt-5">
                                    <div class="input-group-prepend">
                                        <p class="lead px-md-6 font-medium" style="color: #BA9F81;">제목</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="d-flex justify-content-center flex-column mb-3">
                        <img src="${ path }/resources/images/park-align.png" class="d-block mx-auto mb-3" height="1" width="1500" alt="Themesberg Logo">
                    </div>

                    <div class="d-flex">
                        <div class="col-12 col-lg-4">
                            <div class="form-group form-group-lg mb-lg-0">
                                <div class="input-group input-group-lg mt-3">
                                    <div class="input-group-prepend">
                                        <svg style="color: #5E4D44;" xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="ml-6 bi bi-dribbble" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd" d="M8 0C3.584 0 0 3.584 0 8s3.584 8 8 8c4.408 0 8-3.584 8-8s-3.592-8-8-8zm5.284 3.688a6.802 6.802 0 0 1 1.545 4.251c-.226-.043-2.482-.503-4.755-.217-.052-.112-.096-.234-.148-.355-.139-.33-.295-.668-.451-.99 2.516-1.023 3.662-2.498 3.81-2.69zM8 1.18c1.735 0 3.323.65 4.53 1.718-.122.174-1.155 1.553-3.584 2.464-1.12-2.056-2.36-3.74-2.551-4A6.95 6.95 0 0 1 8 1.18zm-2.907.642A43.123 43.123 0 0 1 7.627 5.77c-3.193.85-6.013.833-6.317.833a6.865 6.865 0 0 1 3.783-4.78zM1.163 8.01V7.8c.295.01 3.61.053 7.02-.971.199.381.381.772.555 1.162l-.27.078c-3.522 1.137-5.396 4.243-5.553 4.504a6.817 6.817 0 0 1-1.752-4.564zM8 14.837a6.785 6.785 0 0 1-4.19-1.44c.12-.252 1.509-2.924 5.361-4.269.018-.009.026-.009.044-.017a28.246 28.246 0 0 1 1.457 5.18A6.722 6.722 0 0 1 8 14.837zm3.81-1.171c-.07-.417-.435-2.412-1.328-4.868 2.143-.338 4.017.217 4.251.295a6.774 6.774 0 0 1-2.924 4.573z"/>
                                        </svg>
                                        <p class="lead ml-3 text-surroundAir font-base" style="color: #5E4D44;">공원명</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="d-flex">
                        <div class="col-12 col-lg-4">
                            <div class="form-group form-group-lg mb-lg-0">
                                <div class="input-group input-group-lg mt-2 mb-3">
                                    <div class="input-group-prepend">
                                        <svg style="color: #5E4D44;" xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="ml-6 bi bi-calendar" viewBox="0 0 16 16">
                                            <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
                                        </svg>
                                        <input class="datepicker text-surroundAir ml-3" placeholder="날짜선택" type="text" style="border-color: #5E4D44;" required>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="d-flex mb-5">
                        <div class="col-12 col-lg-4">
                            <div class="form-group form-group-lg mb-lg-0">
                                <div class="input-group input-group-lg">
                                    <div class="input-group-prepend">
                                        <svg style="color: #5E4D44;" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="ml-6 bi bi-image" viewBox="0 0 16 16">
                                            <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
                                            <path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z"/>
                                          </svg>
                                        <input id="park_review_image" type="file" class="text-surroundAir ml-3">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <figure class="position-absolute bottom-0 left-0 w-100 d-none d-md-block mb-n2">
            <svg class="fill-white" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 3000 185.4">
                <path d="M3000,0v185.4H0V0c496.4,115.6,996.4,173.4,1500,173.4S2503.6,115.6,3000,0z"></path>
            </svg>
        </figure>
    </section>

    <div class="section pt-0 ml-100">
        <div class="container mt-n10 mt-lg-n12 z-2">
            <input type="text" class="text-surroundAir text-center" placeholder="작성된 후기와 장소와 다른 사용자가 볼 수 있으니, 배려하는 마음을 담아 작성해주세요." style="width: 1000px; height: 650px;">
        </div>
    </div>

    <div class="col ml-400 ">
        <button class="btn btn-primary ml-12 animate-up-2 " type="submit" style="background-color: #5E4D44; border-color: #5E4D44;">
            <a href="#" style="color: white;">작성하기</a>
        </button>
    </div>
</body>