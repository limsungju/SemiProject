<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
	div{	text-align:center;
		}
		table{	margin:auto;
				text-align:center;
				
			}


</style>
</head>
<body>


	<fmt:requestEncoding value="utf-8"/>
	<jsp:useBean id="dao" class="Board.reDAO"/>
	${dao.count(param.num) }
	<c:set var="dto" value="${dao.listView(param.num) }"/>
	
	<div><h2>글 내용</h2>
		<table border=1>
			<tr>
				<td><b>작성자</b></td><td>${dto.getId()}</td><td><b>조회수</b></td><td>${dto.getCount() }</td>
			</tr>
			<tr>
				<td><b>작성일</b></td><td>${dto.getPdate() }</td><td><b>다운로드</b></td><td>${dto.getFilename()}</td>
			</tr>
			<tr>
				<td><b>문서내용</b></td><td colspan="3">${dto.getContent() }</td>
			</tr>
			<tr>
				<td><b>좋아요</b></td><td colspan="3">${dto.getLikey() }</td>
			</tr>
			<tr>
				<td colspan="4">
				<c:choose>
					<c:when test="${userId == dto.getId() }">
						<input type="button" value="목록" onclick="location.href='list.jsp'">
						<input type="button" value="수정" onclick="location.href='modify.jsp?num=${param.num}'">
						<input type="button" value="삭제" onclick="location.href='listDelete.jsp?num=${param.num}'">
					</c:when>
					<c:otherwise>
						<input type="button" value="목록" onclick="location.href='list.jsp'">
						<input type="button" value="좋아요" onclick="location.href='likeylikey.jsp?num=${param.num}'">
					</c:otherwise>
			</c:choose>
			</tr>
	
	
		</table>
	</div>
	
	
</body>
</html>












