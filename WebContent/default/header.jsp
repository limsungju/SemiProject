<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
ul#menu li {
	display: inline;
}
</style>
</head>
<body>
	<header>
		<div align="center">
		

				<h2>CARE LAB</h2>
			
		
		<div align="right">
		<hr>
			<ul id="menu">
			
				<li><a href="index.jsp">HOME</a></li>
				
				<c:choose>
				<c:when test="${userId=='' || userId==null }">
				<li><a href="/semiproject/login/login.jsp">회원정보</a></li>
				</c:when>
				<c:otherwise>
				<li><a href="/semiproject/login/memberInfo.jsp">회원정보</a></li>
				</c:otherwise>
				</c:choose>
				
				<c:choose>
				<c:when test="${userId=='' || userId==null }">
				<li><a href="/semiproject/login/login.jsp">게시판</a></li>
				</c:when>
				<c:otherwise>
				<li><a href="/semiproject/board/mainList.jsp">게시판</a></li>
				</c:otherwise>
				</c:choose>
				
				
				<c:choose>
				<c:when test="${userId=='' || userId==null }">
					<li><a href="/semiproject/login/login.jsp">로그인</a></li>
				</c:when>
				<c:otherwise>
				<li><a href="/semiproject/login/logout.jsp">로그아웃</a></li>
				</c:otherwise>
				</c:choose>
			</ul>
		</div>
			
		</div>
			<hr>
	</header>

</body>
</html>