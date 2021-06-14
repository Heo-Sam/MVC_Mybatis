<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록: 내용화면</title>
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
	.bg{
		background-color: skyblue;
	}
	input{
		padding: 5px;
	}
</style>
<script type="text/javascript">
	function update_go(f) {
		f.action="${pageContext.request.contextPath}/MyController?cmd=update";
		f.submit();
	}
	function delete_go(f) {
		f.action="${pageContext.request.contextPath}/MyController?cmd=delete";
		f.submit();
	}
</script>
</head>
<body>
 <div>
  <h2>방명록: 내용화면</h2>
	<hr>
	<h3>[<a href="${pageContext.request.contextPath}/MyController?cmd=list">게시물 목록으로</a>]</h3>
	  <form method="post">
		<table>
		 <tbody>
			 <tr>
				<th class="bg">작성자</th><th>${vo.name }</th>
			</tr>
			<tr>
				<th class="bg">제목</th><th>${vo.subject }</th>
			</tr>
			<tr>
				<th class="bg">E-mail</th><th>${vo.email }</th>
			</tr>
			<tr>
				<th class="bg">첨부파일</th>
				  <c:choose>
				  	<c:when test="${!empty vo.f_name }">
				  		<td>
				  			<a href="view/download.jsp?path=upload&f_name=${vo.f_name}"><img src="upload/${vo.f_name}" style="width: 80px"></a><br>
				  			${vo.f_name}
				  		</td>
				  	</c:when>
				  	<c:otherwise>
				  		<td>첨부파일 없음</td>
				  	</c:otherwise>
				  </c:choose>
			</tr>
			<tr style="text-align: left;">
				<td colspan="2" style="padding: 0px 50px;">
					<pre>${vo.content}</pre>
				</td>
			</tr>
		  <tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="수정" onclick="update_go(this.form)">
					<input type="button" value="삭제" onclick="delete_go(this.form)">
				</td>
				
			</tr>
		  </tfoot>
		 </tbody>
		</table>
	 </form>
  </div>

</body>
</html>