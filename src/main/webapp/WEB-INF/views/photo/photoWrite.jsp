<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gallery</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/galleryFile.js"></script>

</head>
<body>
	<form action="/photoWrite" method="post" id="form">
		<table border="1">
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
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<td>파일</td>
				<td><input type="file" name="uploadFile"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content"></textarea></td>
			</tr>
		</table>
		<input type="button" id="uploadBtn" value="글쓰기">
	</form>

</body>
</html>