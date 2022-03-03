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
   

    <!-- NOTICE: You can use the _analytics.html partial to include production code specific code & trackers -->
    <style>
        body {
            font-family: 'Jua', sans-serif;
        }
        
        .font {
            font-family: 'Jua', sans-serif;
            color: #7c6356;
        }
        
        .btn {
            background-color: #7c6356;
            color: white;
        }
        
        .border-a {
            border: #5E4D44 solid 3px;
            border-radius: 1rem !important;
        }
        
        .col-12 input,
        .col-12 textarea {
            border: 0.0625rem solid #7c6356;
            color: #7c6356;
        }
        
        #listbtn {
            background-color: #5E4D44;
            border-color: #5E4D44;
            font-size: 22px;
            letter-spacing: 4px;
        }
        
        #notice_content {
            font-size: 20px;
            padding: 1.5rem;
        }
    </style>
</head>

<body>
    <!-- Section -->
    <section class=" d-flex align-items-center section-image py-lg-0">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12">
                    <div class="col-12 mt-3 d-flex align-items-center justify-content-center">
                        <div class="bg mt-8 rounded p-5 w-100 fmxw-850 border-a">

                            <div class="col-12 text-center mb-5 mt-md-3">
                                <div style="width: 100px; height: 100px; display: inline-block; float: left; ">
                                    <img src="${path}/resources/upload/member/${notice.profile}" alt="관리자 이미지" style="width: 100px; height: 100px; border-radius: 50px;">
                                </div>
                                <div style="width: 100px; height: 100px; display: inline-block; float: left;">
                                    <h5 class="mb-2 font mt-4" style="color: #5E4D44; padding-left: 20px; text-align: left; font-size: 20px;">${notice.nick_name }</h5>
                                    <p class="font" style="color: #947b6d; padding-left: 20px; text-align: left; font-size: 18px;">${fn:substring(notice.write_date,0,10)}</p>
                                </div>
                                <div style="width: 500px; height: 100px; display: inline-block; float: center;">
                                    <p class="font mt-3" style="color: #5E4D44; font-size: 25px;">${notice.title }</p>
                                </div>
                            </div>


                            <div id="notice_content" class="col-12 px-4 " style="border: 1px solid  #5E4D44;  border-radius: 1rem; height: 600px;">
                            <c:if test="${notice.re_filename != null }">
                            	<img alt="" src="<img src="${path}/resources/upload/notice/${notice.re_filename}"">
                            </c:if>
                               ${notice.content}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section>
        <div class="container mb-5">
            <div class="text-center">
                <button id="listbtn" class="btn btn-dark mt-4 animate-up-2 text-center px-7" type="button" onclick="location.href = '${path}/notice/list'">
            목록으로</button>
            <c:if test="${loginMember.id != null }">
	            <c:if test="${loginMember.id.equals('admin') }">
	                <button id="listbtn" class="btn btn-dark mt-4 animate-up-2 text-center px-7" type="button" onclick="location.href='${path}/notice/update?notice_no=${notice.notice_no }'">
	            수정하기</button>
	            </c:if>
            </c:if>
            </div>

        </div>
    </section>
    </main>



   
</body>

</html>