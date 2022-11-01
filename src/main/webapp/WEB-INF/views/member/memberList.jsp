<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>이름</td>
			<td>ID</td>
			<td>PW</td>
			<td>일촌명</td>

		</tr>
		<c:forEach items="${memberList}" var="member">
		<tr>
			<td>${member.username}</td>
			<td>${member.userid}</td>
			<td>${member.userpw}</td>
			<td>${member.ilchon}</td>
		</tr>
		</c:forEach>
	</table>

</body>
</html>