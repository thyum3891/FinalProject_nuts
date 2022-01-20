<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="item" items="${shopList}">
	<img alt="썸네일" src="${item.image}" height="300px" width="300px">
	<p><a href="${item.link}">상품명 : ${item.title}</a></p>
	<p>링크 : ${item.link}</p>
	<p>최저가 : ${item.lprice}</p>
	<p>카테고리 1 : ${item.category1}</p>
	<p>카테고리 2 : ${item.category2}</p>
	<p>카테고리 3 : ${item.category3}</p>
	<p>카테고리 4 : ${item.category4}</p>
	
	</c:forEach>
</body>
</html>