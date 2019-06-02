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
<div><h2>게시글 등록</h2>
<form action="regTip.jsp" method="post">
	<table>
		<tr>
			<td><b>제목</b></td>
			<td><input type="text" name="title"></td>
		</tr>
		<tr>
			<td><b>내용</b></td>
			<td><textarea rows="10" cols="15" name="content"></textarea></td>
		</tr>
		<tr>
			<td><b>파일첨부</b></td>
			<td><input type="file" name="filename" onclick="location.href='fileUpLoad.jsp?file=${file}'"></td>
		</tr>	
			
	</table>
	<input type="hidden" name="id" value="${userId }">
	<input type="submit" value="글저장">
	<input type="button" value="목록으로" onclick="location.href='listTip.jsp'">
</form>
</div>
</body>
</html>






