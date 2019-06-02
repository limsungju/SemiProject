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
	<jsp:include page="/default/header.jsp"/>
	
	<jsp:useBean id="mb" class="members.MemberDAO"/>
	<jsp:useBean id="dto" class="members.MemberDTO"/>
	<div align="center" style="height: 300px;">
	
	<h1>개인 정보</h1>
	<c:set var="dta" value="${mb.memberView(param.id)}"/>

		<table>
		<tr><th width="100">아 이 디</th><td>${dta.getId()}</td></tr>
		<tr><th width="100">비밀번호</th><td>${dta.getPwd()}</td></tr>
		<tr><th width="100">이 름</th><td>${dta.getName()}</td></tr>
		<tr><th width="100">주 소</th><td>${dta.getAddr()}</td></tr>
		<tr><th width="100">전화번호</th><td>${dta.getTel() }</td></tr>
	<tr>
	<td align="center"><input type="button" value="수 정" 
	onclick='location.href="modifyInfo.jsp?id=${dta.getId()}"'></td>
	<td><input type="button" value="삭 제" 
	onclick='location.href="delete.jsp?id=${dta.getId()}"'></td>
    </tr>
		</table>
	</div>
	
	<jsp:include page="/default/footer.jsp"/>
</body>
</html>