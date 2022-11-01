<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="get">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="userid" value="${memberDetail.userid}"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="userpw"
					value="${memberDetail.userpw}"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="username" value="${memberDetail.username}"></td>
			</tr>
			<tr>
				<td>일촌명</td>
				<td><input type="text" name="ilchon"
					value="${memberDetail.ilchon}"></td>
			</tr>

			<tr>
				<td><input type="submit" value="수정" formaction="/memberModify">
					<input type="submit" value="탈퇴" formaction="/memberRemove"></td>
			</tr>
		</table>
	</form>
</body>
</html>