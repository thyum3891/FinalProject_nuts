<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
        
        .font {
            font-family: 'Jua', sans-serif;
            color: #7c6356;
        }
        
        .bg {
            background-color: WHITE;
        }
        
        .btn {
            background-color: #5f4f46;
            border-color: #5E4D44;
            color: rgb(255, 255, 255);
        }
        
        .border-a {
            border: #5E4D44 solid 2px;
        }
    </style>
</head>

<body>
    <!-- Section -->


     <form action="${ path }/notice/update" method="POST" enctype="multipart/form-data">
    <section class="d-flex align-items-center section-image">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 ">
                    <div class="col-12 mt-3 d-flex align-items-center justify-content-center">
                        <div class="bg mt-8 rounded p-5 w-100 fmxw-700 border-a ">

                            <!-- Form -->
                           

                                <div class="col-12 text-center mb-5 mt-md-3">
                                    <h5 class="mb-0 font" style="color: #5E4D44;">공지사항</h5>
                                </div>


                                <div class="col-12 px-3">

                                    <input class="form-control" type="text" id="notice_title" placeholder="제목" name="title" value="${notice.title }" required>

                                </div>
                                <div class="col-12 d-flex">
                                    <input class="col-md-8 my-3 form-control mr-lg-5" disabled="disabled" id="notice_file" placeholder="파일없음" name="notice_file" value="${notice.filename }">
                                    <label class="btn col-md-3 my-3 btn-dark animate-up-2" style="background-color: #a38778; border-color: #a38778; font-color : white;" >
                                        파일 업로드<input type="file" onchange="change(this.value)" name="reloadFile" hidden></label>
                                </div>

                                <div class="slideform-group col-12">
                                    <textarea class="form-control my-3" placeholder="" id="notice_Textarea" name="content" rows="12" required></textarea>
                                </div>
                                <input type="text" value="${loginMember.id}" name="writer" hidden>
                                <input type="text" value="${notice.notice_no}" name="notice_no" hidden>
                           
                            <!-- End of Form -->

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

            <div class="container mb-5 d-flex justify-content-center">
                <div class="row ">
                    <div class="col-12 d-flex justify-content-center">
                        <button class="btn mx-2 px-6 btn-dark mt-4 animate-up-2" type="submit">수정하기</button>
                        <button class="btn mx-2 px-6 btn-dark mt-4 animate-up-2" type="location.href ='${path}/notice/delete?notice_no=${notice.notice_no }'">삭제하기</button>
                    </div>
                    <div class="col-12 mb-5 d-block d-flex justify-content-center mt-4">
                        <a href="${path }/notice/list" style="color : #977d6f;">목록으로</a>
                    </div>
                </div>
            </div>
         </form>
    </main>
 
</body>
<script type="text/javascript">
    	function change(value){
    		$("#notice_file").val(value);
    		
    	}
    </script>
</html>