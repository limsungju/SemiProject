<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
	<c:when test="${userId==null }">
	<div align="center">
	
		내 사전에 불가능은 없다.<br>
		불가능은 소극적인 자의 환영이며<br>
		비겁한 자의 도피처 이다.<br><br>
		-나폴레옹
	</div>
	</c:when>
	<c:otherwise>
	<div align="center">
	
		<h3>로그인 성공</h3>
	</div>
	</c:otherwise>
</c:choose>


</body>
</html>