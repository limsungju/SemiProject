<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		fileForm.jsp 페이지
<form action="fileUpLoad" method="post"
									 enctype="multipart/form-data">
	파일 : <input type="file" name="file"><br />
	내용 <input type="text" name="test"><br>
	<input type="submit" value="File Upload">
	
	
	<a href="fileName">파일 목록 보기</a>
	
</form>
</body>
</html>