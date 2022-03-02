<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

           <div class="modal-content">
				<table style="align-content: center;">
					<c:forEach var="req" items="${reqList}">
					<script type="text/javascript">

					</script>
					<tr>
						<td style="width: 55px">
							 <c:if test="${req.profile != null}">
								<img src="${path}/resources/upload/member/${req.profile}" width="50px" height="50px"  class="rounded-circle border-white">
							</c:if>
							 <c:if test="${req.profile == null}">
								<img src="${path}/resources/images/nuts_logo.png" width="50px" height="50px"  class="rounded-circle border-white">
							</c:if>
						</td>
						<td style="text-align: center">${req.nick_name }</td>
						<td style="text-align: center;width: 130px"> 
							<a onclick="reqUpdate('${req.wr_no}','수락')" class="btn btn-sm btn-primary mb-3" style="color:  white">수락</a>
							<a onclick="reqUpdate('${req.wr_no}','거절')" class="btn btn-sm btn-primary mb-3" style="color:  white">거절</a> 
						</td>
					</tr>
					
					</c:forEach>
				</table>

			</div>
			<script type="text/javascript">
			<c:if test="${count > 0}">
				$("#bellBtn${party_no}").css("color", "red");
			</c:if>
			</script>
