<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js">
</script>
<script type="text/javascript" src="/resources/js/popup.js"></script>
</head>
<body>
	<form action="/SignUp" method="post">
		<table>
			<tr>
				<td>이름</td>
				<td><input type="text" name="username">
				<label id="namemsg"></label></td>
			</tr>
			<tr>
				<td>ID</td>
				<td><input type="text" name="userid">
				<label id="idmsg"></label></td>
			</tr>
			<tr>
				<td>PW</td>
				<td><input type="password" name="userpw">
				<label id="pwmsg"></label></td>
			</tr>
			<tr>
				<td>일촌명</td>
				<td><input type="text" name="ilchon">
				<label id="icmsg"></label></td>
			</tr>
		</table>
		<button type="button" id="join" onclick="Signup">가입하기</button>
	</form>
</body>
</html>