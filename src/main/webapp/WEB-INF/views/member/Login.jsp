<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js">
</script>
<script type="text/javascript" src="/resources/js/popup.js"></script>
</head>
<body>
	<form action="/Login" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="userid"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="userpw"></td>
			</tr>
		</table>
		<button type="button" onclick="Login()">로그인</button>
	</form>

</body>
</html>