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

<title>ν</title>

<link rel="stylesheet" href="/resources/css/home.css">
<link rel="stylesheet" href="/resources/css/layout.css">

</head>

<body>
	<%@ include file="/WEB-INF/views/layout1.jsp"%>
	<div class="profile_1">
		<select class="todayis">
			<option>TODAY IS..π§‘</option>
			<option value="">π</option>
			<option value="">π</option>
			<option value="">π</option>
			<option value="">π</option>
			<option value="">π€</option>
			<option value="">π€</option>
			<option value="">π</option>
			<option value="">π§</option>
			<option value="">π₯</option>
			<option value="">π</option>
			<option value="">π­</option>
			<option value="">πΊ</option>
			<option value="">πΉ</option>
		</select>
		<!-- λ©μΈμ¬μ§ -->
		<img class="profile_image" src="/resources/img/κΈ°λ³Έμ¬μ§ μ¬.jfif" />
	</div>
	<div class="profile_2">
		<!-- νλνκΈ° -->
		<select class="">
			<option>νλνκΈ°</option>
			<option value="https://snskeyboard.com/darkchapter/generate.php">β</option>
		</select>
	</div>
	<%@ include file="/WEB-INF/views/layout2.jsp"%>
	<!--
	<div class="updated_news_title">
		<strong>Update News</strong>
	</div>
	<div class="updated_news_contents">
		<div class="updated_news_left">
			 κ°μ₯ μ΅κ·Όμ λ±λ‘λ κΈ
			<ul>
				<c:forEach var="update" items="${updatelist}">
					<li>${update.title}</li>
					</c:forEach>
		
			</ul>
		</div>
		<div class="updated_news_right">	
			<table>
				<tr>
					<td>λ€μ΄μ΄λ¦¬ ${update_diary}/${total_diary}</td>
					<td>μ¬μ§μ²©  ${update_photo}/${total_photo}</td>
				</tr>
				<tr>
					<td>κ°€λ¬λ¦¬ 0/0</td>
					<td>κ²μν 0/0</td>
				</tr>
				<tr>
					<td>λμμ 0/0</td>
					<td>λ°©λͺλ‘ 0/0</td>
				</tr>
			</table>
		</div> 
	</div>
	-->
	<div class="miniroom_title">
		<strong>Mini Room</strong>
	</div>
	<div class="miniroom_contents">
		<!-- λ―Έλλ£Έ -->
		<img class="miniroom_gif" src="/resources/img/λ―Έλλ£Έ.png">
	</div>

	<div class="friends_contents">
		<div class="friends_write">
			<form action="/ilchonWrite" method="POST">
				<strong>Friends say</strong> <input type="text" name="content">
				<input type="hidden" name="userid"
					value="${sessionScope.login.userid}"> <input type="submit"
					value="νμΈ">
			</form>
		</div>
		<ul>
			<c:forEach items="${ilchonlist}" var="list">
				<li>${list.content}(${list.ilchon}${list.username})&nbsp;
					<span id="ilchon_date">
					<fmt:formatDate pattern="yyyy.MM.dd" value="${list.regdate}" />
					</span> 
					<!-- λ‘κ·ΈμΈ λ μμ΄λμ μΌμ΄νμμ± μμ΄λκ° κ°μΌλ©΄ μ­μ λ²νΌ -->
					<c:if test="${sessionScope.login.userid eq list.userid }">
						<a href="/ilchonDelete?ino=${list.ino}">μ­μ </a>
					</c:if>
				</li>
			</c:forEach>
		</ul>
	</div>
	<%@ include file="/WEB-INF/views/layout3.jsp"%>
</body>
</html>