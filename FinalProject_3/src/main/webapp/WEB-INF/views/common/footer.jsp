<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<footer class="footer pb-5 mt-4 pt-5">
        <hr class="my-3 my-lg-5">
        <div class="container">
            <div class="row ml-6">
                <img src="${path}/resources/images/nutslogo2.svg" height="120" class="mb-3 mt-4">

                <div class="col mb-5 mb-xl-0 ml-4">
                    <ul class="footer-links mt-4" style="color: #D0CECE;">
                        <li class="font-small text-surroundAir mb-1">대표이사 염동훈</li>
                        <li class="font-small text-surroundAir mb-1">사업자등록번호 1234-1234-1234</li>
                        <li class="font-small text-surroundAir mb-1">통신판매업신고번호 제 2022-동훈-5959짱 </li>
                        <li class="font-small text-surroundAir mb-1">(12345) 서울특별시 강남구 동훈이는 멋져 59, 10살</li>
                        <li class="font-small text-surroundAir mb-1">TEL. 02-1234-5959 <span class="ml-3">E-mail donghun@nuts.com</span></li>
                    </ul>
                </div>
                <div class="col mt-4">
                    <span class="h5" style="color: #5E4D44;">앱 다운받기</span>
                    <p class="font-small mt-2 text-surroundAir" style="color: #5E4D44;">지금 바로 앱에서 만나보세요!</p>

                    <button class="btn btn-sm btn-white mb-xl-0 mr-2 mr-lg-2" style="border-color: #5E4D44;">
                    <span class="d-flex align-items-center">
                        <span class="icon icon-brand mr-2"><span class="fab fa-apple" style="color: #5E4D44;"></span></span>
                        <span class="d-inline-block text-left" style="color: #5E4D44;">
                            <small class="font-weight-normal d-block text-surroundAir">Available on</small> App Store 
                        </span> 
                    </span>
                </button>

                    <button class="btn btn-sm btn-white" style="border-color: #5E4D44;">
                    <span class="icon icon-brand mr-2"><span class="fab fa-google-play" style="color: #5E4D44;"></span></span>
                    <span class="d-inline-block text-left" style="color: #5E4D44;">
                        <small class="font-weight-normal d-block text-surroundAir">Available on</small> Google Play
                    </span> 
                </button>
                </div>
            </div>
            <div class="row">
                <div class="col mb-md-0 mt-5">
                    <div class="d-flex text-center justify-content-center">
                        <p class="font-weight-normal font-small mb-0 text-surroundAir" style="color: #D0CECE;">Copyright © 견과류
                            <span class="current-year text-surroundAir " style="color: #D0CECE; ">2020</span>. All Rights Reserved.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </footer>