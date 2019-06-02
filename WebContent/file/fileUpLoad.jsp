<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>저장 되었습니다.</h1>

<%--
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
--%>
</body>
</html>





