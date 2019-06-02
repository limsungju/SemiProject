<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String saveDir = application.getRealPath("fileUpDown");
File dir = new File(saveDir);
String fName[] = dir.list();
for(String fileName : fName){
    out.write("<a href=http://localhost:8080/"+
					  request.getContextPath()+"/FileDwon?fileName="
		+ java.net.URLEncoder.encode(fileName,"UTF-8")+">"
							  				+ fileName+"</a><br>");
 }
%>
</body>
</html>




