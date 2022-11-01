<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="initial-scale=1.0, 
			minimum-scale=1.0, 
			width=device-width" />

<title>사진첩</title>

<link rel="stylesheet" href="/resources/css/photo.css">
<link rel="stylesheet" href="/resources/css/layout.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"
	src="/resources/js/folder_select.js"></script>


</head>

<body>
	<%@ include file="/WEB-INF/views/layout1.jsp"%>

	<div class="folder">
		<strong class="photo_album">PHOTO ALBUM</strong>
		<ul>
			<li><a class="select" href="/photo">🔎전체보기</a></li>
			<c:forEach items="${folder}" var="folder">
				<li><a class="select" href="/photo?folder=${folder.fno}">📂${folder.fname}</a></li>
			</c:forEach>
		</ul>
		<br> <br> <a href="/photoSetting" id="foldersetting">폴더관리</a>
	</div>

	<%@ include file="/WEB-INF/views/layout2.jsp"%>

	<div class="photo_contents">
		<table>
			<!-- for문 시작 -->
			<c:forEach items="${list}" var="list">
				<tr>
					<th>${list.title}</th>
				</tr>
				<tr>
					<td>${list.updatedate}</td>
				</tr>

				<tr>
					<td class="content"><img
						src="/display?fileName=${list.file_address}"> <br>${list.content}</td>
				</tr>
				<tr>
					<td><a href="/photoModify?bno=${list.bno}">수정</a> <a
						href="/photoRemove?bno=${list.bno}">삭제</a></td>
				</tr>

			</c:forEach>
			<!-- for문 끝 -->
		</table>

		<!-- 페이징 -->
		<div align="center">
			<!-- prev=true면 이전버튼 활성화 -->
			<c:if test="${paging.prev}">
				<a
					href="/photo?pageNum=${paging.startPage-1}&amount=${paging.cri.amount}&folder=${paging.cri.folder}">이전</a>
			</c:if>
			<!-- begin이 end될동안 반복 10 -->
			<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
				var="num">
				<a
					href="/photo?pageNum=${num}&amount=${paging.cri.amount}&folder=${paging.cri.folder}">${num}</a>
			</c:forEach>
			<!-- next=true면 다음버튼 활성화 -->
			<c:if test="${paging.next}">
				<a
					href="/photo?pageNum=${paging.endPage+1}&amount=${paging.cri.amount}&folder=${paging.cri.folder}">다음</a>
			</c:if>
			<br> <br> <a href="/photoWrite"><button>사진올리기</button></a>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/layout3.jsp"%>
</body>
</html>