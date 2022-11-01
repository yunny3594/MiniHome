<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다이어리</title>
</head>
<body>
	다이어리쓰기
	<form action="/diaryWrite" method="post">
		<textarea rows="20" cols="50" name="content"></textarea>
		<input type="submit" value="등록">
	</form>
</body>
</html>