<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다이어리 수정</title>
</head>
<body>
	다이어리수정
	<c:forEach items="${detail}" var="detail">
	<form action="/diaryModify" method="post">
		<input type="hidden" value="${detail.dno}" name="dno">
		<textarea rows="20" cols="50" name="content">${detail.content}</textarea>
		<input type="submit" value="수정">
	</form>
	</c:forEach>
</body>
</html>