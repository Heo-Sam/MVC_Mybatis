<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 리스트</title>
<style type="text/css">
	a{
		text-decoration: none;
	}
	div{
		width: 600px;
		margin: 100px auto;
		text-align: center;
	}
	table{
		width: 600px;
		text-align: center;
		border-collapse: collapse;
	}
	table, tr, th{
		margin: auto;
		border: 1px solid black;
		padding: 5px;
	}
</style>
</head>
<body>
	<div>
	<h2>방명록</h2>
	<hr>
	  <h3>[<a href="${pageContext.request.contextPath}/MyController?cmd=write">방명록쓰기</a>]</h3>
		<form method="post">
		<table>
			<thead>
				<tr style="background-color: skyblue">
					<th>번호</th><th>작성자</th><th>제목</th><th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:choose> 
					<%-- 비어있으면 when --%>
					<c:when test="${empty list }">
						<tr>
							<td colspan="4"> <h2>원하는 정보가 존재하지 않습니다.</h2>
						</tr>
					</c:when>
					<%-- 비어있지 않으면 otherwise로 떨어진다 --%>
					<c:otherwise>
						<c:forEach var="k" items="${list}" varStatus="vs">
							<tr>
								<td>${vs.count}</td>
								<td>${k.name}</td>
								<td><a href="${pageContext.request.contextPath}/MyController?cmd=onelist&idx=${k.idx}">${k.subject}</a></td>
								<td>${k.regdate.substring(0,10) }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		</form>
	</div>

</body>
</html>