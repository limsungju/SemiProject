<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
	<%
	 String path = request.getRealPath("fileUpDown");
    out.print("fileFolder path : "+path);
    int size = 1024 * 1024 * 10; //10M
    String file = "";	String oriFile = "";
    MultipartRequest multi = 
   					new MultipartRequest(request, path, size,
   							"utf-8", new DefaultFileRenamePolicy());
    file = multi.getFilesystemName("file");
    oriFile = multi.getOriginalFileName("file");
   	
    out.print("<br>request : "+request.getParameter("test")+"<br>");
    out.print("multi : "+multi.getParameter("test")+"<br>");
    
    out.print("<br>DefaultFileRenamePolicy() : "+
    					  "동일한 이름의 파일이 존재 한다면 1,2,3을 넣어 주겠다");
    out.print("<br>file(저장될 파일 이름) : " + file);
    out.print("<br>oriFile(실제 파일 이름) : " + oriFile);
    
%>
	
	<jsp:useBean id="dto" class="Board.reDTO"/>
	<jsp:setProperty property="*" name="dto"/>
	<jsp:useBean id="dao" class="Board.reDAO"/>
	${dao.insert(dto) }
	<c:redirect url="listQna.jsp"/>
	
	
</body>
</html>










