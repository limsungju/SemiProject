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

	<%@page import="members.*" %>
	<jsp:useBean id="check" class="members.MemberDAO"/>
	<jsp:useBean id="dto" class="members.MemberDTO"/>
	<jsp:setProperty property="*" name="dto"/>
	<c:set var= "result" value="${check.userCheck(dto.getId(),dto.getPwd())}"/>
	<c:choose>
		<c:when test="${result==2 }">
			<c:set var="userId" value="${dto.getId() }" scope="session"/>
			<c:redirect url="successLogin.jsp"/>
		</c:when>
		<c:when test="${result==1 }">
			
				<script>alert("비밀번호가 일치하지 않습니다.."); location.href="login.jsp";</script>
			
		</c:when>
		<c:otherwise>
			
				<script>alert('등록되지 않은 아이디 입니다.'); location.href="login.jsp";</script>
		
		</c:otherwise>
	</c:choose>	
	
</body>
</html>