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

<title>다이어리</title>

<link rel="stylesheet" href="/resources/css/diary.css">
<link rel="stylesheet" href="/resources/css/layout.css">

</head>

<body>
	<%@ include file="/WEB-INF/views/layout1.jsp"%>

	<div class="folder">
		<strong class="blue">DIARY</strong>
		<ul>
			<li><a href="/diary">📂내다이어리</a></li>
		</ul>
	</div>

	<%@ include file="/WEB-INF/views/layout2.jsp"%>
	<!-- 내용 -->
	<div class="diary_contents">
		
		<c:forEach items="${diary}" var="diary">
			<div class="box">


				<table>
					<tr>
						<th class="date"><fmt:formatDate pattern="yyyy.MM.dd E HH:mm"
								value="${diary.regdate}" /></th>
					</tr>
					<tr class="content">
						<td><p align="center">${diary.content}</p></td>
					</tr>
				</table>

			</div>

			<a href="/diaryModify?dno=${diary.dno}"><button>수정</button></a>
			<a href="/diaryDelete?dno=${diary.dno}"><button>삭제</button></a>

		</c:forEach>
		<!-- 페이징 -->
		<div align="center" class="paging">
			<!-- prev=true면 이전버튼 활성화 -->
			<c:if test="${paging.prev}">
				<a href="/diary?pageNum=${paging.startPage-1}">이전</a>
			</c:if>
			<!-- begin이 end될동안 반복 10 -->
			<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
				var="num">
				<a href="/diary?pageNum=${num}">${num}</a>
			</c:forEach>
			<!-- next=true면 다음버튼 활성화 -->
			<c:if test="${paging.next}">
				<a href="/diary?pageNum=${paging.endPage+1}">다음</a>
			</c:if>
			<br> <br> <a href="/diaryWrite"><button>글쓰기</button></a>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/layout3.jsp"%>

</body>
</html>