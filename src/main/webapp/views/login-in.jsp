<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>ログイン画面</h1>

<%session.removeAttribute("confirminfo"); %>
	<form action="login-in" method="post">
		ID <input type="text" name="member_id" required> 
		パスワード<input type="password" name="password" required> 
			<br><br><input type="submit"value="ログイン">
	</form>
	
<!--	<form action="registration.jsp" method="get">-->
<!--	<input type="submit"value="新規会員登録">-->
<!--	</form>-->
	
	<br><a href="registration.jsp">新規会員登録</a>
</body>
</html>