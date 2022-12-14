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

<title>๋์์</title>

<link rel="stylesheet" href="/resources/css/photo.css">
<link rel="stylesheet" href="/resources/css/layout.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="/resources/js/folder_select.js"></script>


</head>

<body>
	<%@ include file="/WEB-INF/views/layout1.jsp"%>

	<div class="folder">
		<strong class="photo_album">VIDEO</strong>
		<ul>
			<li><a class="select" href="/video">๐์ ์ฒด๋ณด๊ธฐ</a></li>
			<c:forEach items="${folder}" var="folder">
				<li><a class="select" href="/video?folder=${folder.fno}">๐${folder.fname}</a></li>
			</c:forEach>
			<li><a href="/videoSetting" id="foldersetting">โํด๋๊ด๋ฆฌ</a></li>
		</ul>

	</div>

	<%@ include file="/WEB-INF/views/layout2.jsp"%>

	<div class="photo_contents">



		<table>
			<!-- for๋ฌธ ์์ -->
			<c:forEach items="${list}" var="list">
				<tr>
					<th>${list.title}</th>
				</tr>
				<tr>
					<td>${list.regdate}</td>
				</tr>

				<tr>
					<td class="content">
						<div class="iframe"> ${list.iframe} </div> <br>${list.content}</td>
						
				</tr>
				<tr>
					<td><a href="/videoModify?vdno=${list.vdno}">์์ </a> 
					<a href="/videoRemove?vdno=${list.vdno}">์ญ์ </a></td>
				</tr>

			</c:forEach>
			<!-- for๋ฌธ ๋ -->
		</table>

		<!-- ํ์ด์ง -->
		<div align="center">
			<!-- prev=true๋ฉด ์ด์ ๋ฒํผ ํ์ฑํ -->
			<c:if test="${paging.prev}">
				<a
					href="/video?pageNum=${paging.startPage-1}&amount=${paging.cri.amount}&folder=${paging.cri.folder}">์ด์ </a>
			</c:if>
			<!-- begin์ด end๋ ๋์ ๋ฐ๋ณต 10 -->
			<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
				var="num">
				<a
					href="/video?pageNum=${num}&amount=${paging.cri.amount}&folder=${paging.cri.folder}">${num}</a>
			</c:forEach>
			<!-- next=true๋ฉด ๋ค์๋ฒํผ ํ์ฑํ -->
			<c:if test="${paging.next}">
				<a
					href="/video?pageNum=${paging.endPage+1}&amount=${paging.cri.amount}&folder=${paging.cri.folder}">๋ค์</a>
			</c:if>
			<br> <br> <a href="/videoWrite"><button>๋์์์ฌ๋ฆฌ๊ธฐ</button></a>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/layout3.jsp"%>
</body>
</html>