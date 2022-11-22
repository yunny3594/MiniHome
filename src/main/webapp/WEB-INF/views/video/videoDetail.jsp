<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/attach.js"></script>
</head>
<body>
	<form method="post">
		<table border="1">
			<tr>
				<td>bno</td>
				<td><input type="text" name="bno" value="${detail.bno}"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" value="${detail.title}"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content">${detail.content}</textarea></td>
			</tr>
		</table>
	</form>
	<div id="photo">
		<ul></ul>
	</div>

</body>
</html>