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
<jsp:useBean id="check" class="members.MemberDAO"/>
<c:set var="result" value="${check.delete(param.id)}"/>
<c:choose>
	<c:when test="${result==1 }">

		<c:remove var="userId" scope="session"/>
		<script>alert('삭제 되었습니다'); location.href="login.jsp";</script>
	
	</c:when>
	<c:otherwise>
	
		<script>alert('문제가 발생 되었습니다'); history.back();</script>
	</c:otherwise>

</c:choose>

</body>
</html>