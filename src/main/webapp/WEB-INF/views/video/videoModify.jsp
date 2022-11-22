<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>

</head>
<body>
	<form action="/photoModify" method="post" id="form">
		<table border="1">
		<tr><td>bno:</td><td><input type="text" value="${detail.bno}" name="bno"></td></tr>
			<tr>
				<td>폴더</td>
				<td><select name="folder">
						<c:forEach items="${folder}" var="folder">
							<option value="${folder.fno}">${folder.fname}</option>
						</c:forEach>
				</select></td>
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
		<input type="submit" value="수정">
	</form>

</body>
</html>