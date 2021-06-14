<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 작성하기</title>
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
	function write_ok(f) {
		f.action="${pageContext.request.contextPath}/MyController?cmd=write_ok";
		f.submit();
	}
</script>
</head>
<body>
  <div>
  <h2>방명록: 작성화면</h2>
	<hr>
	<h3>[<a href="${pageContext.request.contextPath}/MyController?cmd=list">게시물 목록으로</a>]</h3>
	  <form method="post" enctype="multipart/form-data">
		<table>
		 <tbody>
			 <tr>
				<th class="bg">작성자</th><th><input type="text" name="name" required></th>
			</tr>
			<tr>
				<th class="bg">제목</th><th><input type="text" name="subject" required></th>
			</tr>
			<tr>
				<th class="bg">E-mail</th><th><input type="text" name="email" required></th>
			</tr>
			<tr>
				<th class="bg">비밀번호</th><th><input type="password" name="pwd" required></th>
			</tr>
			<tr>
				<th class="bg">첨부파일</th><th><input type="file" name="f_name"></th>
			</tr>
			<tr>
				<td colspan="2">
					<textarea rows="10" cols="50" name="content" required></textarea>
				
				</td>
			</tr>
		  <tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="작성하기" onclick="write_ok(this.form)" >
				</td>
				
			</tr>
		  </tfoot>
		 </tbody>
		</table>
	 </form>
  </div>

</body>
</html>