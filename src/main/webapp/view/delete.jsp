<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 삭제하기</title>
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
	function delete_ok(f) {
		// 비밀번호 체크
		if (f.pwd.value == "${vo.pwd}") {
			var chk = confirm("정말 삭제할까요?");
			if (chk) {
				f.submit();
			} else {
				history.go(-1);
			}
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
  <h2>방명록: 삭제화면</h2>
	<hr>
	<h3>[<a href="${pageContext.request.contextPath}/MyController?cmd=list">게시물 목록으로</a>]</h3>
	  <form action="${pageContext.request.contextPath}/MyController" method="post">
		<table>
		 <tbody>
			<tr>
				<th class="bg">비밀번호</th><th><input type="password" name="pwd" required="required"></th>
			</tr>
		  <tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="삭제" onclick="delete_ok(this.form)">
					<input type="hidden" name="cmd" value="delete_ok">
				</td>
				
			</tr>
		  </tfoot>
		 </tbody>
		</table>
	 </form>
  </div>
	

</body>
</html>