<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 수정하기</title>
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
	function update_ok(f) {
		// 비밀번호 체크
		if (f.pwd.value == "${vo.pwd}") {
			alert("수정완료");
			f.action="${pageContext.request.contextPath}/MyController?cmd=update_ok";
			f.submit();
		} else {
			alert("비밀번호 틀림");
			f.pwd.value="";
			f.pwd.focus();
			return;
		}
	}
</script>
</head>
<body>
  <div>
  <h2>방명록: 수정화면</h2>
	<hr>
	<h3>[<a href="list.jsp">게시물 목록으로</a>]</h3>
	  <form method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<th class="bg">작성자</th><th><input type="text" name="name" value="${vo.name }" readonly></th>
			</tr>
			<tr>
				<th class="bg">제목</th><th><input type="text" name="subject" value="${vo.subject }"></th>
			</tr>
			<tr>
				<th class="bg">E-mail</th><th><input type="email" name="email" value="${vo.email }"></th>
			</tr>
			<tr>
				<th class="bg">첨부파일</th>
  				  <td>
					<c:choose>
						<c:when test="${empty vo.f_name }">
								<input type="file" name="f_name"> 첨부된 파일 없음<br>
						</c:when>
						<c:otherwise>
								<input type="file" name="f_name" value=""> 
								<input type="hidden" name="f_name2" value="${vo.f_name}"> 이전 파일(${vo.f_name})<br>
						</c:otherwise>
					</c:choose>
				  </td>
			</tr>
			<tr>
				<th class="bg">비밀번호</th><th><input type="password" name="pwd"></th>
			</tr>
			<tr>
				<td colspan="2">
					<textarea rows="10" cols="50" name="content">${vo.content}</textarea>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="button" value="수정" onclick="update_ok(this.form)">
				</th>
				
			</tr>
		</table>
	 </form>
  </div>

</body>
</html>