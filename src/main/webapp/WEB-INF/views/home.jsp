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

<title>홈</title>

<link rel="stylesheet" href="/resources/css/home.css">
<link rel="stylesheet" href="/resources/css/layout.css">

</head>

<body>
	<%@ include file="/WEB-INF/views/layout1.jsp"%>
	<div class="profile_1">
		<select class="todayis">
			<option>TODAY IS..🧡</option>
			<option value="">💛</option>
			<option value="">💚</option>
			<option value="">💙</option>
			<option value="">💜</option>
			<option value="">🖤</option>
			<option value="">🤍</option>
			<option value="">💔</option>
			<option value="">💧</option>
			<option value="">🔥</option>
			<option value="">🌈</option>
			<option value="">🍭</option>
			<option value="">🍺</option>
			<option value="">🌹</option>
		</select>
		<!-- 메인사진 -->
		<img class="profile_image" src="/resources/img/기본사진 여.jfif" />
	</div>
	<div class="profile_2">
		<!-- 파도타기 -->
		<select class="">
			<option>파도타기</option>
			<option value="https://snskeyboard.com/darkchapter/generate.php">★</option>
		</select>
	</div>
	<%@ include file="/WEB-INF/views/layout2.jsp"%>
	<!--
	<div class="updated_news_title">
		<strong>Update News</strong>
	</div>
	<div class="updated_news_contents">
		<div class="updated_news_left">
			 가장 최근에 등록된 글
			<ul>
				<c:forEach var="update" items="${updatelist}">
					<li>${update.title}</li>
					</c:forEach>
		
			</ul>
		</div>
		<div class="updated_news_right">	
			<table>
				<tr>
					<td>다이어리 ${update_diary}/${total_diary}</td>
					<td>사진첩  ${update_photo}/${total_photo}</td>
				</tr>
				<tr>
					<td>갤러리 0/0</td>
					<td>게시판 0/0</td>
				</tr>
				<tr>
					<td>동영상 0/0</td>
					<td>방명록 0/0</td>
				</tr>
			</table>
		</div> 
	</div>
	-->
	<div class="miniroom_title">
		<strong>Mini Room</strong>
	</div>
	<div class="miniroom_contents">
		<!-- 미니룸 -->
		<img class="miniroom_gif" src="/resources/img/미니룸.png">
	</div>

	<div class="friends_contents">
		<div class="friends_write">
			<form action="/ilchonWrite" method="POST">
				<strong>Friends say</strong> <input type="text" name="content">
				<input type="hidden" name="userid"
					value="${sessionScope.login.userid}"> <input type="submit"
					value="확인">
			</form>
		</div>
		<ul>
			<c:forEach items="${ilchonlist}" var="list">
				<li>${list.content}(${list.ilchon}${list.username})&nbsp;
					<span id="ilchon_date">
					<fmt:formatDate pattern="yyyy.MM.dd" value="${list.regdate}" />
					</span> 
					<!-- 로그인 된 아이디와 일촌평작성 아이디가 같으면 삭제버튼 -->
					<c:if test="${sessionScope.login.userid eq list.userid }">
						<a href="/ilchonDelete?ino=${list.ino}">삭제</a>
					</c:if>
				</li>
			</c:forEach>
		</ul>
	</div>
	<%@ include file="/WEB-INF/views/layout3.jsp"%>
</body>
</html>