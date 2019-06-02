<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<jsp:include page="/default/header.jsp"/>
	<c:set var="pc" value="${dao.pagingNum(param.start) }" />
	<c:set var="listDto" value="${dao.list(pc.startPage,pc.endPage) }" />
	<c:set var="totalPage" value="${dao.getTotalPage() }" />
	<div>
		<h4>TIP</h4>
		<table border=1>
			<tr>

				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>좋아요</th>

			</tr>
			<c:choose>
				<c:when test="${param.start == null}">
					<c:set var="start" value="1" />
				</c:when>
				<c:otherwise>
					<c:set var="start" value="${param.start }" />
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${listDto.size() != 0 }">
					<c:forEach var="list" items="${listDto }">
						<tr>
							<td>${list.num }</td>
							<td><a href="content.jsp?num=${list.num }"> ${list.title }</a></td>
							<td>${list.id }</td>
							<td>${list.pdate }</td>
							<td>${list.count }</td>
							<td>${list.likey }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<th colspan="6">등록된 값이 없습니다</th>
					</tr>
				</c:otherwise>
			</c:choose>
			<tr>
				<td colspan="6">
					<c:choose>
						<c:when test="${start > 1 }">
							<button type="button"
								onclick="location.href='listTip.jsp?start=${start-1}'">이전</button>
						</c:when>
						<c:otherwise>
							<button type="button" disabled>이전</button>
						</c:otherwise>
					</c:choose> 
					<c:forEach begin="1" end="${pc.totEndPage }" step="1" var="cnt">
						<a href="listTip.jsp?start=${cnt }">[${cnt }]</a>
					</c:forEach> <c:choose>
						<c:when test="${start < pc.totEndPage }">
							<button type="button"
								onclick="location.href='listTip.jsp?start=${start+1}'">다음</button>
						</c:when>
						<c:otherwise>
							<button type="button" disabled>다음</button>
						</c:otherwise>
					</c:choose> ${start } / ${pc.totEndPage }
					<button type="button" onclick="location.href='regFormTip.jsp'">
						글쓰기</button></td>
			</tr>

		</table>




	</div>
<jsp:include page="/default/footer.jsp"/>
</body>
</html>