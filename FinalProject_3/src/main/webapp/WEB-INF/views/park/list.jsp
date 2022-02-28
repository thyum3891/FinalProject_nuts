<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ffea6673691d899c7b831444d7cf6ba1&libraries=services"></script>

	
<body>
	<section id="park" class="section-header pb-9 pb-lg-12 bg-park text-white">
		<div class="container">
			<div class="row">
				<div class="col-12 text-center">
					<div class="col-12 text-center">
						<h1 class="mb-5 mt-100"><span class="font-weight-bolder" style="color: #5E4D44;">내 주변 공원 조회하기</span></h1>
					</div>
					
					<form action="${ path }/park/list" method="get">
						<div class="d-flex justify-content-center mb-6">
                        	<div class="col-12 col-lg-4">
                            	<div class="form-group form-group-lg mb-lg-0">
                                	<div class="input-group input-group-lg mt-3">
                                    	<div class="input-group-prepend">
                                        	<span class="input-group-text" style="border-color: #5E4D44;">
                                            	<svg style="color: #5E4D44;" xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-map" viewBox="0 0 16 16">
                                                	<path fill-rule="evenodd" d="M15.817.113A.5.5 0 0 1 16 .5v14a.5.5 0 0 1-.402.49l-5 1a.502.502 0 0 1-.196 0L5.5 15.01l-4.902.98A.5.5 0 0 1 0 15.5v-14a.5.5 0 0 1 .402-.49l5-1a.5.5 0 0 1 .196 0L10.5.99l4.902-.98a.5.5 0 0 1 .415.103zM10 1.91l-4-.8v12.98l4 .8V1.91zm1 12.98 4-.8V1.11l-4 .8v12.98zm-6-.8V1.11l-4 .8v12.98l4-.8z"/>
                                            	</svg>
                                        	</span>
                                    	</div>
                                    	<select class="custom-select text-surroundAir" id="addr" name="addr" style="border-color: #5E4D44;" value="" required="required">
														<option value="">서울특별시</option>
														<option value="강남구">강남구</option>
														<option value="강동구">강동구</option>
														<option value="강북구">강북구</option>
														<option value="강서구">강서구</option>
														<option value="관악구">관악구</option>
														<option value="광진구">광진구</option>
														<option value="구로구">구로구</option>
														<option value="금천구">금천구</option>
														<option value="노원구">노원구</option>
														<option value="도봉구">도봉구</option>
														<option value="동대문구">동대문구</option>
														<option value="동작구">동작구</option>
														<option value="마포구">마포구</option>
														<option value="서대문구">서대문구</option>
														<option value="서초구">서초구</option>
														<option value="성동구">성동구</option>
														<option value="성북구">성북구</option>
														<option value="송파구">송파구</option>
														<option value="양천구">양천구</option>
														<option value="영등포구">영등포구</option>
														<option value="용산구">용산구</option>
														<option value="은평구">은평구</option>
														<option value="중구">중구</option>
														<option value="종로구">종로구</option>
														<option value="중랑구">중랑구</option>
											</select>
                                	</div>
                            	</div>
                        	</div>


                        	<div class="col-12 col-lg-3 ">
                            	<div class="input-group input-group-lg mt-3 ">
                                	<button class="btn btn-primary btn-block animate-up-2 " type="button" onclick="mapQuery($('#addr').val())" style="background-color: #5E4D44; border-color: #5E4D44; height: 3.3rem;">검색하기</button>
                            	</div>
                        	</div>
                    	</div>
					</form>
                    	
                    <div class="d-flex justify-content-center flex-column mb-6">
                        <img src="${ path }/resources/images/park-align.png" class="d-block mx-auto mb-3" height="1" width="1500" alt="Themesberg Logo">
                    </div>
                </div>
			</div>
		</div>
	
		<figure class="position-absolute bottom-0 left-0 w-100 d-none d-md-block mb-n2">
			<svg class="fill-white" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 3000 185.4">
				<path d="M3000,0v185.4H0V0c496.4,115.6,996.4,173.4,1500,173.4S2503.6,115.6,3000,0z" />
			</svg>
		</figure>
	</section>

    <div class="section pt-0">
        <div class="container mt-n10 mt-lg-n12 z-2">
            <div class="row justify-content-center">
                <div class="col-12">
                    <div class="card border-primary p-md-10 " id="map">
                    </div>
                </div> 
            </div>
        </div>
    </div>

    <section class="section section-sm pt-70" id="view">
	</section>
	
	
	<script type="text/javascript">
    mapQuery("");
	function mapQuery(addr){
		
		navigator.geolocation.getCurrentPosition(function(position) {
			<c:if test="${lat!=null && lng != null }">
			 var lat = ${lat},
		        lng = ${lng};
			</c:if>
			<c:if test="${lat==null && lng == null }">
			 var lat = position.coords.latitude,
		        lng = position.coords.longitude;
			</c:if>
		    $.ajax({ 
				type : "GET",
				url : "${path}/park/parkMap",
				data : {
					lat, lng, addr
				},
				success : function (result) {
					console.log(result);
					$("#view").html(result);
				},
				error : function (e) {
					$("#view").html("에러<br>" + e);
				},
			});
		}); 
		
		<!--location.href = ("${path}/park/list?addr=" + addr + "&lat=" + lat +"&lng=" + lng); -->
	}
	</script>
</body>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />


