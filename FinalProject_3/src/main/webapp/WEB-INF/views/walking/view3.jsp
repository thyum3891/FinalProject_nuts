<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var = "testId" value="test2"/>



<script>

<c:forEach var="wp" items="${wpList}" varStatus="vs">
var reqNo = '${wp.party_no}'+'${testId}';
reqFunction('${wp.party_no}', reqNo);
</c:forEach>
function reqFunction(btnId, reqNo){
	
	const btnIdDoc1 = document.getElementById('btn1'+btnId);
	const btnIdDoc2 = document.getElementById('btn2'+btnId);
	
	console.log(btnIdDoc1);
	
	if('${reqStr}'.indexOf(reqNo) >= 0){
		btnIdDoc1.disabled = true;	
		btnIdDoc1.innerText = "신청완료";	
		btnIdDoc2.disabled = true;	
		btnIdDoc2.innerText = "신청완료";	
	}
	
}

</script>
