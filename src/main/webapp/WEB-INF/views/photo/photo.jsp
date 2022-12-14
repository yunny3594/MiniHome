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

<title>์ฌ์ง์ฒฉ</title>

<link rel="stylesheet" href="/resources/css/photo.css">
<link rel="stylesheet" href="/resources/css/layout.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"
	src="/resources/js/photo_like.js"></script>
<script type="text/javascript"
	src="/resources/js/photo_reply.js"></script>

</head>

<body>
<input type="hidden" value="${sessionScope.login.userid}" id="idValue">
	<%@ include file="/WEB-INF/views/layout1.jsp"%>

	<div class="folder">
		<strong class="photo_album">PHOTO ALBUM</strong>
		<ul>
			<li><a class="select" href="/photo">๐์ ์ฒด๋ณด๊ธฐ</a></li>
			<c:forEach items="${folder}" var="folder">
				<li><a class="select" href="/photo?folder=${folder.fno}">๐${folder.fname}</a></li>
			</c:forEach>
			<li> </li>
			<li><a href="/photoSetting" id="foldersetting">โํด๋๊ด๋ฆฌ</a></li>
		</ul>

	</div>

	<%@ include file="/WEB-INF/views/layout2.jsp"%>

	<div class="photo_contents">
	<input type="hidden" value="${total}" id="total">
			<!-- for๋ฌธ ์์ -->
		<c:forEach items="${list}" var="list">
			<input type="hidden" value="${list.likecnt}" id="like">
			<input type="hidden" value="${list.bno}" class="bno">
			
			<table>
			
				<tr>
					<th>${list.title}</th>
				</tr>
				<tr>
					<td>${list.regdate}</td>
					
				</tr>
 
				<tr>
					<td class="content"><img
						src="/display?fileName=${list.file_address}"> <br>${list.content}</td>
				</tr>
				<tr>
					<td>
						<a href="/photoModify?bno=${list.bno}">์์ </a>
						<a href="/photoRemove?bno=${list.bno}">์ญ์ </a>
						<div class="like">
							<a href="javascript:likeup(${list.bno},${list.likecnt});" id="LikeBtn">โฅ</a>
							<span id="likecnt">x${list.likecnt}</span>
						</div>
					</td>
				</tr>
			</table>
			<div class="coment"><script>list(${list.bno})</script>
				<ul id="replyUL${list.bno}"></ul>
				
				<textarea id="reply${list.bno}"></textarea>
				<a href="javascript:reply_write(${list.bno})">๋๊ธ์ฐ๊ธฐ</a>
			</div>
		</c:forEach>
			<!-- for๋ฌธ ๋ -->
		

		<!-- ํ์ด์ง -->
		<div align="center">
			<!-- prev=true๋ฉด ์ด์ ๋ฒํผ ํ์ฑํ -->
			<c:if test="${paging.prev}">
				<a
					href="/photo?pageNum=${paging.startPage-1}&amount=${paging.cri.amount}&folder=${paging.cri.folder}">์ด์ </a>
			</c:if>
			<!-- begin์ด end๋ ๋์ ๋ฐ๋ณต 10 -->
			<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
				var="num">
				<a
					href="/photo?pageNum=${num}&amount=${paging.cri.amount}&folder=${paging.cri.folder}">${num}</a>
			</c:forEach>
			<!-- next=true๋ฉด ๋ค์๋ฒํผ ํ์ฑํ -->
			<c:if test="${paging.next}">
				<a
					href="/photo?pageNum=${paging.endPage+1}&amount=${paging.cri.amount}&folder=${paging.cri.folder}">๋ค์</a>
			</c:if>
			<br> <br> <a href="/photoWrite"><button>์ฌ์ง์ฌ๋ฆฌ๊ธฐ</button></a>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/layout3.jsp"%>
</body>
</html>