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

	<fmt:requestEncoding value="utf-8"/>
	<jsp:useBean id="dao" class="Board.reDAO"/>
	<c:set var="dto" value="${dao.listView(param.num) }"/>
	
	<div><h2>글 내용</h2>
		<form action="chkmodify.jsp" method="post">
		<input type="hidden" name="num" value="${param.num }">
		<table border=1>
			<tr>
				<td><b>작성자</b></td><td>${dto.getId()}</td><td><b>조회수</b></td><td>${dto.getCount() }</td>
			</tr>
			<tr>
				<td><b>작성일</b></td><td>${dto.getPdate() }</td><td><b>다운로드</b></td><td>${dto.getFilename()}</td>
			</tr>
			<tr>
				<td><b>제목수정</b></td><td colspan="3"><input type="text" value="${dto.getTitle() }" name="reTitle"></td>
			</tr>
			<tr>
				<td><b>문서내용 수정</b></td><td colspan="3"><textarea rows="10" cols="20" name="reContent">${dto.getContent() }</textarea></td>
			</tr>
			<tr>
				<td colspan="4">
					<input type="button" value="이전" onclick="location.href='list.jsp'">
					<input type="submit" value="수정" >
			</tr>
	
		
		</table>
		</form>
	</div>

</body>
</html>