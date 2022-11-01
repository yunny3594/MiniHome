<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript"></script>
</head>
<body>
	<form action="/SignUp" method="post">
		<table>
			<tr>
				<td>이름</td>
				<td><input type="text" name="username"></td>
			</tr>
			<tr>
				<td>ID</td>
				<td><input type="text" name="userid"></td>
			</tr>
			<tr>
				<td>PW</td>
				<td><input type="text" name="userpw"></td>
			</tr>
			<tr>
				<td>일촌명</td>
				<td><input type="text" name="ilchon"></td>
			</tr>
		</table>
		<input type="submit" value="회원가입">
	</form>
</body>
</html>