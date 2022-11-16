<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js">
</script>
<script type="text/javascript" src="/resources/js/popup.js"></script>
</head>
<body>

	<div class="top">
		<c:choose>
			<c:when test="${sessionScope.login.userid eq null}">
				<a href="javascript:void(0);" onclick="LoginPOP();"><button>로그인</button></a>
				<a href="javascript:void(0);" onclick="SignupPOP();"><button>회원가입</button></a>
				
			</c:when>
			<c:otherwise>
				<a href="/Logout"><button>로그아웃</button></a> 사용자 : ${sessionScope.login.userid}님
			<a href="/memberDetail?userid=${sessionScope.login.userid}"><button>회원정보</button></a>
			</c:otherwise>
		</c:choose>

	</div>
	<div class="container">
		<div class="left_outline">
			<div class="left_dot">
				<div class="left_inside">
					<span class="today">TODAY 111 | TOTAL 11111</span>
					<div class="left">
</body>
</html>