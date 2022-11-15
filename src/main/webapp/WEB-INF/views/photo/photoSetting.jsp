<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사진첩 폴더 관리</title>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/photoSetting.js"></script>

</head>
<body>
	<c:forEach items="${photo_folder}" var="folder">
		<form>
			<table>

				<tr>
					<td><input type="text" value="${folder.fno}" name="fno"></td>
					<td><input type="text" value="${folder.fname}" name="fname"></td>
					<td><input type="submit" value="수정"
						formaction="photoFolderModify" id="modify">
						<input type="submit" value="삭제"
						formaction="photoFolderDelete" id="delete"></td>
				</tr>

			</table>
		</form>
	</c:forEach>
	<form action="photoFolderAdd">
		<table>
			<tr>
				<td>+</td>
				<td><input type="text" name="fname"></td>
				<td><input type="submit" value="추가" id="add"></td>
			</tr>
		</table>
	</form>


</body>
</html>