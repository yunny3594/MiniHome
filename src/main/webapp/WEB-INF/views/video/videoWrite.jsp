<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>video upload</title>


</head>
<body>
	<form action="/videoWrite" method="post" id="form">
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
				<td>iframe</td>
				<td><textarea name="iframe"></textarea></td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td><textarea name="content"></textarea></td>
			</tr>
		</table>
		<input type="submit" id="uploadBtn" value="글쓰기">
	</form>

</body>
</html>