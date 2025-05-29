<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="login-in" method="post">
		ID <input type="text" name="member_id" required> 
		パスワード<input type="password" name="password" required> 
			<br><input type="submit"value="ログイン">
	</form>
	
	<form action="" method="get">
	<input type="submit"value="新規会員登録">
	</form>
</body>
</html>