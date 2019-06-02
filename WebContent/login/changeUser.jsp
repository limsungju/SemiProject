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
<%
	request.setCharacterEncoding("utf-8");
	//response.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="check" class="members.MemberDAO"/>
<jsp:useBean id="dto" class="members.MemberDTO"/>
<jsp:setProperty property="*" name="dto"/>
<c:set var="id" value="${param.id}"/>
<c:set var="result" value="${check.changeUser(dto)}"/>
<c:choose>
	<c:when test="${result==1 }">
		<script>
		alert('변경 되었습니다.');
		location.href="userInfo.jsp?id=${id}";
		</script>

	</c:when>
	<c:otherwise>
	<script>
			alert('문제가 발생하였습니다. 관리자에게 문의하세요.');
			location.href="userInfo.jsp?id=${id}";
	</script>
	</c:otherwise>


</c:choose>

</body>
</html>