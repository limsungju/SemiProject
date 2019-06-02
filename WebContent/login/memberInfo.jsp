<%@page import="java.util.ArrayList"%>
<%@page import="members.MemberDTO"%>
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
	<jsp:include page="/default/header.jsp" />
	<div align="center">
		<h1>회원 목록</h1>
		<jsp:useBean id="mb" class="members.MemberDAO" />

		<c:set var="memberList" value="${mb.memberView()}" />
		<c:set var="values" value="${memberList }" />
		<c:choose>
			<c:when test="${values==null || values.size()==0 }">
				<h1>등록된 값이 없습니다.</h1>
			</c:when>

			<c:otherwise>

				<table border='1'>
					<tr>
						<th width="100">이름</th>
						<th width="100">주소</th>
						<th width="100">전화번호</th>
					</tr>
					<c:forEach var="dto" items="${values}">

						<tr>

							<td style="cursor: pointer"
								onclick="location.href='userInfo.jsp?id=${dto.getId()}'">
								${dto.getName()}</td>

							<td>${dto.getAddr()}</td>
							<td>${dto.getTel()}</td>
						</tr>
					</c:forEach>
				</table>


			</c:otherwise>

		</c:choose>

	</div>
	<jsp:include page="/default/footer.jsp" />

</body>
</html>
