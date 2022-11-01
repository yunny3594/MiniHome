<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>로그인 ID : ${sessionScope.login.userid}</p>
<a href="/Login"><button>로그인</button></a>
<a href="/Logout"><button>로그아웃</button></a>
<a href="/SignUp"><button>회원가입</button></a>
<a href="/memberDetail?userid=${sessionScope.login.userid}"><button>회원정보</button></a>
<a href="/memberList"><button>목록</button></a>
</body>
</html>