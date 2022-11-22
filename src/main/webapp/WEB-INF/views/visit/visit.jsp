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

<title>방명록</title>

<link rel="stylesheet" href="/resources/css/visit.css">
<link rel="stylesheet" href="/resources/css/layout.css">

</head>

<body>
	<%@ include file="/WEB-INF/views/layout1.jsp"%>
	<div class="profile_1">
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

	<div class="visit">
		<div class="visit_write">
			<form action="/visitWrite" method="POST">
				<img alt="" src="/resources/img/기본미니미.jpg" id="minimi">
				<textarea maxlength="500" name="content"></textarea>


				<select>
					<option>미니미</option>
					<option>미니미</option>
					<option>미니미</option>
					<option>미니미</option>
				</select>

				<c:if test="${sessionScope.login == null}">
					<input type="hidden" value="0" name="mem">
					<input type="text" placeholder="작성자입력" name="username"
						class="writer">

				</c:if>
				<c:if test="${sessionScope.login != null}">
					<input type="hidden" value="1" name="mem">
					<input type="hidden" value="${sessionScope.login.userid}"
						class="writer" name="userid">
				</c:if>
				<input type="submit" value="확인" id="writebtn">
			</form>
		</div>
		<c:forEach var="list" items="${list}">

			<c:choose>

				<c:when test="${list.mem}">
					<div class="visit_list">
						<div class="visit_name1">
							NO.${list.vno} ${list.username} (
							<fmt:formatDate pattern="yyyy.MM.dd" value="${list.regdate}" />
							)
							<c:if test="${sessionScope.login.userid eq list.userid}">
								<a href="/visitDelete?vno=${list.vno}">삭제</a>
							</c:if>
							
							<c:if test="${sessionScope.login.userid eq 'admin'}">
								<a href="/visitDelete?vno=${list.vno}">삭제</a>
							</c:if>

						</div>
						<div class="visit_content">
							<img alt="" src="/resources/img/기본미니미.jpg">
							<p>${list.content}</p>
						</div>
					</div>
				</c:when>

				<c:when test="${!list.mem}">
					<div class="visit_list">
						<div class="visit_name2">
							NO.${list.vno} ${list.username} (
							<fmt:formatDate pattern="yyyy.MM.dd" value="${list.regdate}" />
							)
							<c:if test="${sessionScope.login.userid eq 'admin'}">
								<a href="/visitDelete?vno=${list.vno}">삭제</a>
							</c:if>
						</div>
						<div class="visit_content">
							<img alt="" src="/resources/img/기본미니미.jpg">
							<p>${list.content}</p>
						</div>
					</div>
				</c:when>

			</c:choose>

		</c:forEach>
	</div>

	<%@ include file="/WEB-INF/views/layout3.jsp"%>
</body>
</html>