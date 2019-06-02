<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="dao" class="Board.reDAO"/>
	${dao.listModify(param.reTitle, param.reContent, param.num) }
	<script>alert("수정 되었습니다."); location.href="content.jsp?num=${param.num}";</script>
</body>
</html>