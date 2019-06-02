<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<fmt:requestEncoding value="utf-8"/>
	
	<jsp:useBean id="dto" class="Board.reDTO"/>
	<jsp:setProperty property="*" name="dto"/>
	<jsp:useBean id="dao" class="Board.reDAO"/>
	${dao.insert(dto) }
	<c:redirect url="listTip.jsp"/>
</body>
</html>










